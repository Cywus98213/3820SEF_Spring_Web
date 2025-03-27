package com.comp3820sef.webapp.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginContoller {

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}
