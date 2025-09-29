package com.quangpham.online_store.controller;

import com.quangpham.online_store.domain.User;
import com.quangpham.online_store.repository.UserRepository;
import com.quangpham.online_store.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("hello", "moi");
        return "hello";
    }

    @RequestMapping("/admin/user/create")
    public String createUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String getAdminCreateUser(Model model, @ModelAttribute("newUser") User newUser) {
        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user")
    public String getUserTable(Model model) {
        List<User> listUser = userService.handleFindAll();
        model.addAttribute("list", listUser);
        return "admin/user/table_users";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserById(@PathVariable("id") long id, Model model) {
        User user = userService.handleFindById(id);
        model.addAttribute("user", user);
        return "admin/user/user_detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUserUpdatePage(@PathVariable("id") long id, Model model) {
        model.addAttribute("user", this.userService.handleFindById(id));
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(@ModelAttribute("user") User user, Model model) {
        User currentUser = this.userService.handleFindById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setPhone(user.getPhone());
            currentUser.setFullName(user.getFullName());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(@PathVariable("id") long id, Model model) {
        User user = this.userService.handleFindById(id);
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUser(@ModelAttribute("user")  User user) {
        User currentUser = this.userService.handleFindById(user.getId());
        if (currentUser != null) {
            this.userService.deteleUserbyId(user.getId());
        }
        return "redirect:/admin/user";
    }
}
