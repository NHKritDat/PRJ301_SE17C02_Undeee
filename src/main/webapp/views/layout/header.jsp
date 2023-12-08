<%-- 
    Document   : header
    Created on : Nov 17, 2023, 9:54:21 AM
    Author     : Admin
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDetails"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Cart"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();
    Users u = (Users) session.getAttribute("user_loged");
    Cart cart = (Cart) session.getAttribute("CART");
    if (cart == null) {
        cart = new Cart();
    }
    int total_quantity = 0;
    for (OrderDetails od : cart.getAll()) {
        total_quantity += od.getQuantity();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cafe&MilkTea Ún đeee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
        <link href="./assets/css/popupCart.css" rel="stylesheet"> 
        <link href="./assets/css/footer.css" rel="stylesheet">
        <link href="./assets/css/header.css" rel="stylesheet">
        <link href="./assets/css/home.css" rel="stylesheet">
        <link href="./assets/css/body.css" rel="stylesheet">
        <link href="./assets/css/alert.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="./assets/css/icomoon.css">
        <link rel="stylesheet" href="./assets/css/ionicons.min.css">
    </head>
    <body>

        <div id="page-container">
            <div id="content-wrap">
                <nav class="navbar navbar-expand-lg " style="background-color: aqua">              
                    <a class="navbar-brand" href="./">
                        <img src="views/layout/logo.jpg" alt="Logo" width="40" height="40" style="border-radius: 50px">
                        Ún đeee
                    </a>

                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <%
                                if (u != null) {
                                    if (u.getRole() == 1) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="./">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./customer-product">View products</a>
                            </li>
                            <li class="nav-item">
                                <!--                                <a class="nav-link" href="./EditCartController">Cart</a>-->
                                <a class="nav-link" href="./EditCartController">Cart [<%= total_quantity%>]</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./order-history">My orders</a>
                            </li>
                            <%
                            }else if (u.getRole() == 2) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="./admin-page">Admin Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./view">View products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./create">Create products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./view-orders">View orders</a>
                            </li>
                            <%
                                }
                              else if (u.getRole() == 3) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="./admin-page">Admin Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./view">View products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./create">Create products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./view-orders">View orders</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./admin">Boss room</a>
                            </li>
                            <%
                            }
                         else {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="./">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./customer-product">View products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./EditCartController">Cart [<%= total_quantity%>]</a>
                            </li>
                            <%
                                }
}
                            %>
                        </ul>
                    </div>

                    <div class="input-group-append">

                        <ul class="navbar-nav">
                            <%
                                if (u == null) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="./login">
                                    <i class="fa fa-user-edit me-2"></i>Sign In
                                </a>
                            </li>     
                        </ul>

                        <%
                        } else {
                        %>
                        <div class="nav-item dropdown">
                            <a href="./" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="views/users_avatar/<%= u.getAvatar()%>" alt="Avatar" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex"><%= u.getFullname()%></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <a href="./updateUser" class="dropdown-item">My Profile</a>
                                <a href="./logout" class="dropdown-item">Logout</a>
                            </ul>
                        </div>                       
                        <%
                            }
                        %>
                    </div>
                </nav>
