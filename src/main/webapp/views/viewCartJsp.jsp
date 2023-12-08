<%-- 
    Document   : viewCartJsp
    Created on : Nov 19, 2023, 3:35:30 PM
    Author     : Admin
--%>

<%@include file="layout/header.jsp" %>
<%@page import="java.util.List"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.SizeProducts"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.services.ProductsServices"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Addresses"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.services.UsersServices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  session = request.getSession();
    UsersServices us = new UsersServices();
    List<Addresses> list = us.getAddresses(u.getId());
    ProductsServices ps = new ProductsServices();

    String check = "HAVE PRODUCTS";
    if (cart == null || cart.getSize() == 0) {
        check = "DON'T HAVE PRODUCTS";
    }
    int No = 0;
    double total_price = 0;
%>
<div class="container mt-3">
    <h2>Here is your cart!</h2>
    <% if (check.equals("DON'T HAVE PRODUCTS")) {%>
    <h5>There are no products in the cart yet!</h5>
    <%} else {%>
    <div class="row">
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
                    for (OrderDetails orderDetails : cart.getAll()) {
                        No++;
                        SizeProducts sp = ps.getSizeProductById(orderDetails.getProduct_id(), orderDetails.getSize_id());
                        List<SizeProducts> l = ps.getSizeProductById(orderDetails.getProduct_id());
                        String key = orderDetails.getProduct_id() + "_" + orderDetails.getSize_id();
                %>
                <tr>
                    <th scope="row"><%= No%></th>
                    <td><%= sp.getProduct_name()%></td>

                    <td><img src="./views/products/<%= sp.getImage()%>" width="100px" height="100px" alt="<%= sp.getImage()%>" class="img-thumbnail"/></td>

                    <td>
                        <form action="./EditCartController" method="post">
                            <select class="form-control" id="sizeSanPham" name="edit" onchange="this.form.submit()">
                                <%
                                    for (SizeProducts sizeProducts : l) {
                                        String newKey = sizeProducts.getProduct_id() + "_" + sizeProducts.getSize_id();
                                %>
                                <option value="size-<%= key%>-<%= newKey%>" <%if (key.equals(newKey)) {%>selected=""<%}%>><%= sizeProducts.getSize_name()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </form>
                    </td>
                    <td>
                        <form action="./EditCartController" method="post">
                            <button type="submit" class="btn btn-outline-warning" value="down-<%= key%>-<%= key%>" name="edit">-</button>
                            <%= orderDetails.getQuantity()%>
                            <button type="submit" class="btn btn-outline-success" value="up-<%= key%>-<%= key%>" name="edit">+</button>
                            <button type="submit" class="btn btn-outline-danger" value="remove-<%= key%>-<%= key%>" name="edit">Remove</button>
                        </form>
                    </td>
                    <td><%= Math.round(orderDetails.getQuantity() * sp.getPercent() * sp.getPrice() * Math.pow(10, 2)) / Math.pow(10, 2)%></td>
                </tr>
                <%
                        total_price += Math.round(orderDetails.getQuantity() * sp.getPercent() * sp.getPrice() * Math.pow(10, 2)) / Math.pow(10, 2);
                    }
                %>
            </tbody>
        </table>
    </div>
            
    <div class="row">
        <h2>Ordering information</h2>
        <form action="./CreateOrdersController" method="post" onsubmit="return validateForm()">
            <select class="form-control mb-3" id="diaChi" name="address" onchange="toggleAddressInput()">
                <option value="default" selected="" hidden="">Chọn địa chỉ</option>
                <%
                    for (Addresses a : list) {
                %>
                <option value="<%= a.getAddress_detail()%>"><%= a.getAddress_detail()%></option>
                <%
                    }
                %>
                <option value="other">Địa chỉ khác</option>
            </select>

            <div id="diaChiKhacDiv" class="form-group" style="display: none">
                <label for="diaChiKhac">Địa chỉ nhận hàng khác</label>
                <input type="text" class="form-control" id="diaChiKhac" placeholder="Nhập địa chỉ nhận hàng" name="otherAddress" required="" disabled="">
            </div>

            <div class="form-group">
                <label for="tongGia">Total price</label>
                <input type="text" class="form-control" id="tongGia" name="total_price" value="<%= Math.round(total_price * Math.pow(10, 2)) / Math.pow(10, 2)%>" readonly="">
            </div>
            <button type="submit" class="btn btn-outline-info">Submit order</button>
        </form>
    </div>
    <%}%>
</div>

<%@include file="layout/footer.jsp" %>
