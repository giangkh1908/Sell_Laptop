
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Product</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <style>
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
            .policy__list {
                margin: 10px;
                list-style: none; /* Ẩn dấu đầu dòng của danh sách */
                padding: 10px; /* Thêm padding cho khung */
                border: 1px solid #ccc; /* Đóng khung cho danh sách */
                border-radius: 5px; /* Bo tròn góc cho khung */
            }

            .policy__list li {
                display: flex; /* Sử dụng flexbox để căn chỉnh phần tử */
                align-items: center; /* Căn chỉnh các phần tử theo chiều dọc */
                margin-bottom: 10px; /* Khoảng cách giữa các mục */
            }

            .policy__list .iconl {
                flex: 0 0 auto; /* Không co giãn icon */
                margin-right: 10px; /* Khoảng cách giữa icon và văn bản */
            }

            .policy__list .iconl i {
                font-size: 24px; /* Kích thước của icon */
            }

            .policy__list p {
                margin: 0; /* Xóa margin mặc định của đoạn văn bản */
            }
            .custom-btn-number {
                display: flex;
                align-items: center;
            }

            .custom-btn-number .input_number_product {
                display: flex;
                align-items: center;
            }

            .custom-btn-number .input_number_product input[type="text"] {
                width: 50px;
                text-align: center;
                margin: 0 5px;
            }
            .card-text {
                border: 1px solid #ccc; /* Đặt viền */
                padding: 10px; /* Đặt khoảng cách bên trong */
                border-radius: 5px; /* Đặt góc cong của viền */
                background-color: #f9f9f9; /* Đặt màu nền */
            }
            
                        .product-card1 {
                margin-bottom: 20px;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                transition: 0.3s;
            }

            .product-card1:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }

            .product-img1 {
                width: 100%;
                height: auto;
            }

            .product-info1 {
                padding: 15px;
            }



        </style>
    </head>
    <body>
        <jsp:include page = "nav.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-9">
                    <h3 class="product-detail-heading">Product Detail</h3>

                    <div class="product-detail">
                        <div class="product-card">
                            <img src="${detail.image}" class="product-img w-50" alt="...">

                            <div class="product-info">
                                <h5 class="card-title">${detail.name}</h5>
                                <p class="card-text">Price: ${detail.price} $</p>

                                <div class="promotion-container">
                                    <h3>Khuyến mãi</h3>
                                    <ul class="promotion-box">
                                        <li>Free delivery for orders from 10% to all provinces</li>
                                        <li>Free shipping within a 5km radius with orders from 5%</li>
                                        <li>Attractive gifts up to $100</li>
                                    </ul>
                                    <!--Có phần số lượng mua--> 
                                    <!--Sau đó là 2 nút "Add Cart" "Buy"-->
                                    <!--Nếu "add cart thì nhảy lại trang category xem tiếp sản phẩm, còn buy thì sẽ nhảy ra trang home và số lượng sản phẩm sẽ bị giảm đi theo số lượng mua-->
                                </div>
                                <br/>
                                <div class="custom custom-btn-number show">
                                    <label class="sl section">Quantity:</label>
                                    <div class="input_number_product form-control">									
                                        <button class="btn_num num_1 button button_qty" onclick="decrementQuantity()" type="button">-</button>
                                        <input type="text" id="qty" name="quantity" value="1" maxlength="3" class="form-control prd_quantity" onkeypress="return event.charCode >= 48 && event.charCode <= 57" onchange="validateQuantity()">
                                        <button class="btn_num num_2 button button_qty" onclick="incrementQuantity()" type="button">+</button>
                                    </div>
                                </div>
                                <a href="cart?pid=${detail.id}" class="btn btn-primary">Add Cart</a>
                            </div>
                        </div>
                        <ul class="policy__list">
                            <li>
                                <div class="iconl">
                                    <i class="icondetail-doimoi"></i>
                                </div>
                                <p>
                                    What's wrong is changed inside <b>12 month</b>
                                </p>
                            </li>
                            <li data-field="IsSameBHAndDT">
                                <div class="iconl">
                                    <i class="icondetail-baohanh"></i>
                                </div>
                                <p>
                                    Guarantee <b>Genuine laptop 2 years</b> at manufacturer warranty centers.
                                </p>
                            </li>
                            <li><div class="iconl"></div><p>Product set includes: Instruction manual, Mouse (Wired - Included in the case), Case, Charger ${detail.name}</p></li>
                            <li data-field="hardcode">
                                <div class="iconl"></div>
                                <p>1 year battery warranty</p>
                            </li> 
                        </ul>
                        <h3>Product details </h3>
                        <p class="card-text">${detail.describe}</p>
                    </div>
                    <br/>
                    <h3>Related products </h3>
                    <div class="row">
                        <!-- Hiển thị danh sách sản phẩm gốc -->
                        <c:forEach items="${list}" var="p">
                            <div class="col-md-4">
                                <div class="product-card1">
                                    <img src="${p.image}" class="product-img1" alt="...">
                                    <div class="product-info1">
                                        <a href="detail?pid=${p.id}" class="card-title">${p.name}</a>
                                        <p class="card-text">Price: ${p.price} $</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page = "footer.jsp"/>
        <script>
            function incrementQuantity() {
                var inputElement = document.getElementById('qty');
                var currentValue = parseInt(inputElement.value);
                if (!isNaN(currentValue)) {
                    inputElement.value = currentValue + 1;
                }
            }

            function decrementQuantity() {
                var inputElement = document.getElementById('qty');
                var currentValue = parseInt(inputElement.value);
                if (!isNaN(currentValue) && currentValue > 1) {
                    inputElement.value = currentValue - 1;
                }
            }
        </script>

    </body>
</html>
