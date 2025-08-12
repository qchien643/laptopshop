<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Fruitables - Product Detail</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/homepage/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/homepage/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

                <!-- Customized Bootstrap Stylesheet -->
                <link href="/homepage/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/homepage/css/style.css" rel="stylesheet">
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <%@ include file="../layout/header.jsp" %>

                    <!-- Single Page Header start -->
                    <div class="container-fluid page-header py-5">
                        <h1 class="text-center text-white display-6">Shop Detail</h1>
                        <ol class="breadcrumb justify-content-center mb-0">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item"><a href="/shop">Shop</a></li>
                            <li class="breadcrumb-item active text-white">
                                <c:out value="${product.name}" />
                            </li>
                        </ol>
                    </div>
                    <!-- Single Page Header End -->

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div class="col-lg-8 col-xl-9">
                                    <div class="row g-4">
                                        <div class="col-lg-6">
                                            <div class="border rounded">
                                                <a href="#">
                                                    <img src="<c:url value='/admin/images/product/${product.image}'/>"
                                                        class="img-fluid rounded w-100"
                                                        alt="<c:out value='${product.name}'/>">
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <h4 class="fw-bold mb-3">
                                                <c:out value="${product.name}" />
                                            </h4>

                                            <!-- Label / Purpose -->
                                            <p class="mb-1">
                                                <span class="text-muted">Label:</span>
                                                <strong>
                                                    <c:out value="${product.factory.factory}" />
                                                </strong>
                                            </p>
                                            <p class="mb-3">
                                                <span class="text-muted">Purpose:</span>
                                                <strong>
                                                    <c:out value="${product.target.descTarget}" />
                                                </strong>
                                            </p>

                                            <!-- Price -->
                                            <h5 class="fw-bold mb-3">
                                                <fmt:formatNumber value="${product.price}" type="number"
                                                    minFractionDigits="0" maxFractionDigits="2" /> $
                                            </h5>

                                            <!-- Short / brief description -->
                                            <p class="mb-4">
                                                <c:out value="${product.shortDesc}" />
                                            </p>

                                            <!-- Quantity picker (giới hạn bởi tồn kho) -->
                                            <div class="input-group quantity mb-4" style="width: 120px;">
                                                <button class="btn btn-sm btn-minus rounded-circle bg-light border"
                                                    type="button">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                                <input id="qtyInput" name="qty" type="number"
                                                    class="form-control form-control-sm text-center border-0" value="1"
                                                    min="1" max="${product.quantity}">
                                                <button class="btn btn-sm btn-plus rounded-circle bg-light border"
                                                    type="button">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>

                                            <!-- Add to cart (tùy bạn nối action/controller) -->
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                            </a>

                                            <!-- Stock -->
                                            <p class="text-muted mb-0">
                                                In stock: <strong>
                                                    <c:out value="${product.quantity}" />
                                                </strong> units
                                                <span class="ms-2">(#ID:
                                                    <c:out value="${product.id}" />)
                                                </span>
                                            </p>
                                        </div>

                                        <div class="col-lg-12">
                                            <nav>
                                                <div class="nav nav-tabs mb-3">
                                                    <button class="nav-link active border-white border-bottom-0"
                                                        type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                        data-bs-target="#nav-about" aria-controls="nav-about"
                                                        aria-selected="true">
                                                        Description
                                                    </button>
                                                </div>
                                            </nav>

                                            <div class="tab-content mb-5">
                                                <div class="tab-pane active" id="nav-about" role="tabpanel"
                                                    aria-labelledby="nav-about-tab">
                                                    <!-- Detail description -->
                                                    <p>
                                                        <c:out value="${product.detailDesc}" />
                                                    </p>

                                                    <!-- Simple spec block -->
                                                    <div class="px-2">
                                                        <div class="row g-4">
                                                            <div class="col-12 col-md-8">
                                                                <div
                                                                    class="row bg-light align-items-center text-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Label</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">
                                                                            <c:out value="${product.factory.factory}" />
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div
                                                                    class="row text-center align-items-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Purpose</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">
                                                                            <c:out
                                                                                value="${product.target.descTarget}" />
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div
                                                                    class="row bg-light text-center align-items-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Price</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">
                                                                            <fmt:formatNumber value="${product.price}"
                                                                                type="number" minFractionDigits="0"
                                                                                maxFractionDigits="2" /> $
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div
                                                                    class="row text-center align-items-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Stock</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">
                                                                            <c:out value="${product.quantity}" />
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div
                                                                    class="row bg-light text-center align-items-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Product ID</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">
                                                                            <c:out value="${product.id}" />
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div><!-- /.tab-pane -->
                                            </div><!-- /.tab-content -->
                                        </div>
                                    </div>
                                </div>

                                <!-- Sidebar -->
                                <div class="col-lg-4 col-xl-3">
                                    <div class="row g-4 fruite">
                                        <div class="col-lg-12">
                                            <div class="input-group w-100 mx-auto d-flex mb-4">
                                                <input type="search" class="form-control p-3" placeholder="keywords"
                                                    aria-describedby="search-icon-1">
                                                <span id="search-icon-1" class="input-group-text p-3"><i
                                                        class="fa fa-search"></i></span>
                                            </div>

                                            <div class="mb-4">
                                                <h4>Categories</h4>
                                                <ul class="list-unstyled fruite-categorie">
                                                    <c:forEach items="${factories}" var="factory">
                                                        <li>
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>
                                                                <c:out value="${factory.factory}" />
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Sidebar -->
                            </div>
                        </div>
                    </div>
                    <!-- Single Product End -->

                    <%@ include file="../layout/footer.jsp" %>

                        <!-- JavaScript Libraries -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="/homepage/lib/easing/easing.min.js"></script>
                        <script src="/homepage/lib/waypoints/waypoints.min.js"></script>
                        <script src="/homepage/lib/lightbox/js/lightbox.min.js"></script>
                        <script src="/homepage/lib/owlcarousel/owl.carousel.min.js"></script>

                        <!-- Template Javascript -->
                        <script src="/homepage/js/main.js"></script>

                        <script>
                            // đơn giản cho +/-
                            document.querySelectorAll('.btn-plus').forEach(btn => {
                                btn.addEventListener('click', () => {
                                    const ip = document.getElementById('qtyInput');
                                    const max = parseInt(ip.max || '9999', 10);
                                    const v = Math.min(max, (parseInt(ip.value || '1', 10) + 1));
                                    ip.value = v;
                                });
                            });
                            document.querySelectorAll('.btn-minus').forEach(btn => {
                                btn.addEventListener('click', () => {
                                    const ip = document.getElementById('qtyInput');
                                    const v = Math.max(1, (parseInt(ip.value || '1', 10) - 1));
                                    ip.value = v;
                                });
                            });
                        </script>
            </body>

            </html>