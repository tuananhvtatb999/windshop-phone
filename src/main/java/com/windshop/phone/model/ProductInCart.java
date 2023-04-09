package com.windshop.phone.model;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class ProductInCart {
    private int maSanPham;
    private String tenSanPham;
    private int soluong;
    private BigDecimal giaban;
    private String urlImage;
}
