package com.devpro.shop79.controller.administrator;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.ContactModel;
import com.devpro.shop79.dto.MessageModel;
import com.devpro.shop79.dto.ProductSearchModel;
//import com.devpro.shop79.dto.SiginModel;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.entities.ProductImages;
import com.devpro.shop79.services.CategoryService;
import com.devpro.shop79.services.PagerData;
import com.devpro.shop79.services.ProductImagesService;
import com.devpro.shop79.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class ProductController  extends BaseController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductImagesService productImagesService;

    @RequestMapping(value = {"/admin/product/edit/{productId}"},method = RequestMethod.GET)
    public String adminEdit(final Model model,
                       final HttpServletRequest request,
                       final HttpServletResponse response, @PathVariable("productId") int productId
                            ) throws IOException{
        // gửi danh sách categories xuống view
        Product product = productService.getById(productId);
        // gửi danh sách products xuống view
        model.addAttribute("product", product);

        ProductSearchModel searchModel = new ProductSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        searchModel.categoryId = super.getInteger(request, "categoryId");
        model.addAttribute("productsWithPaging", productService.search(searchModel));
        return "administrator/productAddOrUpdate";
    }


    //Ajax delete
    @RequestMapping(value = {"/admin/product/delete/{productId}"},method = RequestMethod.GET)
    public String Delete(final Model model,
              final HttpServletRequest request,
              final HttpServletResponse response,
              @ModelAttribute("Product") Product product,
              @PathVariable("productId") int productId) throws IOException{
        // gửi danh sách categories xuống view

        productService.deleteById(productId);
        return "redirect:/admin/product/addOrUpdate";
    }
// mai sửa, làm lại bằng ajax
    // định nghĩa action
    @RequestMapping(value = {"/admin/product/addOrUpdate"},method = RequestMethod.GET)
    public String get_list(final Model model,
                       final HttpServletRequest request,
                       final HttpServletResponse response) throws IOException{

        // code cũ lấy tất cả sản phẩm
        model.addAttribute("product", new Product());
        List<Product> products = productService.findAll(); // x
        model.addAttribute("products", products);
        ProductSearchModel searchModel = new ProductSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        searchModel.categoryId = super.getInteger(request, "categoryId");
        model.addAttribute("productsWithPaging", productService.search(searchModel));
        model.addAttribute("searchModel", searchModel); //x
        return "administrator/productAddOrUpdate";
    }

    @RequestMapping(value = {"/admin/product/addOrUpdate"},method = RequestMethod.POST)
    public String product(final Model model,
                          final HttpServletRequest request,
                          final HttpServletResponse response,
                          @ModelAttribute("product") Product product, // spring form biding với product model
                          @RequestParam("productAvatar") MultipartFile productAvatar,  // hứng file đẩy lên
                          @RequestParam("productPictures") MultipartFile[] productPictures // hứng file đẩy lên
                          ) throws IOException{

        // cần kiểm ktra xem id của product đó
        // id== null || = 0 thì thêm mới
        // ngược lại chỉnh
        if(product.getId() == null || product.getId() <= 0){
            productService.add(product, productAvatar, productPictures);
        } else{// chình sửa
            productService.update(product, productAvatar, productPictures);
        }
        // đọc dữ liệu từ người dùng gửi lên
        if(product.getCreatedDate() == null){
            product.setCreatedDate(new Date());
        }
        else{
            product.setUpdatedDate(new Date());
        }
        productService.saveOrUpdate(product);
        ProductSearchModel searchModel = new ProductSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        searchModel.categoryId = super.getInteger(request, "categoryId");
        model.addAttribute("productsWithPaging", productService.search(searchModel));
        return "administrator/productAddOrUpdate";
    }
}
