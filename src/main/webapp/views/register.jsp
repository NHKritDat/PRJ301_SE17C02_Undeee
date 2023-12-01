<%-- 
    Document   : register
    Created on : Nov 20, 2023, 2:41:28 PM
    Author     : Phong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
                .footer-bottom{
                background-color: black;
                text-align: center;
                padding: 20px;
                margin-top: 30px;



                color: white;
                font-size: 16px;
                font-weight: 300;
            }
            .footer-main{
                display: flex;

                justify-content: space-between;
                padding : 0;

            }
            .content_2{
                margin-left: 35px;
            }
            .logo-footer>img{
                width: 150px ;
                height: 150px ;
                border-radius: 120px;
            }
            .logo-footer{
                align-items: center;
            }
    
</style>
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
