package com.bit.controller;

import com.bit.dto.ProductDTO;
import com.bit.service.ShoppingService;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class TestController {

    @Resource(name = "shoppingServiceImp")
    private ShoppingService service;

    @PostMapping(value = "productInsert2")
    public int productAddProcess(ProductDTO dto) {
        System.out.println(dto);
        return service.productAdminInsert(dto);
    }
}
