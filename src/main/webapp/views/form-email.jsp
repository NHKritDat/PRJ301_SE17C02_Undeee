<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String email = (String) request.getAttribute("email");%>
<%@include file="layout/header.jsp" %>
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

<form action="UserVerify" method="post">

    <input type="hidden" name="token" value="${sessionScope.newFullName}">
    <input type="hidden" name="email" value="${sessionScope.newEmail}">
    <input type="hidden" name="password" value="${sessionScope.newPassword}">

    <p>${sessionScope.newFullName}</p>

    <label for="email">Email:</label>
    <input value="${sessionScope.newEmail}" type="email" id="email" name="email">

    <button class="btn btn-outline-info" type="submit">Send Code</button>
</form>
<%@include file="layout/footer.jsp" %>