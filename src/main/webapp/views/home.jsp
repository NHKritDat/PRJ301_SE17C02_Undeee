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
<div> <img style="width: 100%" id="clubs" class="clubs" src="views/layout/Dong-gia-25k-slide-banner.png" alt=""></div>

<div class="container mt-6 mb-3">

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
        <%            List<Products> productList = (List<Products>) request.getAttribute("list");

            for (int i = 0; i < productList.size(); i++) {
                Products product = productList.get(i);
        %>
        <div class="col-md-3 mb-3">
            <div class="card">
                <img src="views/Drinks/<%= product.getImage()%>" class="card-img-top" alt="<%= product.getName()%>" style="width: 100%">
                <div class="card-body">
                    <h6 class="card-title"><%= product.getName()%></h6>
                    <p class="card-text"><%= product.getPrice()%> $</p>
                </div>
                <div class="card-footer">
                    <button class="order-button" "><a href="customer-product" class="btn" role="button">Order Now</a></button>
                </div>
            </div>
        </div>
        <%
            }
        %>         
    </div>
</div>
<%@include file="layout/footer.jsp" %>









