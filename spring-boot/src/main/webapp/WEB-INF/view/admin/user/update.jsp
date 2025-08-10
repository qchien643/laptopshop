<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Update User - SB Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/admin/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <%@ include file="../layout/header.jsp" %>
                    <div id="layoutSidenav">
                        <%@ include file="../layout/sidebar.jsp" %>
                            <div id="layoutSidenav_content">
                                <main>
                                    <div class="container-fluid px-4">
                                        <h1 class="mt-4">Update User</h1>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item"><a href="/admin/user">User</a></li>
                                            <li class="breadcrumb-item active">Update</li>
                                        </ol>
                                        <div class="row justify-content-center">
                                            <div class="col-md-6">
                                                <div class="card shadow-sm">
                                                    <div class="card-body">
                                                        <form:form method="post" action="/admin/user/update/${user.id}"
                                                            modelAttribute="user">
                                                            <div class="mb-3">
                                                                <label for="id" class="form-label">ID:</label>
                                                                <form:input type="text" class="form-control" id="id"
                                                                    path="id" readonly="true" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="email" class="form-label">Email:</label>
                                                                <form:input type="email" class="form-control" id="email"
                                                                    placeholder="Enter email" path="email" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="phone" class="form-label">Phone
                                                                    number:</label>
                                                                <form:input type="tel" class="form-control" id="phone"
                                                                    placeholder="Enter phone number" path="phone" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="fullName" class="form-label">Full
                                                                    Name:</label>
                                                                <form:input type="text" class="form-control"
                                                                    id="fullName" placeholder="Enter full name"
                                                                    path="fullName" />
                                                            </div>
                                                            <div class="mb-4">
                                                                <label for="address" class="form-label">Address:</label>
                                                                <form:input type="text" class="form-control"
                                                                    id="address" placeholder="Enter address"
                                                                    path="address" />
                                                            </div>
                                                            <div class="mb-5">
                                                                <label for="role" class="form-label">Role:</label>
                                                                <form:select class="form-select" id="role" path="role">

                                                                    <form:options items="${roles}" itemValue="id"
                                                                        itemLabel="name" />
                                                                </form:select>
                                                                <div class="d-grid">
                                                                    <button type="submit"
                                                                        class="btn btn-primary">Update</button>
                                                                </div>
                                                        </form:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </main>
                                <%@ include file="../layout/footer.jsp" %>
                            </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>