/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Addresses;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UsersServices extends DBConnect {

    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private String sql = "";

    public Addresses getFirstAddressByUserId(int user_id) {
        Addresses ad = new Addresses();
        sql = "Select * from Addresses where user_id = ? limit 1";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, user_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                ad.setId(rs.getInt(1));
                ad.setUser_id(rs.getInt(2));
                ad.setAddress_detail(rs.getString(3));
                ad.setCreated_at(rs.getDate(4));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return ad;
    }

    public Addresses getAddressByUserId(int user_id, String address) {
        Addresses ad = new Addresses();
        sql = "select * from Addresses where user_id = ? and address_detail = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, user_id);
            pst.setString(2, address);
            rs = pst.executeQuery();
            while (rs.next()) {
                ad.setId(rs.getInt(1));
                ad.setUser_id(rs.getInt(2));
                ad.setAddress_detail(rs.getString(3));
                ad.setCreated_at(rs.getDate(4));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return ad;
    }
    
    public void insertAddress(int user_id, String address) {
        sql = "insert into Addresses (user_id, address_detail) values (?, ?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, user_id);
            pst.setString(2, address);
            pst.execute();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
