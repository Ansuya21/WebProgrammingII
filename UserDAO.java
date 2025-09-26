package com.example.dao;
import com.example.model.User;
import org.springframework.stereotype.Repository;
import java.util.Optional;
/**
 * Data Access Object for User entities.
 * This interface defines the contract for interacting with the database
 * to perform operations on the User table.
 */
@Repository
public interface UserDAO {
    /**
     * Finds a user by their email address.
     * @param email The email address to search for.
     * @return An Optional containing the User if found, otherwise an empty Optional.
     */
    Optional<User> findByEmail(String email);
    /**
     * Saves a new user to the database.
     * @param user The User object to save.
     * @return The saved User object, which may include a generated ID.
     */
    User save(User user);
}
