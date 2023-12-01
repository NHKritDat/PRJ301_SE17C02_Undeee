<%-- 
    Document   : view
    Created on : Oct 23, 2023, 10:10:10 AM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Paging"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>

<%
    String name = (String) session.getAttribute("user-loged");
    String report = (String) request.getAttribute("report");

    Paging newsPaging = (Paging) request.getAttribute("newsPaging");

    String search = (String) request.getAttribute("search");

    List<Products> newsList = newsPaging.getP();
    if (newsList == null) {
        return;
    }
    String category = request.getParameter("category");
    int category_id = 1;
    if (category != null) {
        category_id = Integer.parseInt(category);
    }

    List<Categories> categoryList = (List<Categories>) request.getAttribute("categoryList");
    double numberPage = Math.ceil((double) newsPaging.getTotal() / (double) newsPaging.getPerPage());
%>
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
    <body style="margin-bottom: 100px;">





        <!-- Danh sách sản phẩm dạng card -->
        <div class="container mt-4 myflex">

            <h1 class="padding-top100">Danh Sách Sản Phẩm</h1>

            <!-- Phần tìm kiếm -->


            <div class="row mb-3">
                <div class="col-md-3">
                    <form id="searchForm"  class="d-flex" action="view" method="post" aria-label="Search">
                        <input id="searchInput" class="form-control" type="search" placeholder="Search" name="searchKeyword">
                        <button id="searchButton" class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                <div class="col-md-2">
                    <div >
                        <form action="./view" method="post">
                            <select class="form-control" id="categories" name="searchKeyword" onchange="this.form.submit()">
                                <option hidden="">Categories</option>
                                <%  for (Categories categories : categoryList) {
                                %>
                                <option value="<%= categories.getCategory_id()%>" <%if (category_id == categories.getCategory_id()) {%>selected=""<%}%>><%= categories.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </form>
                    </div>

                </div>
                <div class="col-md-2">
                    <select name="status" class="form-control" id="status">
                        <option value="">STATUS</option>
                        <option value="Active">Active</option>
                        <option value="Sold out">Sold out</option>

                    </select>
                </div>
            </div>




            <h2>List of products</h2>
            <div class="row">
                <%
                    //      List<Products> productList = (List<Products>) request.getAttribute("list");
                    for (int i = 0; i < newsList.size(); i++) {
                        Products product = newsList.get(i);
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
                            <button style="background-color: yellow"><a href="update-products?id=<%= product.getId()%>" class="btn" role="button">Update</a></button>

                        </div>
                    </div>
                </div>
                <%
                    }
                %>         
            </div>
        </div>

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous <%= numberPage%></a>
                </li>
                <% for (int i = 0; i < numberPage; i++) {%>
                <li class="page-item"><a class="page-link" href="./view?page=<%= i + 1%>&perPage=<%= newsPaging.getPerPage()%><%= search == null ? "" : "&search=" + search%>"><%= i + 1%></a></li>
                    <% }%>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
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







