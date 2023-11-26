<%-- 
    Document   : AdminPage
    Created on : Nov 18, 2023, 8:10:43 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp" %>
<h1>Admin Page</h1>
<h1>Hi, <%= u.getFullname()%></h1>
<form action="view-orders">
    <input type="submit" value="View Order">
</form>
<%@include file="../layout/footer.jsp" %>
