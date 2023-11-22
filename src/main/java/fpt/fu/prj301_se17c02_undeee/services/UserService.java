/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

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
public class UserService extends DBConnect {


    public List<Users> getPets() {
        List<Users> list = new ArrayList<>();
        String query = "SELECT* FROM Users ";
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
public Users getUserbyID(String id) {
        String query = "SELECT* FROM Users where id =?";
        PreparedStatement preparestatement;
        Users user = null;
         
        try {
            preparestatement = connection.prepareStatement(query);
            preparestatement.setString(1, id);
            ResultSet res = preparestatement.executeQuery();
            while (res.next()) {
                user = new Users();
                user.setId(res.getInt(1));
                user.setEmail(res.getString(2));
                user.setPassword(res.getString(3));
                user.setFullname(res.getString(4));
                user.setPhone(res.getString(5));
                user.setAvatar(res.getString(6));
                user.setRole(res.getInt(7));
                user.setCreated_at(res.getDate(8));
                return user;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return null;
    }


 public int updateUsers(String fullname, String password, String phone, String image, int id) {
        try {
            String insertQuery = "UPDATE Users  SET fullname= ?,password = ?,phone=? , avatar =? WHERE id = ?";
            // Táº¡o PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiáº¿t láº­p cÃ¡c tham sá»‘ trong truy váº¥n
            preparedStatement.setString(1, fullname);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, image);
            preparedStatement.setInt(5, id);

            // Thá»±c hiá»‡n INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }
}
