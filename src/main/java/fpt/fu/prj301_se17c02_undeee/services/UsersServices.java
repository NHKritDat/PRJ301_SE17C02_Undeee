/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author dell
 */
public class UserServices {

    DBConnect db = new DBConnect();

    public Users checkLogin(String email, String password) {
        try {
            String sql = "Select * from Users where email = ? and password = ?";
            PreparedStatement stm = db.connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                int role = rs.getInt("role");
                Date created_at = rs.getDate("created_at");
                return new Users(id, email, password, fullname, phone, avatar, role, created_at);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
