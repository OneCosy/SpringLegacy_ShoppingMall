package com.mycatgib.springstudy.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class ApiController {
    @GetMapping("/api/{name}")
    public Response helloApi(@PathVariable String name) {
        return new Response("Hello, " + name);
    }

    static class Response {
        private String value;

        public Response(String name) {
            this.value = name;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }
}
