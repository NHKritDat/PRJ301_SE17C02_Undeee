<%-- 
    Document   : forgotPasswordConfirmation
    Created on : Dec 7, 2023, 6:54:32 AM
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
                display: flex;
                text-align: center;
                justify-content: center;
                margin-top: 100px;
            }
            .logo-img {
                width: 100px;
                border-radius: 50%;
            }

            .heading {
                margin-top: 24px;
                font-weight: 500;
                color: #000;
                font-size: 30px;
            }

            .text-description {
                margin-top: 24px;
                font-size: 15px;
                white-space: pre-line;
                text-align: justify;
                margin: 0 20px;
                line-height: 1.4;
            }

            .btn {
                text-decoration: none;
                letter-spacing: 1px;
                text-transform: capitalize;
                cursor: pointer;
            }

            .content {
                background-color: #a1c2e2ce;
                display: inline-block;
                white-space: pre-line;
                margin-top: 32px;
                width:360px;
            }
        </style>
    </head>
    <body>
        <form action="ReturnLogin" method="GET">
            <div class="main">
                <div class="item">
                    <img src="views/layout/logo.jpg" alt="Undee" class="logo-img">
                    <h2 class="heading">Reset your password</h2>        
                    <div class="content">
                        <p class="text-description">Check email for a link to reset your password.If it doesn't appear within few minutes.Check your spam folder!</p>                  
                        <a href="./login.jsp" class="btn">Return to sign in</a>

                    </div>
                </div>

            </div>
        </form>

    </body>
</html>
