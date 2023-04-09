package com.windshop.phone.config;

import com.windshop.phone.entity.Cart;
import com.windshop.phone.entity.ProductCart;
import com.windshop.phone.entity.User;
import com.windshop.phone.model.CartDto;
import com.windshop.phone.model.ProductInCart;
import com.windshop.phone.repository.CartRepository;
import com.windshop.phone.repository.ProducRepository;
import com.windshop.phone.repository.ProductCartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;

@Component
public class UserLogoutSuccessHandler implements LogoutHandler {

    @Autowired
    private ProductCartRepository productCartRepository;

    @Autowired
    private ProducRepository producRepository;

    @Autowired
    private CartRepository cartRepository;

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        HttpSession httpSession = request.getSession();

        CartDto cartDto = (CartDto) httpSession.getAttribute("GIO_HANG");
        if (cartDto == null) {
            return;
        }

        Cart cart = new Cart();
        User userLogged = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        cart.setEmailUser(userLogged.getEmail());
        cart.setCreatedDate(LocalDateTime.now());
        cartRepository.save(cart);
        for (ProductInCart sanPhamTrongGioHang : cartDto.getProductInCarts()) {
            ProductCart productCart = new ProductCart();
            productCart.setCart(cart);
            productCart.setProduct(producRepository.getOne(sanPhamTrongGioHang.getMaSanPham()));
            productCart.setQuantity(sanPhamTrongGioHang.getSoluong());
            productCartRepository.save(productCart);
        }
        httpSession.removeAttribute("GIO_HANG");
        httpSession.removeAttribute("SL_SP_GIO_HANG");
    }
}
