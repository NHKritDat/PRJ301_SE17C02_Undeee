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

    String search = (String) request.getAttribute("search");

    List<Products> newsList = newsPaging.getP();
    if (newsList == null) {
        return;
    }
    String category = (String) request.getAttribute("category");
    int category_id = 0;
    if (category != null && !category.equals("")) {
        category_id = Integer.parseInt(category);
    }

    List<Categories> categoryList = (List<Categories>) request.getAttribute("categoryList");
    double numberPage = Math.ceil((double) newsPaging.getTotal() / (double) newsPaging.getPerPage());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<div class="container mt-4 myflex">

    <h1 class="padding-top-100">Danh Sách Sản Phẩm</h1>

    <div class="row mb-3">
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
            <select name="status" class="form-control" id="status">
                <option value="">STATUS</option>
                <option value="Active">Active</option>
                <option value="Sold out">Sold out</option>

            </select>
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

<%@include file="layout/footer.jsp" %>







