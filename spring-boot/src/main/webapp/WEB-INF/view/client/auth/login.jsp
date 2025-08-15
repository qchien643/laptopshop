<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <title>Login</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
            </head>

            <body class="bg-body-tertiary">
                <div class="container min-vh-100 d-flex align-items-center justify-content-center">
                    <div class="card shadow-sm" style="max-width:420px;width:100%;">
                        <div class="card-body p-4">
                            <h1 class="h4 mb-4 text-center">Sign in</h1>

                            <!-- No method/action attributes -->
                            <form id="loginForm" class="needs-validation" method="post" action="/login" novalidate>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="username"
                                        placeholder="you@example.com" required />
                                    <div class="invalid-feedback">Please enter a valid email.</div>
                                </div>

                                <c:if test="${param.error != null}">
                                    <div class="my-2" style="color: red;">Invalid email or password.</div>
                                </c:if>
                                <c:if test="${param.logout != null}">
                                    <div class="my-2" style="color: green;">You have been logged out.</div>
                                </c:if>



                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="••••••••" required />
                                    <div class="invalid-feedback">Password is required.</div>
                                </div>
                                <div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </div>
                                <div class="mb-3">
                                    <a href="/register">register</a>
                                </div>

                                <button class="btn btn-primary w-100" type="submit">Login</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap JS (optional) -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

                <!-- Client-side validation (optional) -->
                <script>
                    (() => {
                        const form = document.getElementById('loginForm');
                        form.addEventListener('submit', (e) => {
                            if (!form.checkValidity()) {
                                e.preventDefault();
                                e.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        });
                    })();
                </script>
            </body>

            </html>