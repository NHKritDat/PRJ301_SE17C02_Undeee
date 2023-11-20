<%-- 
    Document   : AdminPage
    Created on : Nov 18, 2023, 8:10:43 PM
    Author     : dell
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Users userLogin = null;
    Object userLoginSession = session.getAttribute("user_loged");
    if (userLoginSession != null) {
        userLogin = (Users) userLoginSession;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admin Page</h1>
        <h1>Hi, <%= userLogin.getFullname()%></h1>
        <form action="view-orders">
            <input type="submit" value="View Order">
        </form>
    </body>
</html>
