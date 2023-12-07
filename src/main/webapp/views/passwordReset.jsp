<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Reset</title>
</head>
<body>

    <h2>Password Reset</h2>

    <form action="PasswordResetServlet" method="post">
        <input type="hidden" name="token" value="${token}"> <!-- The token received from the request attribute -->
        <input type="hidden" name="email" value="${email}"> <!-- The token received from the request attribute -->
        <p>Email: ${email}</p>
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <input type="submit" value="Reset Password">
    </form>

</body>
</html>
