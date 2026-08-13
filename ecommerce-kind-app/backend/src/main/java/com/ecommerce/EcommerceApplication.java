package com.ecommerce;

import com.ecommerce.model.Product;
import com.ecommerce.repository.ProductRepository;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class EcommerceApplication {

    public static void main(String[] args) {

        SpringApplication.run(EcommerceApplication.class, args);

    }

    @Bean
    CommandLineRunner loadProducts(ProductRepository repository) {

        return args -> {

            if (repository.count() == 0) {

                repository.save(
                    new Product(
                        "Laptop",
                        "High performance business laptop",
                        65000,
                        "https://images.unsplash.com/photo-1496181133206-80ce9b88a853"
                    )
                );

                repository.save(
                    new Product(
                        "Smartphone",
                        "Latest generation smartphone",
                        35000,
                        "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9"
                    )
                );

                repository.save(
                    new Product(
                        "Headphones",
                        "Wireless noise cancelling headphones",
                        5999,
                        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
                    )
                );

                repository.save(
                    new Product(
                        "Smart Watch",
                        "Fitness and health smart watch",
                        7999,
                        "https://images.unsplash.com/photo-1523275335684-37898b6baf30"
                    )
                );
            }
        };
    }
}
