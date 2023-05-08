package com.windshop.phone.controller.admin;

import com.windshop.phone.entity.SaleOrder;
import com.windshop.phone.repository.SaleOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

@Controller
public class AdminController {

    @Autowired
    private SaleOrderRepository saleOrderRepository;

    @GetMapping(value = "/admin")
    public String indexAdmin(final HttpServletRequest request, final ModelMap model,
                             @PathParam("page") Integer page) {
        model.addAttribute("totalMonth", saleOrderRepository.sumTotalInMonth());
        model.addAttribute("quantityOrder", saleOrderRepository.quantityOrder());
        model.addAttribute("quantityProduct", saleOrderRepository.quantityProduct());

        int pageP = !ObjectUtils.isEmpty(page) ? page : 1;
        Pageable pageable = PageRequest.of(pageP - 1, 10);
        Page<SaleOrder> orderPage = saleOrderRepository.findAll(pageable);
        model.addAttribute("orders", orderPage.getContent());
        model.addAttribute("currentPage", pageP);
        model.addAttribute("total", orderPage.getTotalPages());

        return "admin/index";
    }

    @GetMapping(value = "/role-blocked")
    public String accessDenied() {
        return "admin/blocked-role";
    }

}
