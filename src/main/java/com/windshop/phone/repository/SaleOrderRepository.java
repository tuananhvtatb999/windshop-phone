package com.windshop.phone.repository;

import com.windshop.phone.entity.SaleOrder;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SaleOrderRepository extends JpaRepository<SaleOrder, Integer> {
}
