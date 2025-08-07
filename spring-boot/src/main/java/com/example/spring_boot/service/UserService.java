package com.example.spring_boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring_boot.domain.User;
import com.example.spring_boot.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello() {
        return "User information and service logic can be implemented here.";
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserEmail(String email) {
        return this.userRepository.findByEmail(email);

    }

    public User getOneUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

    public User handleSaveUser(User user) {
        User savedUser = this.userRepository.save(user);
        return savedUser;
    }

    public User updateOrInsert(User user) {
        return this.userRepository.updateOrInsert(user);
    }

    public void deleteUserById(Long id) {
        this.userRepository.deleteById(id);
    }
}
