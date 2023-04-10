package com.windshop.phone.model;

import com.windshop.phone.entity.Product;
import com.windshop.phone.repository.ProductRepository;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CartDto {
    private List<ProductInCart> ProductInCarts = new ArrayList<>();

    public List<ProductInCart> getProductInCarts() {
        return ProductInCarts;
    }

    public void setProductInCarts(List<ProductInCart> ProductInCarts) {
        this.ProductInCarts = ProductInCarts;
    }

    public BigDecimal getTotal(ProductRepository productRepo) {
        BigDecimal decimal = BigDecimal.ZERO;
        for (ProductInCart phamTrongGioHang : ProductInCarts) {
            Product product = productRepo.getOne(phamTrongGioHang.getMaSanPham());
            decimal = decimal.add(product.getPrice());
        }
        return decimal;
    }

}
