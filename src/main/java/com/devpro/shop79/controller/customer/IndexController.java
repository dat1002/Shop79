package com.devpro.shop79.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.dto.ContactModel;
import com.devpro.shop79.dto.ProductSearchModel;
//import com.devpro.shop79.dto.SiginModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.services.CategoryService;
import com.devpro.shop79.services.PagerData;
import com.devpro.shop79.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.Id;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class IndexController extends BaseController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

//	@RequestMapping(value = { "/details/{seo}" }, method = RequestMethod.GET)
//	public String details(final Model model, final HttpServletRequest request, final HttpServletResponse response,
//						  @PathVariable("seo") String seo)
//			throws IOException {
//		CategorySearchModel categorySearchModel = new CategorySearchModel();
//		model.addAttribute("categoryList",categoryService.search(categorySearchModel));
//		ProductSearchModel searchModel = new ProductSearchModel();
//		model.addAttribute("productList", productService.search(searchModel));
//		ProductSearchModel productSearchModel = new ProductSearchModel();
//		productSearchModel.seo = seo;
//		PagerData<Product> pagerData = productService.search(productSearchModel);
//		Product product = pagerData.getData().get(0);
//		model.addAttribute("product", product);
//		return "customer/details"; // -> ???????ng d???n t???i View.
//	}

	@RequestMapping(value = {"/index"},method = RequestMethod.GET)
	public String get_list(final Model model,
						   final HttpServletRequest request,
						   final HttpServletResponse response) throws IOException{

		// code c?? l???y t???t c??? s???n ph???m
		CategorySearchModel categorySearchModel = new CategorySearchModel();
		List<Categories> categories = categoryService.findAll();
		ProductSearchModel productSearchModel = new ProductSearchModel();
		model.addAttribute("CurrentCategory", categories);
		model.addAttribute("categoryList",categoryService.search(categorySearchModel));
		model.addAttribute("productList", productService.search(productSearchModel));

		return "customer/home";
	}


	@RequestMapping(value = {"/ajax/index"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact
						(final Model model,
						final HttpServletRequest request,
						final HttpServletResponse response,
						final @RequestBody ContactModel contactModel) throws Exception{
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",contactModel);
		return ResponseEntity.ok(jsonResult);
	// mai s???a ch??? contact v?? ch??? buyNow
	}
}


// l??m qu???n l?? danh m???c s???n ph???m
// qu???n l?? user
// ????ng k??
// s???a trang index
// qu???n l?? ????n ?????t h??ng
// g???i email ?????n ng?????i d??ng
