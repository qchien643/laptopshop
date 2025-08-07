<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Dashboard - SB Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body>
            <h1>Hello Eric!</h1>
            <p>This is a simple JSP page.</p>
            <p>Welcome to the Spring Boot application!</p>
            <h1>${message}</h1>
            <button class="btn btn-success">
                Launch demo modal
            </button>
            <h2>------------</h2>

            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>STT</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Phone</th>
                </tr>
                <c:forEach var="user" items="${dataUsers}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${user.fullname}</td>
                        <td>${user.email}</td>
                        <td> ${user.phone}</td>
                    </tr>
                </c:forEach>
            </table>

        </body>

        </html>