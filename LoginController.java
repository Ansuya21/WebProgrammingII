package com.example.controller;

import com.example.model.User;
import com.example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    // Show login form
    @GetMapping("/login")
    public String showLoginPage() {
        return "user/login"; // maps to /WEB-INF/views/user/login.jsp
    }

    // Process login
    @PostMapping("/login")
    public ModelAndView processLogin(@RequestParam("username") String username,
                                     @RequestParam("password") String password) {
        ModelAndView mv = new ModelAndView();
        if (loginService.authenticate(username, password)) {
            User user = loginService.getUserByUsername(username);
            mv.setViewName("user/loginsummary");
            mv.addObject("username", user.getUsername());
        } else {
            mv.setViewName("user/login");
            mv.addObject("error", "Invalid username or password!");
        }
        return mv;
    }

    // Show registration form
    @GetMapping("/register")
    public String showRegistrationPage() {
        return "user/registration"; // maps to /WEB-INF/views/user/registration.jsp
    }

    // Process registration
    @PostMapping("/register")
    public ModelAndView processRegistration(@RequestParam("name") String name,
                                            @RequestParam("email") String email,
                                            @RequestParam("username") String username,
                                            @RequestParam("password") String password) {
        User user = new User(name, email, username, password);
        loginService.register(user);

        ModelAndView mv = new ModelAndView("user/summary");
        mv.addObject("name", user.getName());
        mv.addObject("username", user.getUsername());
        return mv;
    }
}
