<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yang-shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            .product-card {
                margin-bottom: 20px;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                transition: 0.3s;
            }

            .product-card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }

            .product-img {
                width: 100%;
                height: auto;
            }

            .product-info {
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <jsp:include page = "nav.jsp"/>

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-flex w-50" src="images/acer1.jpg" alt="First slide" style="margin-left: 400px"  >
                </div>
                <div class="carousel-item">
                    <img class="d-flex w-50" src="images/mac3.jpg" alt="Second slide" style="margin-left: 400px" >
                </div>
                <div class="carousel-item">
                    <img class="d-flex w-50" src="images/asus3.jpg" alt="Third slide" style="margin-left: 400px" >
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


        <script>
            $(document).ready(function () {
                $('.carousel').carousel();
            });
            $('.carousel').carousel({
                interval: 1500
            });
        </script>


        <div class="card-group" style="margin-top:50px;">
            <div class="card" style="border-style: none;">
                <img style="height:55px; width:64px; margin: auto;" src="images/giaohang.jpg">
                <div class="card-body">
                    <h5 class="card-title" style="text-align:center">DELIVERY NATIONWIDE</h5>
                    <p class="card-text" style="text-align:center">Shipping all over Vietnam</p>
                </div>
            </div>
            <div class="card" style="border-style: none;">
                <img class="card-img-top" style="height:55px; width:64px; margin: auto;" src="images/thanhtoan.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title" style="text-align:center">PAYMENT ON DELIVERY</h5>
                    <p class="card-text" style="text-align:center">Receive goods at home and pay</p>
                </div>
            </div>
            <div class="card" style="border-style: none;">
                <img class="card-img-top" style="height:55px; width:64px; margin: auto;" src="images/baohanh.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title" style="text-align:center">LONG-TERM WARRANTY</h5>
                    <p class="card-text" style="text-align:center">Guarantee up to 60 days</p>
                </div>
            </div>
            <div class="card" style="border-style: none;">
                <img class="card-img-top" style="height:55px; width:64px; margin: auto;" src="images/doihang.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title" style="text-align:center">EASY EXCHANGE</h5>
                    <p class="card-text" style="text-align:center">Free exchange within 30 days</p>
                </div>
            </div>
        </div>
        <div class="container">
            <h2 style="font-family: inherit; margin-left: 300px">--------------All Products---------------</h2> 
            <div class="row">
                <c:forEach items="${requestScope.data3}" var="p" >
                    <div class="col-md-4">
                        <div class="product-card">
                            <img src="${p.image}" class="product-img" alt="...">
                            <div class="product-info">
                                <h5 class="card-title"> <a href="detail?pid=${p.id}">${p.name}</a></h5>
                                <p class="card-text">Price: ${p.price} $</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <h2 style="font-family: inherit; margin-left: 270px">-------------The cheapest product--------------</h2> 
            <div class="row">
                <c:forEach items="${requestScope.listMin}" var="p" >
                    <div class="col-md-4">
                        <div class="product-card">
                            <img src="${p.image}" class="product-img" alt="...">
                            <div class="product-info">
                                <h5 class="card-title"> <a href="detail?pid=${p.id}">${p.name}</a></h5>
                                <p class="card-text">Price: ${p.price} $</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <h2 style="font-family: inherit; margin-left: 250px">-------------The most expensive products------------</h2> 
            <div class="row">
                <c:forEach items="${requestScope.listMax}" var="p">
                    <div class="col-md-4">
                        <div class="product-card">
                            <img src="${p.image}" class="product-img" alt="...">
                            <div class="product-info">
                                <h5 class="card-title"> <a href="detail?pid=${p.id}">${p.name}</a></h5>
                                <p class="card-text">Price: ${p.price} $</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <h2 style="font-family: inherit; margin-left: 300px">--------------The latest Acer products------------------</h2> 
            <div class="row">
                <c:forEach items="${requestScope.listAcer}" var="p">
                    <div class="col-md-4">
                        <div class="product-card">
                            <img src="${p.image}" class="product-img" alt="...">
                            <div class="product-info">
                                <h5 class="card-title"> <a href="detail?pid=${p.id}">${p.name}</a></h5>
                                <p class="card-text">Price: ${p.price} $</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <h2 style="font-family: inherit; margin-left: 250px">------------The latest Macbook products------------</h2> 
            <div class="row">
                <c:forEach items="${requestScope.listMac}" var="p">
                    <div class="col-md-4">
                        <div class="product-card">
                            <img src="${p.image}" class="product-img" alt="...">
                            <div class="product-info">
                                <h5 class="card-title"> <a href="detail?pid=${p.id}">${p.name}</a></h5>
                                <p class="card-text">Price: ${p.price} $</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page = "footer.jsp"/>
    </body>
</html>
