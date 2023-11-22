/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.OrderDetails;
import fpt.fu.prj301_se17c02_undeee.models.Orders;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.models.Sizes;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell
 */
public class OrderServices {

    DBConnect db = new DBConnect();

    public List<OrderDto> getOrders(String search) {
        List<OrderDto> orders = new ArrayList<>();
        try {
            String sql = "select o.*, u.fullname from Orders o join Users u on o.user_id = u.id";
            if (search != null) {
                sql += " WHERE o.status like '%" + search + "%'";
            }
            PreparedStatement preparedStatement = db.connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                OrderDto orderDto = new OrderDto();

                Orders order = new Orders();
                order.setId(rs.getInt("id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setTotal_price(rs.getDouble("total_price"));
                order.setStatus(rs.getString("status"));
                order.setCreated_at(rs.getDate("created_at"));

                Users user = new Users();
                user.setFullname(rs.getString("fullname"));

                orderDto.setOrder(order);
                orderDto.setUser(user);
                orders.add(orderDto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public OrderDto getOrdersById(String id) {
        OrderDto orderDto = null;
        try {
            String sql = "SELECT o.*, u.fullname FROM Orders o JOIN Users u ON o.user_id = u.id WHERE o.id = " + id;
            PreparedStatement preparedStatement = db.connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                orderDto = new OrderDto();

                Orders order = new Orders();
                order.setId(rs.getInt("id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setTotal_price(rs.getDouble("total_price"));
                order.setStatus(rs.getString("status"));
                order.setCreated_at(rs.getDate("created_at"));

                Users user = new Users();
                user.setFullname(rs.getString("fullname"));

                orderDto.setOrder(order);
                orderDto.setUser(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDto;
    }

    public void updateOrders(Orders order) {
        try {
            String sql = "UPDATE Orders SET total_price=?, status=? WHERE id=?";
            PreparedStatement preparedStatement = db.connection.prepareStatement(sql);
            preparedStatement.setDouble(1, order.getTotal_price());
            preparedStatement.setString(2, order.getStatus());
            preparedStatement.setInt(3, order.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteOrders(int orderId) {
        String deleteOrderDetailsSql = "DELETE FROM OrderDetails WHERE order_id = ?";
        String deleteOrderSql = "DELETE FROM Orders WHERE id = ?";

        try {
            db.connection.setAutoCommit(false);

            // Xóa từ bảng OrderDetails trước
            try (PreparedStatement preparedStatementOrderDetails = db.connection.prepareStatement(deleteOrderDetailsSql)) {
                preparedStatementOrderDetails.setInt(1, orderId);
                preparedStatementOrderDetails.executeUpdate();
            }

            // Sau đó xóa từ bảng Orders
            try (PreparedStatement preparedStatementOrders = db.connection.prepareStatement(deleteOrderSql)) {
                preparedStatementOrders.setInt(1, orderId);
                preparedStatementOrders.executeUpdate();
            }

            // Commit transaction
            db.connection.commit();
        } catch (SQLException e) {
            try {
                // Rollback nếu có lỗi
                db.connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                // Set lại AutoCommit về true
                db.connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<OrderDetailDto> getOrderDetails(int orderId) {
        List<OrderDetailDto> orderDetailsList = new ArrayList<>();

        String sql = "SELECT od.order_id, od.product_id, od.size_id, p.name AS product_name, s.name AS size_name, od.quantity, od.created_at "
            + "FROM Orders o "
            + "JOIN OrderDetails od ON o.id = od.order_id "
            + "JOIN Products p ON od.product_id = p.id "
            + "JOIN Sizes s ON od.size_id = s.id "
            + "WHERE od.order_id = ?";

        try (PreparedStatement preparedStatement = db.connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, orderId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                OrderDetailDto orderDetailsDto = new OrderDetailDto();
                
                OrderDetails orderDetail = new OrderDetails();
                orderDetail.setOrder_id(rs.getInt("order_id"));
                orderDetail.setProduct_id(rs.getInt("product_id"));
                orderDetail.setSize_id(rs.getInt("size_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setCreated_at(rs.getDate("created_at"));
                
                Products product = new Products();
                product.setName(rs.getString("product_name"));
                
                Sizes size = new Sizes();
                size.setName(rs.getString("size_name"));
                
                orderDetailsDto.setOrderDetail(orderDetail);
                orderDetailsDto.setProduct(product);
                orderDetailsDto.setSize(size);
                orderDetailsList.add(orderDetailsDto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetailsList;
    }
}
