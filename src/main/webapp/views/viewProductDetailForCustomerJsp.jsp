<%-- 
    Document   : viewProductsForCustomerJsp
    Created on : Nov 22, 2023, 12:41:51 PM
    Author     : Admin
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.services.ProductsServices"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.SizeProducts"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%  ProductsServices ps = new ProductsServices();
    List<Products> list = (List<Products>) request.getAttribute("list");
%>
<div class="container">
    <div class="row">
        <%
            for (Products p : list) {
                List<SizeProducts> l = ps.getSizeProductById(p.getId());
        %>
        <div class="col-md-4">
            <div class="card">
                <img src="views/Drinks/<%= p.getImage()%>" class="card-img-top" alt="Sản phẩm 1" style="width: 100%; height: 250px">
                <div class="card-body">
                    <h5 class="card-title"><%= p.getName()%></h5>
                    <p class="card-text"><%= p.getPrice()%></p>
                    <p class="card-text"><strong>Trạng thái: </strong><%= p.getStatus()%></p>
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
    </div>
</div>
<%@include file="layout/footer.jsp" %>
