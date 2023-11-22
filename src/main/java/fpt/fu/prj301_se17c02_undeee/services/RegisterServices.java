/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Phong
 */
public class RegisterServices implements Serializable {

    DBConnect db = new DBConnect();

    public boolean registerAccount(String email, String fullname, String phone, String password) {
        boolean result = false;
        try {
            String sql = "Insert Into Users(email,fullname,phone,password) Values(?,?,?,?)";
            PreparedStatement stm = db.connection.prepareCall(sql);
            stm.setString(1, email);
            stm.setString(2, fullname);
            stm.setString(3, phone);
            stm.setString(4, password);

            int rowAffectecs = stm.executeUpdate();
            if (rowAffectecs > 0) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
}
