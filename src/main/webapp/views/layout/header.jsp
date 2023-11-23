<%-- 
    Document   : header
    Created on : Nov 17, 2023, 9:54:21 AM
    Author     : Admin
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();
    Users u = (Users) session.getAttribute("user_loged");
    Object total_quantity_String = request.getAttribute("total_quantity");
    int total_quantity = 0;
    if (total_quantity_String != null) {
        total_quantity = Integer.parseInt(total_quantity_String.toString());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cafe&MilkTea Ún đeee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg " style="background-color: aqua">
            <div class="container-fluid">
                <a class="navbar-brand" href="./">
                    <img src="views/layout/logo.jpg" alt="Logo" width="40" height="40" style="border-radius: 50px">
                    Ún đeee
                </a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <%
                            if (u != null) {
                                if (u.getRole() == 1) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="./AddToCartController">View products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./EditCartController">Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" aria-disabled="true"><%= total_quantity%></a>
                        </li>
                        <%
                        } else {
                        %>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="./admin-page">Admin Page</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./view">View products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./view-orders">View orders</a>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>

                    <%
                        if (u == null) {
                    %>
                    <button>
                        <a class="nav-link active" aria-current="page" href="./login">Đăng nhập</a>
                    </button>
                    <%
                    } else {
                    %>
                    <li class="nav-item dropdown" style="list-style-type: none">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <%= u.getFullname()%>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="./updateUser">View profile</a></li>
                            <li><a class="dropdown-item" href="./logout">Logout</a></li>
                        </ul>
                    </li>
                    <%
                        }
                    %>
                </div>
            </div>
        </nav>
