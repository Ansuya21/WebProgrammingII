package com.example.service;

import com.example.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    // Spring Security already requires loadUserByUsername(String username)

    // Custom method to save a new user
    User save(User user);
}
