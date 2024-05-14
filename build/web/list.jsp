<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <style type="text/css">
            /* Navbar */
            .navbar {
                background-color: #343a40; /* Màu xám đậm */
            }

            .navbar-brand, .nav-link {
                color: #ffc107; /* Màu vàng */
            }

            .navbar-brand:hover, .nav-link:hover {
                color: #ffca28; /* Màu vàng nhạt khi hover */
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            .container {
                width: 50%;
                margin: 100px auto;
                background-color: #ffe4c4;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #d2691e;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f9f9f9;
            }

            a {
                text-decoration: none;
                background-color: #8b4513;
                color: white;
                padding: 8px 12px;
                border-radius: 5px;
            }

            a:hover {
                background-color: #A0522D;
            }

            .add-link {
                text-align: right;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
 <jsp:include page = "nav.jsp"/>
            <div class="container">
                <h2>List of categories</h2>
                <div class="add-link">
                    <a href="new.jsp">Add New</a>
                </div>
                <table border="1px">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach items="${requestScope.data}" var="c">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.name}</td>
                            
                            <td>
                                <a href="update?id=${c.id}">Update</a>
                                <a href="#" onclick="doDelete('${c.id}')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm('Are you sure you want to delete ID ' + id + '?')) {
                    window.location = 'delete?id=' + id;
                }
            }
        </script>
    </body>
</html>
