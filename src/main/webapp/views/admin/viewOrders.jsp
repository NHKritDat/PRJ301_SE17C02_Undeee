<%-- 
    Document   : viewOrder
    Created on : Nov 19, 2023, 2:11:22 PM
    Author     : dell
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.Paging"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //List<OrderDto> orders = (List<OrderDto>) request.getAttribute("orders");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    int no = 0;
    Paging paging = (Paging) request.getAttribute("paging");
    String search = (String) request.getAttribute("search");
    String searchBy = (String) request.getAttribute("searchBy");

    List<OrderDto> orders = paging.getO();
    double numPage = Math.ceil((double) paging.getTotal() / (double) paging.getPerPage());
    String pageInstant = (String) request.getAttribute("page");
    int numPageInstant = 1;
    if (pageInstant != null) {
        numPageInstant = Integer.parseInt(pageInstant);
    }
%>    
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

<%@include file="../layout/header.jsp" %>
<div class="container padding-top-100">
    <div class="row"> 
        <a href="view-orders"><h1>View Orders</h1></a>
        <h2>Order Lists</h2>
        <form action="view-orders" class="row">
            <div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
                <select name="searchBy" id="searchBy" class="form-control custom-select" onchange="changeSearchBy()">
                    <option value="createdAt">Created At</option>
                    <option value="status">Status</option>
                    <option value="customerName">Customer Name</option>
                </select>
            </div>
            <div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-5">
                <input type="date" name="search" class="form-control" id="searchInput" placeholder="">
            </div>
            <div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
                <button class="btn btn-primary btn-block" type="submit">Search</button>
            </div>
        </form>
    </div>
    <br>
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
            <tbody>
                <% for (OrderDto orderDto : orders) {
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
        <%--
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item <%= (currentPage == 1) ? "disabled" : ""%>">
                <a class="page-link" href="./view-orders?page=<%= currentPage - 1%>&search=<%= search%>&searchBy=<%= searchBy%>">
                    Previous
                </a>
            </li>
            <% for (int i = 1; i <= totalPages; i++) {%>
            <li class="page-item <%= (i == currentPage) ? "active" : ""%>">
                <a class="page-link" href="./view-orders?page=<%= i%>&search=<%= search%>&searchBy=<%= searchBy%>">
                    <%= i%>
                </a>
            </li>
            <% }%>
            <li class="page-item <%= (currentPage == totalPages) ? "disabled" : ""%>">
                <a class="page-link" href="./view-orders?page=<%= currentPage + 1%>&search=<%= search%>&searchBy=<%= searchBy%>">
                    Next
                </a>
            </li>
        </ul>
    </nav>
        --%>
        <div class="row">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="<%if (numPageInstant > 1) {%>./view-orders?page=<%= numPageInstant - 1%>&search=<%= search%>&searchBy=<%= searchBy%><%}%>" tabindex="-1">Previous</a>
                    </li>
                    <% for (int i = 0; i < numPage; i++) {%>
                    <li class="page-item">
                        <a class="page-link" href="./view-orders?page=<%= i + 1%>&search=<%= search%>&searchBy=<%= searchBy%>"><%= i + 1%></a>
                    </li>
                    <%}%>
                    <li class="page-item">
                        <a class="page-link" href="<%if (numPageInstant < numPage) {%>./view-orders?page=<%= numPageInstant + 1%>&search=<%= search%>&searchBy=<%= searchBy%><%}%>">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
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

//                            window.onpageshow = function (event) {
//                                if (event.persisted) {
//                                    window.location.reload();
//                                }
//                            };
        </script>
    </div>
</div>
<%@include file="../layout/footer.jsp" %>
