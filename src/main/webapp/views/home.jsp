<%-- 
    Document   : view
    Created on : Oct 23, 2023, 10:10:10 AM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>

<%
    String name = (String) session.getAttribute("user-loged");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>

<div class="colorlib-about">
    <div class="container">
        <div class="row row-pb-lg">
            <div><img style="width: 100%" id="clubs" class="clubs" src="views/layout/Dong-gia-25k-slide-banner.png" alt=""></div>
        </div>

        <div class="colorlib-about">
            <div class="container">
                <div class="row row-pb-lg">
                    <div class="col-sm-6 mb-3">
                        <div class="video colorlib-video" style="background-image: url(./views/layout/Series-ly-1-lit-slide-banner.jpg);">
                            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/XsSOv0LIIYE" frameborder="0" allowfullscreen></iframe>
                            <div class="overlay"></div>                 
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="about-wrap">
                            <h2>Welcome to Coffee and MilkTea Undeee</h2>
                            <p>Our baristas are dedicated to crafting the perfect cup for you, using carefully selected beans from around the world. Whether you're a fan of a robust espresso, a velvety latte, or a refreshing iced coffee, Undee Café promises a delightful experience for your taste buds.</p>
                            <p>At Undee Café, we believe in creating not just a coffee break but a memorable experience. Join us as we redefine your coffee journey, one cup at a time.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="colorlib-about">
            <div class="container">
                <div class="text-center"><h1 style="color: #88c8bc; font-weight: 700;">Undeee menu</h1></div>
                <div class="text-center"><h2>Best Seller</h2></div>
                <div class="row mt-3">
                    <%                List<Products> productList = (List<Products>) request.getAttribute("list");
                        for (int i = 0; i < productList.size(); i++) {
                            Products product = productList.get(i);
                    %>
                    <div class="col-md-3 mb-3">
                        <div class="card">
                            <img src="views/products/<%= product.getImage()%>" class="card-img-top" alt="<%= product.getName()%>" style="width: 100%">
                            <div class="card-body">
                                <h6 class="card-title"><%= product.getName()%></h6>
                                <p class="card-text"><%= product.getPrice()%> $</p>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>         
                </div>
            </div>
        </div>        
    </div>

    <div class="row" style="justify-content: center">
        <a href="customer-product" class="btn btn-outline-info col-md-2">Order Now</a>
    </div>
</div>
<%@include file="layout/footer.jsp" %>









