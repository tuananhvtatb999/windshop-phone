package com.windshop.phone.controller.user;

import com.windshop.phone.entity.SaleOrder;
import com.windshop.phone.repository.SaleOrderRepository;
import com.windshop.phone.service.impl.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.websocket.server.PathParam;

@Controller
@RequestMapping("/user")
public class OrderController {

    @Autowired
    private SaleOrderService saleOrderService;

    @GetMapping("/order")
    public String index(@PathParam("page") Integer page,
                        final Model model){
        int pageP = !ObjectUtils.isEmpty(page) ? page : 1;
        Pageable pageable = PageRequest.of(pageP - 1, 5);
        Page<SaleOrder> saleOrderPage = saleOrderService.findAllSaleOrder(pageable);
        model.addAttribute("currentPage", pageP);
        model.addAttribute("total", saleOrderPage.getTotalPages());
        model.addAttribute("orders", saleOrderPage.getContent());
        return "user/order";
    }
}
