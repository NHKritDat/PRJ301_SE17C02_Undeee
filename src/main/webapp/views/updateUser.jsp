<%-- 
    Document   : updateUser.jsp
    Created on : Nov 18, 2023, 3:30:30 PM
    Author     : Hp
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.Users"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<h1 class="mytop">Update <%= u.getFullname()%>'s profile </h1>
<a class="logout" href="logout">Logout</a>
<div class="container">
    <div class="image-container">

        <div style="align-items: center">
            <img  src="views/Admins/<%= u.getAvatar()%>" style="width: 200px ; margin-bottom: 20px" alt="..." class=" rounded-circle">

        </div>

        <label for="imageInput" class="form-label">Change Image </label>
        <input class="form-control" type="file" id="imageInput" name="imageNews" />
    </div>
    <div class="information">
        <form action="./updateUser?id=<%= u.getId()%>" method="POST" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="fullname" class="form-label">New Name</label>
                <input type="text" value="<%= u.getFullname()%>" name="fullname" class="form-control"  placeholder="Enter new fullname">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">New Password</label>
                <input class="form-control"  value="<%= u.getPassword()%>"  name="password"  placeholder="Enter new password"/>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">New Phone</label>
                <input class="form-control"  value="<%= u.getPhone()%>"  name="phone"  placeholder="Enter new phone number"/>
            </div>

            <button type="submit" class="btn btn-primary mb-3">Update</button>
        </form>
    </div>


</div>

<div style="align-items: center">
    <audio controls>
        <source src="views/music1/music.mp3" type="audio/mpeg">
    </audio></div>
</div>
<%@include file="layout/footer.jsp" %>