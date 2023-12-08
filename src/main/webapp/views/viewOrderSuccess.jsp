<%-- 
    Document   : viewOrderSuccess
    Created on : Nov 21, 2023, 3:24:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<div class="container padding-top-100 mb-3">
    <div class="row">
        <div class="text-center">
            <img src="./assets/themify-icons/SVG/check.svg" alt="complete" style="width: 80px; height:80px; border: 2px solid #000; border-radius: 50%;"/>
            <h2 class="mb-4">Thank you for purchasing, Your order is complete!</h2>
            <p>
                <a href="./" class="btn btn-outline-info">Home</a>
                <a href="./customer-product" class="btn btn-outline-info">Continue Order</a>
            </p>
        </div>
    </div>
</div>
<%@include file="layout/footer.jsp" %>
