<%-- 
    Document   : updateOrders
    Created on : Nov 20, 2023, 11:05:52 AM
    Author     : dell
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    OrderDto orderToUpdate = (OrderDto) request.getAttribute("orderToUpdate");
%>
<%@include file="../layout/header.jsp" %>
<div class="container">
    <h1>Update Orders</h1>
    <form action="update-orders" method="POST">
        <input type="hidden" name="id" value="<%= orderToUpdate.getOrder().getId()%>">

        <label>Id:</label>
        <input type="text" name="orderId" value="<%= orderToUpdate.getOrder().getId()%>" readonly><br>

        <label>Customer Name:</label>
        <input type="text" name="fullname" value="<%= orderToUpdate.getUser().getFullname()%>" readonly><br>

        <label>Total Price:</label>
        <input type="text" name="total_price" value="<%= orderToUpdate.getOrder().getTotal_price()%>"><br>

        <label for="status">Status:</label>
        <input type="text" id="status" name="status" value="<%= orderToUpdate.getOrder().getStatus()%>"><br>

        <label>Created at:</label>
        <input type="text" name="id" value="<%= orderToUpdate.getOrder().getCreated_at()%>" readonly><br>

        <input type="submit" value="Update Order">
    </form>
</div>
<%@include file="../layout/footer.jsp" %>
