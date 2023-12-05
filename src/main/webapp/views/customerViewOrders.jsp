<%-- 
    Document   : customerViewOrders
    Created on : Dec 3, 2023, 7:29:35 PM
    Author     : dell
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%    List<OrderDto> orderList = (List) request.getAttribute("orderList");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<div class="container mt-5 padding-top-100">
    <h2>Order History</h2>

    <div class="row">
        <% for (OrderDto order : orderList) {
                Date created_at = order.getOrder().getCreated_at();
                String formattedDate = dateFormat.format(created_at);
        %>
        <div class="card mb-3">
            <div class="card-body">
                <button class="btn btn-link" onclick="showDetails('<%= order.getOrder().getId()%>')">Show Details</button>
                <div class="row">
                    <div class="col-md-3">
                        <img src="#%>" alt="Product Image" class="img-fluid">
                    </div>
                    <div class="col-md-9">
                        <h5 class="card-title">Order ID: <%= order.getOrder().getId()%></h5>
                        <p class="card-text">Total Price: <%= order.getOrder().getTotal_price()%></p>
                        <p class="card-text">Status: <%= order.getOrder().getStatus()%></p>
                        <p class="card-text">Created At: <%= formattedDate%></p>
                    </div>
                </div>
                <form id="detailsForm_<%= order.getOrder().getId()%>" style="display: none;">
                    <h4>Order Details</h4>
                    <p class="card-text">Address: <%= order.getAddress().getAddress_detail()%></p>
                    <%
                        for (OrderDto orderDetail : order.getOrderDetailList()) {
                    %>
                    <div class="row">
                        <div class="col-md-3">
                            <img src="./views/products/<%= orderDetail.getProduct().getImage()%>" alt="Product Image" class="img-fluid">
                        </div>
                        <div class="col-md-9">
                            <p class="card-text">Quantity: <%= orderDetail.getOrderDetail().getQuantity()%></p>
                            <p class="card-text">Size: <%= orderDetail.getSize().getName()%></p>
                        </div>
                    </div>
                    <% }%>

                    <button class="btn btn-link" onclick="hideDetails('<%= order.getOrder().getId()%>')">Hide Details</button>
                </form>
            </div>
        </div>
        <% }%>
    </div>
</div>
<%@include file="layout/footer.jsp" %>