<%-- 
    Document   : viewOrderDetails
    Created on : Nov 20, 2023, 2:44:17 PM
    Author     : dell
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<OrderDto> orderDetails = (List<OrderDto>) request.getAttribute("orderDetails");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Undeee</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="../layout/header.jsp" %>
        <div class="container">
            <h1>View Order-Details</h1>
            <div class="row">
                <table class="table table-striped-columns align-middle table-bordered">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Category</th>
                            <th>Product Name</th>
                            <th>Size</th>
                            <th>Quantity</th>
                            <th>Created At</th>
                            <th>Action</th>
                        </tr>

                    </thead>
                    <tbody class="table-group-divider">
                        <% for (OrderDto orderDetail : orderDetails) {
                                Date created_at = orderDetail.getOrderDetail().getCreated_at();
                                String formattedDate = dateFormat.format(created_at);
                        %>
                        <tr>
                            <td><%= orderDetail.getOrderDetail().getOrder_id()%></td>
                            <td><%= orderDetail.getCategory().getCategory_id()%></td>
                            <td><%= orderDetail.getProduct().getName()%></td>
                            <td><%= orderDetail.getSize().getName()%></td>
                            <td><%= orderDetail.getOrderDetail().getQuantity()%></td>
                            <td><%= formattedDate%></td>
                            <td>
                                <form action="delete-orderDetails" method="POST" onsubmit="return confirm('Are you sure you want to delete this orderDetail?');">
                                    <input type="hidden" name="id" value="<%= orderDetail.getOrderDetail().getOrder_id()%>">
                                    <input type="hidden" name="order_detail_id" value="<%= orderDetail.getOrderDetail().getOrder_detail_id()%>">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <form action="update-orders">
                    <%
                        for (OrderDto orderDetail : orderDetails) {
                    %>
                    <input type="hidden" name="order_id" value="<%= orderDetail.getOrderDetail().getOrder_id()%>">
                    <input type="hidden" name="all_categories" value="<%= orderDetail.getCategory().getCategory_id()%>">
                    <%
                        }
                    %>
                    <input type="submit" value="Update">
                </form>
            </div>
        </div>
        <%@include file="../layout/footer.jsp" %>
    </body>

    <script>
        window.onpageshow = function (event) {
            if (event.persisted) {
                window.location.reload();
            }
        };
    </script>
</html>




