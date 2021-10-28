package com.devpro.shop79.controller.administrator;

import com.devpro.shop79.components.Utilities;
import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.dto.UserSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Role;
import com.devpro.shop79.entities.User;
import com.devpro.shop79.services.CategoryService;
import com.devpro.shop79.services.RoleService;
import com.devpro.shop79.services.UserService;
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

@Controller
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    private RoleService roleService;

    @RequestMapping(value = {"/admin/user/delete/{UserId}"},method = RequestMethod.GET)
    public String Delete(final Model model,
                         final HttpServletRequest request,
                         final HttpServletResponse response,
                         @ModelAttribute("User") User user,
                         @PathVariable("UserId") int userId) throws IOException {
        // gửi danh sách categories xuống view

        userService.deleteById(userId);
        return "redirect:/admin/user/addOrUpdate";
    }

    @RequestMapping(value = {"/admin/user/edit/{UserId}"}, method = RequestMethod.GET)
    public String editUser(final Model model,
                               final HttpServletRequest request,
                               final HttpServletResponse response,
                               @PathVariable("UserId") int userId) throws IOException{
        User user = userService.getById(userId);
        model.addAttribute("user", user);
        UserSearchModel searchModel = new UserSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("userWithPaging", userService.search(searchModel));
        return "administrator/user";
    }

    @RequestMapping(value = {"/admin/user/addOrUpdate"}, method = RequestMethod.GET)
    public String adminUser(final Model model,
                                final HttpServletRequest request,
                                final HttpServletResponse response) throws Exception{
        model.addAttribute("user", new User());
        UserSearchModel searchModel = new UserSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("userWithPaging", userService.search(searchModel));
        model.addAttribute("searchModel", searchModel);
        return "administrator/user";
    }

    @RequestMapping(value = {"/admin/user/addOrUpdate"}, method = RequestMethod.POST)
    public String post_User(final Model model,
                                final HttpServletRequest request,
                                final HttpServletResponse response,
                                @ModelAttribute("user") User user) throws Exception{
        UserSearchModel searchModel = new UserSearchModel();
        user.setPassword(Utilities.encode(user.getPassword()));
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("userWithPaging", userService.search(searchModel));
        userService.saveOrUpdate(user);
        return "administrator/user";
    }
}
