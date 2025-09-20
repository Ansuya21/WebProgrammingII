package com.example.service;

import com.example.dao.UserDao;
import com.example.model.User;

public class UserService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) { this.userDao = userDao; }

    public int register(User user) { return userDao.register(user); }

    public User login(String email, String password) { return userDao.login(email, password); }
}
