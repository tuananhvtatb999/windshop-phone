package com.windshop.phone.repository;

import com.windshop.phone.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProducRepository extends JpaRepository<Product, Integer> {
}
