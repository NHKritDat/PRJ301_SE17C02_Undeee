<%-- 
    Document   : viewProducts
    Created on : Nov 20, 2023, 4:34:05 PM
    Author     : Phong
--%>

<%@page import="java.util.List"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Products</title>
    </head>
    <body>
        <div>
            <%
                List<Products> list = (List<Products>) request.getAttribute("PRODUCTS");

            %>
            <table border="1">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Category ID</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Created At</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Products p : list) {
                    %> 
                    <tr>
                        <td>
                            <%= p.getId()%>
                        </td>
                        <td>
                            <%= p.getName()%>
                        </td>
                        <td>
                            <%= p.getCategory_id()%>
                        <td>
                            <%= p.getImage()%>
                        </td>
                        <td>
                            <%= p.getPrice()%>
                        </td>
                        <td>
                            <%= p.getStatus()%>
                        </td>
                        <td>
                            <%= p.getCreate_at()%>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
