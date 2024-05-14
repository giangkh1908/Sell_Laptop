<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <style>
        .custom-hr {
            border-bottom: 1px solid #000; /* Màu và kiểu của đường kẻ */
            margin-bottom: 10px; /* Khoảng cách dưới của đường kẻ */
        }
    </style>
</head>
<body>
    <jsp:include page = "nav.jsp"/>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <h1>Dash Board</h1>
                <hr class="custom-hr">
                <!-- Danh sách liên kết để chuyển hướng -->
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="order">Order</a>
                    </li>
                </ul>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="orderDetail">Order Details</a>
                    </li>
                </ul>
            </div>
            <!-- Nội dung chính -->
            <div class="col-md-9">
                <h2>List of Products and Total Ordered Quantity:</h2>
                <!-- Lặp qua danh sách sản phẩm và tổng số sản phẩm được đặt -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Total Money</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.date}</td>
                                <td>${o.totalmoney}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <h2>Total Money: ${totalMoney}</h2>

            </div>
        </div>
    </div>
    <jsp:include page = "footer.jsp"/>
</body>
</html>
