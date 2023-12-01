<%-- 
    Document   : view
    Created on : Oct 23, 2023, 10:10:10 AM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>

<%
    String name = (String) session.getAttribute("user-loged");
    String report = (String) request.getAttribute("report");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Website của bạn</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="./assets/css/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <style>
            .brand-name{
                font-family: "Segoe UI", Arial, sans-serif;
                font-size: 30px;

            }

            .navbar-brand img{
                border-radius: 50px;
                width: 50px;
                height: 50px;
            }
            .nav-item{
                margin-right: 50px;
            }
            .nav-link{
                color: white;
                font-weight: 500;
                font-size: 20px;
            }
            #navbarNav{
                margin-left: 120px;
            }


            .card{
                margin-bottom: 60px !important;

            }
            .center{
                text-align: center !important;
            }

            .blue{
                color: #006bff
            }

            .padding0{
                padding :0px !important;
            }


            .order-button{
                background-color: rgb(0, 170, 255);
            }
            .order-button:hover{
                border-color: rgb(0, 170, 255);
                background-color: white;
            }



        </style>
        <style>
            .card{
                margin-bottom: 60px !important;

            }
            .center{
                text-align: center !important;
            }

            .blue{
                color: #006bff
            }
        </style>
    </head>
    <body >

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg " style="background-color: aqua ">
            <a class="navbar-brand" href="./">
                <img src="views/layout/logo.jpg" alt="Logo" width="40" height="40" style="border-radius: 50px">
                Ún đeee
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="">Trang chủ</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="customer-product">Sản phẩm <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Tuyển dụng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Nhượng quyền</a>
                    </li>
                </ul>
            </div>


        </nav>
        <div> <img style="width: 100%" id="clubs" class="clubs" src="views/layout/Dong-gia-25k-slide-banner.png" alt=""></div>
        <!-- Danh sách sản phẩm dạng card -->
        <div class="container mt-6">


            <div class="center blue">  <h1 >Undeee menu</h1></div>
            <div  class="center"> <h2>Best Seller</h2></div>



            <form id="searchForm" action="view" method="Post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm" id="searchInput" name="searchKeyword">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="searchButton">Tìm kiếm</button>
                    </div>
                </div>
            </form>

            <div class="row">
                <%
                    List<Products> productList = (List<Products>) request.getAttribute("list");

                    for (int i = 0; i < productList.size(); i++) {
                        Products product = productList.get(i);
                %>
                <div class="col-md-3">
                    <div class="card">

                        <img src="views/Drinks/<%= product.getImage()%>" class="card-img-top" alt="Sản phẩm 1" style="width: 100%;
                             height: 250px">
                        <div class="card-body" style="align-items: center !important">
                            <h5 class="card-title"><%= product.getName()%></h5>
                            <p class="card-text"><%= product.getPrice()%> $</p>
                        </div>
                        <div class="card-footer">

                            <button class="order-button" "><a href="AddToCartController?id=<%= product.getId()%>" class="btn" role="button">Order Now</a></button>

                        </div>
                    </div>
                </div>
                <%
                    }
                %>         
            </div>
        </div>


        <%@include file="layout/footer.jsp" %>









