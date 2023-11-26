<%-- 
    Document   : add
    Created on : Oct 23, 2023, 1:10:56 PM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
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
        <style>

            .labelSize{
                margin-right: 30px;
            }
            .menu-list {
                margin: 0 40px;
                width: 300px;

            }

            .menu-list_header {
                background-color: green;
                color: white;
                padding: 10px 10px;
                text-align: center;
            }


            .menu-list_header-first {
                margin: 0;
                font-size: 20px;
                font-weight: 600;
            }

            .menu-list {
                margin: 0 40px;
                width: 300px;

            }

            .menu-list_header {
                background-color: green;
                color: white;
                padding: 10px 10px;
                text-align: center;
            }


            .menu-list_header-first {
                margin: 0;
                font-size: 20px;
                font-weight: 600;
            }

            .menu-list_content {
                background-color: #E9E3E3;
                padding: 10px 10px;
                display: flex;
                justify-content: space-between; /* Adjust as needed */
                align-items: center; /* Adjust as needed */
            }

            .menu-list_item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .menu-list_item label, input {
                cursor: pointer;
            }

            .menu-list_item-price {
                color: #F7732B;
                font-weight: 600;
            }

            .menu-list_footer {
                background-color: #F7732B;
                color: white;
                padding: 20px 20px;
                text-align: center;
                font-size: 18px;
                display: none;
            }

        </style>

    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Trang chủ</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="view">Sản phẩm</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="add">Tạo mới sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login">Đăng xuất</a>
                    </li>
                </ul>
            </div>
            <div class="ml-auto">
                <span class="navbar-text">Xin chào, <strong id="userName"><%= name%></strong></span>
            </div>
        </nav>

        <!-- Body: Form tạo sản phẩm -->
        <div class="container mt-4">
            <h1>Tạo sản phẩm mới</h1>
            <form action="create" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="tenSanPham">Product's name</label>
                    <input type="text" class="form-control" id="tenSanPham" name="name" placeholder="Nhập tên sản phẩm">
                </div>
                <div class="form-group">
                    <label for="moTa">Product's price</label>
                    <input type="number" class="form-control" id="giaSanPham" name="price" placeholder="Nhập gia san pham">
                </div>


                --<!-- start category -->

                <div style="margin: 0 !important;" class="form-group">
                    <label for="loaiSanPham">Categories</label>
                    <select class="form-control" id="loaiSanPham" name="category">
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

                --<!-- end category -->

                <div class="size">

                    <div class="menu-list_header">
                        <p class="menu-list_header-first">Sizes of product</p>
                    </div>

                    <div class="menu-list_content">
                        <div class="menu-list_item">
                            <div>
                                <input type="checkbox" name="size" value="S" >
                                <label class="labelSize" for="small">Small</label>
                            </div>
                            <div>
                                <input type="checkbox" name="size" value="M" >
                                <label class="labelSize" for="medium">Medium</label>
                            </div>
                            <div>
                                <input type="checkbox" name="size" value="L" >
                                <label class="labelSize" for="large">Large</label>
                            </div>
                        </div>
                    </div>                        
                </div>

                <div class="form-group">
                    <label for="hinhAnh">Hình ảnh sản phẩm</label>
                    <input type="file" class="form-control-file" id="hinhAnh" name="image">
                </div>
                <button type="submit" class="btn btn-primary">Tạo sản phẩm</button>
            </form>
        </div>



        <!-- Footer -->
        <!-- Footer -->
        <footer class="bg-dark text-white p-3" style="position: fixed; bottom: 0; width: 100%;">
            <div class="container">
                <p class="text-center">© 2023 Website của bạn. Tất cả quyền được bảo lưu.</p>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
