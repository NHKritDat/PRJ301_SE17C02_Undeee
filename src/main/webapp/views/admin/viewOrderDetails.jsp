<%-- 
    Document   : viewOrderDetails
    Created on : Nov 20, 2023, 2:44:17 PM
    Author     : dell
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.services.OrderDetailDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<OrderDetailDto> orderDetails = (List<OrderDetailDto>) request.getAttribute("orderDetails");
%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>View Order-Details</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product Name</th>
                    <th>Size</th>
                    <th>Quantity</th>
                    <th>Created At</th>
                </tr>
            </thead>
            <tbody>
                <% for (OrderDetailDto orderDto : orderDetails) {%>
                <tr>
                    <td><%= orderDto.getOrderDetail().getOrder_id()%></td>
                    <td><%= orderDto.getProduct().getName()%></td>
                    <td><%= orderDto.getSize().getName()%></td>
                    <td><%= orderDto.getOrderDetail().getQuantity()%></td>
                    <td><%= orderDto.getOrderDetail().getCreated_at()%></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html>
