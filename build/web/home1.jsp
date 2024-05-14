<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Results</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    </head>
    <body>
        <jsp:include page = "nav.jsp"/>

        <!-- Search Results -->
        <div class="container-fluid">
            <div class="row">
                <h3>Search Results</h3>
                <div class="row p-5">

                    <div class="row">
                        <c:forEach items="${requestScope.searchResults}" var="p">
                            <div class="card m-1">
                                <img src="${p.image}" style="width: 200px;height: auto" class="card-img-top" alt="...">
                                <div class="card-body" style="width:200px">
                                    <h5 class="card-title">${p.name}</h5>
                                    <p class="card-text" style="font-size: 14px;">Price ${p.price} $</p>
                                    <a href="#" class="btn btn-primary">Buy</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page = "footer.jsp"/>
    </body>
</html>
