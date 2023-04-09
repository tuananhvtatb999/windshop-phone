package com.windshop.phone.controller;

import com.windshop.phone.entity.Brand;
import com.windshop.phone.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
public abstract class BaseController {

    @Autowired
    private BrandRepository brandRepository;

    @ModelAttribute("brands")
    public List<Brand> getBrand(){
        return brandRepository.findAll();
    }
}
