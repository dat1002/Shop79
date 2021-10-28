package com.devpro.shop79.controller.administrator;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.ProductDetailsSearchModel;
import com.devpro.shop79.entities.Details;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.services.CategoryService;
import com.devpro.shop79.services.DetailsService;
import com.devpro.shop79.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductDetailsController extends BaseController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private DetailsService detailsService;

    @RequestMapping(value = {"/admin/product/productDetails"}, method = RequestMethod.GET)
    public  String getList(final Model model,
                           final HttpServletRequest request,
                           final HttpServletResponse response
                           ) throws IOException{
        model.addAttribute("details", new Details());
        List<Product> product = productService.findAll();
        model.addAttribute("product", product);
        ProductDetailsSearchModel searchModel = new ProductDetailsSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("productDetailsWithPaging", detailsService.search(searchModel));
        model.addAttribute("searchModel", searchModel);
        return "administrator/productDetails";
    }

    @RequestMapping(value = {"/admin/product/productDetails"}, method = RequestMethod.POST)
    public String postDetail(final Model model,
                             final HttpServletRequest request,
                             final HttpServletResponse response,
                             @ModelAttribute("details") Details details) throws  IOException {
        List<Product> product = productService.findAll();
        model.addAttribute("product", product);
        detailsService.saveOrUpdate(details);
        ProductDetailsSearchModel searchModel = new ProductDetailsSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("productDetailsWithPaging", detailsService.search(searchModel));
        model.addAttribute("searchModel", searchModel);
        return "administrator/productDetails";
    }

    @RequestMapping(value = {"/admin/product/productDetails/edit/{DetailsId}"}, method = RequestMethod.GET)
    public String editDetail(final Model model,
                             final HttpServletRequest request,
                             final HttpServletResponse response,
                             @PathVariable("DetailsId") int detailsId) throws  IOException {
        List<Product> product = productService.findAll();
        model.addAttribute("product", product);
        Details details = detailsService.getById(detailsId);
        model.addAttribute("details", details);
        detailsService.saveOrUpdate(details);
        ProductDetailsSearchModel searchModel = new ProductDetailsSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("productDetailsWithPaging", detailsService.search(searchModel));
        model.addAttribute("searchModel", searchModel);
        return "administrator/productDetails";
    }

    @RequestMapping(value = {"/admin/product/productDetails/delete/{detailsId}"}, method = RequestMethod.GET)
    public String delete(final Model model,
                             final HttpServletRequest request,
                             final HttpServletResponse response,
                             @PathVariable("detailsId") Integer detailsId) throws  IOException {
        Details details = detailsService.getById(detailsId);
        model.addAttribute("details", details);
        detailsService.deleteById(detailsId);
        return "redirect:/admin/product/productDetails";
    }

    @RequestMapping(value = {"/admin/product/showMore/{productId}"}, method = RequestMethod.GET)
    public  String showMore(final Model model,
                           final HttpServletRequest request,
                           final HttpServletResponse response,
                           @PathVariable("productId") int productId ) throws IOException{
        model.addAttribute("details", new Details());
        List<Product> product = productService.findAll();
        model.addAttribute("product", product);
        ProductDetailsSearchModel searchModel = new ProductDetailsSearchModel();
        searchModel.setKeyword(String.valueOf(productId));
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("productDetailsWithPaging", detailsService.search(searchModel));
        model.addAttribute("searchModel", searchModel);
        return "administrator/productDetails";
    }
}
