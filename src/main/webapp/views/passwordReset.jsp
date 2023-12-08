<%@page import="fpt.fu.prj301_se17c02_undeee.models.PasswordResetError"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Password Reset</title>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .wrapper {
                background-color: #00ffff;
                width: 100%;
                height: 100vh;
                padding: 15px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container {
                width: 500px;
                background-color: white;
                padding: 30px;
                border-radius: 16px;
                background-color: rgba(0, 0, 0, 0.08) 0px 4px 12px;
                text-align: center;
            }

            .title-section {
                margin-bottom: 30px;
            }
            .tittle-section p {
                margin: 24px 0;
                font-size: 20px;
            }

            .title {
                color: #38475a;
                font-size: 25px;
                font-weight: 500;
                text-transform: capitalize;
                margin-bottom: 10px;
            }

            .input-group {
                position: relative;
            }

            .input-group.label-title {
                color: #38475a;
                text-transform: capitalize;
                margin-bottom: 11px;
                font-size: 14px;
                display: block;
                font-weight: 500;
            }

            .input-group input {
                width: 100%;
                background-color: none;
                color: #38475a;
                height: 50px;
                font-size: 16px;
                font-weight: 300;
                border: 1px solid #EAECF0;
                padding: 9px 18px 9px 52px;
                outline: none;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .input-group input::placeholder {
                color: #38475a;
                font-size: 16px;
                font-weight: 400;
            }

            .input-group .icon {
                position: absolute;
                color: #38475a;
                left: 13px;
                top: calc(50% - 11px);
                text-align: center;
                font-size: 23px;
            }

            .input-group button {
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

            .sumbit-btn:hover {
                opacity: 0.9;
            }

            .from {
                margin-top: 24px;
            }
            .input-group input {
                margin-top: 10px;
            }


        </style>
    </head>
    <body>
        <%
            PasswordResetError errors = (PasswordResetError) request.getAttribute("RESET_PASSWORD_ERR");
        %>

        <form action="PasswordResetServlet" method="post">
            <input type="hidden" name="token" value="${token}"> <!-- The token received from the request attribute -->
            <input type="hidden" name="email" value="${email}"> <!-- The token received from the request attribute -->          
            <div class="wrapper">
                <div class="container">

                    <div class="tittle-section">
                        <h2 class="tittle">Reset Your New Password</h2>
                        <p>Email: ${email}</p>
                    </div>

                    <form action="" class="from">
                        <div class="input-group">
                            <label for="" class="label-tittle">Enter your new Password </label>
                            <input type="password" name="newPassword" placeholder="New Password" required>
                            <%
                                if (errors != null && errors.getNewPasswordError() != null) {
                            %>
                            <font style="color:red">
                            <%= errors.getNewPasswordError()%>
                            </font><br>      
                            <%
                                }
                            %>
                        </div>

                        <div class="input-group">
                            <label for="" class="label-tittle">Confirm your new Password </label>
                            <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
                            <%
                                if (errors != null && errors.getConfirmPasswordError() != null) {
                            %>
                            <font style="color:red">
                            <%= errors.getConfirmPasswordError()%>
                            </font><br>      
                            <%
                                }
                            %>
                        </div>

                        <div class="input-group">
                            <button class="submit-btn" type="submit"> Reset Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </form>

    </body>
</html>
