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
<div class="container mt-5 padding-top-100">
    <h1 class="mb-4">Update OrderDetails</h1>
    <form action="update-orderDetails" method="POST">

        <input type="hidden" name="id" value="<%= order.getOrder().getId()%>">

        <div class="mb-3 card">
            <div class="card-body">
                <h5 class="card-title">Order ID: <%= order.getOrder().getId()%></h5>
                <p class="card-text">Customer Name: <%= order.getUser().getFullname()%></p>
                <p class="card-text">Address: <%= order.getAddress().getAddress_detail()%></p>
                <% Date created_at = order.getOrder().getCreated_at();
                    String formattedDate = dateFormat.format(created_at);
                %>
                <p class="card-text">Created at: <%= formattedDate%></p>
                <p class="card-text">Status:
                    <select name="status">
                        <option value="Success" <%= order.getOrder().getStatus().equals("Success") ? "selected" : ""%>>Success</option>
                        <option value="Pending" <%= order.getOrder().getStatus().equals("Pending") ? "selected" : ""%>>Pending</option>
                    </select>
                </p>
            </div>
        </div>
        <div class="card mb-3">
            <div class="card-body">
                <label>Order Details:</label>
                <br>
                <%
                    for (OrderDto orderDetail : orderDetailList) {
                %>            
                <input type="hidden" name="AllOrderDetailsId" value="<%= orderDetail.getOrderDetail().getOrder_detail_id()%>">
                <%
                    String categoryKey = String.valueOf(orderDetail.getCategory().getCategory_id());
                %>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label>Category:</label>
                        <select name="category_<%= orderDetail.getOrderDetail().getOrder_detail_id()%>" id="category_<%= orderDetail.getOrderDetail().getOrder_detail_id()%>" onchange="updateProductList(<%= orderDetail.getOrderDetail().getOrder_detail_id()%>)">
                            <%
                                List<Categories> categoriesList = categoryMap.get(categoryKey);
                                if (categoriesList != null) {
                                    for (Categories category : categoriesList) {
                            %>
                            <option value="<%= category.getCategory_id()%>" <%= category.getCategory_id() == orderDetail.getCategory().getCategory_id() ? "selected" : ""%>>
                                <%= category.getName()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Product:</label>
                        <select name="product_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" id="product_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>">
                            <%
                                List<Products> productsList = productMap.get(categoryKey);
                                if (productsList != null) {
                                    for (Products product : productsList) {
                            %>
                            <option value="<%= product.getId()%>" <%=product.getId() == orderDetail.getProduct().getId() ? "selected" : ""%>>
                                <%= product.getName()%>  
                            </option>   
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label>Size:</label>
                        <select name="size_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" id="size_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>">
                            <%
                                List<Sizes> sizesList = sizeMap.get(categoryKey);
                                if (sizesList != null) {
                                    for (Sizes size : sizesList) {
                            %>
                            <option value="<%= size.getId()%>" <%=size.getId() == orderDetail.getSize().getId() ? "selected" : ""%>>
                                <%= size.getName()%>  
                            </option> 
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label>Quantity:</label>
                        <input type="number" min="1" name="quantity_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" id="quantity_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" value="<%=orderDetail.getOrderDetail().getQuantity()%>">       
                    </div>
                </div>
                <% }%>
            </div>
        </div>   
        <div class="mb-3 mt-3 text-center">
            <input type="submit" class="btn btn-primary" value="Update Order">
        </div>
    </form>
</div>
<%@include file="../layout/footer.jsp" %>