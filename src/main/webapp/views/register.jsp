<%-- 
    Document   : register
    Created on : Nov 20, 2023, 2:41:28 PM
    Author     : Phong
--%>


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
<%@page import="fpt.fu.prj301_se17c02_undeee.models.RegisterError"%>

<%    RegisterError errors = (RegisterError) request.getAttribute("ERROR");
%>

<center>
    <div>
        <form action="register" method="POST">
            <h1>Sign Up</h1>
            <h2>Join us and you will never regret that choice</h2>
            <input type="text" name="txtFullName" value="" placeholder="Full Name"/><br>

            <input type="text" name="txtEmail" value="" placeholder="Email"/><br>
            <%
                if (errors != null && errors.getEmailError() != null) {
            %>
            <font style="color:red">
            <%= errors.getEmailError()%>
            </font>
            <%
                }
            %>

            <input type="text" name="txtPhone" value="" placeholder="Phone"/><br>
            <%
                if (errors != null && errors.getPhoneError() != null) {
            %>
            <font style="color:red">
            <%= errors.getPhoneError()%>
            </font>
            <%
                }
            %>

            <input type="text" name="txtPassword" value="" placeholder="Password"/><br>
            <%
                if (errors != null && errors.getPasswordError() != null) {
            %>
            <font style="color:red">
            <%= errors.getPasswordError()%>
            </font>
            <%
                }
            %>

            <input type="text" name="txtConfirm" value="" placeholder="Confirm Password"/><br>
            <input type="submit" value="Register" name="Action" />
        </form>
    </div>
</center>

<%@include file="layout/footer.jsp" %>

