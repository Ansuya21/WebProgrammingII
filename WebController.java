package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class WebController {

    @GetMapping
    public String showIndexPage() {
        return "index"; // The main home page for unauthenticated users
    }

    @GetMapping("/user/login")
    public String showLoginPage() {
        return "login";
    }

    @GetMapping("/user/register")
    public String showRegisterPage() {
        return "register";
    }
}
