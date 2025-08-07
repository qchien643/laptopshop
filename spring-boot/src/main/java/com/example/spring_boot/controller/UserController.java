package com.example.spring_boot.controller;

import com.example.spring_boot.domain.User;
import com.example.spring_boot.repository.UserRepository;
import com.example.spring_boot.service.UserService;

import java.util.List;

import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(
            UserService userService) {
        this.userService = userService;
        ;
    }

    @GetMapping("/admin/user/create")
    public String getAdminUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping("/admin/user/view/{id}")
    public String getUserDetailPage(Model model, @PathVariable("id") Long id) {
        User user = this.userService.getOneUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user")
    public String getAdminUserCreatePage(Model model) {
        List<User> arrUsers = this.userService.getAllUser();
        System.out.println(arrUsers);
        model.addAttribute("dataUsers", arrUsers);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getAdminUserUpdatePage(Model model, @PathVariable("id") Long id) {
        User user = this.userService.getOneUserById(id);
        model.addAttribute("user", user);
        return "admin/user/update";
    }

    @RequestMapping(value = "/admin/user/delete/{id}")
    public String handleAdminUserDelete(@PathVariable("id") Long id) {
        this.userService.deleteUserById(id);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user", method = RequestMethod.POST)
    public String createAdminUser(Model model, @ModelAttribute("newUser") User newUser) {
        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/update/{id}", method = RequestMethod.POST)
    public String handleAdminUserUpdate(Model model, @PathVariable("id") Long id, @ModelAttribute("user") User user) {
        user.setId(id);
        this.userService.updateOrInsert(user);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/view/{id}", method = RequestMethod.POST)
    public String createAdminUserPage(Model model, @ModelAttribute("newUser") User newUser) {
        System.out.println("Creating admin user page" + newUser);
        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

}
