<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    </head>
    <body>
    <jsp:include page = "nav.jsp"/>


        <!-- Danh sách sản phẩm và các chức năng (chỉ hiển thị khi là admin) -->
        <c:if test="${isAdmin}">
            <div class="admin-section">
                <h1>List of products</h1>
                <div class="add-product">
                    <a href="newP.jsp" class="add-new">Add New</a>
                </div>
                <table class="product-table">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Image</th>
                        <th>Category ID</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach items="${requestScope.data1}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.name}</td>
                            <td>${p.quantity}</td>
                            <td>
                                <img src="${p.image}" width="50px" height="50px"/>    
                            </td>
                            <td>${p.category.id}</td>
                            <td>
                                <a href="#" onclick="doDeleteP('${p.id}')">Delete</a>
                                <a href="updateP?id=${p.id}">Update</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:if>
                    <script type="text/javascript">
                function doDeleteP(id) {
                    if (confirm('Are you sure you want to delete ID ' + id + '?')) {
                        window.location = 'deleteP?id=' + id;
                    }
                }
            </script>

        <style type="text/css">
            .admin-section {
                margin-top: 50px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .add-product {
                text-align: center; /* Căn giữa */
                margin-bottom: 20px;
            }

            .add-new {
                display: inline-block;
                padding: 10px 20px;
                color: #fff;
                background-color: #007bff;
                border: 2px solid #007bff;
                border-radius: 5px;
                font-size: 16px;
                transition: all 0.3s ease;
                text-decoration: none;
            }

            .add-new:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .product-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .product-table th, .product-table td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }

            .product-table th {
                background-color: #f2f2f2;
                color: #333;
            }

            .product-table tr:hover {
                background-color: #f9f9f9;
            }

            .product-table img {
                vertical-align: middle;
            }

            .product-table a {
                text-decoration: none;
                padding: 5px 10px;
                background-color: #007bff;
                color: #fff;
                border-radius: 3px;
            }

            .product-table a:hover {
                background-color: #0056b3;
            }
        </style>


    </body>
</html>
