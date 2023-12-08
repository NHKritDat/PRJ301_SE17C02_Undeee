<%-- 
    Document   : viewProductsForCustomerJsp
    Created on : Nov 22, 2023, 12:41:51 PM
    Author     : Admin
--%>


<%@page import="fpt.fu.prj301_se17c02_undeee.models.Paging"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.services.ProductsServices"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.SizeProducts"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%  Paging paging = (Paging) request.getAttribute("paging");
    String search = (String) request.getAttribute("search");
    String category = request.getParameter("category");

    if (search == null) {
        search = "";
    }
    int category_id = 0;
    if (category != null && !category.equals("")) {
        category_id = Integer.parseInt(category);
    } else {
        category = "";
    }

    ProductsServices ps = new ProductsServices();
    List<Products> ProductList = paging.getP();
    List<Categories> CategoryList = (List<Categories>) request.getAttribute("CategoryList");
    double numPage = Math.ceil((double) paging.getTotal() / (double) paging.getPerPage());
    String pageInstant = request.getParameter("page");
    int numPageInstant = 1;
    if (pageInstant != null) {
        numPageInstant = Integer.parseInt(pageInstant);
    }
%>
<div class="colorlib-about">
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-3">
                <form role="search" class="d-flex" action="./customer-product" method="get" aria-label="Search">
                    <input class="form-control" type="search" placeholder="Search" name="search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
            <div class="col-md-2">
                <form action="./customer-product" method="get">
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
                <img src="views/products/<%= p.getImage()%>" class="card-img-top" alt="<%= p.getName()%>" style="width: 100%; height: 250px">
                <div class="card-body">
                    <h6 class="card-title"><%= p.getName()%></h6>
                    <p class="card-text">Giá gốc: <%= p.getPrice()%></p>
                </div>
                <div class="card-footer">
                    <form method="post" action="./AddToCartController" style="display: flex">
                        <select name="size_id" class="form-control">
                            <%
                                for (SizeProducts sp : l) {
                            %>
                            <option value="<%= sp.getSize_id()%>"><%= sp.getSize_name()%></option>
                            <%
                                }
                            %>
                        </select>
                        <input type="number" name="quantity" placeholder="0" required="" min="0" max="99" class="form-control" style="width: 50%">
                        <button type="submit" class="btn btn-outline-success" value="<%= p.getId()%>" name="product_id">+</button>
                    </form>
                </div>
            </div>
        </div>
        <%  }
        %>
    </div>

        <div class="row">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="<%if (numPageInstant > 1) {%>./customer-product?page=<%= numPageInstant - 1%>&search=<%= search%>&category=<%= category%><%}%>" tabindex="-1">Previous</a>
                    </li>
                    <% for (int i = 0; i < numPage; i++) {%>
                    <li class="page-item">
                        <a class="page-link" href="./customer-product?page=<%= i + 1%>&search=<%= search%>&category=<%= category%>"><%= i + 1%></a>
                    </li>
                    <%}%>
                    <li class="page-item">
                        <a class="page-link" href="<%if (numPageInstant < numPage) {%>./customer-product?page=<%= numPageInstant + 1%>&search=<%= search%>&category=<%= category%><%}%>">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%@include file="layout/footer.jsp" %>