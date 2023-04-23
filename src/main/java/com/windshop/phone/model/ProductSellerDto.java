package com.windshop.phone.model;

import com.windshop.phone.entity.Brand;
import com.windshop.phone.entity.Category;
import com.windshop.phone.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductSellerDto {

    private Integer id;

    private LocalDateTime createdDate;

    private LocalDateTime updatedDate;

    private Integer status;

    private String title;

    private BigDecimal price;

    private BigDecimal priceSale;

    private Integer quantity;

    private String shortDes;

    private String shortDetails;

    private String seo;

    private Category category;

    private Brand brand;

    private Integer quantitySold;

    private BigDecimal revenuePrice;

    private Integer month;

    private Integer year;

    public ProductSellerDto(Product product, Long quantitySold, BigDecimal revenuePrice, Integer month) {
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.map(product, this);
        this.setQuantitySold(Math.toIntExact(quantitySold));
        this.setRevenuePrice(revenuePrice);
        this.setMonth(month);
        this.setYear(month);
    }
}
