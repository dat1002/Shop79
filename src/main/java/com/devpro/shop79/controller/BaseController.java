package com.devpro.shop79.controller;

import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.entities.Role;
import com.devpro.shop79.entities.User;
import com.devpro.shop79.services.CategoryService;
import com.devpro.shop79.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseController {

    @Autowired
    private CategoryService categoryService;
    private List<String> roles() {
        List<String> roles = new ArrayList<String>();
        User logined = getUserLogined();

        if(logined == null) return roles;
        for(Role r : logined.getRoles()) {
            roles.add(r.getAuthority());
        }

        return roles;
    }

    @ModelAttribute("isAdmin")
    public boolean isAdmin() {
        for(String role : roles()) {
            if(role.equalsIgnoreCase("admin")) return true;
        }
        return false;
    }

    @ModelAttribute("isMember")
    public boolean isMember() {
        for(String role : roles()) {
            if(role.equalsIgnoreCase("member")) return true;
        }
        return false;
    }

    @ModelAttribute("isLogined")
    public boolean isLogined(){
        boolean isLogined = false;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            isLogined = true;
        }
        return  isLogined;
    }

    @ModelAttribute("isNotLogined")
    public boolean isNotLogined(){
        boolean isNotLogined = true;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            isNotLogined = false;
        }
        return  isNotLogined;
    }

    @ModelAttribute("userLogined")
    public User getUserLogined() {
        Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(userLogined != null && userLogined instanceof UserDetails)
            return (User) userLogined;

        return null;
    }

    /**
     * tất cả các controller mà extens từ đây
     * thì các action sẽ luôn sẵn danh sách categories.
     * @return
     */
    @ModelAttribute("categories")
    public List<Categories> categories() {
        return categoryService.findAll();
    }

    @Autowired
    private ProductService productService;

    /**
     * tất cả các controller mà extens từ đây
     * thì các action sẽ luôn sẵn danh sách product.
     * @return
     */
    @ModelAttribute("products")
    public List<Product> products() {
        return productService.findAll();
    }
    /**
     * lấy current page, mặc định trả về 1
     * @param request
     * @return
     */
    public int getCurrentPage(HttpServletRequest request) {
        try {
            return Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            return 1;
        }
    }


    public Integer getInteger(HttpServletRequest request, String paramName) {
        try {
            return Integer.parseInt(request.getParameter(paramName));
        } catch (Exception e) {
            return null;
        }
    }
}
