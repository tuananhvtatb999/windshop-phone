package com.windshop.phone.controller.user;

import com.windshop.phone.entity.*;
import com.windshop.phone.model.AjaxResponse;
import com.windshop.phone.model.CartDto;
import com.windshop.phone.model.ProductInCart;
import com.windshop.phone.repository.ProductRepository;
import com.windshop.phone.repository.SaleOrderRepository;
import com.windshop.phone.service.impl.CartServiceImpl;
import com.windshop.phone.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SaleOrderRepository saleOrderRepository;

    @Autowired
    private CartServiceImpl cartService;

    @Autowired
    private UserServiceImpl userService;

    @PostMapping(value = "/user/add-to-cart")
    public ResponseEntity<AjaxResponse> muaHang(@RequestBody ProductInCart productInCart, final HttpServletRequest request) {

        HttpSession httpSession = request.getSession();

        CartDto cartDto = null;

        if (httpSession.getAttribute("GIO_HANG") != null) {
            cartDto = (CartDto) httpSession.getAttribute("GIO_HANG");
        } else {
            cartDto = new CartDto();
            httpSession.setAttribute("GIO_HANG", cartDto);
        }

        List<ProductInCart> _productInCart = cartDto.getProductInCarts();

        boolean sanPhamDaCoTrongCartPhaiKhong = false;

        for (ProductInCart item : _productInCart) {
            if (item.getMaSanPham() == productInCart.getMaSanPham()) {
                sanPhamDaCoTrongCartPhaiKhong = true;
                item.setSoluong(item.getSoluong() + productInCart.getSoluong());
            }
        }

        // nếu sản phẩm chưa có trong giỏ hàng.
        if (!sanPhamDaCoTrongCartPhaiKhong) {

            Product product = productRepository.getOne(productInCart.getMaSanPham());
            productInCart.setTenSanPham(product.getTitle());
            if (product.getPriceSale() != null) {
                productInCart.setGiaban(product.getPriceSale());
            } else {
                productInCart.setGiaban(product.getPrice());
            }
            productInCart.setUrlImage(product.getProductImages().get(0).getTitle());
            cartDto.getProductInCarts().add(productInCart);
        }

        httpSession.setAttribute("SL_SP_GIO_HANG", cartDto.getProductInCarts().size());

        return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(cartDto.getProductInCarts().size())));
    }

    @GetMapping(value = "/user/cart")
    public String cart(final HttpServletRequest request) {

        HttpSession httpSession = request.getSession();

        String str;
        if (httpSession.getAttribute("GIO_HANG") != null) {
            str = "user/cart";
        } else {
            str = "user/cart-empty";
        }
        return str;
    }

    @PostMapping(value = "/update-gio")
    public ResponseEntity<AjaxResponse> update(@RequestBody ProductInCart sanPhamTrongGioHang,
                                               final HttpServletRequest request) {

        HttpSession httpSession = request.getSession();

        CartDto gioHang = (CartDto) httpSession.getAttribute("GIO_HANG");


        List<ProductInCart> _sanPhamTrongGioHangs = gioHang.getProductInCarts();

        for (ProductInCart item : _sanPhamTrongGioHangs) {
            if (item.getMaSanPham() == sanPhamTrongGioHang.getMaSanPham()) {
                item.setSoluong(sanPhamTrongGioHang.getSoluong());
            }
        }
        return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(gioHang.getProductInCarts().size())));
    }

    @PostMapping(value = "/update-quantity")
    public ResponseEntity<AjaxResponse> updateQuantity(@RequestBody ProductInCart sanPhamTrongGioHang,
                                                       final HttpServletRequest request) {

        HttpSession httpSession = request.getSession();

        CartDto gioHang = (CartDto) httpSession.getAttribute("GIO_HANG");

        int sl = 0;
        List<ProductInCart> _sanPhamTrongGioHangs = gioHang.getProductInCarts();
        for (ProductInCart item : _sanPhamTrongGioHangs) {
            if (item.getMaSanPham() == sanPhamTrongGioHang.getMaSanPham()) {
                item.setSoluong(sanPhamTrongGioHang.getSoluong() + item.getSoluong());
                sl = item.getSoluong();
            }
        }

        return ResponseEntity.ok(new AjaxResponse(200, sl));
    }

    @PostMapping(value = "/checkout")
    public String save(final ModelMap model, final HttpServletRequest request) {

        HttpSession httpSession = request.getSession();

        CartDto gioHang = (CartDto) httpSession.getAttribute("GIO_HANG");

        User userLogged = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.findByEmail(userLogged.getEmail());

        SaleOrder saleOrder = new SaleOrder();
        saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
        saleOrder.setCreatedDate(LocalDateTime.now());
        saleOrder.setCustomerName(user.getUsername());
        saleOrder.setCustomerAddress(user.getAddress());
        saleOrder.setCustomerPhone(user.getPhoneNumber());
        saleOrder.setCustomerEmail(user.getEmail());
        saleOrder.setTotal(gioHang.getTotal(productRepository));

        for (ProductInCart sanPhamTrongGioHang : gioHang.getProductInCarts()) {
            SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
            saleOrderProducts.setProduct(productRepository.getOne(sanPhamTrongGioHang.getMaSanPham()));
            saleOrderProducts.setQuality(sanPhamTrongGioHang.getSoluong());
            saleOrderProducts.setPrice(sanPhamTrongGioHang.getGiaban());
            saleOrderProducts.setCreatedDate(LocalDateTime.now());
            saleOrder.addSaleOrderProducts(saleOrderProducts);
        }

        saleOrderRepository.save(saleOrder);

        Cart cart = cartService.findByUserEmail(user.getEmail(), 1);
        cartService.delete(cart);
        httpSession.removeAttribute("GIO_HANG");
        httpSession.removeAttribute("SL_SP_GIO_HANG");
        model.addAttribute("message",
                "<script type=\"text/javascript\">\r\n" + "	alert('Cảm ơn bạn đã mua hàng!')\r\n" + "</script>");
        return "user/home";
    }

    @GetMapping(value = {"/hien-thi-san-pham-trong-gio-hang/{id}"})
    public String indexD(@PathVariable Integer id, final HttpServletRequest request) {

        HttpSession httpSession = request.getSession();

        CartDto gioHang = (CartDto) httpSession.getAttribute("GIO_HANG");
        if (httpSession.getAttribute("GIO_HANG") != null) {
            gioHang = (CartDto) httpSession.getAttribute("GIO_HANG");

            List<ProductInCart> list = gioHang.getProductInCarts();
            Iterator<ProductInCart> it = list.iterator();
            for (Iterator<ProductInCart> iterator = list.iterator(); iterator.hasNext(); ) {
                ProductInCart integer = iterator.next();
                if (integer.getMaSanPham() == id) {
                    iterator.remove();
                }
            }
            //httpSession.setAttribute("GIO_HANG", gioHang);
        }
        String str = null;
        if (httpSession.getAttribute("GIO_HANG") != null) {
            str = "user/cart";
        } else {
            str = "user/cart-empty";
        }
        httpSession.setAttribute("SL_SP_GIO_HANG", gioHang.getProductInCarts().size());
        return str;
    }
}
