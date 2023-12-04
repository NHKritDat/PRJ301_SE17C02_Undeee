<%-- 
    Document   : register
    Created on : Nov 20, 2023, 2:41:28 PM
    Author     : Phong
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.RegisterError"%>

<%    RegisterError errors = (RegisterError) request.getAttribute("ERROR");
%>

<div class="container padding-top-100">
    <form action="register" method="POST">
        <h1>Sign Up</h1>
        <h2>Join us and you will never regret that choice</h2>

        <input type="text" name="txtEmail" value="" placeholder="Email"/><br>

        <%
            if (errors != null && errors.getEmailError() != null) {
        %>
        <font style="color:red">
        <%= errors.getEmailError()%>
        </font><br>      
        <%
            }
        %>
        <%
            if (errors != null && errors.getEmailUniqueError() != null) {
        %>
        <font style="color:red">
        <%= errors.getEmailUniqueError()%>
        </font><br>      
        <%
            }
        %>

        <input type="text" name="txtPhone" value="" placeholder="Phone"/><br>
        <%
            if (errors != null && errors.getPhoneError() != null) {
        %>
        <font style="color:red">
        <%= errors.getPhoneError()%>
        </font><br>
        <%
            }
        %>

        <input type="text" name="txtPassword" value="" placeholder="Password"/><br>
        <%
            if (errors != null && errors.getPasswordError() != null) {
        %>
        <font style="color:red">
        <%= errors.getPasswordError()%>
        </font><br>
        <%
            }
        %>

        <input type="text" name="txtConfirm" value="" placeholder="Confirm Password"/><br>
        <%
            if (errors != null && errors.getConfirmPasswordError() != null) {
        %>
        <font style="color:red">
        <%= errors.getConfirmPasswordError()%>
        </font><br>
        <%
            }
        %>

        <input type="text" name="txtFullName" value="" placeholder="Full Name"/><br>
        <%
            if (errors != null && errors.getFullnameError() != null) {
        %>
        <font style="color:red">
        <%= errors.getFullnameError()%>
        </font><br>
        <%
            }
        %>
        <input type="submit" value="Register" name="Action" />
    </form>
</div>

<%@include file="layout/footer.jsp" %>

