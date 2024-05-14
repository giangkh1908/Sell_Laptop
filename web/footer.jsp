
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <style>
            .footer {
                bottom: 0;
                left: 0;
                width: 100%;
                z-index: 1000;
                background-color: #343a40;
                color: #fff;
            }

        </style>
    </head>
    <body>
        <div class="container-fluid bg-dark text-white-50 footer py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">About us!</h4>
                            <p class="mb-4">Is a company specializing in huge laptops with the most stable prices on the market. You can collect old products, renew them, upgrade them, upgrade your device models when purchasing through Yang-shop</p>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Shop Info</h4>
                            <a class="btn-link" href="home">Products</a><br>
                            <a href="https://www.facebook.com/aGFja2VyIGzhu48/">Facebook</a><br>
                            <a href="https://twitter.com/">Twitter</a><br>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Account</h4>
                            <a class="btn-link" href="profile.jsp">My Account</a><br>
                            <a class="btn-link" href="category">Shop details</a><br>
                            <a class="btn-link" href="#">Shopping Cart</a><br>
                            <a class="btn-link" href="#">Order History</a><br>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Contact</h4>
                            <p>Address: Thanh Xuan, Ha Noi</p>
                            <p>Email: Yangshop@gmail.com</p>
                            <p>Phone: +0866710932</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
