package com.devpro.shop79.controller.administrator;

import com.devpro.shop79.controller.BaseController;
import com.devpro.shop79.dto.SaleOrderSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Product;
import com.devpro.shop79.entities.SaleOrder;
import com.devpro.shop79.entities.SaleOrderProducts;
import com.devpro.shop79.services.ProductService;
import com.devpro.shop79.services.SaleOrderProductsService;
import com.devpro.shop79.services.SaleOrderService;
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
public class SaleOrderController extends BaseController {
    @Autowired
    SaleOrderService saleOrderService;

    @Autowired
    SaleOrderProductsService saleOrderProductsService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = {"/admin/saleOrderManagement/{Id}"}, method = RequestMethod.GET)
    public String listSaleOrder(final Model model,
                           final HttpServletRequest request,
                           final HttpServletResponse response,
                           @PathVariable("Id") int id ) throws Exception{

        List<SaleOrderProducts> saleOrderProducts = saleOrderProductsService.findAll();
        model.addAttribute("saleOrderProducts",saleOrderProducts);
        SaleOrder saleOrder = saleOrderService.getById(id);
        model.addAttribute("saleOrder", saleOrder);
        return "administrator/saleOrderProductManagement";
    }

    @RequestMapping(value = {"/admin/saleOrderManagement"}, method = RequestMethod.GET)
    public String getOrder(final Model model,
                           final HttpServletRequest request,
                           final HttpServletResponse response) throws Exception{
        model.addAttribute("saleOder", new SaleOrder());
        SaleOrderSearchModel searchModel = new SaleOrderSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));
        model.addAttribute("saleOrderWithPaging", saleOrderService.search(searchModel));
        model.addAttribute("searchModel", searchModel);
        model.addAttribute("product", new Product());
        model.addAttribute("saleOrderProduct", saleOrderProductsService.findAll());
        return "administrator/orderManagement";
    }

    @RequestMapping(value = {"/admin/saleOrderManagement/delete/{Id}"}, method = RequestMethod.GET)
    public String delete(final Model model,
                                final HttpServletRequest request,
                                final HttpServletResponse response,
                                @ModelAttribute("saleOrder") SaleOrder saleOrder,
                                @PathVariable("Id") int id) throws IOException {
        saleOrderService.deleteById(id);
        return "redirect:/admin/saleOrderManagement";
    }
}
