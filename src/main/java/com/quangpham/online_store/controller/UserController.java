package com.quangpham.online_store.controller;

import com.quangpham.online_store.domain.User;
import com.quangpham.online_store.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("hello", "moi");
        return "test";
    }

    @RequestMapping("/admin/user")
    public String getAdminUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String getAdminCreateUser(Model model, @ModelAttribute("newUser") User newUser) {
        System.out.println(newUser);
        return "hello";
    }

//    @GetMapping("/")
//    public String getHomePage() {
//        return userService.handleHello();
//    }
}
