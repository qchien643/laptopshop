<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <title>Create Account</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-primary bg-gradient">

                <%-- Tạo URL /register an toàn theo context path --%>
                    <c:url var="registerUrl" value="/register" />

                    <div class="container min-vh-100 d-flex align-items-center justify-content-center">
                        <div class="card shadow-lg rounded-4" style="max-width: 720px; width: 100%;">
                            <div class="card-body p-4 p-md-5">
                                <h2 class="text-center mb-4">Create Account</h2>

                                <form:form action="${registerUrl}" method="post" modelAttribute="registerUser"
                                    cssClass="row g-3 needs-validation" novalidate="novalidate">

                                    <%-- CSRF (nếu dùng Spring Security) --%>
                                        <c:if test="${not empty _csrf}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </c:if>

                                        <div class="col-md-6">
                                            <form:input path="firstName" cssClass="form-control form-control-lg"
                                                placeholder="First name" />
                                            <form:errors path="firstName" cssClass="invalid-feedback d-block" />
                                        </div>

                                        <div class="col-md-6">
                                            <form:input path="lastName" cssClass="form-control form-control-lg"
                                                placeholder="Last name" />
                                            <form:errors path="lastName" cssClass="invalid-feedback d-block" />
                                        </div>

                                        <div class="col-12">
                                            <form:input path="email" type="email"
                                                cssClass="form-control form-control-lg" placeholder="Email address" />
                                            <form:errors path="email" cssClass="invalid-feedback d-block" />
                                        </div>

                                        <div class="col-md-6">
                                            <form:password path="password" cssClass="form-control form-control-lg"
                                                placeholder="Password" autocomplete="new-password" />
                                            <form:errors path="password" cssClass="invalid-feedback d-block" />
                                        </div>

                                        <div class="col-md-6">
                                            <form:password path="confirmPassword"
                                                cssClass="form-control form-control-lg" placeholder="Confirm Password"
                                                autocomplete="new-password" />
                                            <form:errors path="confirmPassword" cssClass="invalid-feedback d-block" />
                                        </div>

                                        <div class="col-12 pt-2">
                                            <button type="submit" class="btn btn-primary btn-lg w-100 rounded-3">Create
                                                Account</button>
                                        </div>

                                        <div class="col-12 text-center">
                                            <small>Have an account? <a href="<c:url value='/login'/>">Go to
                                                    login</a></small>
                                        </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>