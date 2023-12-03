<%-- 
    Document   : viewOrderHistory
    Created on : Dec 1, 2023, 9:02:25 AM
    Author     : dell
--%>
<%-- 
<%@include file="../layout/header.jsp" %>
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<OrderDto> orderList = (List) request.getAttribute("orderList");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    int no = 0;
%>


<div class="container">

    <h2>Order Lists</h2>


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

                </tr>
            </thead>

            <tbody>
                <% for (OrderDto orderDto : orderList) {
                        Date created_at = orderDto.getOrder().getCreated_at();
                        String formattedDate = dateFormat.format(created_at);
                        no++;
                %>

            <tbody class="table-group-divider">


                <tr>
                    <td><%= no%></td>
                    <td><%= orderDto.getOrder().getId()%></td>
                    <td><%= orderDto.getUser().getFullname()%></td>
                    <td><%= orderDto.getAddress().getAddress_detail()%></td>
                    <td><%= orderDto.getOrder().getTotal_price()%></td>
                    <td><%= orderDto.getOrder().getStatus()%></td>
                    <td><%= formattedDate%></td>

                </tr>
                <% }%>
            </tbody>
        </table>

    </div>
</div>
                <%--
<%@include file="../layout/footer.jsp" %>
                --%>

