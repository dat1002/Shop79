package com.devpro.shop79.controller.administrator;

import com.devpro.shop79.components.Utilities;
import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.dto.RoleSearchModel;
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
public class RoleController extends BaseController {
    @Autowired
    private RoleService roleService;

    @RequestMapping(value = {"/admin/role/delete/{RoleId}"},method = RequestMethod.GET)
    public String Delete(final Model model,
                         final HttpServletRequest request,
                         final HttpServletResponse response,
                         @ModelAttribute("Role") Role role,
                         @PathVariable("RoleId") int roleId) throws IOException {
        // gửi danh sách categories xuống view

        roleService.deleteById(roleId);
        return "redirect:/admin/role/addOrUpdate";
    }

    @RequestMapping(value = {"/admin/role/edit/{RoleId}"}, method = RequestMethod.GET)
    public String editUser(final Model model,
                           final HttpServletRequest request,
                           final HttpServletResponse response,
                           @PathVariable("RoleId") int roleId) throws IOException{
        Role role = roleService.getById(roleId);
        model.addAttribute("role", role);
        RoleSearchModel searchModel = new RoleSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("roleWithPaging", roleService.search(searchModel));
        return "administrator/role";
    }

    @RequestMapping(value = {"/admin/role/addOrUpdate"}, method = RequestMethod.GET)
    public String adminRole(final Model model,
                            final HttpServletRequest request,
                            final HttpServletResponse response) throws Exception{
        model.addAttribute("role", new Role());
        RoleSearchModel searchModel = new RoleSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("roleWithPaging", roleService.search(searchModel));
        model.addAttribute("searchModel", searchModel);
        return "administrator/role";
    }

    @RequestMapping(value = {"/admin/role/addOrUpdate"}, method = RequestMethod.POST)
    public String post_User(final Model model,
                            final HttpServletRequest request,
                            final HttpServletResponse response,
                            @ModelAttribute("role") Role role) throws Exception{
        RoleSearchModel searchModel = new RoleSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("roleWithPaging", roleService.search(searchModel));
        roleService.saveOrUpdate(role);
        return "administrator/role";
    }
}
