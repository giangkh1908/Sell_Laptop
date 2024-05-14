<%-- 
    Document   : update
    Created on : Mar 5, 2024, 2:00:04 AM
    Author     : KimHo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Category</title>
    <style>
        body {
            font-family: 'Courier New', Courier, monospace;
            background-color: #000;
            color: #0f0;
            margin: 0;
            padding: 0;
        }
        
        .container {
            width: 50%;
            margin: 50px auto;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 255, 0, 0.5);
        }
        
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        form {
            text-align: center;
        }
        
        input[type="number"],
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #0f0;
            background-color: rgba(0, 0, 0, 0.5);
            color: #0f0;
            border-radius: 5px;
            box-sizing: border-box;
            font-family: 'Courier New', Courier, monospace;
        }
        
        button[type="submit"] {
            background-color: #00f;
            color: #0ff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Courier New', Courier, monospace;
        }
        
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>A updating category</h1>
        <c:set var="c" value="${requestScope.category}"/>
        <form action="update" method="post">
            enter id <input type="number" readonly name="id" value="${c.id}"/><br/>
            enter name <input type="text" name="name" value="${c.name}"/><br/>
            enter describe <textarea name="desc">${c.describe}</textarea><br/>
            <button type="submit">UPDATE</button>
        </form>
    </div>
</body>
</html>
