<%-- 
    Document   : viewCartJsp
    Created on : Nov 19, 2023, 3:35:30 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.SizeProducts"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.services.ProductsServices"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Addresses"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.services.UsersServices"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Users"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDetails"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%  session = request.getSession();
    Cart cart = (Cart) session.getAttribute("CART");
    UsersServices us = new UsersServices();
    Addresses ad = us.getFirstAddressByUserId(u.getId());
    ProductsServices ps = new ProductsServices();

    String check = "HAVE PRODUCTS";
    if (cart == null || cart.getSize() == 0) {
        check = "DON'T HAVE PRODUCTS";
    }
    int No = 0;
    double total_price = 0;
%>
<div class="container">
    <div class="row">
        <h2>Here is your cart!</h2>
        <% if (check.equals("DON'T HAVE PRODUCTS")) {%>
        <p>There are no products in the cart yet!</p>
        <%} else {%>
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
                        List<SizeProducts> list = ps.getSizeProductById(orderDetails.getProduct_id());
                        String key = orderDetails.getProduct_id() + "_" + orderDetails.getSize_id();
                %>
                <tr>
                    <th scope="row"><%= No%></th>
                    <td><%= sp.getProduct_name()%></td>
                    <td><img src="./views/Drinks/<%= sp.getImage()%>" width="100px" height="100px" alt="<%= sp.getImage()%>" class="img-thumbnail"/></td>
                    <td>
                        <form action="./EditCartController" method="post">
                            <select class="form-control" id="sizeSanPham" name="edit" onchange="this.form.submit()">
                                <%
                                    for (SizeProducts sizeProducts : list) {
                                    String newKey = sizeProducts.getProduct_id() + "_" + sizeProducts.getSize_id();
                                %>
                                <option value="size-<%= key%>-<%= newKey%>" <%if(key.equals(newKey)){%>selected=""<%}%>><%= sizeProducts.getSize_name()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </form>
                    </td>
                    <td>
                        <form action="./EditCartController" method="post">
                            <button type="submit" class="btn btn-success" value="up-<%= key%>-<%= key%>" name="edit">+</button>
                            <%= orderDetails.getQuantity()%>
                            <button type="submit" class="btn btn-warning" value="down-<%= key%>-<%= key%>" name="edit">-</button>
                            <button type="submit" class="btn btn-danger" value="remove-<%= key%>-<%= key%>" name="edit">Remove</button>
                        </form>
                    </td>
                    <td><%= Math.round(orderDetails.getQuantity() * sp.getPercent() * sp.getPrice() * Math.pow(10, 3)) / Math.pow(10, 3)%></td>
                </tr>
                <%
                        total_price += Math.round(orderDetails.getQuantity() * sp.getPercent() * sp.getPrice() * Math.pow(10, 3)) / Math.pow(10, 3);
                    }
                %>
            </tbody>
        </table>
    </div>
    <div class="row">
        <h2>Ordering information</h2>
        <form action="./CreateOrdersController" method="post">
            <div class="form-control">
                <label for="diaChi">Địa chỉ nhận hàng</label>
                <input type="text" class="form-control" id="diaChi" placeholder="Nhập địa chỉ nhận hàng" name="address" value="<%= ad.getAddress_detail()%>">
            </div>
            <div class="form-control">
                <label for="tongGia">Total price</label>
                <input type="text" class="form-control" id="tongGia" name="total_price" value="<%= total_price%>" readonly="">
            </div>
            <button type="submit" class="btn btn-success">Submit order</button>
        </form>
    </div>
    <%}%>
</div>
<%@include file="layout/footer.jsp" %>
