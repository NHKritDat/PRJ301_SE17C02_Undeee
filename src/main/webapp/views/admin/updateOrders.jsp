<%-- 
    Document   : updateOrders
    Created on : Nov 20, 2023, 11:05:52 AM
    Author     : dell
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.services.ProductsServices"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Sizes"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="java.util.List"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    OrderDto order = (OrderDto) request.getAttribute("order");
    List<OrderDto> orderDetailList = (List<OrderDto>) request.getAttribute("orderDetailList");
    Map<String, List<Categories>> categoryMap = (Map<String, List<Categories>>) request.getAttribute("categoryMap");
    Map<String, List<Products>> productMap = (Map<String, List<Products>>) request.getAttribute("productMap");
    Map<String, List<Sizes>> sizeMap = (Map<String, List<Sizes>>) request.getAttribute("sizeMap");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<%@include file="../layout/header.jsp" %>
<div class="colorlib-about">
    <div class="container">
        <!--<div class="container mt-5">-->
        <%-- Display Customer Information --%>
        <form action="update-orderDetails" method="post">
            <div class="card">
                <div class="card-header">
                    Customer Information
                </div>
                <div class="card-body">
                    <h5 class="card-title">Order ID: <%= order.getOrder().getId()%></h5>
                    <p class="card-text">Customer Name: <%= order.getUser().getFullname()%></p>
                    <p class="card-text">Address: <%= order.getAddress().getAddress_detail()%></p>
                    <% Date created_at = order.getOrder().getCreated_at();
                        String formattedDate = dateFormat.format(created_at);
                    %>
                    <p class="card-text">Created at: <%= formattedDate%></p>

                    <div class="row">
                        <div class="col-md-1">
                            <p class="card-text">Status:</p>
                        </div>
                        <div class="col-md-4">
                            <select name="status" class="form-control custom-select">
                                <option value="Success" <%= order.getOrder().getStatus().equals("Success") ? "selected" : ""%>>Success</option>
                                <option value="Pending" <%= order.getOrder().getStatus().equals("Pending") ? "selected" : ""%>>Pending</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Display Product List for Updating --%>
            <div class="card mt-3 mb-5">
                <div class="card-header">
                    Update Order-Details
                </div>
                <div class="card-body ">

                    <input type="hidden" name="id" value="<%= order.getOrder().getId()%>">
                    <%-- Iterate through the product list --%>
                    <table class="table table-hover mx-auto" style="width: fit-content;">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Category</th>
                                <th scope="col">Product</th>
                                <th scope="col">Size</th>
                                <th scope="col">Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int rowNumber = 1;
                                for (OrderDto orderDetail : orderDetailList) {
                                    String categoryKey = String.valueOf(orderDetail.getCategory().getCategory_id());
                            %>
                        <input type="hidden" name="AllOrderDetailsId" value="<%= orderDetail.getOrderDetail().getOrder_detail_id()%>">
                        <tr>
                            <th scope="row"><%= rowNumber++%></th>
                            <td>
                                <select name="category_<%= orderDetail.getOrderDetail().getOrder_detail_id()%>" id="category_<%= orderDetail.getOrderDetail().getOrder_detail_id()%>" onchange="updateProductList(<%= orderDetail.getOrderDetail().getOrder_detail_id()%>)">
                                    <% List<Categories> categoriesList = categoryMap.get(categoryKey);
                                        if (categoriesList != null) {
                                            for (Categories category : categoriesList) {
                                    %>
                                    <option value="<%= category.getCategory_id()%>" <%= category.getCategory_id() == orderDetail.getCategory().getCategory_id() ? "selected" : ""%>>
                                        <%= category.getName()%>
                                    </option>
                                    <% }
                                    }%>
                                </select>
                            </td>
                            <td>
                                <select name="product_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" id="product_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>">
                                    <% List<Products> productsList = productMap.get(categoryKey);
                                        if (productsList != null) {
                                            for (Products product : productsList) {
                                    %>
                                    <option value="<%= product.getId()%>" <%=product.getId() == orderDetail.getProduct().getId() ? "selected" : ""%>>
                                        <%= product.getName()%>  
                                    </option>   
                                    <% }
                                    }%>
                                </select>
                            </td>
                            <td>
                                <select name="size_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" id="size_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>">
                                    <% List<Sizes> sizesList = sizeMap.get(categoryKey);
                                        if (sizesList != null) {
                                            for (Sizes size : sizesList) {
                                    %>
                                    <option value="<%= size.getId()%>" <%=size.getId() == orderDetail.getSize().getId() ? "selected" : ""%>>
                                        <%= size.getName()%>  
                                    </option> 
                                    <% }
                                    }%>
                                </select>
                            </td>
                            <td>
                                <input type="number" min="1" name="quantity_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" id="quantity_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" value="<%=orderDetail.getOrderDetail().getQuantity()%>">
                            </td>
                        </tr>
                        <% }%>
                        </tbody>
                    </table>

                <div class="text-center">
                    <input type="submit" class="btn btn-outline-info" value="Update Order">
                </div>

                </div>
            </div>
        </form>
    </div>
</div>

<%@include file="../layout/footer.jsp" %>
