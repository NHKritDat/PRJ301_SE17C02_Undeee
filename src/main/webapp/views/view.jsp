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
<%@include file="layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Website của bạn</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

      
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
                        <a class="nav-link" href="create">Tạo mới sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Đăng xuất</a>
                    </li>
                    <li>
                        <div style="margin: 0 !important;" class="form-group">
                            <select class="form-control" id="loaiSanPham" name="category">
                                <option value="0"%>">Categories</option>
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

                    <li>     
                        <div class="form-group">
                            <select name="status" class="form-control" id="status">
                                <option value="">STATUS</option>
                                <option value="Active">Active</option>
                                <option value="Sold out">Sold out</option>

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
        <div> <img style="width: 100%" id="clubs" class="clubs" src="views/layout/Dong-gia-25k-slide-banner.png" alt=""></div>

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
                <div class="col-md-3">
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


<--<!-- Search Category -->
<script>
    document.getElementById('loaiSanPham').addEventListener('change', function () {
        const categoryId = document.getElementById('loaiSanPham').value;
        const searchForm = document.getElementById('searchForm');

        // Update the search form action URL to include the selected category ID
        searchForm.action = "view?searchCategory=" + categoryId;

        // Submit the search form to trigger the servlet processing
        searchForm.submit();
    });

</script>


<--<!-- Search Status -->
<script>
    document.getElementById('status').addEventListener('change', function () {
        const status = document.getElementById('status').value;
        const searchForm = document.getElementById('searchForm');

        // Update the search form action URL to include the selected category ID
        searchForm.action = "view?searchKeyword=" + status;

        // Submit the search form to trigger the servlet processing
        searchForm.submit();
    });

</script>

     <script>
        const imageElement = document.getElementById("clubs");
        const imageSources = ["views/layout/Dong-gia-25k-slide-banner.png"
            , "views/layout/Series-ly-1-lit-slide-banner.png",
        "views/layout/Slide_banner-1.jpg"]; // Danh sách các đường dẫn ảnh

        let currentImageIndex = 0;

        function changeImage() {
            imageElement.src = imageSources[currentImageIndex];
            currentImageIndex = (currentImageIndex + 1) % imageSources.length;
        }

        setInterval(changeImage, 3000); // Thực hiện hàm changeImage sau mỗi 3000ms (3 giây)
    </script>

<%@include file="layout/footer.jsp" %>







