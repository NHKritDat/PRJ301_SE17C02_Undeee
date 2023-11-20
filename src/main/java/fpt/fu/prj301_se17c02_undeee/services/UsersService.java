/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author Phong
 */
public class UsersService implements Serializable {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/undeee";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "123";
    public Connection connection = null;

    public UsersService() {
        this.connection = getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }

    private Connection getConnection(String url, String username, String password) {
        Connection c = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection(url, username, password);
            System.out.println("Connect to Database success!!!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Can't connect to Database!!! " + e.getMessage());
        }
        return c;
    }

    public Users checkLogin(String email, String password) throws SQLException {

        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            if (connection != null) {
                String sql = "Select id, fullname, phone, avatar, role, created_at "
                        + "From Users "
                        + "Where email = ? , password = ? ";
                stm = connection.prepareCall(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    int role = rs.getInt("role");
                    Date created_at = rs.getDate("created_at");

                    Users result = new Users(id, email, password, fullname, phone, avatar, role, created_at);
                    return result;
                }
            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }

        }
        return null;

    }

}
