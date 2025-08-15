package com.example.spring_boot.config;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    protected String determineTargetUrl(final Authentication authentication) {

        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin/user");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        throw new IllegalStateException();
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        session.setAttribute("fullName", "luulomhe");
    }

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            org.springframework.security.core.Authentication authentication) throws IOException, ServletException {
        // TODO Auto-generated method stub
        String targetUrl = determineTargetUrl(authentication);
        if (response.isCommitted()) {
            System.out.println("Response has already been committed. Unable to redirect.");
            return;
        }
        redirectStrategy.sendRedirect(request, response, targetUrl);
        clearAuthenticationAttributes(request);
    }

}
