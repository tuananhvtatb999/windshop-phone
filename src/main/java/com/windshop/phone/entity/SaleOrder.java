package com.windshop.phone.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tbl_saleorder")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class SaleOrder extends BaseEntity {
	@Column(name = "code")
	private String code;

	@Column(name = "total", precision = 20, scale = 2, nullable = false)
	private BigDecimal total;

	@Column(name = "customer_name")
	private String customerName;

	@Column(name = "customer_address")
	private String customerAddress;
	
	@Column(name = "customer_phone")
	private String customerPhone;

	@Column(name = "cutomer_email")
	private String customerEmail;
	
	@Column(name = "seo")
	private String seo;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "saleOrder", fetch = FetchType.EAGER)
	private List<SaleOrderProducts> saleOrderProducts = new ArrayList<SaleOrderProducts>();

	public void addSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(this);
		saleOrderProducts.add(_saleOrderProducts);
	}

}
