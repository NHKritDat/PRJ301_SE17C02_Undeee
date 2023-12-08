<%-- 
    Document   : updateUser.jsp
    Created on : Nov 18, 2023, 3:30:30 PM
    Author     : Hp
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.UpdateUsersError"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.RegisterError"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Users"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%    UpdateUsersError errors = (UpdateUsersError) request.getAttribute("UPDATE_ERROR");
%>
<div class="container padding-top-100">
    <h1 class="mytop">Update <%= u.getFullname()%>'s profile </h1>
    <div class="image-container">
        <div style="align-items: center">
            <img src="views/users_avatar/<%= u.getAvatar()%>" style="width: 200px ; margin-bottom: 20px" alt="..." class="rounded-circle">
        </div>
    </div>
    <div class="row">
        <form action="./updateUser" method="POST" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="imageInput" class="form-label">Change Image</label>
                <input class="form-control" type="file" id="imageInput" name="image"/>
            </div>

            <div class="mb-3">
                <label for="fullname" class="form-label">Full Name</label>
                <input type="text" value="<%= u.getFullname()%>" name="fullname" class="form-control" placeholder="Enter new fullname">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">New Password</label>
                <input type="password" class="form-control" value="<%= u.getPassword()%>" name="password" placeholder="Enter new password"/>
                <%
                    if (errors != null && errors.getUpdatePasswordError() != null) {
                %>
                <font style="color:red">
                <%= errors.getUpdatePasswordError()%>
                </font><br>
                <%
                    }
                %>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input class="form-control" value="<%= u.getPhone()%>" name="phone" placeholder="Enter new phone number"/><br>
                <%
                    if (errors != null && errors.getUpdatePhoneError() != null) {
                %>
                <font style="color:red">
                <%= errors.getUpdatePhoneError()%>
                </font><br>
                <%
                    }
                %>
            </div>

            <button type="submit" class="btn btn-outline-info mb-3">Update</button>
        </form>
    </div>
</div>
<%@include file="layout/footer.jsp" %>
