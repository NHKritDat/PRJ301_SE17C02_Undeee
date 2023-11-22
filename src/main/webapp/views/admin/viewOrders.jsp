<%-- 
    Document   : viewOrder
    Created on : Nov 19, 2023, 2:11:22 PM
    Author     : dell
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<OrderDto> orders = (List<OrderDto>) request.getAttribute("orders");
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Undeee</title>
    </head>
    <body>
        <a href="view-orders"><h1>View Orders</h1></a>
        <h2>Order Lists</h2>
        <form action="view-orders">
            <input type="text" name="search" placeholder="Search order status">
            <div>
                <button type="submit">Search</button>
            </div>
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (OrderDto orderDto : orders) {%>
                <tr>
                    <td><%= orderDto.getOrder().getId()%></td>
                    <td><%= orderDto.getUser().getFullname()%></td>
                    <td><%= orderDto.getOrder().getTotal_price()%></td>
                    <td><%= orderDto.getOrder().getStatus()%></td>
                    <td><%= orderDto.getOrder().getCreated_at()%></td>
                    <td>
                        <form action="update-orders">
                            <input type="hidden" name="id" value="<%= orderDto.getOrder().getId()%>">
                            <input type="submit" value="Update">
                        </form>
                        <form action="delete-orders" method="POST" onsubmit="return confirm('Are you sure you want to delete this order?');">
                            <input type="hidden" name="id" value="<%= orderDto.getOrder().getId()%>">
                            <input type="submit" value="Delete">
                        </form>
                        <form action="view-orderDetails">
                            <input type="hidden" name="id" value="<%= orderDto.getOrder().getId()%>">
                            <input type="submit" value="View OrderDetails">
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html>
