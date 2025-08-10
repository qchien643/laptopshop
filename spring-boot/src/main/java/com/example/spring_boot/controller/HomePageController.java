package com.example.spring_boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageController {

    @GetMapping("/")
    public String getHomePage() {
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

    @GetMapping("/shopDetail")
    public String getShopDetailPage() {
        return "homepage/shop_detail/shop-detail";
    }

}
