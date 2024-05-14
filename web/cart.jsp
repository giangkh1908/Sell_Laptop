
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <style>
            .product-card {
                display: flex;
                flex-direction: row;
                align-items: center;
            }

            .product-img {
                flex: 0 0 150px; /* Đặt kích thước ảnh */
                margin-right: 20px; /* Khoảng cách giữa ảnh và nội dung */
            }

            .product-info {
                flex: 1; /* Tự động mở rộng để lấp đầy không gian còn lại */
            }

            .card-title {
                margin-bottom: 10px; /* Khoảng cách dưới tiêu đề */
            }

            .card-text {
                margin-bottom: 5px; /* Khoảng cách dưới mỗi đoạn mô tả */
            }
            .product-detail-heading {
                font-size: 24px;
                color: #333; /* Màu chữ */
                border-bottom: 2px solid #ccc; /* Đường viền dưới */
                padding-bottom: 10px; /* Khoảng cách dưới */
                margin-bottom: 20px; /* Khoảng cách dưới */
            }
            .promotion-container {
                border: 1px solid #ccc; /* Đường viền */
                padding: 10px; /* Khoảng cách bên trong */
                border-radius: 5px; /* Bo tròn góc */
                background-color: #f9f9f9; /* Màu nền */
            }

            .promotion-box {
                list-style-type: none; /* Loại bỏ dấu đầu dòng */
                padding-left: 0; /* Loại bỏ padding mặc định của danh sách */
            }

            .promotion-box li {
                margin-bottom: 10px; /* Khoảng cách giữa các mục */
                color: #666; /* Màu chữ */
            }
            .card-text {
                font-size: 18px; /* Kích thước chữ */
                font-weight: bold; /* Làm đậm văn bản */
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
                        <h1>Product</h1>
                        <div class="product-quantity">
                            <h1 class="card-title">${cart.name}</h1>
                            <h6 class="card-text">Quantity of product: ${cart.quantity}</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <h3 class="product-detail-heading">${cart.name} ${cart.price}$</h3>

                    <div class="product-detail">
                        <div class="product-card">
                            <img src="${cart.image}" class="product-img w-50" alt="...">
                            <div class="product-info">
                                <div class="promotion-container">
                                    <!--Kiểm tra về thông tin mua hàng của khách hàng-->
                                    <h3>Thông tin mua hàng</h3>
                                    <ul class="promotion-box">
                                        <li>Miễn phí giao hàng cho đơn hàng từ 1000$ tới mọi tỉnh thành</li>
                                        <li>Miễn phí ship nội thành trong bán kính 5km với đơn hàng từ 500$ trở lên</li>
                                        <li>Quà tặng hấp dẫn lên tới 50$</li>
                                    </ul>
                                </div>

                            </div>        

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page = "footer.jsp"/>
    </body>
</html>
