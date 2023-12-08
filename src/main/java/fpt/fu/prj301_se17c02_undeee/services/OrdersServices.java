/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Addresses;
import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.models.OrderDetails;
import fpt.fu.prj301_se17c02_undeee.models.OrderDto;
import fpt.fu.prj301_se17c02_undeee.models.Orders;
import fpt.fu.prj301_se17c02_undeee.models.Paging;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.models.Sizes;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrdersServices extends DBConnect {

    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private String sql = "";

    public int insertOrder(int user_id, int address_id, double total_price, String status) {
        int order_id = 0;
        sql = "insert into Orders (user_id, address_id, total_price, status) values (?, ?, ?, ?)";
        try {
            pst = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, user_id);
            pst.setInt(2, address_id);
            pst.setDouble(3, total_price);
            pst.setString(4, status);
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            while (rs.next()) {
                order_id = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return order_id;
    }

    public void insertOrderDetails(int order_id, int product_id, int size_id, int quantity) {
        sql = "insert into OrderDetails (order_id, product_id, size_id, quantity) values (?, ?, ?, ?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, order_id);
            pst.setInt(2, product_id);
            pst.setInt(3, size_id);
            pst.setInt(4, quantity);
            pst.execute();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Paging getOrders(String search, String searchBy, int page, int perPage) {
        Paging paging = new Paging();
        List<OrderDto> orders = new ArrayList<>();
        try {
            int limit = perPage;
            int offset = (page - 1) * perPage;

            sql = "SELECT o.id AS order_id, u.id AS user_id, a.id AS address_id, "
                    + "o.total_price, o.status, o.created_at AS order_created_at, "
                    + "u.email, u.password, u.fullname, u.phone, u.avatar, u.role, u.created_at AS user_created_at, "
                    + "a.address_detail, a.created_at AS address_created_at "
                    + "FROM Orders o "
                    + "JOIN Users u ON o.user_id = u.id "
                    + "JOIN Addresses a ON o.address_id = a.id ";

            String sqlCount = "SELECT COUNT(*) AS total FROM Orders o "
                    + "JOIN Users u ON o.user_id = u.id "
                    + "JOIN Addresses a ON o.address_id = a.id ";

            if (search != null && !search.isEmpty() && searchBy != null && !searchBy.isEmpty()) {              
                sql += " WHERE ";
                sqlCount += " WHERE ";
                switch (searchBy) {
                    case "status":
                        sql += "o.status LIKE '%" + search + "%'";
                        sqlCount += "o.status LIKE '%" + search + "%'";
                        break;
                    case "customerName":
                        sql += "u.fullname LIKE '%" + search + "%'";
                        sqlCount += "u.fullname LIKE '%" + search + "%'";
                        break;
                    case "createdAt":
                        sql += "o.created_at LIKE '%" + search + "%'";
                        sqlCount += "o.created_at LIKE '%" + search + "%'";
                        break;
                }
            }

            Statement st = connection.createStatement();
            sql += "ORDER BY order_id "
                    + " LIMIT " + limit
                    + " OFFSET " + offset;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                OrderDto orderDto = new OrderDto();

                Orders order = new Orders();
                order.setId(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setAddress_id(rs.getInt("address_id"));
                order.setTotal_price(rs.getDouble("total_price"));
                order.setStatus(rs.getString("status"));
                order.setCreated_at(rs.getTimestamp("order_created_at"));

                Users user = new Users();
                user.setId(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setAvatar(rs.getString("avatar"));
                user.setRole(rs.getInt("role"));
                user.setCreated_at(rs.getTimestamp("user_created_at"));

                Addresses address = new Addresses();
                address.setId(rs.getInt("address_id"));
                address.setUser_id(rs.getInt("user_id"));
                address.setAddress_detail(rs.getString("address_detail"));
                address.setCreated_at(rs.getTimestamp("address_created_at"));

                orderDto.setOrder(order);
                orderDto.setUser(user);
                orderDto.setAddress(address);
                orders.add(orderDto);
            }

            paging.setO(orders);
            paging.setPage(page);
            paging.setPerPage(perPage);

            ResultSet rsTotal = st.executeQuery(sqlCount);
            int total = 0;
            while (rsTotal.next()) {
                total += rsTotal.getInt(1);
            }
            paging.setTotal(total);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return paging;
    }

    public OrderDto getOrdersById(int id) { //
        OrderDto orderDto = null;
        try {
            sql = "SELECT o.id AS order_id, u.id AS user_id, a.id AS address_id, "
                    + "o.total_price, o.status, o.created_at AS order_created_at, "
                    + "u.email, u.password, u.fullname, u.phone, u.avatar, u.role, u.created_at AS user_created_at, "
                    + "a.address_detail, a.created_at AS address_created_at "
                    + "FROM Orders o "
                    + "JOIN Users u ON o.user_id = u.id "
                    + "JOIN Addresses a ON o.address_id = a.id "
                    + "WHERE o.id = " + id;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();

            if (rs.next()) {
                orderDto = new OrderDto();

                Orders order = new Orders();
                order.setId(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setAddress_id(rs.getInt("address_id"));
                order.setTotal_price(rs.getDouble("total_price"));
                order.setStatus(rs.getString("status"));
                order.setCreated_at(rs.getTimestamp("order_created_at"));

                Users user = new Users();
                user.setId(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setAvatar(rs.getString("avatar"));
                user.setRole(rs.getInt("role"));
                user.setCreated_at(rs.getTimestamp("user_created_at"));

                Addresses address = new Addresses();
                address.setId(rs.getInt("address_id"));
                address.setUser_id(rs.getInt("user_id"));
                address.setAddress_detail(rs.getString("address_detail"));
                address.setCreated_at(rs.getTimestamp("address_created_at"));

                orderDto.setOrder(order);
                orderDto.setUser(user);
                orderDto.setAddress(address);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderDto;
    }

    public Paging getOrdersByUserId(int user_id, int page, int perPage) { //
        Paging paging = new Paging();
        List<OrderDto> ordersList = new ArrayList<>();
        try {
            int limit = perPage;
            int offset = (page - 1) * perPage;

            sql = "SELECT o.id AS order_id, u.id AS user_id, a.id AS address_id, "
                    + "o.total_price, o.status, o.created_at AS order_created_at, "
                    + "u.email, u.password, u.fullname, u.phone, u.avatar, u.role, u.created_at AS user_created_at, "
                    + "a.address_detail, a.created_at AS address_created_at "
                    + "FROM Orders o "
                    + "JOIN Users u ON o.user_id = u.id "
                    + "JOIN Addresses a ON o.address_id = a.id "
                    + "WHERE u.id = " + user_id
                    + " ORDER BY o.id "
                    + "LIMIT " + limit + " OFFSET " + offset;

            String sqlCount = "SELECT COUNT(*) AS total FROM Orders o "
                    + "JOIN Users u ON o.user_id = u.id "
                    + "JOIN Addresses a ON o.address_id = a.id "
                    + "WHERE u.id = " + user_id;

            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {
                OrderDto orderDto = new OrderDto();

                Orders order = new Orders();
                order.setId(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setAddress_id(rs.getInt("address_id"));
                order.setTotal_price(rs.getDouble("total_price"));
                order.setStatus(rs.getString("status"));
                order.setCreated_at(rs.getTimestamp("order_created_at"));

                Users user = new Users();
                user.setId(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setAvatar(rs.getString("avatar"));
                user.setRole(rs.getInt("role"));
                user.setCreated_at(rs.getTimestamp("user_created_at"));

                Addresses address = new Addresses();
                address.setId(rs.getInt("address_id"));
                address.setUser_id(rs.getInt("user_id"));
                address.setAddress_detail(rs.getString("address_detail"));
                address.setCreated_at(rs.getTimestamp("address_created_at"));

                orderDto.setOrder(order);
                orderDto.setUser(user);
                orderDto.setAddress(address);
                ordersList.add(orderDto);
            }
            paging.setO(ordersList);
            paging.setPage(page);
            paging.setPerPage(perPage);

            PreparedStatement pstCount = connection.prepareStatement(sqlCount);
            ResultSet rsTotal = pstCount.executeQuery(sqlCount);

            int total = 0;
            while (rsTotal.next()) {
                total += rsTotal.getInt("total");
            }
            paging.setTotal(total);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return paging;
    }

    public List<OrderDto> getOrderDetailsByOrderId(int order_id) { //
        List<OrderDto> orderDetailsList = new ArrayList<>();

        sql = "SELECT o.id AS order_id, od.id AS order_detail_id, p.id AS product_id, s.id AS size_id, c.id AS category_id, "
                + "o.total_price, o.status, o.created_at AS order_created_at, "
                + "od.quantity, od.created_at AS order_detail_created_at, "
                + "p.name AS product_name, p.image, p.status, p.price, p.created_at AS product_created_at, "
                + "s.name AS size_name, s.percent, s.created_at AS size_created_at, "
                + "c.name AS category_name, c.created_at AS category_created_at "
                + "FROM Orders o "
                + "JOIN OrderDetails od ON o.id = od.order_id "
                + "JOIN Products p ON od.product_id = p.id "
                + "JOIN Sizes s ON od.size_id = s.id "
                + "JOIN Categories c ON p.category_id = c.id "
                + "WHERE o.id = ?";

        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, order_id);
            rs = pst.executeQuery();

            while (rs.next()) {
                OrderDto orderDetailsDto = new OrderDto();

                Orders order = new Orders();
                order.setId(rs.getInt("order_id"));
                order.setTotal_price(rs.getDouble("total_price"));
                order.setStatus(rs.getString("status"));
                order.setCreated_at(rs.getTimestamp("order_created_at"));

                OrderDetails orderDetail = new OrderDetails();
                orderDetail.setOrder_detail_id(rs.getInt("order_detail_id"));
                orderDetail.setOrder_id(rs.getInt("order_id"));
                orderDetail.setProduct_id(rs.getInt("product_id"));
                orderDetail.setSize_id(rs.getInt("size_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setCreated_at(rs.getTimestamp("order_detail_created_at"));

                Products product = new Products();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setCategory_id(rs.getInt("category_id"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setStatus(rs.getString("status"));
                product.setCreated_at(rs.getTimestamp("product_created_at"));

                Sizes size = new Sizes();
                size.setId(rs.getInt("size_id"));
                size.setCategory_id(rs.getInt("category_id"));
                size.setName(rs.getString("size_name"));
                size.setPercent(rs.getDouble("percent"));
                size.setCreated_at(rs.getTimestamp("size_created_at"));

                Categories category = new Categories();
                category.setCategory_id(rs.getInt("category_id"));
                category.setName(rs.getString("category_name"));
                category.setCreated_at(rs.getTimestamp("category_created_at"));

                orderDetailsDto.setOrder(order);
                orderDetailsDto.setOrderDetail(orderDetail);
                orderDetailsDto.setProduct(product);
                orderDetailsDto.setSize(size);
                orderDetailsDto.setCategory(category);
                orderDetailsList.add(orderDetailsDto);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderDetailsList;
    }

    public void updateOrders(String status, double total_price, int id) { //
        try {
            sql = "UPDATE Orders SET status=?, total_price=? WHERE id= " + id;
            pst = connection.prepareStatement(sql);
            pst.setString(1, status);
            pst.setDouble(2, total_price);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateTotalPrice(double total_price, int id) { //
        try {
            sql = "UPDATE Orders SET total_price=? WHERE id= " + id;
            pst = connection.prepareStatement(sql);
            pst.setDouble(1, total_price);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateOrderDetails(int product_id, int size_id, int quantity, int order_detail_id) { //
        try {
            sql = "UPDATE OrderDetails SET product_id=?, size_id=?, quantity=? WHERE id= " + order_detail_id;
            pst = connection.prepareStatement(sql);
            pst.setInt(1, product_id);
            pst.setInt(2, size_id);
            pst.setInt(3, quantity);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteOrders(int orderId) { //
        String deleteOrderDetailsSql = "DELETE FROM OrderDetails WHERE order_id = ?";
        String deleteOrderSql = "DELETE FROM Orders WHERE id = ?";
        try {
            connection.setAutoCommit(false);
            // Xóa từ bảng OrderDetails trước
            try (PreparedStatement preparedStatementOrderDetails = connection.prepareStatement(deleteOrderDetailsSql)) {
                preparedStatementOrderDetails.setInt(1, orderId);
                preparedStatementOrderDetails.executeUpdate();
            }
            // Sau đó xóa từ bảng Orders
            try (PreparedStatement preparedStatementOrders = connection.prepareStatement(deleteOrderSql)) {
                preparedStatementOrders.setInt(1, orderId);
                preparedStatementOrders.executeUpdate();
            }
            // Commit transaction
            connection.commit();
        } catch (SQLException e) {
            try {
                // Rollback nếu có lỗi
                connection.rollback();
            } catch (SQLException ex) {
                System.out.println(e.getMessage());
            }
            System.out.println(e.getMessage());
        } finally {
            try {
                // Set lại AutoCommit về true
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public void deleteOrderDetails(int id) { //
        sql = "DELETE FROM OrderDetails WHERE id = " + id;
        try {
            pst = connection.prepareStatement(sql);
            pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
