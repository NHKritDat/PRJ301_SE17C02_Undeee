<%-- 
    Document   : home_navbar
    Created on : Nov 25, 2023, 7:55:06 PM
    Author     : Hp
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("user_loged");
  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: aqua">

            <a class="navbar-brand" href="./">
                <img src="views/layout/logo.jpg" alt="Logo" width="40" height="40" style="border-radius: 50px">
                Ún đeee
            </a>
      
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="view">Sản phẩm <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="create">Về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Đăng xuất</a>
                    </li>
                    <li>
                        <div style="margin: 0 !important;" class="form-group">
                            <select class="form-control" id="loaiSanPham" name="category">
                                <option value="0"%>">Categories</option>
                                <%
                                    List<Categories> categoryList = (List<Categories>) request.getAttribute("categoryList");
                                    for (int i = 0; i < categoryList.size(); i++) {
                                        Categories category = categoryList.get(i);
                                %>
                                <option value="<%= category.getCategory_id()%>"><%= category.getName()%></option>
                                <%
                                    }
                                %>     
                            </select>
                        </div>
                    </li>

                    <li>     
                        <div class="form-group">
                            <select name="status" class="form-control" id="status">
                                <option value="">STATUS</option>
                                <option value="Active">Active</option>
                                <option value="Sold out">Sold out</option>

                            </select>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="ml-auto">
                <span class="navbar-text">Xin chào, <strong id="userName"><%= name%></strong></span>
            </div>
        </nav>

