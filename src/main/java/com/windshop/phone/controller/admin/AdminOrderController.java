package com.windshop.phone.controller.admin;


import com.windshop.phone.controller.BaseController;
import com.windshop.phone.entity.Category;
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
import java.util.ArrayList;
import java.util.List;


@Controller
public class AdminOrderController extends BaseController {

    @Autowired
    SaleOrderRepository saleOrderRepository;

    @GetMapping("/admin/list-orders")
    public String order(final HttpServletRequest request, final ModelMap model,
                        @PathParam("page") Integer page) {
        int pageP = !ObjectUtils.isEmpty(page)? page : 1;
        Pageable pageable = PageRequest.of(pageP-1, 10);
        Page<SaleOrder> orderPage = saleOrderRepository.findAll(pageable);
        model.addAttribute("orders", orderPage.getContent());
        model.addAttribute("currentPage", pageP);
        model.addAttribute("total", orderPage.getTotalPages());
        String search = request.getParameter("search");

        if (search != null) {
            List<SaleOrder> saleOrders = new ArrayList<>();
            for (SaleOrder saleOrder : saleOrderRepository.findAll()) {
                if (saleOrder.getCode().toLowerCase().equals(search.toLowerCase())) {
                    saleOrders.add(saleOrder);
                }
            }
            model.addAttribute("orders", saleOrders);
        }
        return "admin/donhang";
    }

//    @GetMapping("/admin/list-orders/{id}")
//    public String order(@PathVariable Integer id, final HttpServletRequest request) {
//        SaleOrder sale = saleOrderRepo.getOne(id);
//        // sale.setStatus(Integer.parseInt(request.getParameter("gridRadios")));
//        saleOrderRepo.save(sale);
//        return "back-end/donhang";
//    }
//
//    @RequestMapping(value = { "/delete-order" }, method = RequestMethod.POST)
//    public ResponseEntity<AjaxResponse> deletesaleOrder(final ModelMap model, final HttpServletRequest request,
//                                                        final HttpServletResponse response, @RequestBody Integer id) {
//        saleOrderRepo.deleteById(id);
//        return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công!"));
//    }
//
//    @PostMapping(value = { "/update-status" })
//    public ResponseEntity<AjaxResponse> updateStatus(@RequestBody String data) {
//        JSONObject json = new JSONObject(data);
//        SaleOrder order = saleOrderRepo.getOne(json.getInt("id"));
//        order.setStatus(json.getInt("status"));
//        order.setUpdatedDate(LocalDate.now());
//        saleOrderRepo.save(order);
//        return ResponseEntity.ok(new AjaxResponse(200,"Success"));
//    }
}
