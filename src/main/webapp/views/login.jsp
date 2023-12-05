<%-- 
    Document   : Login
    Created on : Nov 18, 2023, 3:48:25 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
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
<div class="container">
    <h1>Login</h1>
    <form action="login" method="POST">
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
        </div>
        <div class="">
            Not a member? <a href="./register">Sign Up</a>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
        <input type="checkbox" name="Remember me" value="ON" />Remember me
</div>
<%@include file="layout/footer.jsp" %>