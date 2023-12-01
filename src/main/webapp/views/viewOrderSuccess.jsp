<%-- 
    Document   : viewOrderSuccess
    Created on : Nov 21, 2023, 3:24:33 PM
    Author     : Admin
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
<div class="container">
    <div class="row">
        <p>You have placed your order successfully!</p>
    </div>
</div>
<%@include file="layout/footer.jsp" %>
