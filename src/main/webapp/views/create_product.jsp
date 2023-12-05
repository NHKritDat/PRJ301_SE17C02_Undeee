<%-- 
    Document   : add
    Created on : Oct 23, 2023, 1:10:56 PM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="java.util.List"%>
<%
    String name = (String) session.getAttribute("name");
    String report = (String) request.getAttribute("report");
    if (report == null) {
        report = "...";
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<div class="container padding-top-100 mb-3">
    <h1>Tạo sản phẩm mới</h1>
    <form action="create" method="POST" enctype="multipart/form-data">
        <div class="form-group">
            <label for="tenSanPham">Product's name</label>
            <input type="text" class="form-control" id="tenSanPham" name="name" placeholder="Nhập tên sản phẩm">
        </div>
        <div class="form-group">
            <label for="moTa">Product's price</label>
            <input type="number" class="form-control" id="giaSanPham" name="price" placeholder="Nhập gia san pham">
        </div>

        <div style="margin: 0 !important;" class="form-group">
            <label for="loaiSanPham">Categories</label>
            <select class="form-control" id="loaiSanPham" name="category">
                <%                            List<Categories> categoryList = (List<Categories>) request.getAttribute("categoryList");
                    for (int i = 0; i < categoryList.size(); i++) {
                        Categories category = categoryList.get(i);
                %>
                <option value="<%= category.getCategory_id()%>"><%= category.getName()%></option>
                <%
                    }
                %>     
            </select>
        </div>

        <div class="form-group">
            <label for="hinhAnh">Hình ảnh sản phẩm</label>
            <input type="file" class="form-control-file" id="hinhAnh" name="image">
        </div>

        <div class="form-group">
            <label  for="status">STATUS</label>
            <select name="status" class="form-control" id="status">
                <option value="Active">Active</option>
                <option value="Sold out">Sold out</option>

            </select>
        </div>

        <button type="submit" class="btn btn-primary">Tạo sản phẩm</button>
    </form>
    <h1 >Trạng thái: <span style="color:red"> <%= report%></span></h1>
</div>
<%@include file="layout/footer.jsp" %>
