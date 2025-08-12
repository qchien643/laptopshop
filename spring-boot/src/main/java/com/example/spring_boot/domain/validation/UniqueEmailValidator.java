package com.example.spring_boot.domain.validation;

import com.example.spring_boot.repository.UserRepository;
import com.example.spring_boot.service.UserService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Component;

@Component
public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

    private final UserService userService;

    public UniqueEmailValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null || value.isBlank()) {
            return true; // Let @NotBlank/@Email handle empties/format
        }
        return userService.getAllUserEmail(value).isEmpty();
    }
}
