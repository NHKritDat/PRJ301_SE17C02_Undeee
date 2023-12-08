<%-- 
    Document   : Login
    Created on : Nov 18, 2023, 3:48:25 PM
    Author     : dell
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>

<div class="container-fluid position-relative d-flex p-0">
    <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <a href="./login" class="" style="text-decoration: none">
                            <h3 class="text-primary" style="color: aqua !important;"><i class="fa fa-user-edit me-2" style="color: aqua"></i>Undeee</h3>
                        </a>
                        <h3>Sign In</h3>
                    </div>
                    <form action="login" method="POST">
                        <div class="form-floating mb-3">
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
                            <c:set var="error" value="${requestScope.LOGIN_ERROR}"/>
                            <input type="email" name="email" class="form-control" id="floatingInput" aria-describedby="emailHelp" placeholder="Enter email" value="<%=cuValue%>">
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password" value="<%= cpValue%>">
                            <label for="floatingPassword">Password</label>
                            <c:if test="${not empty error}">
                                <font style="color:red">
                                ${error}
                                </font>
                            </c:if>
                        </div>

                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="form-check">
                                <input type="checkbox" <%= crChecked%> name="RememberMe" value="ON" class="form-check-input" id="exampleCheck1" style="border-color: aqua; background-color: aqua;">
                                <label class="form-check-label" for="exampleCheck1">Remember me</label>
                            </div>
                            <a href="ForgotPasswordServlet" style="color: aqua;">Forgot Password</a>
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4" style="background-color: aqua; border-color: aqua;">Sign In</button>
                        <p class="text-center mb-0">Don't have an Account? <a href="./register" style="color: aqua;">Sign Up</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="layout/footer.jsp" %>