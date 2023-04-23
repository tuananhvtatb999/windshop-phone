package com.windshop.phone.controller;

import com.windshop.phone.entity.Brand;
import com.windshop.phone.entity.Category;
import com.windshop.phone.repository.CategoryRepository;
import com.windshop.phone.service.impl.BrandServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
public abstract class BaseController {

    @Autowired
    private BrandServiceImpl brandService;

    @Autowired
    private CategoryRepository categoryRepository;

    @ModelAttribute("brands")
    public List<Brand> getBrand() {
        Pageable pageable = PageRequest.of(0, 5);
        Page<Brand> brandPage = brandService.getBrands(pageable);
        return brandPage.getContent();
    }

    @ModelAttribute("categories")
    public List<Category> getCategories() {
        Pageable pageable = PageRequest.of(0, 5);
        Page<Category> categoryPage = categoryRepository.findAllByStatus(1, pageable);
        return categoryPage.getContent();
    }
}
