<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>Fruitables - Vegetable Website Template</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">

            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                rel="stylesheet">

            <!-- Icon Font Stylesheet -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <!-- Libraries Stylesheet -->
            <link href="homepage/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
            <link href="homepage/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


            <!-- Customized Bootstrap Stylesheet -->
            <link href="homepage/css/bootstrap.min.css" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="homepage/css/style.css" rel="stylesheet">
        </head>

        <body>

            <!-- Spinner Start -->
            <div id="spinner"
                class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                <div class="spinner-grow text-primary" role="status"></div>
            </div>
            <!-- Spinner End -->


            <%@ include file="../layout/header.jsp" %>


                <!-- Modal Search Start -->
                <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content rounded-0">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body d-flex align-items-center">
                                <div class="input-group w-75 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="keywords"
                                        aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i
                                            class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Search End -->

                <%@ include file="../layout/banner.jsp" %>

                    <%@ include file="../layout/feature.jsp" %>


                        <!-- Fruits Shop Start-->
                        <div class="container-fluid fruite py-5">
                            <div class="container py-5">
                                <div class="tab-class text-center">
                                    <div class="row g-4">
                                        <div class="col-lg-4 text-start">
                                            <h1>Our Organic Products</h1>
                                        </div>
                                    </div>

                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane fade show p-0 active">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <!-- quan trọng: stretch để các cột bằng chiều cao -->
                                                    <div class="row g-4 align-items-stretch">
                                                        <c:forEach var="product" items="${products}" varStatus="status">
                                                            <!-- cột cũng là flex để card cao 100% -->
                                                            <div class="col-md-6 col-lg-4 col-xl-3 d-flex">

                                                                <!-- card: flex-column + h-100 -->
                                                                <div
                                                                    class="rounded position-relative fruite-item d-flex flex-column h-100 w-100 overflow-hidden">
                                                                    <div class="fruite-img">
                                                                        <img src="admin/images/product/${product.image}"
                                                                            class="img-fluid w-100 rounded-top"
                                                                            alt="${product.name}">
                                                                    </div>

                                                                    <div
                                                                        class="text-white bg-secondary px-3 py-1 rounded position-absolute top-0 start-0 mt-2 ms-2">
                                                                        ${product.factory.factory}
                                                                    </div>

                                                                    <!-- khối nội dung giãn nở chiếm phần còn lại -->
                                                                    <div
                                                                        class="p-4 border border-secondary border-top-0 rounded-bottom d-flex flex-column flex-grow-1">
                                                                        <h4 data-href="/shopDetail/${product.id}"
                                                                            class="mb-2 href-name">
                                                                            ${product.name}</h4>

                                                                        <!-- mô tả sẽ chiếm “đệm” giữa, không làm vỡ layout -->
                                                                        <p class="mb-3 flex-grow-1">${product.shortDesc}
                                                                        </p>

                                                                        <!-- hàng đáy luôn dính đáy -->
                                                                        <div
                                                                            class="d-flex justify-content-between align-items-center mt-auto">
                                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                                $${product.price} / kg</p>
                                                                            <a href="#"
                                                                                class="btn border border-secondary rounded-pill px-3 text-primary">
                                                                                <i
                                                                                    class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                                Add to cart
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Fruits Shop End-->



                        <%@ include file="../layout/footer.jsp" %>


                            <!-- JavaScript Libraries -->
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                            <script
                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                            <script src="homepage/lib/easing/easing.min.js"></script>
                            <script src="homepage/lib/waypoints/waypoints.min.js"></script>
                            <script src="homepage/lib/lightbox/js/lightbox.min.js"></script>
                            <script src="homepage/lib/owlcarousel/owl.carousel.min.js"></script>

                            <!-- Template Javascript -->
                            <script src="homepage/js/main.js"></script>
                            <script>
                                document.querySelectorAll('.href-name').forEach(col => {
                                    col.addEventListener('click', (e) => {
                                        if (e.target.closest('a, button')) return; // để nút/link bên trong hoạt động bình thường
                                        window.location.href = col.dataset.href;
                                    });
                                });
                            </script>
        </body>

        </html>