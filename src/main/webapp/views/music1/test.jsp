<%-- 
    Document   : test
    Created on : Nov 26, 2023, 8:19:45 AM
    Author     : Hp
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website của bạn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
</head>

<body style="margin-bottom: 100px;">

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
                        <a class="nav-link" href="home">Trang chủ</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="view">Sản phẩm <span class="sr-only">(current)</span></a>
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
            <form id="searchForm" action="view" method="Post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm" id="searchInput" name="searchKeyword">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="searchButton">Tìm kiếm</button>
                    </div>
                </div>
            </form>
      
        </nav>

    <!-- Danh sách sản phẩm dạng card -->
    <div class="container mt-4">
           <div> <img style="width: 100%" id="clubs" class="clubs" src="views/layout/Dong-gia-25k-slide-banner.png" alt=""></div>

            <div class="center blue">  <h1 >Undeee menu</h1></div>
            <div  class="center"> <h2>Best Seller</h2></div>
          
           


        <h1>Danh Sách Sản Phẩm</h1>

        <div class="row">
                <%
                    List<Products> productList = (List<Products>) request.getAttribute("list");

                    for (int i = 0; i < productList.size(); i++) {
                        Products product = productList.get(i);
                %>
                <div class="col-md-3">
                    <div class="card">

                        <img src="views/Drinks/<%= product.getImage()%>" class="card-img-top" alt="Sản phẩm 1" style="width: 100%; height: 250px">
                        <div class="card-body" style="align-items: center !important">
                            <h5 class="card-title"><%= product.getName()%></h5>
                            <p class="card-text"><%= product.getPrice()%> $</p>
                        </div>
                        <div class="card-footer">

                            <button style="background-color: rgb(0, 170, 255)"><a href="AddToCartController?id=<%= product.getId()%>" class="btn" role="button">Order Now</a></button>

                        </div>
                    </div>
                </div>
                <%
                    }
                %>         
            </div>
        </div>
    </div>

    <!-- Footer -->
    <!-- Footer -->
    <footer class="bg-dark text-white p-3" style="position: fixed;bottom: 0; width: 100%; z-index: 1;">
        <div class="container">
            <p class="text-center">© 2023 Website của bạn. Tất cả quyền được bảo lưu.</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
</body>

</html>
