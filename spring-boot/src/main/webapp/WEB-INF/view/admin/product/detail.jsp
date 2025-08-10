<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>User Detail - SB Admin</title>
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
                                    <h1 class="mt-4">Product Detail</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                        <li class="breadcrumb-item active">Detail</li>
                                    </ol>
                                    <div class="row justify-content-center">
                                        <div class="col-md-6">
                                            <div class="card shadow-sm">
                                                <div class="card-header">
                                                    <h5 class="mb-0">User Information</h5>
                                                </div>
                                                <div class="card-body">
                                                    <p><strong>ID:</strong> ${product.id}</p>
                                                    <p><strong>Name:</strong> ${product.name}</p>
                                                    <p><strong>Price:</strong> ${product.price}</p>
                                                    <p><strong>Short Description:</strong> ${product.shortDesc}</p>
                                                    <p><strong>Detail Description:</strong> ${product.detailDesc}</p>
                                                    <p><strong>Factory:</strong> ${product.factory.descFactory}</p>
                                                    <p><strong>Target:</strong> ${product.target.descTarget}</p>
                                                    <p><strong>Quantity:</strong> ${product.quantity}</p>
                                                    <p><strong>Image:</strong> <img
                                                            src="/admin/images/product/${product.image}"
                                                            alt="Product Image" class="img-fluid"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>


                        </main>


                </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>