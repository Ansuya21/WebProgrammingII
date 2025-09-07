package com.example.service;

import com.example.model.User;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    private final Map<String, User> userDb = new HashMap<>();

    @Override
    public boolean authenticate(String username, String password) {
        return userDb.containsKey(username) && userDb.get(username).getPassword().equals(password);
    }

    @Override
    public void register(User user) {
        userDb.put(user.getUsername(), user);
    }

    @Override
    public User getUserByUsername(String username) {
        return userDb.get(username);
    }
}
