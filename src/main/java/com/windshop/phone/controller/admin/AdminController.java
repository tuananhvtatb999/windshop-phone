package com.windshop.phone.controller.admin;

import com.windshop.phone.entity.SaleOrder;
import com.windshop.phone.entity.User;
import com.windshop.phone.repository.SaleOrderRepository;
import com.windshop.phone.repository.UserRepository;
import com.windshop.phone.service.impl.UserServiceImpl;
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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AdminController {

    @Autowired
    private SaleOrderRepository saleOrderRepository;

    @Autowired
    private UserServiceImpl userService;

    @GetMapping(value = "/admin")
    public String indexAdmin(final HttpServletRequest request, final ModelMap model,
                             @PathParam("page") Integer page,
                             @PathParam("month") Integer month,
                             @PathParam("year") Integer year) {
        int pageP = !ObjectUtils.isEmpty(page) ? page : 1;
        Pageable pageable = PageRequest.of(pageP - 1, 10);
        Page<SaleOrder> orderPage = saleOrderRepository.findAll(pageable);
        List<SaleOrder> orderList;
        int totalP = 0;
        Integer finalYear;
        Integer finalMonth;
        if (month == null || year == null) {
            finalYear = LocalDateTime.now().getMonthValue();
            finalMonth = LocalDateTime.now().getYear();
            orderList = orderPage.getContent().stream().filter(t -> t.getCreatedDate().getMonthValue() == finalMonth
                    && t.getCreatedDate().getYear() == finalYear).collect(Collectors.toList());
            totalP = orderList.isEmpty() ? 0 : (int)Math.ceil((double)orderList.size() / (double)10);
        } else {
            finalMonth = month;
            finalYear = year;
            orderList = orderPage.getContent().stream().filter(t -> t.getCreatedDate().getMonthValue() == finalMonth
                    && t.getCreatedDate().getYear() == finalYear).collect(Collectors.toList());
            totalP = orderList.isEmpty() ? 0 : (int)Math.ceil((double)orderList.size() / (double)10);
        }

        User user = userService.findById(saleOrderRepository.getIdBestSeller(month, year));
        model.addAttribute("bestSeller", user != null ? user.getFirstName() + " " + user.getLastName() : "No data");
        model.addAttribute("totalMonth", saleOrderRepository.sumTotalInMonth(month, year));
        model.addAttribute("quantityOrder", saleOrderRepository.quantityOrder(month, year));
        model.addAttribute("quantityProduct", saleOrderRepository.quantityProduct(month, year));
        model.addAttribute("month", month);
        model.addAttribute("year", year);



        model.addAttribute("orders", orderList);
        model.addAttribute("currentPage", pageP);
        model.addAttribute("total", totalP);

        return "admin/index";
    }

    @GetMapping(value = "/role-blocked")
    public String accessDenied() {
        return "admin/blocked-role";
    }

}
