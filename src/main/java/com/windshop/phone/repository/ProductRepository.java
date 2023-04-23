package com.windshop.phone.repository;

import com.windshop.phone.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    Page<Product> findAllByBrandId(Integer brandId, Pageable pageable);

    Page<Product> findAllByCategoryId(Integer categoryId, Pageable pageable);
}
