package com.windshop.phone.controller.user;

import com.windshop.phone.controller.BaseController;
import com.windshop.phone.entity.User;
import com.windshop.phone.model.AjaxResponse;
import com.windshop.phone.model.UserDto;
import com.windshop.phone.service.impl.UserServiceImpl;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;

@Controller
@RequestMapping("user")
public class AccountController extends BaseController {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/account")
    public String indexAccount(final Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User userDb = userService.findByEmail(user.getEmail());
        model.addAttribute("user", userDb);
        return "user/account";
    }

    @PostMapping("/change-password")
    public ResponseEntity<AjaxResponse> changePassword(@RequestBody String data) throws JSONException {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        JSONObject json = new JSONObject(data);
        if (!bCryptPasswordEncoder.matches(json.getString("oldPass"), user.getPassword())) {
            return ResponseEntity.ok(new AjaxResponse(200, "Fail"));
        }
        User userDb = userService.findByEmail(user.getEmail());
        userDb.setPassword(json.getString("newPass"));
        userDb.setUpdatedDate(LocalDateTime.now());
        userService.save(userDb);
        return ResponseEntity.ok(new AjaxResponse(200, "Success"));
    }

    @PostMapping("/change-information")
    public ResponseEntity<AjaxResponse> changeInformation(@ModelAttribute UserDto user) throws JSONException, IOException {
        userService.update(user);
        return ResponseEntity.ok(new AjaxResponse(200, "Success"));
    }
}
