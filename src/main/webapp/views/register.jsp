<%-- 
    Document   : register
    Created on : Nov 20, 2023, 2:41:28 PM
    Author     : Phong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
    <center>
        <div>
            <form action="RegisterController" method="POST">
                <c:set var="errors" value="${requestScope.ERROR}"/>
                <h1>Sign Up</h1>
                <h2>Join us and you will never regret that choice</h2>
                <input type="text" name="txtFullName" value="" placeholder="Full Name"/><br>
                <input type="text" name="txtEmail" value="" placeholder="Email"/><br>
                <c:if test="${not empty errors}">
                    <font style="color:red">
                    ${errors.emailError}
                    </font>                    
                </c:if>
                <input type="text" name="txtPhone" value="" placeholder="Phone"/><br>
                <c:if test="${not empty errors}">
                    <font style="color:red">
                    ${errors.phoneError}
                    </font>                 
                </c:if>
                <input type="text" name="txtPassword" value="" placeholder="Password"/><br>
                <c:if test="${not empty errors}">
                    <font style="color:red">
                    ${errors.passwordError}
                    </font>                 
                </c:if>
                <input type="text" name="txtConfirm" value="" placeholder="Confirm Password"/><br>
                <input type="submit" value="Register" name="Action" />
            </form>
        </div>
    </center>
<%@include file="layout/footer.jsp" %>
