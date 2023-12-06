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
        <link href="./assets/css/popupCart.css" rel="stylesheet"> 
        <link href="./assets/css/footer.css" rel="stylesheet">
        <link href="./assets/css/header.css" rel="stylesheet">
        <link href="./assets/css/home.css" rel="stylesheet">
        <link href="./assets/css/body.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/themify-icons/themify-icons.css">

    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
        * {
            margin: 0;
            padding: 0;
            user-select: none;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .alert {
            background: #ffdb9b;
            padding: 20px 40px;
            min-width: 420px;
            position: absolute;
            right: 0;
            top: 150px;
            border-radius: 4px;
            border-left: 8px solid #ffa502;
            overflow: hidden;
            opacity: 0;
            pointer-events: none;
        }
        
        .alert1 {
            background: #9bffad;
            padding: 20px 40px;
            min-width: 420px;
            position: absolute;
            right: 0;
            top: 150px;
            border-radius: 4px;
            border-left: 8px solid rgb(4, 171, 15);
            overflow: hidden;
            opacity: 0;
            pointer-events: none;
        }
        
        .alert.showAlert {
            opacity: 1;
            pointer-events: auto;
        }
        
        .alert.show {
            animation: show_slide 1s ease forwards;
        }
        
        .alert1.showAlert {
            opacity: 1;
            pointer-events: auto;
        }
        
        .alert1.show {
            animation: show_slide 1s ease forwards;
        }
        
        @keyframes show_slide {
            0% {
                transform: translateX(100%);
            }
            40% {
                transform: translateX(-10%);
            }
            80% {
                transform: translateX(0%);
            }
            100% {
                transform: translateX(-10px);
            }
        }
        
        .alert.hide {
            animation: hide_slide 1s ease forwards;
        }
        
        .alert1.hide {
            animation: hide_slide 1s ease forwards;
        }
        
        @keyframes hide_slide {
            0% {
                transform: translateX(-10px);
            }
            40% {
                transform: translateX(0%);
            }
            80% {
                transform: translateX(-10%);
            }
            100% {
                transform: translateX(100%);
            }
        }
        
        .alert .fa-exclamation-circle {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #ce8500;
            font-size: 30px;
        }
        
        .alert .msg {
            padding: 0 20px;
            font-size: 18px;
            color: #ce8500;
        }
        
        .alert .close-btn {
            position: absolute;
            right: 0px;
            top: 50%;
            transform: translateY(-50%);
            background: #ffd080;
            padding: 20px 18px;
            cursor: pointer;
        }
        
        .alert .close-btn:hover {
            background: #ffc766;
        }
        
        .alert .close-btn .fas {
            color: #ce8500;
            font-size: 22px;
            line-height: 40px;
        }
        
        .alert1 .fa-exclamation-circle {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #00ce03;
            font-size: 30px;
        }
        
        .alert1 .msg {
            padding: 0 20px;
            font-size: 18px;
            color: #05a829;
        }
        
        .alert1 .close-btn {
            position: absolute;
            right: 0px;
            top: 50%;
            transform: translateY(-50%);
            background: #62ef43;
            padding: 20px 18px;
            cursor: pointer;
        }
        
        .alert1 .close-btn:hover {
            background: #66ff99;
        }
        
        .alert1 .close-btn .fas {
            color: #108a02;
            font-size: 22px;
            line-height: 40px;
        }
    </style>
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
                                <a class="nav-link" href="./EditCartController">Cart</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" aria-disabled="true"><%= total_quantity%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./order-history">My orders</a>
                            </li>
                            <%
                            } else {
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
                            } else {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="./">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./customer-product">View products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./EditCartController">Cart</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" aria-disabled="true"><%= total_quantity%></a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>

                    <div class="input-group-append">
                        <%
                            if (u == null) {
                        %>
                        <button class="btn btn-primary">
                            <a class="nav-link active" aria-current="page" href="./login">Đăng nhập</a>
                        </button>
                        <%
                        } else {
                        %>
                        <img src="views/users_avatar/<%= u.getAvatar()%>" alt="Logo" width="40" height="40" style="border-radius: 50px">
                        <li class="nav-item dropdown" style="list-style-type: none">

                            <div class="btn-group">
                                <a class="nav-link"><%= u.getFullname()%></a>
                                <button type="button" class="btn nav-link dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="./updateUser">View profile</a></li>
                                    <li><a class="dropdown-item" href="./logout">Logout</a></li>
                                </ul>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </div>
                </nav>

