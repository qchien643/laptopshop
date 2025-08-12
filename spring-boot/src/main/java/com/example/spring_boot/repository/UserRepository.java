package com.example.spring_boot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.example.spring_boot.domain.Role;
import com.example.spring_boot.domain.User;

import jakarta.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // This interface extends the Repository interface for User entity with Long as
    // ID type
    // Additional query methods can be defined here if needed
    User save(User user);

    List<User> findByEmail(String email);

    @Transactional
    default User updateOrInsert(User user) {
        return save(user);
    }

}
