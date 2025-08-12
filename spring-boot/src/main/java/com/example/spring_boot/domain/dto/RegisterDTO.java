package com.example.spring_boot.domain.dto;

import com.example.spring_boot.domain.validation.PasswordMatches;
import com.example.spring_boot.domain.validation.StrongPassword;
import com.example.spring_boot.domain.validation.UniqueEmail;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@PasswordMatches(first = "password", second = "confirmPassword", message = "Mật khẩu xác nhận không khớp")
public class RegisterDTO {
    @NotBlank(message = "First name không được để trống")
    @Size(max = 50, message = "First name tối đa 50 ký tự")
    @Pattern(regexp = "^[\\p{L}\\s'-]+$", message = "First name chỉ được chứa chữ cái, khoảng trắng, gạch nối, nháy")
    private String firstName;

    @NotBlank(message = "Last name không được để trống")
    @Size(max = 50, message = "Last name tối đa 50 ký tự")
    @Pattern(regexp = "^[\\p{L}\\s'-]+$", message = "Last name chỉ được chứa chữ cái, khoảng trắng, gạch nối, nháy")
    private String lastName;

    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ")
    @UniqueEmail(message = "Email đã tồn tại")
    private String email;

    @NotBlank(message = "Password không được để trống")
    @Size(min = 8, max = 100, message = "Password phải từ 8-100 ký tự")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,100}$", message = "Password phải có chữ thường, CHỮ HOA, số và ký tự đặc biệt")
    private String password;

    @NotBlank(message = "Confirm password không được để trống")
    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}