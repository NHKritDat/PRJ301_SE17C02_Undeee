<%@page import="fpt.fu.prj301_se17c02_undeee.services.UsersServices"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Users"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Orders"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    List<Orders> listOrder = (List<Orders>) request.getAttribute("listOrder");
    List<Users> listUsers = (List<Users>) request.getAttribute("listUsers");
    UsersServices us = new UsersServices();
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Undeee Admin Page </title>
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" href="./views/admin-views/assets/css/style.css">
    </head>

    <body>
        <!-- =============== Navigation ================ -->
        <div class="container">
            <div class="navigation">
                <ul>
                    <li>
                        <a href="admin-page">
                            <span class="icon">
                                <ion-icon name="logo-apple"></ion-icon>
                            </span>
                            <span class="title">UnDeee</span>
                        </a>
                    </li>

                    <li>
                        <a href="admin">
                            <span class="icon">
                                <ion-icon name="home-outline"></ion-icon>
                            </span>
                            <span class="title">Dashboard</span>
                        </a>
                    </li>

                    <li>
                        <a href="./updateUser">
                            <span class="icon">
                                <ion-icon name="settings-outline"></ion-icon>
                            </span>
                            <span class="title">Setting account</span>
                        </a>
                    </li>


                    <li>
                        <a href="logout">
                            <span class="icon">
                                <ion-icon name="log-out-outline"></ion-icon>
                            </span>
                            <span class="title">Sign Out</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- ========================= Main ==================== -->
            <div class="main">
                <div style="width: 94%" class="topbar">
                    <div class="toggle">
                        <ion-icon name="menu-outline"></ion-icon>
                    </div>



                    <div class="user">
                        <img src="views/users_avatar/hoang-nam-tien-fpt.png" alt="">
                    </div>
                </div>

                <!-- ======================= Cards ================== -->
                <div class="cardBox">
                    <div class="card">
                        <div>
                            <div class="numbers">${sessionScope.count}</div>
                            <div class="cardName">Daily Views</div>
                        </div>

                        <div class="iconBx">
                            <ion-icon name="eye-outline"></ion-icon>
                        </div>
                    </div>

                    <div class="card">
                        <div>
                            <div class="numbers">${requestScope.number_orders}</div>
                            <div class="cardName">orders</div>
                        </div>

                        <div class="iconBx">
                            <ion-icon name="cart-outline"></ion-icon>
                        </div>
                    </div>

                    <div class="card">
                        <div>
                            <div class="numbers">${requestScope.number_users}</div>
                            <div class="cardName">Users</div>
                        </div>

                        <div class="iconBx">
                            <ion-icon name="chatbubbles-outline"></ion-icon>
                        </div>
                    </div>

                    <div class="card">
                        <div>
                            <div class="numbers">$ ${requestScope.total_profits}</div>
                            <div class="cardName">Earning</div>
                        </div>

                        <div class="iconBx">
                            <ion-icon name="cash-outline"></ion-icon>
                        </div>
                    </div>
                </div>

                <!-- ================ Order Details List ================= -->
                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2>Recent Orders</h2>
                            <a href="view-orders" class="btn">View All</a>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <td>Name</td>
                                    <td>Price</td>
                                    <td>Payment</td>
                                    <td>Status</td>
                                </tr>
                            </thead>


                            <%
                                for (Orders o : listOrder) {
                                    String pay = null;
                                    String status = null;
                                    if (o.getStatus().equalsIgnoreCase("Success")) {
                                        pay = "Paid";
                                        status = "delivered";
                                    } else {
                                        pay = "Due";
                                        status = "pending";

                                    }
                                    String name = "Nguyen Thi Ngoc Han";
                                    for (Users user : listUsers) {
                                        if (o.getUser_id() == user.getId()) {
                                            name = user.getFullname();
                                        }
                                    }


                            %>
                            <tr>
                                <td><%=name%></td>
                                <td>$<%=o.getTotal_price()%></td>
                                <td><%=pay%></td>
                                <td><span class="status <%=status%>"><%=o.getStatus()%></span></td>
                            </tr>
                            <%    }
                            %>


                        </table>
                    </div>

                    <!-- ================= New Customers ================ -->
                    <div class="recentCustomers">
                        <div class="cardHeader">
                            <h2>Recent Customers</h2>
                        </div>

                        <table>
                            <%
                                for (Users user : listUsers) {


                            %>
                            <tr>
                                <td width="60px">
                                    <div class="imgBx"><img src="views/users_avatar/<%= user.getAvatar()%>" alt=""></div>
                                </td>
                                <td>
                                    <h4><%=user.getFullname()%> <br></h4>
                                </td>
                            </tr>
                            <%

                                }

                            %>


                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- =========== Scripts =========  -->
        <script src="./views/admin-views/assets/js/main.js"></script>

        <!-- ====== ionicons ======= -->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>

</html>