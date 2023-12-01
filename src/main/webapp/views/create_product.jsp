<%-- 
    Document   : add
    Created on : Oct 23, 2023, 1:10:56 PM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="java.util.List"%>
<%
    String name = (String) session.getAttribute("name");
    String report = (String) request.getAttribute("report");
    if(report==null){
    report="...";
    }
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
                       .footer-bottom{
                background-color: black;
                text-align: center;
                padding: 20px;
                margin-top: 30px;



                color: white;
                font-size: 16px;
                font-weight: 300;
            }
            .footer-main{
                display: flex;

                justify-content: space-between;
                padding : 0;

            }
            .content_2{
                margin-left: 35px;
            }
            .logo-footer>img{
                width: 150px ;
                height: 150px ;
                border-radius: 120px;
            }
            .logo-footer{
                align-items: center;
                
            }
        </style>
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
            .footer-bottom{
                background-color: black;
                text-align: center;
                padding: 20px;
                margin-top: 30px;



                color: white;
                font-size: 16px;
                font-weight: 300;
            }
            .footer-main{
                display: flex;

                justify-content: space-between;
                padding : 0;

            }
            .content_2{
                margin-left: 35px;
            }
            .logo-footer>img{
                width: 150px ;
                height: 150px ;
                border-radius: 120px;
            }
            .logo-footer{
                align-items: center;
            }



            .order-button{
                background-color: rgb(0, 170, 255);
            }
            .order-button:hover{
                border-color: rgb(0, 170, 255);
                background-color: white;
            }
            .navbar{
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                width: 100% !important;
            }
            .padding-top100{
                padding-top: 100px;
            }
        </style>

    </head>
    <body>

       

        <!-- Body: Form tạo sản phẩm -->
        <div class="container padding-top-100">
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


                <div class="form-group">
                    <label for="hinhAnh">Hình ảnh sản phẩm</label>
                    <input type="file" class="form-control-file" id="hinhAnh" name="image">
                </div>
                
                 <div class="form-group">
                    <label  for="status">STATUS</label>
                    <select name="status" class="form-control" id="status">
                        <option value="Active">Active</option>
                        <option value="Sold out">Sold out</option>

                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Tạo sản phẩm</button>
            </form>
                        <h1 >Trạng thái: <span style="color:red"> <%= report%></span></h1>
        </div>

 <button onclick="CalTotal()">Calculate Total</button>

  


<%@include file="layout/footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
