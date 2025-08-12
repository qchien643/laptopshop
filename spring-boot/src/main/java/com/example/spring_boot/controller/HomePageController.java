package com.example.spring_boot.controller;

import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring_boot.domain.Product;
import com.example.spring_boot.service.FactoryService;
import com.example.spring_boot.service.ProductsService;
import com.example.spring_boot.service.TargetService;

@Controller
public class HomePageController {
    private final ProductsService productsService;
    private final TargetService targetService;
    private final FactoryService factoryService;

    public HomePageController(ProductsService productsService, TargetService targetService,
            FactoryService factoryService) {
        this.productsService = productsService;
        this.targetService = targetService;
        this.factoryService = factoryService;
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

    @GetMapping("/shopDetail")
    public String getShopDetailPage(Model model) {

        model.addAttribute("factories", this.factoryService.getAllFactories());
        return "homepage/shop_detail/shop-detail";
    }

    @GetMapping("/products/{id}")
    public String getProductDetailPage(@PathVariable("id") Long id) {
        return "homepage/shop_detail/shop-detail";
    }

}
