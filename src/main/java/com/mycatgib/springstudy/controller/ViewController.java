package com.mycatgib.springstudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
    @GetMapping("/view")
    public String helloSpring(Model model) {
        model.addAttribute("data", "hello!");
        return "hello";
    }
}
