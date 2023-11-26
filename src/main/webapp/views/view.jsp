<%-- 
    Document   : view
    Created on : Oct 23, 2023, 10:10:10 AM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>

<%
    String name = (String) session.getAttribute("name");
%>
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
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Trang chủ</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="view">Sản phẩm <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="add">Tạo mới sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login">Đăng xuất</a>
                    </li>
                    <li>
                        <div style="margin: 0 !important;" class="form-group">
                            <label for="loaiSanPham">Categories</label>
                            <select class="form-control" id="loaiSanPham" name="category">
<<<<<<< Updated upstream
=======
                                <option value="0"%>Categories</option>
>>>>>>> Stashed changes
                                <%
                                    List<Categories> categoryList = (List<Categories>) request.getAttribute("categoryList");
                                    for (int i = 0; i < categoryList.size(); i++) {
                                        Categories category = categoryList.get(i);
                                %>
                                <option value="<%= category.getCategory_id()%>"><%= category.getName()%></option>
                                <%
                                    }
                                %>     
                            </select>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="ml-auto">
                <span class="navbar-text">Xin chào, <strong id="userName"><%= name%></strong></span>
            </div>
        </nav>


        <!-- Danh sách sản phẩm dạng card -->
        <div class="container mt-4">
            <h1>Danh Sách Sản Phẩm</h1>

            <!-- Phần tìm kiếm -->
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
                <div class="col-md-4">
                    <div class="card">

                        <img src="views/Drinks/<%= product.getImage()%>" class="card-img-top" alt="Sản phẩm 1" style="width: 100%; height: 250px">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName()%></h5>
                            <p class="card-text"><%= product.getPrice()%></p>
                            <p class="card-text"><strong>Trang thái:</strong><%= product.getStatus()%></p>
                        </div>
                        <div class="card-footer">
                            <button style="background-color: red"><a href="delete?id=<%= product.getId()%>" class="btn" role="button">Delete</a></button>
                            <button style="background-color: yellow"><a href="UpdateProductController?id=<%= product.getId()%>" class="btn" role="button">Update</a></button>
                            
                        </div>
                    </div>
                </div>
                <%
                    } 
                %>         
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

<script>
    function xoaSanPham(productId) {
        if (confirm("Bạn có chắc muốn xóa sản phẩm này?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "delete?id=" + productId, true);
            xhr.send();

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    location.reload();
                }
            };
        }
    }



    document.getElementById("searchButton").addEventListener("click", function () {
        var searchKeyword = document.getElementById("searchInput").value;
        var form = document.getElementById("searchForm");
        form.action = "view?searchKeyword=" + searchKeyword;
        form.submit();
    });

</script>












