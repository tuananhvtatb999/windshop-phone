package com.windshop.phone.config;

import com.windshop.phone.entity.Cart;
import com.windshop.phone.entity.Product;
import com.windshop.phone.entity.ProductCart;
import com.windshop.phone.entity.User;
import com.windshop.phone.model.CartDto;
import com.windshop.phone.model.ProductInCart;
import com.windshop.phone.repository.ProductCartRepository;
import com.windshop.phone.service.impl.CartServiceImpl;
import com.windshop.phone.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Autowired
    private ProductCartRepository productCartRepository;

    @Autowired
    private CartServiceImpl cartService;


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException {

        HttpSession httpSession = request.getSession();

        User userDetails = (User) authentication.getPrincipal();
        if(userDetails.getRole().equals("ADMIN")){
            response.sendRedirect("admin");
            return;
        }
        Cart cart = cartService.findByUserEmail(userDetails.getEmail(), 1);
        if (cart == null){
            response.sendRedirect("home");
            return;
        }

        List<ProductCart> productCartList = cart.getProducts();
        List<ProductInCart> productInCarts = new ArrayList<>();
        for (ProductCart productCart: productCartList) {
            Product product = productCart.getProduct();
            ProductInCart productInCart = new ProductInCart();
            productInCart.setMaSanPham(product.getId());
            productInCart.setTenSanPham(product.getTitle());
            productInCart.setSoluong(productCart.getQuantity());
            productInCart.setGiaban(product.getPrice());
            productInCart.setUrlImage(product.getProductImages().get(0).getTitle());
            productInCarts.add(productInCart);
        }
        CartDto cartDto = new CartDto();
        cartDto.setProductInCarts(productInCarts);
        httpSession.setAttribute("GIO_HANG", cartDto);
        httpSession.setAttribute("SL_SP_GIO_HANG", cartDto.getProductInCarts().size());

        String redirectURL;

        if (userDetails.getRole().equals("USER")) {
            redirectURL = "home";
        } else {
            redirectURL = "admin";
        }
        response.sendRedirect(redirectURL);

    }

}