<%-- 
    Document   : viewOrderSuccess
    Created on : Nov 21, 2023, 3:24:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<div class="container mt-3">
    <div class="row">
        <div class="text-center">            
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 80px; height: 80px; border: 2px solid #00ff00; border-radius: 50%;">
                <path d="M20 6L9 17 4 12" fill="#00ff00"/>
            </svg>
            <h2 class="mb-4">Thank you for purchasing, Your order is complete!</h2>
            <p>
                <a href="./" class="btn btn-outline-info">Home</a>
                <a href="./customer-product" class="btn btn-outline-info">Continue Order</a>
            </p>
        </div>
    </div>
</div>
<%@include file="layout/footer.jsp" %>
