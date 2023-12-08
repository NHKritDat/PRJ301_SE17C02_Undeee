<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <style>
            /* CSS giữ nguyên */

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
                padding-left: 8px;
            }

            .btn {
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

            .content {
                background-color: #a1c2e2ce;
                display: inline-block;
                white-space: pre-line;
                margin-top: 32px;
                width:400px;
            }

            .txtEmail {
                
                border-radius: 4px;
                width: 300px;
                height: 32px;

            }
            /* CSS thêm mới */
        </style>
    </head>
    <body>
        <!-- Thay đổi class container -->

        <!-- Thay đổi action và method -->
        <form action="ForgotPasswordServlet" method="post">
            <div class="main">
                <div class="item">
                    <img src="views/layout/logo.jpg" alt="Undee" class="logo-img">
                    <h2 class="heading">Reset your password</h2>        
                    <div class="content">
                        <p class="text-description">Please enter your email after click link to reset password!</p>
                        <h3>Email</h3>
                        <input type="text" name="email" class="txtEmail">
                        <button class="btn">Submit</button>
                    </div>
                </div>
        </form>

    </body>
</html>
