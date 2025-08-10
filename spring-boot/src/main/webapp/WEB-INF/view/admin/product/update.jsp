<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Update Product - SB Admin</title>

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
                                        <h1 class="mt-4">Update Product</h1>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                                            <li class="breadcrumb-item active">Update</li>
                                        </ol>

                                        <div class="row justify-content-center">
                                            <div class="col-lg-8">
                                                <div class="card shadow-sm">
                                                    <div class="card-body">
                                                        <h2 class="mb-4">Edit product</h2>

                                                        <!-- product: object đã load sẵn từ DB -->
                                                        <form:form method="post"
                                                            action="/admin/product/update/${product.id}"
                                                            modelAttribute="product" enctype="multipart/form-data">

                                                            <!-- ID (readonly) -->
                                                            <div class="mb-3">
                                                                <label for="id" class="form-label">ID:</label>
                                                                <form:input path="id" id="id" type="text"
                                                                    cssClass="form-control" readonly="true" />
                                                            </div>

                                                            <div class="row g-3">
                                                                <!-- Name -->
                                                                <div class="col-md-6">
                                                                    <label for="name" class="form-label">Name:</label>
                                                                    <form:input path="name" id="name" type="text"
                                                                        cssClass="form-control" />
                                                                    <form:errors path="name"
                                                                        cssClass="invalid-feedback d-block" />
                                                                </div>

                                                                <!-- Price -->
                                                                <div class="col-md-6">
                                                                    <label for="price" class="form-label">Price:</label>
                                                                    <form:input path="price" id="price" type="number"
                                                                        cssClass="form-control" step="0.01" min="0" />
                                                                    <form:errors path="price"
                                                                        cssClass="invalid-feedback d-block" />
                                                                </div>

                                                                <!-- Detail description -->
                                                                <div class="col-12">
                                                                    <label for="detailDesc" class="form-label">Detail
                                                                        description:</label>
                                                                    <form:textarea path="detailDesc" id="detailDesc"
                                                                        cssClass="form-control" rows="4" />
                                                                    <form:errors path="detailDesc"
                                                                        cssClass="invalid-feedback d-block" />
                                                                </div>

                                                                <!-- Short description -->
                                                                <div class="col-md-6">
                                                                    <label for="shortDesc" class="form-label">Short
                                                                        description:</label>
                                                                    <form:input path="shortDesc" id="shortDesc"
                                                                        cssClass="form-control" />
                                                                    <form:errors path="shortDesc"
                                                                        cssClass="invalid-feedback d-block" />
                                                                </div>

                                                                <!-- Quantity -->
                                                                <div class="col-md-6">
                                                                    <label for="quantity"
                                                                        class="form-label">Quantity:</label>
                                                                    <form:input path="quantity" id="quantity"
                                                                        type="number" cssClass="form-control" min="0"
                                                                        step="1" />
                                                                    <form:errors path="quantity"
                                                                        cssClass="invalid-feedback d-block" />
                                                                </div>

                                                                <!-- Factory -->
                                                                <div class="col-md-6">
                                                                    <label for="factory"
                                                                        class="form-label">Factory:</label>
                                                                    <!-- Giữ cách bind giống form create của bạn -->
                                                                    <form:select path="factory" id="factory"
                                                                        cssClass="form-select">
                                                                        <form:options items="${factories}"
                                                                            itemValue="id" itemLabel="descFactory" />
                                                                    </form:select>
                                                                </div>

                                                                <!-- Target -->
                                                                <div class="col-md-6">
                                                                    <label for="target"
                                                                        class="form-label">Target:</label>
                                                                    <form:select path="target" id="target"
                                                                        cssClass="form-select">
                                                                        <form:options items="${targets}" itemValue="id"
                                                                            itemLabel="descTarget" />
                                                                    </form:select>
                                                                </div>

                                                                <!-- Current image + choose new -->
                                                                <div class="col-12">
                                                                    <label class="form-label d-block">Current
                                                                        image:</label>
                                                                    <c:if test="${not empty product.image}">
                                                                        <c:url
                                                                            value='/admin/images/product/${product.image}'
                                                                            var='imgUrl' />
                                                                        <img src="/admin/images/product/${product.image}"
                                                                            alt="Current image"
                                                                            style="max-width:200px; display:block; margin-bottom:8px;">
                                                                    </c:if>

                                                                    <!-- giữ giá trị ảnh cũ nếu không upload ảnh mới -->
                                                                    <form:hidden path="image" id="oldImage" />

                                                                    <label for="file" class="form-label mt-2">Change
                                                                        image (optional):</label>
                                                                    <input id="file" name="file" type="file"
                                                                        accept="image/*" class="form-control" />

                                                                    <div class="mt-2">
                                                                        <img id="imagePreview" src="" alt="Preview"
                                                                            style="max-width:200px; display:none;" />
                                                                    </div>
                                                                </div>

                                                                <!-- Submit -->
                                                                <div class="col-12">
                                                                    <button type="submit"
                                                                        class="btn btn-primary px-4">Update</button>
                                                                    <a href="/admin/product"
                                                                        class="btn btn-outline-secondary ms-2">Cancel</a>
                                                                </div>
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
                    <script>
                        // Preview ảnh mới khi user chọn file
                        document.getElementById('file').addEventListener('change', function (e) {
                            const file = e.target.files && e.target.files[0];
                            const img = document.getElementById('imagePreview');
                            if (!file || !file.type.startsWith('image/')) {
                                img.style.display = 'none';
                                img.src = '';
                                return;
                            }
                            const reader = new FileReader();
                            reader.onload = function (ev) {
                                img.src = ev.target.result;
                                img.style.display = 'block';
                            };
                            reader.readAsDataURL(file);
                        });
                    </script>
            </body>

            </html>