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

    Paging newsPaging = (Paging) request.getAttribute("newsPaging");
    String pageInstant = (String) request.getAttribute("page");
    int numPageInstant = 1;
    if (pageInstant != null) {
        numPageInstant = Integer.parseInt(pageInstant);
    }
    String search = (String) request.getAttribute("search");

    List<Products> newsList = newsPaging.getP();
    if (newsList == null) {
        return;
    }

    String category = (String) request.getAttribute("category");

    int category_id = 0;
    if (category != null && !category.equals("")) {
        category_id = Integer.parseInt(category);
    } else {
        category = "";
    }

    List<Categories> categoryList = (List<Categories>) request.getAttribute("categoryList");
    double numberPage = Math.ceil((double) newsPaging.getTotal() / (double) newsPaging.getPerPage());
    int report = 2;
    if (session.getAttribute("report") != null) {
        report = (int) session.getAttribute("report");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<div class="colorlib-about">
  <div class="container">
    <p class="report" value="<%= report%>"></p>

    <h1>Danh Sách Sản Phẩm</h1>

    <div class=" alert hide ">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">Warning: Cannot delete this product!</span>
        <div class="close-btn">
            <span class="fas fa-times"></span>
        </div>
    </div> 

    <div class="alert1 hide">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">Success alert!</span>
        <div class="close-btn">
            <span class="fas fa-times"></span>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <form id="searchForm"  class="d-flex" action="view" method="post" aria-label="Search">
                <input id="searchInput" class="form-control" type="search" placeholder="Search" name="searchKeyword">
                <button id="searchButton" class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        
        <div class="col-md-2">
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
                
        <div class="col-md-2">
            <form action="./view" method="post">
                <select name="status" class="form-control" id="status" >
                    <option value="">STATUS</option>
                    <option value="Active">Active</option>
                    <option value="Sold out">Sold out</option>
                </select>
            </form>
        </div>
    </div>

        <div class="row">
            <%
                for (int i = 0; i < newsList.size(); i++) {
                    Products product = newsList.get(i);
            %>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <img src="views/products/<%= product.getImage()%>" class="card-img-top" alt="Sản phẩm 1" style="width: 100%; height: 250px">
                    <div class="card-body">
                        <span>
                            <h6 class="card-title"><%= product.getName()%></h6>
                        </span>
                        <p class="card-text"><%= product.getPrice()%></p>
                        <p class="card-text"><strong>Trạng thái: </strong><%= product.getStatus()%></p>
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

<div class="row">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="<%if (numPageInstant > 1) {%> ./view?page=<%= numPageInstant - 1%>&perPage=<%= newsPaging.getPerPage()%><%= search == null ? "" : "&search=" + search%><%}%>" tabindex ="-1">Previous</a>
            </li>
            <% for (int i = 0; i < numberPage; i++) {%>
            <li class="page-item">
                <a class="page-link" href="./view?page=<%= i + 1%>&perPage=<%= newsPaging.getPerPage()%><%= search == null ? "" : "&search=" + search%>"><%= i + 1%></a>
            </li>
            <% }%>
            <li class="page-item">
                <a class="page-link" href="<%if (numPageInstant < numberPage) {%> ./view?page=<%= numPageInstant + 1%>&perPage=<%= newsPaging.getPerPage()%><%= search == null ? "" : "&search=" + search%><%}%>" >Next</a>
            </li>
        </ul>
    </nav>
</div>

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

<!-- Đảm bảo bạn đã tải jQuery trước khi sử dụng -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<script>
    // Sử dụng hàm jQuery() thay vì $ để đảm bảo $ đã được định nghĩa
    jQuery(document).ready(function ($) {
        // Hàm kiểm tra và thực hiện các thao tác
        function checkAndExecute() {
            // Lấy giá trị của thuộc tính data-value của thẻ <p> có class "report"
            var pValue = $('p.report').attr('value');

            // Nếu giá trị là 0, thực hiện các thao tác
            if (pValue === '0') {
                $('.alert').addClass("show");
                $('.alert').removeClass("hide");
                $('.alert').addClass("showAlert");

                // Đặt thời gian để ẩn alert sau 5 giây
                setTimeout(function () {
                    $('.alert').removeClass("show");
                    $('.alert').addClass("hide");
                }, 5000);

                // Đổi giá trị của thuộc tính value thành 1
                $('p.report').attr('value', '2');
            }

        }

        // Gọi hàm khi trang được tải
        checkAndExecute();

        $('.close-btn').click(function () {
            $('.alert').removeClass("show");
            $('.alert').addClass("hide");

            // Reset giá trị của thuộc tính value khi đóng alert
            $('p.report').attr('value', '2');
        });
    });
</script>

<script>
    // Sử dụng hàm jQuery() thay vì $ để đảm bảo $ đã được định nghĩa
    jQuery(document).ready(function ($) {
        // Hàm kiểm tra và thực hiện các thao tác
        function checkAndExecute1() {
            // Lấy giá trị của thuộc tính data-value của thẻ <p> có class "report"
            var pValue = $('p.report').attr('value');

            // Nếu giá trị là 0, thực hiện các thao tác
            if (pValue === '1') {
                $('.alert1').addClass("show");
                $('.alert1').removeClass("hide");
                $('.alert1').addClass("showAlert");

                // Đặt thời gian để ẩn alert sau 5 giây
                setTimeout(function () {
                    $('.alert1').removeClass("show");
                    $('.alert1').addClass("hide");
                }, 5000);

                // Đổi giá trị của thuộc tính value thành 1
                $('p.report').attr('value', '2');
            }

        }

        // Gọi hàm khi trang được tải
        checkAndExecute1();

        $('.close-btn').click(function () {
            $('.alert1').removeClass("show");
            $('.alert1').addClass("hide");

            // Reset giá trị của thuộc tính value khi đóng alert
            $('p.report').attr('value', '2');
        });
    });
</script>


<%session.removeAttribute("report");%>

<!-- Thẻ <p> với giá trị mặc định là 1 -->
<p value="1"></p>

</script>
<%@include file="layout/footer.jsp" %>







