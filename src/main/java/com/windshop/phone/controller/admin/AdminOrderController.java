package com.windshop.phone.controller.admin;


import com.windshop.phone.controller.BaseController;
import com.windshop.phone.entity.Product;
import com.windshop.phone.entity.SaleOrder;
import com.windshop.phone.entity.SaleOrderProduct;
import com.windshop.phone.entity.User;
import com.windshop.phone.enums.StatusOrder;
import com.windshop.phone.model.AjaxResponse;
import com.windshop.phone.repository.ProductRepository;
import com.windshop.phone.repository.SaleOrderRepository;
import com.windshop.phone.service.impl.UserServiceImpl;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


@Controller
@RequestMapping("/admin")
public class AdminOrderController extends BaseController {

    @Autowired
    SaleOrderRepository saleOrderRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/list-orders")
    public String order(final HttpServletRequest request, final ModelMap model,
                        @PathParam("page") Integer page) {
        int pageP = !ObjectUtils.isEmpty(page) ? page : 1;
        Pageable pageable = PageRequest.of(pageP - 1, 10);
        Page<SaleOrder> orderPage = saleOrderRepository.findAll(pageable);
        model.addAttribute("orders", orderPage.getContent());
        model.addAttribute("currentPage", pageP);
        model.addAttribute("total", orderPage.getTotalPages());
        String search = request.getParameter("search");

        if (search != null) {
            List<SaleOrder> saleOrders = new ArrayList<>();
            for (SaleOrder saleOrder : saleOrderRepository.findAll()) {
                if (saleOrder.getCode().equalsIgnoreCase(search) ||
                saleOrder.getUser().getFirstName().equalsIgnoreCase(search) ||
                        saleOrder.getUser().getLastName().equalsIgnoreCase(search)) {
                    saleOrders.add(saleOrder);
                }
            }
            model.addAttribute("orders", saleOrders);
        }
        return "admin/donhang";
    }

    @PostMapping("/delete-order")
    public ResponseEntity<AjaxResponse> deletesaleOrder(@RequestBody Integer id) {
        SaleOrder saleOrder = saleOrderRepository.findById(id).orElse(null);
        saleOrder.setStatus(0);
        saleOrderRepository.saveAndFlush(saleOrder);
        return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công!"));
    }

    @PostMapping("/update-status-order")
    public ResponseEntity<AjaxResponse> updateStatus(@RequestBody String data) {
        JSONObject json = new JSONObject(data);
        SaleOrder order = saleOrderRepository.getOne(json.getInt("id"));
        int status = json.getInt("status");
        if(status == 1 && status != order.getStatusOrder()) {
            for (SaleOrderProduct sale: order.getSaleOrderProducts()) {
                Product product = sale.getProduct();
                Product productInDB = productRepository.getReferenceById(product.getId());
                product.setQuantity(productInDB.getQuantity() - sale.getQuantity());
                productRepository.save(productInDB);
            }
        }
        User userLogged = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.findByEmail(userLogged.getEmail());
        order.setLastestUpdateBy(user);
        order.setStatusOrder(status);
        order.setStatusOrderName(Objects.requireNonNull(StatusOrder.findByCode(status)).toString());
        order.setUpdatedDate(LocalDateTime.now());
        saleOrderRepository.save(order);
        return ResponseEntity.ok(new AjaxResponse(200,"Success"));
    }
}
