package com.devpro.shop79.controller.administrator;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.ProductSearchModel;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.services.CategoryService;
import com.devpro.shop79.services.ProductImagesService;
import com.devpro.shop79.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class IndexAdminController extends BaseController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductImagesService productImagesService;

    @RequestMapping(value = {"/admin/index"},method = RequestMethod.GET)
    public String index(final Model model,
                           final HttpServletRequest request,
                           final HttpServletResponse response) throws IOException {

        // code cũ lấy tất cả sản phẩm
        model.addAttribute("product", new Product());
        List<Product> products = productService.findAll(); // x
        model.addAttribute("products", products);
        ProductSearchModel searchModel = new ProductSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        searchModel.categoryId = super.getInteger(request, "categoryId");
        model.addAttribute("productsWithPaging", productService.search(searchModel));
        model.addAttribute("searchModel", searchModel);

        return "administrator/adminIndex";
    }
}
