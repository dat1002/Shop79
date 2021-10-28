package com.devpro.shop79.controller.administrator;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.services.CategoryService;
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
public class CategoryController extends BaseController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/admin/category/delete/{CategoryId}"},method = RequestMethod.GET)
    public String Delete(final Model model,
                         final HttpServletRequest request,
                         final HttpServletResponse response,
                         @ModelAttribute("Category") Categories category,
                         @PathVariable("CategoryId") int categoryId) throws IOException {
        // gửi danh sách categories xuống view

        categoryService.deleteById(categoryId);
        return "redirect:/admin/category/addOrUpdate";
    }

    @RequestMapping(value = {"/admin/category/edit/{CategoryId}"}, method = RequestMethod.GET)
    public String editCategory(final Model model,
                                final HttpServletRequest request,
                                final HttpServletResponse response,
                               @PathVariable("CategoryId") int categoryId) throws Exception{
        Categories category = categoryService.getById(categoryId);
        model.addAttribute("category", category);
        CategorySearchModel searchModel = new CategorySearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("categoryWithPaging", categoryService.search(searchModel));
        return "administrator/categoryAddOrUpdate";
    }

    @RequestMapping(value = {"/admin/category/addOrUpdate"}, method = RequestMethod.GET)
    public String adminCategory(final Model model,
                                final HttpServletRequest request,
                                final HttpServletResponse response) throws Exception{
        model.addAttribute("category", new Categories());


        CategorySearchModel searchModel = new CategorySearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("categoryWithPaging", categoryService.search(searchModel));
        model.addAttribute("searchModel", searchModel);
        return "administrator/categoryAddOrUpdate";
    }

    @RequestMapping(value = {"/admin/category/addOrUpdate"}, method = RequestMethod.POST)
    public String post_Category(final Model model,
                                final HttpServletRequest request,
                                final HttpServletResponse response,
                                @ModelAttribute("category") Categories category) throws Exception{
        CategorySearchModel searchModel = new CategorySearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("categoryWithPaging", categoryService.search(searchModel));

        categoryService.saveOrUpdate(category);
        return "administrator/categoryAddOrUpdate";
    }

}
