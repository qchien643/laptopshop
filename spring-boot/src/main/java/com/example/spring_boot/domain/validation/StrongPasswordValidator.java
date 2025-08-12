package com.example.spring_boot.domain.validation;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class StrongPasswordValidator implements ConstraintValidator<StrongPassword, String> {

    private int min;
    private int max;
    private boolean requireLowercase;
    private boolean requireUppercase;
    private boolean requireDigit;
    private boolean requireSpecial;

    @Override
    public void initialize(StrongPassword constraintAnnotation) {
        this.min = constraintAnnotation.min();
        this.max = constraintAnnotation.max();
        this.requireLowercase = constraintAnnotation.requireLowercase();
        this.requireUppercase = constraintAnnotation.requireUppercase();
        this.requireDigit = constraintAnnotation.requireDigit();
        this.requireSpecial = constraintAnnotation.requireSpecial();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null)
            return false;
        if (value.length() < min || value.length() > max)
            return false;

        if (requireLowercase && !value.chars().anyMatch(Character::isLowerCase))
            return false;
        if (requireUppercase && !value.chars().anyMatch(Character::isUpperCase))
            return false;
        if (requireDigit && !value.chars().anyMatch(Character::isDigit))
            return false;
        if (requireSpecial && value.chars().noneMatch(ch -> !Character.isLetterOrDigit(ch)))
            return false;

        return true;
    }
}