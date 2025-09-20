package com.example.dao;

import com.example.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    // Register user
    public int register(User user) {
        String sql = "INSERT INTO users(username, name, email, password, contact_number) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, user.getUsername(), user.getName(), user.getEmail(), user.getPassword(), user.getContactNumber());
    }

    // Login
    public User login(String email, String password) {
        String sql = "SELECT * FROM users WHERE email=? AND password=?";
        List<User> users = jdbcTemplate.query(sql, new Object[]{email, password}, new RowMapper<User>() {
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setContactNumber(rs.getString("contact_number"));
                return u;
            }
        });
        return users.isEmpty() ? null : users.get(0);
    }
}
