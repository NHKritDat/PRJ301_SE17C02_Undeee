<%-- 
    Document   : AdminPage
    Created on : Nov 18, 2023, 8:10:43 PM
    Author     : dell
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
<%@include file="../layout/header.jsp" %>
<h1>Admin Page</h1>
<h1>Hi, <%= u.getFullname()%></h1>
<form action="view-orders">
    <input type="submit" value="View Order">
</form>
<%@include file="../layout/footer.jsp" %>