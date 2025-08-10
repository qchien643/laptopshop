package com.example.spring_boot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.spring_boot.domain.Product;

import jakarta.transaction.Transactional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Custom query methods (if needed) can be defined here
    Product save(String name);

    @Transactional
    default Product updateOrInsertProduct(Product product) {
        return save(product);
    }
}
