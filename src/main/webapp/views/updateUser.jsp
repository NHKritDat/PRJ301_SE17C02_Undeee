<%-- 
    Document   : updateUser.jsp
    Created on : Nov 18, 2023, 3:30:30 PM
    Author     : Hp
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.Users"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User's profile  </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
        <style>
            .input {
                width: 50% !important;
            }
            .img{
                margin-top: 20px;
            }

            .mytop{
                margin-bottom: 80px
            }

            /* Thêm kiểu flex cho container */
            .container {
                display: flex;
                justify-content: space-between;
            }

            /* Thiết lập flex cho phần thông tin và phần hình ảnh */
            .information, .image-container {
                flex: 0 0 48%; /* Phần tỷ lệ chiều rộng của mỗi cột */
            }
            a.logout {
                /* Thiết lập kiểu chữ và màu sắc */
                text-decoration: none; /* Loại bỏ gạch chân dưới */
                color: #fff; /* Màu chữ trắng */
                font-weight: bold; /* Chữ đậm */
                padding: 8px 16px; /* Khoảng trắng nội dung bên trong thẻ */

                /* Thiết lập màu nền và kiểu nền */
                background-color: #007bff; /* Màu xanh dương */
                border-radius: 4px; /* Bo tròn góc */
                display: inline-block; /* Hiển thị như block nhưng không làm thay đổi cấu trúc của văn bản */

                /* Hiệu ứng hover khi di chuột qua */
                transition: background-color 0.3s ease;
            }

            a.logout:hover {
                background-color: #0056b3; /* Màu nền thay đổi khi di chuột qua */
            }

        </style>
    </head>
    <body>
        <%
            Users news = (Users) request.getAttribute("user");
        %>
        <h1 class="mytop">Update <%= news.getFullname()%>'s profile </h1>
        <a class="logout" href="logout">Logout</a>
        <div class="container">
            <div class="image-container">

                <div style="align-items: center">
                    <img  src="views/Admins/<%= news.getAvatar()%>" style="width: 200px ; margin-bottom: 20px" alt="..." class=" rounded-circle">

                </div>

                <label for="imageInput" class="form-label">Change Image </label>
                <input class="form-control" type="file" id="imageInput" name="imageNews" />
            </div>
            <div class="information">
                <form action="./updateUser?id=<%= news.getId()%>" method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="fullname" class="form-label">New Name</label>
                        <input type="text" value="<%= news.getFullname()%>" name="fullname" class="form-control"  placeholder="Enter new fullname">
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">New Password</label>
                        <input class="form-control"  value="<%= news.getPassword()%>"  name="password"  placeholder="Enter new password"/>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">New Phone</label>
                        <input class="form-control"  value="<%= news.getPhone()%>"  name="phone"  placeholder="Enter new phone number"/>
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

</body>
</html>