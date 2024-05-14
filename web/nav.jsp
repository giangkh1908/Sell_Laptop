<%-- 
    Document   : nav
    Created on : Mar 6, 2024, 7:47:45 PM
    Author     : KimHo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
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

            /* Card */
            .card {
                margin-bottom: 20px; /* Khoảng cách giữa các card */
            }

            .card-title {
                font-size: 18px; /* Kích thước tiêu đề card */
                color: #007bff; /* Màu xanh dương */
            }

            .card-text {
                font-size: 14px; /* Kích thước văn bản card */
                color: #6c757d; /* Màu xám nhạt */
            }

            .btn-primary {
                background-color: #007bff; /* Màu nền của nút */
                border-color: #007bff; /* Màu viền của nút */
            }

            .btn-primary:hover {
                background-color: #0056b3; /* Màu nền của nút khi hover */
                border-color: #0056b3; /* Màu viền của nút khi hover */
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-collapse bg-dark">
            <a class="navbar-brand" href="home">Yang</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="category">Category</a>
                    </li>
                    <li class="nav-item">
                        <c:if test="${sessionScope.account!=null}">
                            <a class="nav-link" href="profile.jsp">Profile</a>
                        </c:if>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-success btn-sm ml-3" href="managerCart">
                            <i class="fas fa-shopping-cart"></i> <!-- Sử dụng Font Awesome icon -->
                            <span class="d-none d-sm-inline ml-1">Cart</span> <!-- Hiển thị văn bản "Cart" trên màn hình lớn -->
                            <span id="amountCart" class="badge badge-light" style="font-size: 12px;"></span> <!-- Số lượng sản phẩm trong giỏ hàng -->
                        </a>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0" action="home1" method="get">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" name="key" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    <c:if test="${sessionScope.account==null}">
                        <a href="login" class="btn btn-primary">
                            <i class="bi bi-box-arrow-in-right"></i> Login
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.account!=null}">
                        <a href="logout" class="btn btn-primary">
                            <i class="bi bi-box-arrow-in-right"></i> Logout
                        </a>
                    </c:if>

                </form>
            </div>
        </nav>
    </body>
</html>
