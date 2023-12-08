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
<div class="container mt-4">
    <div class="row text-center">
        <h1>Admin Page</h1>
        <h1>Hi, <%= u.getFullname()%></h1>
    </div>
</div>
<%@include file="../layout/footer.jsp" %>