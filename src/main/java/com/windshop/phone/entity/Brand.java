package com.windshop.phone.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tbl_brand")
public class Brand extends BaseEntity {

	@Column(name = "name", nullable = true)
	private String name;

	@Column(name = "description", nullable = true)
	private String description;
	
	@Column(name = "image")
	private String image;

	@Column(name = "seo", nullable = false)
	private String seo;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "brand", fetch = FetchType.LAZY)
	private List<Product> products = new ArrayList<Product>();

	public void addProduct(Product product) {
		products.add(product);
		product.setBrand(this);
	}
	
	public void removeProduct(Product product) {
		products.remove(product);
		product.setBrand(null);
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
