<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <style>
            .text-center {
                text-align: center; /* Căn giữa nội dung */
                margin-top: 20px; /* Khoảng cách từ phía trên */
            }

        </style>
    </head>
    <body>
        <jsp:include page = "nav.jsp"/>
        <div class="container-fluid">
            <div class="col-md-3">
                <a href="change.jsp">Change information</a><br/>
            </div>
            <h1 class="text-center">User Detail</h1>
            <div class="text-center">
                <c:set var="acc" value="${sessionScope.account}"/>
                <c:if test="${acc!=null}">
                    <h3>Fullname: ${acc.fullname}</h3>
                    <h3>Username: ${acc.username}</h3>
                    <h3>Role: ${acc.role}</h3>
                </c:if>
            </div>
            <div class="text-center mt-5">
                <h6>If you have any comments or questions, please contact us: Email: yangshop@gmail.com . Phone: 0866710983</h6>
            </div>
        </div>
        <jsp:include page = "footer.jsp"/>
    </body>
</html>
