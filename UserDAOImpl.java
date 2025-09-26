package com.example.dao.impl;

import com.example.dao.UserDAO;
import com.example.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * Implementation of the UserDAO interface using Spring's JdbcTemplate.
 * This class handles database operations for the User entity.
 */
@Repository
public class UserDAOImpl implements UserDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public UserDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    /**
     * Finds a user by their email address.
     * @param email The email address to search for.
     * @return An Optional containing the User if found, otherwise an empty Optional.
     */
    @Override
    public Optional<User> findByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email = ?";
        try {
            // queryForObject is used here to get a single result.
            // A RowMapper is provided to map the result set to a User object.
            User user = jdbcTemplate.queryForObject(sql, new UserRowMapper(), email);
            return Optional.ofNullable(user);
        } catch (EmptyResultDataAccessException e) {
            // If no user is found, queryForObject will throw an exception.
            // We catch it and return an empty Optional.
            return Optional.empty();
        }
    }

    /**
     * Saves a new user to the database.
     * @param user The User object to save.
     * @return The saved User object, which may include a generated ID.
     */
    @Override
    public User save(User user) {
        SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
                .withTableName("user")
                .usingGeneratedKeyColumns("id");

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("name", user.getName());
        parameters.put("email", user.getEmail());
        parameters.put("password", user.getPassword());

        Number key = jdbcInsert.executeAndReturnKey(parameters);
        user.setId(key.longValue());
        return user;
    }

    /**
     * RowMapper to convert a ResultSet row into a User object.
     */
    private static class UserRowMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getLong("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            return user;
        }
    }
}
