//package com.devpro.shop79.controller.administrator;
//
//import com.devpro.shop79.controller.BaseController;
//import com.devpro.shop79.dto.UserSearchModel;
//import com.devpro.shop79.entities.Role;
//import com.devpro.shop79.entities.User;
//import com.devpro.shop79.entities.UserRole;
//import com.devpro.shop79.services.UserRoleService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//public class UserRoleController extends BaseController {
//    @Autowired
//    public UserRoleService userRoleService;
//
//    @RequestMapping(value = {"/admin/userRole/addOrUpdate"}, method = RequestMethod.GET)
//    public String adminUser(final Model model,
//                            final HttpServletRequest request,
//                            final HttpServletResponse response) throws Exception{
//        model.addAttribute("user", new User());
//        model.addAttribute("role", new Role());
//        model.addAttribute("userRole", new UserRole());
//        UserSearchModel searchModel = new UserSearchModel();
//        searchModel.keyword = request.getParameter("keyword");
//        searchModel.setPage(getCurrentPage(request));
//        model.addAttribute("userRoleWithPaging", userRoleService.search(searchModel));
//        model.addAttribute("searchModel", searchModel);
//        return "administrator/userRole";
//    }
//}
