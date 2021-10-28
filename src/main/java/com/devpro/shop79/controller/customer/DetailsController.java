package com.devpro.shop79.controller.customer;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.dto.ProductDetailsSearchModel;
import com.devpro.shop79.dto.ProductImageSearchModel;
import com.devpro.shop79.dto.ProductSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.entities.ProductImages;
import com.devpro.shop79.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class DetailsController extends BaseController {
    @Autowired
    ProductService productService;

    @Autowired
    ProductImagesService productImagesService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    DetailsService detailsService;

    @RequestMapping(value = { "/details/{seo}" }, method = RequestMethod.GET)
    public String details(final Model model, final HttpServletRequest request, final HttpServletResponse response,
                          @PathVariable("seo") String seo)
            throws IOException {
        CategorySearchModel categorySearchModel = new CategorySearchModel();
        model.addAttribute("categoryList",categoryService.search(categorySearchModel));
        model.addAttribute("category", new Categories());
        ProductSearchModel searchModel = new ProductSearchModel();
        model.addAttribute("productList", productService.search(searchModel));
        ProductSearchModel productSearchModel = new ProductSearchModel();
        productSearchModel.seo = seo;
        PagerData<Product> pagerData = productService.search(productSearchModel);
        Product product = pagerData.getData().get(0);
        model.addAttribute("product", product);
        ProductImageSearchModel productImageSearchModel = new ProductImageSearchModel();
        model.addAttribute("productImages", productImagesService.search(productImageSearchModel));
        ProductDetailsSearchModel detailsSearchModel = new ProductDetailsSearchModel();
        model.addAttribute("productDetails", detailsService.search(detailsSearchModel));
        return "customer/details"; // -> đường dẫn tới View.
    }
}
