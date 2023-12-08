<%-- 
    Document   : register
    Created on : Nov 20, 2023, 2:41:28 PM
    Author     : Phong
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.RegisterError"%>

<%    RegisterError errors = (RegisterError) request.getAttribute("ERROR");
%>

<div class="container-fluid position-relative d-flex p-0 mb-5">
    <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-6" style="margin-top: 80px;">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <a href="./register" class="" style="text-decoration: none">
                            <h3 class="text-primary" style="color: aqua !important;"><i class="fa fa-user-edit me-2" style="color: aqua"></i>Undeee</h3>
                        </a>
                        <h3>Sign Up</h3>
                    </div>

                    <form action="register" method="POST">
                        <div class="form-floating mb-3">
                            <input type="email" name="txtEmail" value="" class="form-control" id="floatingInput" placeholder="Email">
                            <label for="floatingInput">Email address</label>
                            <%
                                if (errors != null && errors.getEmailError() != null) {
                            %>
                            <font style="color:red">
                            <%= errors.getEmailError()%>
                            </font><br>      
                            <%
                                }
                            %>
                            <%
                                if (errors != null && errors.getEmailUniqueError() != null) {
                            %>
                            <font style="color:red">
                            <%= errors.getEmailUniqueError()%>
                            </font><br>      
                            <%
                                }
                            %>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" name="txtFullName" value="" class="form-control" id="floatingText" placeholder="Full Name">
                            <label for="floatingText">Full Name</label>
                            <%
                                if (errors != null && errors.getFullnameError() != null) {
                            %>
                            <font style="color:red">
                            <%= errors.getFullnameError()%>
                            </font><br>
                            <%
                                }
                            %>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" name="txtPhone" value="" class="form-control" id="floatingPhone" placeholder="Phone">
                            <label for="floatingPhone">Phone</label>
                            <%
                                if (errors != null && errors.getPhoneError() != null) {
                            %>
                            <font style="color:red">
                            <%= errors.getPhoneError()%>
                            </font><br>
                            <%
                                }
                            %>
                        </div>

                        <div class="form-floating mb-4">
                            <input type="password" name="txtPassword" value="" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                            <%
                                if (errors != null && errors.getPasswordError() != null) {
                            %>
                            <font style="color:red">
                            <%= errors.getPasswordError()%>
                            </font><br>
                            <%
                                }
                            %>
                        </div>

                        <div class="form-floating mb-4">
                            <input type="password" name="txtConfirm" value="" class="form-control" id="floatingConfirm" placeholder="Confirm Password">
                            <label for="floatingConfirm">Confirm Password</label>
                            <%
                                if (errors != null && errors.getConfirmPasswordError() != null) {
                            %>
                            <font style="color:red">
                            <%= errors.getConfirmPasswordError()%>
                            </font><br>
                            <%
                                }
                            %>
                        </div>
                        <button type="submit" value="Register" name="Action" class="btn btn-primary py-3 w-100 mb-4" style="background-color: aqua; border-color: aqua;">Sign Up</button>
                        <p class="text-center mb-0">Already have an Account? <a href="./login" style="color: aqua;">Sign In</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<%@include file="layout/footer.jsp" %>

