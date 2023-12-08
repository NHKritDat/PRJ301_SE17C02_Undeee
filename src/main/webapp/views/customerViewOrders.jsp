<%-- 
    Document   : customerViewOrders
    Created on : Dec 3, 2023, 7:29:35 PM
    Author     : dell
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.SizeProducts"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.services.ProductsServices"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Paging"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%    Paging paging = (Paging) request.getAttribute("paging");
    List<OrderDto> orderList = paging.getO();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    double numPage = Math.ceil((double) paging.getTotal() / (double) paging.getPerPage());
    String pageInstant = request.getParameter("page");
    int numPageInstant = 1;
    if (pageInstant != null) {
        numPageInstant = Integer.parseInt(pageInstant);
    }
%>
<div class="colorlib-about">
  <div class="container">
    <h3>Order History</h3>
    <br>
    
    <div class="row">
        <div class="card mb-3">
        <% for (OrderDto order : orderList) {
                Date created_at = order.getOrder().getCreated_at();
                String formattedDate = dateFormat.format(created_at);
        %>           
            <div class="card-body">
                <div class="mb-2">
                    <button class="btn btn-outline-info" onclick="showDetails('<%= order.getOrder().getId()%>')">Show Details</button>
                </div>  

                    <div class="row">
                        <div class="col-md-3">
                            <img src="views/layout/logo.jpg" alt="Product Image" class="img-fluid" style="width: 150px;border-radius: 50%">
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
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Size</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int No = 0;
                                    for (OrderDto orderDetail : order.getOrderDetailList()) {
                                        No++;
                                %>
                                <tr>
                                    <th scope="row"><%= No%></th>
                                    <td><%= orderDetail.getProduct().getName()%></td>

                                    <td><img src="./views/products/<%= orderDetail.getProduct().getImage()%>" width="100px" height="100px" alt="<%= orderDetail.getProduct().getImage()%>" class="img-thumbnail"/></td>

                                    <td>
                                        <%= orderDetail.getSize().getName()%>
                                    </td>
                                    <td>
                                        <%= orderDetail.getOrderDetail().getQuantity()%>
                                    </td>
                                    <td><%= Math.round(orderDetail.getOrderDetail().getQuantity() * orderDetail.getSize().getPercent() * orderDetail.getProduct().getPrice() * Math.pow(10, 3)) / Math.pow(10, 3)%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <button class="btn btn-outline-info" onclick="hideDetails('<%= order.getOrder().getId()%>')">Hide Details</button>
                    </form>

                </div>
                <% }%>
            </div>

            <div class="row">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="<%if (numPageInstant > 1) {%>./order-history?page=<%= numPageInstant - 1%><%}%>" tabindex="-1">Previous</a>
                        </li>
                        <% for (int i = 0; i < numPage; i++) {%>
                        <li class="page-item">
                            <a class="page-link" href="./order-history?page=<%= i + 1%>"><%= i + 1%></a>
                        </li>
                        <%}%>
                        <li class="page-item">
                            <a class="page-link" href="<%if (numPageInstant < numPage) {%>./order-history?page=<%= numPageInstant + 1%><%}%>">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<%@include file="layout/footer.jsp" %>