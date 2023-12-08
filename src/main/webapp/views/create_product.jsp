<%-- 
    Document   : add
    Created on : Oct 23, 2023, 1:10:56 PM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="java.util.List"%>
<%
    String name = (String) session.getAttribute("name");
    int report = 2;
    if (session.getAttribute("report") != null) {
        report = (int) session.getAttribute("report");
    }
    String alert = (String) request.getAttribute("alert");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<style>
    body{
        background-color: #00c0ff24;
    }
    #h1{
        padding: 30px 2px 0px 113px;
        font-size: 34px;
    }
    .top37{
        margin-top: 37px;
    }

    .buttonA{
        background-color: #f8d569;
        border: solid #e2b907;
        color: white;
        font-size: 18px;
        font-weight: 600;
        padding: 10px;
        border-radius: 10px;
    }
    .inputA{
        border: solid white;
        border-radius: 14px;
        width: 112%;
        padding: 15px;
        margin-bottom: 20px;

    }
    .imgFile{
        padding: 40px;
        vertical-align: middle;
        border-style: none;
        width: 110%;
        background-color: white;
        margin-bottom: 120px
    }
    #hinhAnh{
        margin-bottom: 31px;
        padding: 20px;
        background-color: white;
    }
    #loaiSanPham, #status{
        appearance: auto;
        border: solid white;
        border-radius: 14px;
        width: 112%;
        height: 60px;
        /* padding: 26px; */
        margin-bottom: 40px;
    }
</style>


<h1 id="h1" >Add new product</h1>
<p class="report" value="<%=report%>"></p>
<div class=" alert hide ">
    <span class="fas fa-exclamation-circle"></span>
    <span class="msg">Warning: <%=alert%>!</span>
    <div class="close-btn">
        <span class="fas fa-times"></span>
    </div>
</div> 
<div class="container padding-top-60 mb-3">

    <form action="create" method="POST" enctype="multipart/form-data">

        <div class="row">

            <div style="text-align: center" class="form-group col-md-4">
                <input style="margin-top: 84px;" type="file" class="inputA top37" id="hinhAnh" name="image" >
                <div style="text-align: center;">
                    <img class="imgFile" src="https://th.bing.com/th/id/OIP.RgZdMqNzMgkH3o8rsku6BAAAAA?rs=1&pid=ImgDetMain" alt="" id="previewImage">
                </div>
              </div>

                <div style="width: 100px;"></div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input maxlength="24" style="margin-top: 84px;" type="text" class="inputA " id="tenSanPham" name="name" placeholder="Product Name" required="">
                    </div>
                    <div class="form-group">
                        <input type="text" class="inputA" id="giaSanPham" name="price" placeholder="Product Price" required="">
                    </div>

                    <div style="margin: 0 !important;" class="form-group">
                        <select class="form-control"  id="loaiSanPham" name="category">
                            <%                            List<Categories> categoryList = (List<Categories>) request.getAttribute("categoryList");
                                for (int i = 0; i < categoryList.size(); i++) {
                                    Categories category = categoryList.get(i);
                            %>
                            <option value="<%= category.getCategory_id()%>"><%= category.getName()%></option>
                            <%
                                }
                            %>     
                        </select>
                    </div>

                    <div class="form-group">
                        <select style="appearance:auto; "  name="status" class="form-control" id="status">
                            <option value="Active">Active</option>
                            <option value="Sold out">Sold out</option>

                        </select>
                    </div>

                    <div style="text-align: center" >
                        <button  type="submit" class="buttonA">Add new product</button>

                    </div>

                </div>
            </div>
    </form>
</div>



<!-- Đảm bảo bạn đã tải jQuery trước khi sử dụng -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<script>
// Sử dụng hàm jQuery() thay vì $ để đảm bảo $ đã được định nghĩa
    jQuery(document).ready(function ($)

    {
        // Hàm kiểm tra và thực hiện các thao tác
        function checkAndExecute() {
            // Lấy giá trị của thuộc tính data-value của thẻ <p> có class "report"
            var pValue = $('p.report').attr('value');
            // Nếu giá trị là 0, thực hiện các thao tác
            if (pValue === '0') {
                $('.alert').addClass("show");
                $('.alert').removeClass("hide");
                $('.alert').addClass("showAlert");
                // Đặt thời gian để ẩn alert sau 5 giây
                setTimeout(function () {
                    $('.alert').removeClass("show");
                    $('.alert').addClass("hide");
                }, 5000);
                // Đổi giá trị của thuộc tính value thành 1
                $('p.report').attr('value', '2');
            }

        }

        // Gọi hàm khi trang được tải
        checkAndExecute();
        $('.close-btn').click(function () {
            $('.alert').removeClass("show");
            $('.alert').addClass("hide");
            // Reset giá trị của thuộc tính value khi đóng alert
            $('p.report').attr('value', '2');
        });
    }

    );
</script>
<%session.removeAttribute("report");%>



<%@include file="layout/footer.jsp" %>
