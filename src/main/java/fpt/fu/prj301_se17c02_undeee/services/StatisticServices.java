/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Orders;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hp
 */
public class StatisticServices extends DBConnect {

    private PreparedStatement pst = null;
    private ResultSet res = null;
    private String sql = "";

    
        public int countViewsHome() {
        int count = 0;
        String query = "select * from views_home order by views desc Limit 1;";
        try {
            pst = connection.prepareStatement(query);
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                count = res.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return count;
    }
        
            public int saveViewsHome(int views) {
        try {
            String insertQuery = " INSERT INTO views_home (views) VALUES (?);";

            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);

            preparedStatement.setInt(1, views);         
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }
        
    public int countOrders() {
        int count = 0;
        String query = "select count(*) from orders ";
        try {
            pst = connection.prepareStatement(query);
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                count = res.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return count;
    }

    public int countUsers() {
        int count = 0;
        String query = "select count(*) from Users where role = 1 ";
        try {
            pst = connection.prepareStatement(query);
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                count = res.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return count;
    }

    public double calTotalProfits() {
        double count = 0;
        String query = "SELECT sum(total_price) as Sales From Orders where status = 'Success'";
        try {
            pst = connection.prepareStatement(query);
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                count = res.getDouble(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return count;
    }

    /*SELECT *
FROM orders
ORDER BY created_at DESC
LIMIT 8;
HashMap     */
        public List<Orders> getList8Orders() {
        List<Orders> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM orders\n"
                + "ORDER BY created_at DESC\n"
                + "LIMIT 8;";
        Statement stm;

        try {
            stm = connection.createStatement();
            ResultSet res = stm.executeQuery(query);
            while (res.next()) {
                Orders order = new Orders();
                order.setId(res.getInt("id"));
                order.setUser_id(res.getInt("user_id"));
                order.setAddress_id(res.getInt("address_id"));
                order.setTotal_price(res.getDouble("total_price"));
                order.setStatus(res.getString("status"));
                order.setCreated_at(res.getTimestamp("created_at"));
                list.add(order);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }
   
    public List<Users> getList8Users() {
        List<Users> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM users\n"
                + "ORDER BY created_at DESC\n"
                + "LIMIT 8;";
        Statement stm;

        try {
            stm = connection.createStatement();
            ResultSet res = stm.executeQuery(query);
            while (res.next()) {
                Users user = new Users();
                user.setId(res.getInt(1));
                user.setEmail(res.getString(2));
                user.setPassword(res.getString(3));
                user.setFullname(res.getString(4));
                user.setPhone(res.getString(5));
                user.setAvatar(res.getString(6));
                user.setRole(res.getInt(7));
                user.setCreated_at(res.getDate(8));
                list.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }
}
