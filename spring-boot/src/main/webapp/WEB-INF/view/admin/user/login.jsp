<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Create a User</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-light">
                <div class="container mt-5">
                    <div class="col-md-6 mx-auto">
                        <h2 class="mb-4">Create a user</h2>
                        <form:form method="post" action="/admin/user" modelAttribute="newUser">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <form:input type="email" class="form-control" id="email" placeholder="Enter email"
                                    path="email" />
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <form:input type="password" class="form-control" id="password"
                                    placeholder="Enter password" path="password" />
                            </div>

                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone number:</label>
                                <form:input type="tel" class="form-control" id="phone" placeholder="Enter phone number"
                                    path="phone" />
                            </div>

                            <div class="mb-3">
                                <label for="fullname" class="form-label">Full Name:</label>
                                <form:input type="text" class="form-control" id="fullname" placeholder="Enter full name"
                                    path="fullName" />
                            </div>

                            <div class="mb-4">
                                <label for="address" class="form-label">Address:</label>
                                <form:input type="text" class="form-control" id="address" placeholder="Enter address"
                                    path="address" />
                            </div>

                            <button type="submit" class="btn btn-primary">Create</button>
                        </form:form>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>