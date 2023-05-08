package com.windshop.phone.controller.user;

import com.windshop.phone.controller.BaseController;
import com.windshop.phone.entity.BaseEntity;
import com.windshop.phone.entity.Product;
import com.windshop.phone.entity.User;
import com.windshop.phone.service.impl.ProductServiceImpl;
import com.windshop.phone.service.impl.UserServiceImpl;
import com.windshop.phone.util.Utility;
import com.windshop.phone.validator.UserValidator;
import net.bytebuddy.utility.RandomString;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class IndexController extends BaseController {

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping(value = "/home")
    public String index(final Model model) {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> productList = productService.shopProduct(pageable);
        List<Product> products = productList.getContent().stream().sorted(Comparator.comparing(BaseEntity::getCreatedDate)).collect(Collectors.toList());
        model.addAttribute("products", products);
        return "user/home";
    }

    @GetMapping(value = "/shop")
    public String shopPage(final ModelMap model, final HttpServletRequest request,
                           @PathParam("page") Integer page,
                           @PathParam("brandId") Integer brandId,
                           @PathParam("categoryId") Integer categoryId) {
        int pageP = !ObjectUtils.isEmpty(page) ? page : 1;
        Pageable pageable = PageRequest.of(pageP - 1, 12);
        Page<Product> productList = productService.shopProduct(pageable);

        if (brandId != null) {
            productList = productService.pageProductByBrand(brandId, pageable);
        }

        if (categoryId != null) {
            productList = productService.pageProductByCategory(categoryId, pageable);
        }

        String search = request.getParameter("search");
        String gia = request.getParameter("gia");
        List<Product> productSearch = new ArrayList<>();

        if (StringUtils.isNotEmpty(search)) {
            productSearch = productList.getContent().stream().filter(t -> t.getTitle().toLowerCase().contains(search.toLowerCase())
                    || t.getBrand().getName().toLowerCase().contains(search.toLowerCase())
                    || t.getCategory().getName().toLowerCase().contains(search.toLowerCase()))
                    .collect(Collectors.toList());
        }

        if (StringUtils.isNotEmpty(gia)) {
            productSearch = productService.filter(Integer.parseInt(gia));

        }

        model.addAttribute("products", StringUtils.isNotEmpty(search) || StringUtils.isNotEmpty(gia) ? productSearch : productList.getContent());
        model.addAttribute("currentPage", pageP);
        model.addAttribute("total", productList.getTotalPages());
        return "user/shop";
    }

    @GetMapping(value = "/single-product")
    public String singleProduct(@PathParam("id") Integer id,
                                Model model) {
        Product product = productService.findById(id).orElse(null);
        model.addAttribute("product", product);
        return "user/single-product";
    }

    @GetMapping(value = "/user/checkout")
    public String checkout(final Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User userDb = userService.findByEmail(user.getEmail());
        model.addAttribute("address", user.getAddress());
        return "user/checkout";
    }

    @GetMapping(value = "/sign-in")
    public String login(Model model, String error, String logout) {
        String message = (String) model.getAttribute("message");
        if (!ObjectUtils.isEmpty(message)) {
            model.addAttribute("message", message);
        } else {
            model.addAttribute("message", "");
        }
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("messageLogout", "You have been logged out successfully.");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
            return "user/sign-in";
        }

        return "redirect:/home";
    }

    @GetMapping(value = "/sign-up")
    public String signUp(Model model) {
        model.addAttribute("userForm", new User());
        return "user/sign-up";
    }

    @PostMapping("/sign-up")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult,
                               RedirectAttributes redirectAttributes) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "user/sign-up";
        }

        userForm.setRole("USER");
        userForm.setCreatedDate(LocalDateTime.now());
        userService.save(userForm);
        redirectAttributes.addFlashAttribute("message", "success");

        return "redirect:/sign-in";
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "user/forgot-password";
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String token = RandomString.make(30);

        try {
            userService.updateResetPasswordToken(token, email);
            String resetPasswordLink = Utility.getSiteURL(request) + "/reset-password?token=" + token;
            sendEmail(email, resetPasswordLink);
            model.addAttribute("message", "We have sent a reset password link to your email. Please check.");
        } catch (UnsupportedEncodingException | MessagingException e) {
            model.addAttribute("error", "Error while sending email");
        }

        return "user/forgot-password";
    }

    @GetMapping("/reset-password")
    public String showResetPasswordForm(@PathParam(value = "token") String token, Model model) {
        User customer = userService.getByResetPasswordToken(token);
        model.addAttribute("token", token);

        if (customer == null) {
            model.addAttribute("message", "Invalid Token");
            return "message";
        }

        return "user/reset-password";
    }

    @PostMapping("/reset-password")
    public String processResetPassword(HttpServletRequest request, Model model) {
        String token = request.getParameter("token");
        String password = request.getParameter("password");

        User customer = userService.getByResetPasswordToken(token);
        model.addAttribute("title", "Reset your password");

        if (customer == null) {
            model.addAttribute("message", "Invalid Token");
            return "message";
        } else {
            userService.updatePassword(customer, password);

            model.addAttribute("message", "You have successfully changed your password.");
        }

        return "redirect:/home";
    }

    public void sendEmail(String recipientEmail, String link)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("contact@windshop.com", "Wind-shop Support");
        helper.setTo(recipientEmail);

        String subject = "Here's the link to reset your password";

        String content = "<p>Hello,</p>"
                + "<p>You have requested to reset your password.</p>"
                + "<p>Click the link below to change your password:</p>"
                + "<p><a href=\"" + link + "\">Change my password</a></p>"
                + "<br>"
                + "<p>Ignore this email if you do remember your password, "
                + "or you have not made the request.</p>";

        helper.setSubject(subject);

        helper.setText(content, true);

        mailSender.send(message);
    }
}