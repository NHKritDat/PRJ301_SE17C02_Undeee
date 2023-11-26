<%-- 
    Document   : viewProductsForCustomerJsp
    Created on : Nov 22, 2023, 12:41:51 PM
    Author     : Admin
--%>


<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.services.ProductsServices"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.SizeProducts"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%  ProductsServices ps = new ProductsServices();
    List<Products> ProductList = (List<Products>) request.getAttribute("ProductList");
    List<Categories> CategoryList = (List<Categories>) request.getAttribute("CategoryList");
    String category = request.getParameter("category");
    int category_id = 0;
    if (category != null) {
        category_id = Integer.parseInt(category);
    }
%>
<div class="container mt-3">
    <div class="row mb-3">
        <div class="col-md-3">
            <form role="search" class="d-flex" action="AddToCartController" method="get" aria-label="Search">
                <input class="form-control" type="search" placeholder="Search" name="search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <div class="col-md-2">
            <form action="./AddToCartController" method="get">
                <select class="form-control" id="categories" name="category" onchange="this.form.submit()">
                    <option hidden="">Categories</option>
                    <%  for (Categories categories : CategoryList) {
                    %>
                    <option value="<%= categories.getCategory_id()%>" <%if (category_id == categories.getCategory_id()) {%>selected=""<%}%>><%= categories.getName()%></option>
                    <%
                        }
                    %>
                </select>
            </form>
        </div>
    </div>
    <div class="row">
        <%
            for (Products p : ProductList) {
                List<SizeProducts> l = ps.getSizeProductById(p.getId());
        %>
        <div class="col-md-3 mb-3">
            <div class="card">
                <img src="views/Drinks/<%= p.getImage()%>" class="card-img-top" alt="<%= p.getName()%>" style="width: 100%; height: 250px">
                <div class="card-body">
                    <h5 class="card-title"><%= p.getName()%></h5>
                    <p class="card-text">Giá: <%= p.getPrice()%></p>
                </div>
                <div class="card-footer">
                    <form method="post" action="./AddToCartController">
                        <select name="size_id" class="form-control">
                            <%
                                for (SizeProducts sp : l) {
                            %>
                            <option value="<%= sp.getSize_id()%>"><%= sp.getSize_name()%></option>
                            <%
                                }
                            %>
                        </select>
                        <input type="number" name="quantity" placeholder="0" required="" class="form-control">
                        <button type="submit" class="btn btn-success" value="<%= p.getId()%>" name="product_id">Add to cart</button>
                    </form>
                </div>
            </div>
        </div>
        <%  }
        %>
        <div class="overlay" id="overlay" onclick="closePopup()"></div>
        <div class="popup col-md-3" id="popup">
            <div class="card">
                
            </div>
        </div>
    </div>
</div>
<%@include file="layout/footer.jsp" %>
