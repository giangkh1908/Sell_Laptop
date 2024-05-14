
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
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
            /* CSS cho danh mục sản phẩm */
            .category-tab {
                margin-top: 20px;
                background-color: #f8f9fa; /* Màu nền */
                border-radius: 5px; /* Bo góc */
                padding: 10px; /* Khoảng cách giữa phần nội dung và viền */
            }

            .category-tab h3 {
                color: #007bff; /* Màu chữ */
                font-size: 24px; /* Cỡ chữ */
                margin-bottom: 15px; /* Khoảng cách dưới */
            }

            .nav-link {
                color: #333; /* Màu chữ của các tab */
                font-size: 18px; /* Cỡ chữ của các tab */
                padding: 5px 10px; /* Khoảng cách giữa các tab */
            }

            .nav-link:hover {
                color: #adb5bd; /* Màu chữ khi hover */
                background-color: transparent; /* Nền trong suốt khi hover */
            }

            .nav-link.active {
                color: #a71d2a; /* Màu chữ của tab đang được chọn */
                background-color: #b3b7bb; /* Màu nền của tab đang được chọn */
            }
            .pagination {
                margin-top: 20px;
            }

            .pagination-circle .page-link {
                border-radius: 50% !important;
            }

            .pagination-circle .page-item.active .page-link {
                background-color: #007bff !important;
                border-color: #007bff !important;
            }

            .pagination-circle .page-link {
                color: #007bff;
            }

            .pagination-circle .page-link:hover {
                color: #0056b3;
            }
        </style>
    </head>
    <body>
        <jsp:include page = "nav.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <!-- Tab danh mục sản phẩm -->
                    <div class="category-tab">
                        <h3>Category</h3>
                        <ul class="nav flex-column">
                            <c:forEach items="${requestScope.listC}" var="category">
                                <li class="nav-item">
                                    <a class="nav-link ${tag == category.id ? "active":""}" href="category2?cid=${category.id}">${category.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <form action="category3" method="get">
                        <select name="sortBy">
                            <option value="asc">Sort by Price Asc</option>
                            <option value="desc">Sort by Price Desc</option>
                        </select>
                        <button type="submit">Submit</button>
                    </form>
                    <form action="category4" method="post">
                        <h3>Price</h3>
                        <input type="radio" name="price" value="under500"> <label>Under 500$</label> <br/>
                        <input type="radio" name="price" value="500to1500"> <label>500$ to 1500$</label> <br/>
                        <input type="radio" name="price" value="above1500"> <label>Above 1500$</label> <br/>
                        <button type="submit">Search</button>
                    </form>
                </div>
                <div class="col-md-9">
                    <h3>All Product</h3> 
                    <div class="row">
                        <!-- Hiển thị danh sách sản phẩm gốc -->
                        <c:forEach items="${products}" var="p">
                            <div class="col-md-4">
                                <div class="product-card">
                                    <img src="${p.image}" class="product-img" alt="...">
                                    <div class="product-info">
                                        <a href="detail?pid=${p.id}" class="card-title">${p.name}</a>
                                        <p class="card-text">Price: ${p.price} $</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="pagination pagination-lg">
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li class="page-item"><a class="page-link" href="category?index=${i}" >${i}</a></li>
                            </c:forEach>
                    </div>
                </div>

            </div>
        </div>
        <jsp:include page = "footer.jsp"/>



    </body>
</html>
