package com.windshop.phone.controller.user;

import com.windshop.phone.controller.BaseController;
import com.windshop.phone.entity.SaleOrder;
import com.windshop.phone.enums.StatusOrder;
import com.windshop.phone.model.AjaxResponse;
import com.windshop.phone.service.impl.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.websocket.server.PathParam;

@Controller
@RequestMapping("/user")
public class OrderController extends BaseController {

    @Autowired
    private SaleOrderService saleOrderService;

    @GetMapping("/order")
    public String index(@PathParam("page") Integer page,
                        final Model model) {
        int pageP = !ObjectUtils.isEmpty(page) ? page : 1;
        Pageable pageable = PageRequest.of(pageP - 1, 5);
        Page<SaleOrder> saleOrderPage = saleOrderService.findAllSaleOrder(pageable);
        model.addAttribute("currentPage", pageP);
        model.addAttribute("total", saleOrderPage.getTotalPages());
        model.addAttribute("orders", saleOrderPage.getContent());
        return "user/order";
    }

    @PostMapping("/cancel-order")
    public ResponseEntity<AjaxResponse> cancelOrder(@RequestBody Integer id) {
        SaleOrder saleOrder = saleOrderService.findById(id);
        saleOrder.setStatusOrder(3);
        saleOrder.setStatusOrderName(StatusOrder.CANCELLED.toString());
        saleOrderService.updateSaleOrder(saleOrder);
        return ResponseEntity.ok(new AjaxResponse(200, "Success"));
    }
}
