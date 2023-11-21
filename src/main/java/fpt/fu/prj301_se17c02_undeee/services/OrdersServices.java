/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
            pst = connection.prepareStatement(sql);
            pst.setInt(1, user_id);
            pst.setInt(2, address_id);
            pst.setDouble(3, total_price);
            pst.setString(4, status);
            pst.execute();
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
    
    
}
