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
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDetailDto"%>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Undeee</title>
        <style>
                .footer-bottom{
                background-color: black;
                text-align: center;
                padding: 20px;
                margin-top: 30px;



                color: white;
                font-size: 16px;
                font-weight: 300;
            }
            .footer-main{
                display: flex;

                justify-content: space-between;
                padding : 0;

            }
            .content_2{
                margin-left: 35px;
            }
            .logo-footer>img{
                width: 150px ;
                height: 150px ;
                border-radius: 120px;
            }
            .logo-footer{
                align-items: center;
            }
    
</style>
    </head>
    <body>
        <%@include file="../layout/header.jsp" %>
        <div class="container mt-4">
            <h1 class="mb-4">Update OrderDetails</h1>
            <form action="update-orderDetails" method="POST">
                
                <input type="hidden" name="id" value="<%= order.getOrder().getId()%>">

                <div class="mb-3">
                    <label>Id:</label>
                    <input type="text" name="orderId" value="<%= order.getOrder().getId()%>" readonly><br>
                </div>

                <div class="mb-3">
                    <label>Customer Name:</label>
                    <input type="text" name="fullname" value="<%= order.getUser().getFullname()%>" readonly><br>
                </div>

                <div class="mb-3">
                    <label>Address:</label>
                    <input type="text" name="address" value="<%= order.getAddress().getAddress_detail()%>" readonly><br>
                </div>      

                <% Date created_at = order.getOrder().getCreated_at();
                    String formattedDate = dateFormat.format(created_at);
                %>
                <div class="mb-3">
                    <label>Created at:</label>
                    <input type="text" name="id" value="<%= formattedDate%>" readonly><br>
                </div>
                
                <div class="mb-3">
                    <label>Status:</label>
                    <select name="status">
                        <option value="success" <%= order.getOrder().getStatus().equals("success") ? "selected" : ""%>>Success</option>
                        <option value="pending" <%= order.getOrder().getStatus().equals("pending") ? "selected" : ""%>>Pending</option>
                    </select>
                </div>
                <hr>
                <%                    
                    for (OrderDto orderDetail : orderDetailList) {
                %>
                <label>Order Details:</label>
                <br>

                <input type="hidden" name="AllOrderDetailsId" value="<%= orderDetail.getOrderDetail().getOrder_detail_id()%>">
                <%
                    String categoryKey = String.valueOf(orderDetail.getCategory().getCategory_id());
                %>
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

                <label>Quantity:</label>
                <input type="number" min="1" name="quantity_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" id="quantity_<%=orderDetail.getOrderDetail().getOrder_detail_id()%>" value="<%=orderDetail.getOrderDetail().getQuantity()%>">       

                <%
                    }
                %>
                <br>

                <input type="submit" class="btn btn-primary" value="Update Order">
            </form>
        </div>
        <%@include file="../layout/footer.jsp" %>
    </body>
</html>
<script>
    function updateProductList(index) {
        console.log("Updating dropdown for index:", index);
        var category = document.getElementById("category_" + index).value;
        var productSelect = document.getElementById("product_" + index);
        var sizeSelect = document.getElementById("size_" + index);
        // Gửi yêu cầu AJAX đến Servlet để lấy danh sách sản phẩm theo Category
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Cập nhật danh sách sản phẩm trong select
                var response = JSON.parse(xhr.responseText);
                // Cập nhật danh sách sản phẩm
                updateSelectOptions1(productSelect, response.products);
                updateSelectOptions2(sizeSelect, response.sizes);
            }
        };
        xhr.open("POST", "update-orders", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("category=" + category);
    }

    function updateSelectOptions1(select, options) {
        // Xóa tất cả các options hiện tại
        select.innerHTML = "";
        // Thêm options mới từ danh sách sản phẩm
        for (var i = 0; i < options.length; i++) {
            var option = document.createElement("option");
            option.value = options[i].product_id;
            option.text = options[i].name;
            select.add(option);
        }
    }


    function updateSelectOptions2(select, options) {
        // Xóa tất cả các options hiện tại
        select.innerHTML = "";
        // Thêm options mới từ danh sách sản phẩm
        for (var i = 0; i < options.length; i++) {
            var option = document.createElement("option");
            option.value = options[i].size_id;
            option.text = options[i].name;
            select.add(option);
        }
    }

    // Trigger product and size loading for each category dropdown on page load
    document.addEventListener("DOMContentLoaded", function () {
        var categoryDropdowns = document.querySelectorAll("[id^='category_']");
        categoryDropdowns.forEach(function (dropdown) {
            console.log("Updating dropdown for:", dropdown.id);
            updateProductList(dropdown);

        });
    });
    window.onpageshow = function (event) {
        if (event.persisted) {
            window.location.reload();
        }
    };

</script>
