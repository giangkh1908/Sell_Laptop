<%-- 
    Document   : new
    Created on : Mar 5, 2024, 1:45:29 AM
    Author     : KimHo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Category</title>
    <style>
        body {
            font-family: 'Courier New', Courier, monospace;
            background-color: #cbeba0; /* Màu nền mùa xuân */
            color: #333;
            margin: 0;
            padding: 0;
        }
        
        .container {
            width: 30%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        
        form {
            text-align: center;
        }
        
        input[type="number"],
        input[type="text"],
        textarea {
            width: 50%; /* Giảm chiều rộng của input và textarea xuống 90% */
            padding: 10px; /* Tăng padding */
            margin-bottom: 20px;
            border: 1px solid #68b051; /* Màu viền input */
            background-color: #efffe6; /* Màu nền input */
            color: #333;
            border-radius: 5px;
            box-sizing: border-box;
            font-family: 'Courier New', Courier, monospace;
        }
        
        button[type="submit"] {
            background-color: #3fb950; /* Màu nút */
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Courier New', Courier, monospace;
        }
        
        button[type="submit"]:hover {
            background-color: #367f42; /* Màu nút khi hover */
        }
    </style>
</head>
<body>
    <jsp:include page = "nav.jsp"/>
    <div class="container">
        <h1>A new category</h1>
        <h3>${requestScope.error}</h3>
        <form action="add">
            enter id <input type="number" name="id"/><br/>
            enter name <input type="text" name="name"/><br/>
            enter describe <textarea name="desc"></textarea><br/>
            <button type="submit">SAVE</button>
        </form>
    </div>
         
</body>
</html>
