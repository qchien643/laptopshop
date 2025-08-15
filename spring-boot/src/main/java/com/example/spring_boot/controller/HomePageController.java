package com.example.spring_boot.controller;

import org.springframework.security.access.method.P;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring_boot.domain.Product;
import com.example.spring_boot.domain.User;
import com.example.spring_boot.domain.dto.RegisterDTO;
import com.example.spring_boot.service.FactoryService;
import com.example.spring_boot.service.ProductsService;
import com.example.spring_boot.service.TargetService;
import com.example.spring_boot.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;

@Controller
public class HomePageController {
    private final ProductsService productsService;
    private final TargetService targetService;
    private final FactoryService factoryService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(
            ProductsService productsService,
            TargetService targetService,
            FactoryService factoryService,
            UserService userService,
            PasswordEncoder passwordEncoder) {
        this.productsService = productsService;
        this.targetService = targetService;
        this.factoryService = factoryService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("products", this.productsService.getAllProducts());

        return "homepage/home/home";
    }

    @GetMapping("/contact")
    public String getHomePageShop() {
        return "homepage/contact/contact";
    }

    @GetMapping("/shop")
    public String getShopPage() {
        return "homepage/shop/shop";
    }

    @GetMapping("/shopDetail/{id}")
    public String getShopDetailPage(Model model, @PathVariable("id") Long id) {
        model.addAttribute("product", this.productsService.getProductById(id));
        model.addAttribute("factories", this.factoryService.getAllFactories());
        return "homepage/shop_detail/shop-detail";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String postRegisterPage(
            @Valid @ModelAttribute("registerUser") RegisterDTO registerDTO,
            BindingResult bindingResult,
            Model model) {

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getAccessDeniedPage() {
        return "client/auth/deny";
    }
}