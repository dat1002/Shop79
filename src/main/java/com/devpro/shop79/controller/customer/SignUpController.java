package com.devpro.shop79.controller.customer;

import com.devpro.shop79.components.Utilities;
import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.SignUpModel;
import com.devpro.shop79.entities.User;
import com.devpro.shop79.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SignUpController extends BaseController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/signUp"},method = RequestMethod.GET)
    public String getForm(final Model model,
                               final HttpServletRequest request,
                               final HttpServletResponse response) throws IOException {
        model.addAttribute("user", new User());
        return "customer/signUp"; // đường dẫn tới View
    }

    @RequestMapping(value = {"/signUp"}, method = RequestMethod.POST)
    public  String postInf( final Model model,
                            final HttpServletRequest request,
                            final HttpServletResponse response,
                            @ModelAttribute("user") User user   ) throws IOException{
        user.setPassword(Utilities.encode(user.getPassword()));
        userService.saveOrUpdate(user);

        return "redirect:/signUp";
    }

//    @RequestMapping(value = {"/ajax/signUp"},method = RequestMethod.POST)
//    public ResponseEntity<Map<String, Object>> ajax_signUp(final Model model,
//                                                          final HttpServletRequest request,
//                                                          final HttpServletResponse response,
//                                                          final @RequestBody SignUpModel signUpModel,
//                                                           @ModelAttribute("user") User user) {
//        user.setPassword(Utilities.encode(user.getPassword()));
//        System.out.println("Tài khoản email của bạn: "+signUpModel.getEmail());
//        Map<String, Object> jsonResult = new HashMap<>();
//        jsonResult.put("code",200);
//        jsonResult.put("message",signUpModel);
//        return ResponseEntity.ok(jsonResult);
//    }

}
