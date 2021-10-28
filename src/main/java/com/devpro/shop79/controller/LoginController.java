package com.devpro.shop79.controller;

//import com.devpro.shop79.dto.SiginModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class LoginController extends BaseController{
    @RequestMapping(value = {"/login"},method = RequestMethod.GET)
    public String post_contact(final Model model,
                               final HttpServletRequest request,
                               final HttpServletResponse response) throws IOException {
        return "login"; // đường dẫn tới View
    }
}
