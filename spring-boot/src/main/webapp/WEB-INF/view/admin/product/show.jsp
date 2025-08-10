<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>User - SB Admin</title>
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
                                <div class="container mt-4">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h3>Table products</h3>
                                        <a href="/admin/product/create" class="btn btn-primary">Create Product</a>

                                    </div>

                                    <table class="table table-bordered">
                                        <thead class="table-light">
                                            <tr>
                                                <th>ID</th>
                                                <th>images</th>
                                                <th>name</th>
                                                <th>factory</th>
                                                <th>target</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${dataProducts}" varStatus="status">
                                                <tr>
                                                    <td>${product.id}</td>
                                                    <td>
                                                        <img src="/admin/images/product/${product.image}"
                                                            alt="Product Image" class="rounded-circle"
                                                            style="width: 50px; height: 50px; object-fit: cover;">

                                                    </td>

                                                    <td>${product.name}</td>
                                                    <td>${product.factory.descFactory}</td>
                                                    <td>${product.target.descTarget}</td>
                                                    <td>
                                                        <a href="/admin/product/view/${product.id}"
                                                            class="btn btn-success btn-sm">View</a>
                                                        <a href="/admin/product/update/${product.id}"
                                                            class="btn btn-warning btn-sm">Update</a>
                                                        <a href="/admin/product/delete/${product.id}"
                                                            class="btn btn-danger btn-sm">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </main>
                            <%@ include file="../layout/footer.jsp" %>
                        </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/chart-area-demo.js"></script>
                <script src="/admin/js/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/datatables-simple-demo.js"></script>
        </body>

        </html>