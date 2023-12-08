<%-- 
    Document   : resetTokenError
    Created on : Dec 7, 2023, 6:59:39 AM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .main {
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            .item {
                width: 800px;
                background-color: #ccc;
                padding: 30px;
                border-radius: 16px;
            }

            .heading {
                margin-bottom: 32px;
                color: rgb(245, 6, 6)
            }

            .link {
                text-decoration: none;
                margin-top: 24px;
                border-radius: 20px;
                border: 1px solid #000;
                background-color: #cccccc;
                color: #000;
                font-size: 15px;
                font-weight: 600;
                margin: 20px;
                padding: 12px 80px;
                letter-spacing: 1px;
                text-transform: capitalize;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="item">
                <h1 class="heading">Incorrect Verification Code !!!</h1>
                <a href="./register.jsp" class="link">Return Register Page</a>
            </div>
        </div>
    </body>
</html>
