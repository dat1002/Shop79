//package com.devpro.shop79.controller.customer;
//
////import com.devpro.shop79.dto.SiginModel;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.validation.constraints.Email;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Map;
//
//@Controller
//public class SiginController {
//
//    //đinh nghĩa action
////    @RequestMapping(value = {"/login"},method = RequestMethod.POST)
////    public String post_contact(final Model model,
////                               final HttpServletRequest request,
////                               final HttpServletResponse response, @ModelAttribute("siginModel") SiginModel siginModel) throws IOException {
////
////        // đọc dữ liệu từ người dùng gửi lên
//////        String yourEmail = request.getParameter("email");
//////        String yourPassWord = request.getParameter("password");
////
////        model.addAttribute("yourAccount",siginModel.getEmail()+siginModel.getPassword());
////
////        //MVC được cấu hình chỉ vào thư mục src/main/webapp/WEB-INF/views
////        // để tìn các views
////        // /WEB-INF/views/customer/index.jsp
////        return "customer/login"; // đường dẫn tới View
////    }
//
//
//    //đinh nghĩa action
//    @RequestMapping(value = {"/login"},method = RequestMethod.GET)
//    public String home(final Model model,
//                       final HttpServletRequest request,
//                       final HttpServletResponse response) throws IOException {
//
//        // đẩy thông báo xuống tầng view
//
//        //MVC được cấu hình chỉ vào thư mục src/main/webapp/WEB-INF/views
//        // để tìn các views
//        // /WEB-INF/views/customer/index.jsp
//        return "customer/login"; // đường dẫn tới View
//    }
////    @RequestMapping(value = {"/ajax/login"},method = RequestMethod.POST)
////    public ResponseEntity<Map<String, Object>> ajax_login(final Model model,
////                                                          final HttpServletRequest request,
////                                                          final HttpServletResponse response,
////                                                          final @RequestBody SiginModel siginModel ) {
////        System.out.println("Tài khoản email của bạn: "+siginModel.getEmail());
////        Map<String, Object> jsonResult = new HashMap<String, Object>();
////        jsonResult.put("code",200);
////        jsonResult.put("message",siginModel);
////        return ResponseEntity.ok(jsonResult);
////    }
////
//}
