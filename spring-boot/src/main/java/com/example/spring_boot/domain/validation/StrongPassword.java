package com.example.spring_boot.domain.validation;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Documented
@Constraint(validatedBy = StrongPasswordValidator.class)
@Target({ FIELD })
@Retention(RUNTIME)
public @interface StrongPassword {
    String message() default "Password must be strong (lowercase, UPPERCASE, digit, special char)";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    int min() default 8;

    int max() default 100;

    boolean requireLowercase() default true;

    boolean requireUppercase() default true;

    boolean requireDigit() default true;

    boolean requireSpecial() default true;
}
