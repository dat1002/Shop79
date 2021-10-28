package com.devpro.shop79.controller.customer;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.InsertModel;
import com.devpro.shop79.services.BaseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class InsertController extends BaseController {

    @RequestMapping(value = {"/insert"},method = RequestMethod.POST)
    public String insert(final Model model,
                       final HttpServletRequest request,
                       final HttpServletResponse respone) throws IOException{

        // đọc dữ liệu từ người dùng gửi lên
        String tenSP = request.getParameter("tenSP");
        String maSP = request.getParameter("maSP");
        String giaSP = request.getParameter("giaSP");
        String soLuong = request.getParameter("soLuong");
        String anhSP = request.getParameter("anhSP");
        String moTa = request.getParameter("moTa");


        model.addAttribute("postTenSP",  tenSP);
        model.addAttribute("postMaSP",  maSP);
        model.addAttribute("postGiaSP",  giaSP);
        model.addAttribute("postSoLuong",  soLuong);
        model.addAttribute("postAnhSP",  anhSP);
        model.addAttribute("postMoTa",  moTa);
        return "customer/insert";
    }

    @RequestMapping(value = {"/insert"},method = RequestMethod.GET)
    public String home(final Model model,
                         final HttpServletRequest request,
                         final HttpServletResponse respone) throws IOException{

        InsertModel insertModel = new InsertModel();
        insertModel.setTenSP("Ten mong không bị lỗi nữa");
        model.addAttribute("insertModel", insertModel);
        return "customer/insert";
    }
}
