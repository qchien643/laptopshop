package com.example.spring_boot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.spring_boot.domain.Factory;
import com.example.spring_boot.domain.Product;
import com.example.spring_boot.domain.Target;
import com.example.spring_boot.service.FactoryService;
import com.example.spring_boot.service.ProductsService;
import com.example.spring_boot.service.TargetService;
import com.example.spring_boot.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class DashboardController {

    private final ProductsService productsService;
    private final UploadService uploadService;
    private final TargetService targetService;
    private final FactoryService factoryService;

    public DashboardController(ProductsService productsService, UploadService uploadService,
            TargetService targetService, FactoryService factoryService) {
        this.productsService = productsService;
        this.uploadService = uploadService;
        this.targetService = targetService;
        this.factoryService = factoryService;
    }

    @GetMapping("/admin/dashboard")
    public String getDashboardPage() {
        return "admin/dashboard/show";
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> ArrProducts = productsService.getAllProducts();

        model.addAttribute("dataProducts", ArrProducts);

        return "admin/product/show";
    }

    @PostMapping("/admin/product")
    public String postMethodName(Model model, @ModelAttribute("products") Product product) {

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/view/{id}")
    public String getProductView(@PathVariable("id") long id, Model model) {
        Product product = this.productsService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getProductUpdate(@PathVariable("id") long id, Model model) {
        Product product = this.productsService.getProductById(id);
        model.addAttribute("factories", factoryService.getAllFactories());
        model.addAttribute("targets", targetService.getAllTargets());
        model.addAttribute("product", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update/{id}")
    public String postProductUpdate(Model model, @PathVariable("id") long id,
            @ModelAttribute("product") Product product, @ModelAttribute("file") MultipartFile file) {
        // TODO: process POST request
        String imgNameTmp = this.uploadService.uploadFileHandler(file, "admin/images/product");
        if (file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
            product.setImage(imgNameTmp);
        }
        product.setId(id);
        this.productsService.updateProduct(id, product);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/create")
    public String getProductCreate(Model model) {
        model.addAttribute("factories", factoryService.getAllFactories());
        model.addAttribute("targets", targetService.getAllTargets());
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postProductCreate(@ModelAttribute("newProduct") Product product,
            @RequestParam("file") MultipartFile file) {

        String fileName = this.uploadService.uploadFileHandler(file, "admin/images/product");
        product.setImage(fileName);
        this.productsService.createProduct(product);

        // Handle file upload and product creation
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getProductDelete(@PathVariable("id") long id, Model model) {
        this.productsService.deleteProductById(id);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/order")
    public String getOrderPage() {
        return "admin/order/show";
    }

}
