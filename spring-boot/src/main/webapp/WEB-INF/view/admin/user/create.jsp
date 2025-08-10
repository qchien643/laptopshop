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
                <title>Create User - SB Admin</title>
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
                                        <h1 class="mt-4">Create User</h1>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item"><a href="/admin/user">User</a></li>
                                            <li class="breadcrumb-item active">Create</li>
                                        </ol>
                                        <div class="row justify-content-center">
                                            <div class="col-md-6">
                                                <div class="card shadow-sm">
                                                    <div class="card-body">
                                                        <h2 class="mb-4 text-center">Create a user</h2>
                                                        <form:form method="post" action="/admin/user"
                                                            modelAttribute="newUser" enctype="multipart/form-data">
                                                            <div class="mb-3">
                                                                <label for="email" class="form-label">Email:</label>
                                                                <form:input type="email" class="form-control" id="email"
                                                                    placeholder="Enter email" path="email" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="password"
                                                                    class="form-label">Password:</label>
                                                                <form:input type="password" class="form-control"
                                                                    id="password" placeholder="Enter password"
                                                                    path="password" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="phone" class="form-label">Phone
                                                                    number:</label>
                                                                <form:input type="tel" class="form-control" id="phone"
                                                                    placeholder="Enter phone number" path="phone" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="fullname" class="form-label">Full
                                                                    Name:</label>
                                                                <form:input type="text" class="form-control"
                                                                    id="fullname" placeholder="Enter full name"
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
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="file" class="form-label">Avatar:</label>
                                                                <input type="file" id="file" name="file"
                                                                    accept="image/*" class="form-control" />
                                                            </div>
                                                            <!-- Thẻ img để preview -->
                                                            <div class="mb-5">
                                                                <img id="avatarPreview" src="" alt="Avatar Preview"
                                                                    style="max-width:200px; display:none; margin-top:10px;" />
                                                            </div>
                                                            <div class="d-grid">
                                                                <button type="submit"
                                                                    class="btn btn-primary">Create</button>
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
                    <!-- JS Preview Avatar -->
                    <script>
                        document.getElementById('file')
                            .addEventListener('change', function (event) {
                                const fileInput = event.target;
                                if (!fileInput.files || !fileInput.files[0]) {
                                    return;
                                }
                                const file = fileInput.files[0];
                                const previewImg = document.getElementById('avatarPreview');

                                // Chỉ preview nếu là image
                                if (!file.type.startsWith('image/')) {
                                    previewImg.style.display = 'none';
                                    return;
                                }

                                const reader = new FileReader();
                                reader.onload = function (e) {
                                    previewImg.src = e.target.result;
                                    previewImg.style.display = 'block';
                                };
                                reader.readAsDataURL(file);
                            });
                    </script>
            </body>

            </html>