<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <style>
            /* CSS giữ nguyên */

            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            .login-form-container {
                background-color: #fff;
                padding: 25px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 30%;
            }

            /* CSS thêm mới */
            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 8px;
                display: block; /* Hiển thị các label theo chiều dọc */
            }

            input {
                padding: 8px;
                margin-bottom: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                display: block; /* Hiển thị các input theo chiều dọc */
            }

            button {
                padding: 10px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #45a049;
            }
            /* CSS thêm mới */
        </style>
    </head>
    <body>
        <!-- Thay đổi class container -->
        <div class="login-form-container">
            <!-- Thay đổi action và method -->
            <form action="ForgotPasswordServlet" method="post">
                <!-- Thêm trường email -->
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <!-- Thêm nút đăng ký -->
                <button type="submit">Register</button>
            </form>
        </div>
    </body>
</html>
