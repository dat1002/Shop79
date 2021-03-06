package com.devpro.shop79.controller.customer;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.dto.ProductSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.services.CategoryService;
import com.devpro.shop79.services.ProductService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class CategoriesController extends BaseController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/category/{seo}"}, method = RequestMethod.GET)
    public String category(final Model model, final HttpServletRequest request, final HttpServletResponse response,
                           @PathVariable("seo") String seo)
            throws IOException {

        CategorySearchModel categorySearchModel = new CategorySearchModel();
        categorySearchModel.setSeo(seo);
        CategorySearchModel searchModel = new CategorySearchModel();
        model.addAttribute("categoryList", categoryService.search(searchModel));
        ProductSearchModel PrSearchModel = new ProductSearchModel();
        model.addAttribute("productList", productService.search(PrSearchModel));
        Categories categories = categoryService.search(categorySearchModel).getData().get(0);
        model.addAttribute("CurrentCategory", categories);
        ProductSearchModel productSearchModel = new ProductSearchModel();
        productSearchModel.categoryId = categories.getId();
        model.addAttribute("productsData", productService.search(productSearchModel));

        // MVC ???????c c???u h??nh ch??? ?????nh v??o th?? m???c /src/main/webapp/WEB-INF/views
        // ????? t??m c??c views
        // /WEB-INF/views/user/index.jsp
        return "customer/categories"; // -> ???????ng d???n t???i View.

    }
    @RequestMapping(value = {"/search"},method = RequestMethod.GET)
    public String search(final Model model,
                         final HttpServletRequest request,
                         final HttpServletResponse response) throws IOException{

        // code c?? l???y t???t c??? s???n ph???m
        CategorySearchModel categorySearchModel = new CategorySearchModel();
        Categories categories = categoryService.search(categorySearchModel).getData().get(0);
        ProductSearchModel searchModel = new ProductSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        model.addAttribute("productsWithSearch", productService.search(searchModel));
        return "customer/search";
    }
}