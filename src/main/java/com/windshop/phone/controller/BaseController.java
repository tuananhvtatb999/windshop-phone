package com.windshop.phone.controller;

import com.windshop.phone.entity.Brand;
import com.windshop.phone.entity.Category;
import com.windshop.phone.repository.BrandRepository;
import com.windshop.phone.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
public abstract class BaseController {

    @Autowired
    private BrandRepository brandRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @ModelAttribute("brands")
    public List<Brand> getBrand(){
        return brandRepository.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> getCategories(){
        return categoryRepository.findAll();
    }
}
