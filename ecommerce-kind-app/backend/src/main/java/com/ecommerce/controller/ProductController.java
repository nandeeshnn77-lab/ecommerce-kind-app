package com.ecommerce.controller;

import com.ecommerce.model.Product;
import com.ecommerce.repository.ProductRepository;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
@CrossOrigin(origins = "*")
public class ProductController {

    private final ProductRepository repository;

    public ProductController(ProductRepository repository) {

        this.repository = repository;
    }

    @GetMapping
    public List<Product> getProducts() {

        return repository.findAll();
    }

    @PostMapping
    public Product createProduct(@RequestBody Product product) {

        return repository.save(product);
    }

}
