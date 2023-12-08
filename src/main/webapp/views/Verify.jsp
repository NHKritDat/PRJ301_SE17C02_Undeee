<%-- 
    Document   : Login
    Created on : Oct 4, 2023, 9:37:30 PM
    Author     : kienb
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.controllers.email.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-image: url('https://cdn.wallpapersafari.com/68/60/4RCjfM.jpg');
                background-size: cover;
            }

            .verification-code-container {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .verification-code-input {
                width: 2em;
                height: 2em;
                font-size: 1.5em;
                text-align: center;
                margin-right: 5px;
            }

            .submit-button {
                padding: 10px;
                font-size: 1em;
                background-color: rgb(232 176 11);
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-left: 165px;
                margin-bottom: 20px;
            }

            h1 {
                text-align: center;
                color: #413e3e;
            }

            p {
                font-size: 12px;
                max-width: 400px;
                margin: 0 auto;
                color: #0000009e;
                text-align: center;
                /* Căn giữa theo chiều ngang */
            }
        </style>
        <title>Verification Code Input</title>
    </head>

    <body>
        <div>
            <form action="check-code" method="post">
                <h1>Verification Code Input</h1>
                <div class="verification-code-container">
                    <input name="num1" class="verification-code-input" type="number" maxlength="1" pattern="[0-9]" inputmode="numeric" min="0" required />
                    <input name="num2" class="verification-code-input" type="number" maxlength="1" pattern="[0-9]" inputmode="numeric" min="0" required />
                    <input name="num3" class="verification-code-input" type="number" maxlength="1" pattern="[0-9]" inputmode="numeric" min="0" required />
                    <input name="num4" class="verification-code-input" type="number" maxlength="1" pattern="[0-9]" inputmode="numeric" min="0" required />
                    <input name="num5" class="verification-code-input" type="number" maxlength="1" pattern="[0-9]" inputmode="numeric" min="0" required />
                    <input name="num6" class="verification-code-input" type="number" maxlength="1" pattern="[0-9]" inputmode="numeric" min="0" required />
                </div>
                <button class="btn btn-outline-info" type="submit">Submit</button>
            </form>
            <p>You have received a 6-digit verification code via email.</p>
            <p>Please check your email to retrieve the code and complete the registration.</p>
        </div>

    </body>

</html>
