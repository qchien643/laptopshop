package com.example.spring_boot.controller;

import com.example.spring_boot.domain.User;
import com.example.spring_boot.repository.UserRepository;
import com.example.spring_boot.service.RoleService;
import com.example.spring_boot.service.UploadService;
import com.example.spring_boot.service.UserService;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import com.example.spring_boot.domain.Role;

import jakarta.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.method.P;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final RoleService roleService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(
            UserService userService, RoleService roleService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user/create")
    public String getAdminUserPage(Model model) {
        User user = new User();
        List<Role> roles = this.roleService.getAllRoles();
        for (Role role : roles) {
            if ("USER".equalsIgnoreCase(role.getName())) {
                user.setRole(role);
                break;
            }
        }
        model.addAttribute("roles", roles);
        model.addAttribute("newUser", user);

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
        List<Role> roles = this.roleService.getAllRoles();
        User user = this.userService.getOneUserById(id);

        model.addAttribute("user", user);
        model.addAttribute("roles", roles);
        return "admin/user/update";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String handleAdminUserDelete(@PathVariable("id") Long id) {
        this.userService.deleteUserById(id);
        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user")
    public String createAdminUser(Model model, @ModelAttribute("newUser") User newUser,
            @ModelAttribute("file") MultipartFile file) {

        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());
        String avatar = this.uploadService.uploadFileHandler(file, "admin/images/avatar");
        newUser.setPassword(hashPassword);
        newUser.setAvatar(avatar);
        this.userService.handleSaveUser(newUser);

        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/update/{id}")
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
