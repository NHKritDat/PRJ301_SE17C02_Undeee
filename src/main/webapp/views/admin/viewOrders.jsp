<%-- 
    Document   : viewOrder
    Created on : Nov 19, 2023, 2:11:22 PM
    Author     : dell
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<OrderDto> orders = (List<OrderDto>) request.getAttribute("orders");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    int no = 0;
%>    
<<<<<<< HEAD
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Undeee</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <%
            String updateSuccess = request.getParameter("updateSuccess");
            if ("true".equals(updateSuccess)) {
        %>
        <script>
            alert("Order update successful!");
        </script>
        <%
        } else if ("false".equals(updateSuccess)) {
        %>
        <script>
            alert("Order update failed!");
        </script>
        <%
            }
        %>
=======
<%@include file="../layout/header.jsp" %>
<div class="container">
    <div class="row">
>>>>>>> origin/mergeTest
        <a href="view-orders"><h1>View Orders</h1></a>
        <h2>Order Lists</h2>
        <form action="view-orders">
            <label for="searchBy">Search By:</label>
            <select name="searchBy" id="searchBy" onchange="changeSearchBy()">
                <option value="createdAt">Created At</option>
                <option value="status">Status</option>
                <option value="customerName">Customer Name</option>
            </select>
            <input type="date" name="search" id="searchInput" placeholder="">
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="row">
        <table class="table table-striped-columns align-middle table-bordered">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Address</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>
<<<<<<< HEAD
            <tbody>
                <% for (OrderDto orderDto : orders) {
                        Date created_at = orderDto.getOrder().getCreated_at();
                        String formattedDate = dateFormat.format(created_at);
                        no++;
                %>
=======
            <tbody class="table-group-divider">
                <% for (OrderDto orderDto : orders) {%>
>>>>>>> origin/mergeTest
                <tr>
                    <td><%= no%></td>
                    <td><%= orderDto.getOrder().getId()%></td>
                    <td><%= orderDto.getUser().getFullname()%></td>
                    <td><%= orderDto.getAddress().getAddress_detail()%></td>
                    <td><%= orderDto.getOrder().getTotal_price()%></td>
                    <td><%= orderDto.getOrder().getStatus()%></td>
                    <td><%= formattedDate%></td>
                    <td>
                        <form action="view-orderDetails">
                            <input type="hidden" name="id" value="<%= orderDto.getOrder().getId()%>">
                            <input type="submit" value="View OrderDetails">
                        </form>
                        <form action="delete-orders" onsubmit="return confirm('Are you sure you want to delete this order?');">
                            <input type="hidden" name="id" value="<%= orderDto.getOrder().getId()%>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
<<<<<<< HEAD
    </body>
</html>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
                            function changeSearchBy() {
                                var searchBy = document.getElementById("searchBy").value;
                                var searchInput = document.getElementById("searchInput");

                                if (searchBy === "status") {
                                    searchInput.type = "text";
                                    searchInput.placeholder = "Search order status";
                                } else if (searchBy === "customerName") {
                                    searchInput.type = "text";
                                    searchInput.placeholder = "Search customer name";
                                } else {
                                    searchInput.type = "date";
                                }
                            }

</script>
=======
    </div>
</div>
<%@include file="../layout/footer.jsp" %>
>>>>>>> origin/mergeTest
