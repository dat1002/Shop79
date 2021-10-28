package com.devpro.shop79.controller.customer;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.Cart;
import com.devpro.shop79.dto.CartItem;
import com.devpro.shop79.dto.MessageModel;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.entities.SaleOrder;
import com.devpro.shop79.entities.SaleOrderProducts;
import com.devpro.shop79.entities.User;
import com.devpro.shop79.services.ProductService;
import com.devpro.shop79.services.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController extends BaseController {

	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService saleOrderService;

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuantity();
		}


		return total;
	}

//	private double getPrice(int id) {
//		return productService.getById(id).getPrice().doubleValue();
//	}
	private void calculateTotalPrice(final HttpServletRequest request) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;
		
		for(CartItem ci : cartItems) {
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuantity())));
		}

		cart.setTotalPrice(total);
		//session.setAttribute("totalPrices",cart.getTotalPrice());
	}

	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		// Thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerAddress = request.getParameter("customerAddress");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerPrice = request.getParameter("customerPrice");
		// tạo hóa đơn
		SaleOrder saleOrder = new SaleOrder();
		if(super.isLogined()){
			User userLogined = super.getUserLogined();
			saleOrder.setUser(userLogined);
			saleOrder.setCustomerName(userLogined.getNameUser());
			saleOrder.setCustomerEmail(userLogined.getEmail());
			saleOrder.setCustomerPhone(userLogined.getPhone());
			saleOrder.setCustomerAddress(userLogined.getAddress());
			//tự thêm các trường vào trong db
		}
		else {
			saleOrder.setCustomerName(customerFullName);
			saleOrder.setCustomerEmail(customerEmail);
			saleOrder.setCustomerAddress(customerAddress);
			saleOrder.setCustomerPhone(customerPhone);

		}
		// mã hóa đơn
		saleOrder.setTotalPrice(customerPrice);
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));

//		if(getUserLogined() != null) {
//			
//		}

		// kết các sản phẩm trong giỏ hàng cho hóa đơn
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuantity());
			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		// lưu vào cơ sở dữ liệu
		saleOrderService.saveOrUpdate(saleOrder);

		// xóa dữ liệu giỏ hàng trong session
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", "0");

		return "redirect:/index";
	}

	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				item.setQuantity(item.getQuantity() + cartItem.getQuantity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPriceSale());
			cartItem.setAvatar(productInDb.getAvatar());
			cart.getCartItems().add(cartItem);
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);

		session.setAttribute("totalPrice", cart.getTotalPrice());

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("totalPrice", cart.getTotalPrice());
		session.setAttribute("totalItems", getTotalItems(request));
		jsonResult.put("soluong", cartItem.getQuantity());
		session.setAttribute("soluong", cartItem.getQuantity());

		return ResponseEntity.ok(jsonResult);
	}
	// remove items
	@RequestMapping(value = { "/cart/delete/{productId}" }, method = RequestMethod.GET)
	public String removeItem(final Model model, final HttpServletRequest request,
							 final HttpServletResponse response, @PathVariable("productId") int productId
							 ) throws IOException{
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (int i = 0; i < cart.getCartItems().size(); i++) {
			if(cart.getCartItems().get(i).getProductId()==productId)
				cart.getCartItems().remove(i);
		}
		this.calculateTotalPrice(request);
		session.setAttribute("totalPrice", cart.getTotalPrice());
		session.setAttribute("totalItems", getTotalItems(request));
		return "redirect:/cart/view";
	}

	// định nghĩa action
	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {


		// đẩy thông báo xuống tầng view

		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "customer/cart"; // -> đường dẫn tới View.
	}
	// hoàn thành mua hàng
	@RequestMapping(value = {"/ajax/cart/view"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_buy(final Model model,
					  final HttpServletRequest request,
					  final HttpServletResponse response,
					  final @RequestBody MessageModel messageModel) throws Exception{
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message", messageModel);
		return ResponseEntity.ok(jsonResult);
	}

}
