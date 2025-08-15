package com.example.spring_boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring_boot.domain.Role;
import com.example.spring_boot.domain.User;
import com.example.spring_boot.domain.dto.RegisterDTO;
import com.example.spring_boot.repository.RoleRepository;
import com.example.spring_boot.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
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

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public Role getRoleByName(String string) {
        // Assuming you have a method to find a role by its name
        return this.roleRepository.findByName(string);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }
}
