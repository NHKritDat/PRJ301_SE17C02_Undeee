<%-- 
    Document   : Login
    Created on : Nov 18, 2023, 3:48:25 PM
    Author     : dell
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<div class="container padding-top-100">
    <h1>Login</h1>
    <form action="login" method="POST">
        <div class="form-group">
            <% Cookie[] cookies = request.getCookies();
                String cuValue = "";
                String cpValue = "";
                String crChecked = "";
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("cEmail".equals(cookie.getName())) {
                            cuValue = cookie.getValue();
                        } else if ("cPassword".equals(cookie.getName())) {
                            cpValue = cookie.getValue();
                        } else if ("cRemember".equals(cookie.getName())) {
                            crChecked = "checked";
                        }
                    }
                }
            %>
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"
                   value="<%=cuValue%>"/>
        </div>

        <label for="exampleInputPassword1">Password</label>
        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password"
               value="<%= cpValue%>"/>

        <div class="">
            Not a member? <a href="./register">Sign Up</a>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <input type="checkbox" <%= crChecked%> name="RememberMe" value="ON" />Remember me
    </form>

</div>
<%@include file="layout/footer.jsp" %>

