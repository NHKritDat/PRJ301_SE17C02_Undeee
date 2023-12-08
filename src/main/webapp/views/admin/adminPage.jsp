<%-- 
    Document   : AdminPage
    Created on : Nov 18, 2023, 8:10:43 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<style>
    body{
        background-color: #00c0ff24;
    }
    #order{
        background-color: #ffa500a8;
        padding: 10px;
        color: white;
        border: 1px solid;
        border-radius: 10px;
        font-weight: 800;
    }
    #page-container{
        min-height: 70vh !important;
    }
</style>
<div class="container mt-3">
    <div class="row text-center mt-3">
        <h1>Admin Page</h1>
        <h1>Hi, <%= u.getFullname()%></h1>
    </div>
    
    
    <div class="button-group text-center">
        <button class="btn btn-info"><a href="view" class="nav-link">View Products</a></button>
        <button class="btn btn-info"><a href="create" class="nav-link">Create Products</a></button>
        <button class="btn btn-info"><a href="view-orders" class="nav-link">View Order</a></button>
    </div>
</div>
<%@include file="../layout/footer.jsp" %>