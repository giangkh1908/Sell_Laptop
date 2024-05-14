<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change information</title>
       
    </head>
    <body>
        <jsp:include page = "nav.jsp"/>
        <div class="container">
            <h3 style="margin-left: 500px">Profile</h3>
            <div class="row">
                <div class="row">
                    <form action="change" style="margin-left: 500px">
                        <input type="hidden" name="user" value="${sessionScope.account.username}">
                        Full Name: <input style="margin-bottom: 20px;padding: 2px;border-radius: 10px" type="text" name="fullname" ><br/>
                        Old Password: <input style="margin-bottom: 20px;padding: 2px;border-radius: 10px" type="password" name="opassword" ><br/>
                        New Password: <input style="margin-bottom: 20px;padding: 2px;border-radius: 10px" type="password" name="npassword" ><br/>
                        Confirm Password: <input style="margin-bottom: 20px;padding: 2px;border-radius: 10px" type="password" name="cpassword" ><br/>
                        <button style="border-radius: 20px;margin-left:100px" type="submit">Change</button>
                    </form>
                        <h3 class="error" style="color: red">${requestScope.ms}</h3>
                </div>
            </div>
        </div>
        <jsp:include page = "footer.jsp"/>
    </body>
</html>

