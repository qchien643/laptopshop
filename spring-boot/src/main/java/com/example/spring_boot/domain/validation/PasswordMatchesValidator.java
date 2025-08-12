package com.example.spring_boot.domain.validation;

import java.util.Objects;

import org.springframework.beans.BeanWrapperImpl;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, Object> {
    private String firstField;
    private String secondField;
    private String message;

    @Override
    public void initialize(PasswordMatches ann) {
        this.firstField = ann.first();
        this.secondField = ann.second();
        this.message = ann.message();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        if (value == null) {
            return true;
        }
        Object v1;
        Object v2;
        try {
            var wrapper = new BeanWrapperImpl(value);
            v1 = wrapper.getPropertyValue(firstField);
            v2 = wrapper.getPropertyValue(secondField);
        } catch (Exception ex) {
            return false;
        }

        boolean ok = Objects.equals(v1, v2);
        if (!ok) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate(message)
                    .addPropertyNode(secondField)
                    .addConstraintViolation();
        }
        return ok;
    }
}
