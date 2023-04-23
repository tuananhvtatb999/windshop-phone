package com.windshop.phone.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "tbl_saleorder_products")
@Getter
@Setter
public class SaleOrderProduct extends BaseEntity {
	
	@ManyToOne(fetch = FetchType.EAGER )
	@JoinColumn(name = "product_id")
	private Product product;
	
	@Column(name = "quantity")
	private Integer quantity;
	
	@Column(name = "price", precision = 13, scale = 0, nullable = false)
	private BigDecimal price;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "saleorder_id")
	private SaleOrder saleOrder;

	@Column(name = "month")
	private Integer month;

	@Column(name = "year")
	private Integer year;
}
