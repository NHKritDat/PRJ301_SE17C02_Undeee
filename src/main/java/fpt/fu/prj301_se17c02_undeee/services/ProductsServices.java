/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.SizeProducts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductsServices extends DBConnect {

    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private String sql = "";

    public SizeProducts getSizeProductById(int product_id, int size_id) {
        SizeProducts sp = new SizeProducts();
        sql = "Select p.name, p.image, s.name, s.price from Products p"
                + "left join Sizes s"
                + "on p.id = s.product_id"
                + "where p.id = ? and s.id = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, product_id);
            pst.setInt(2, size_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp.setProduct_id(product_id);
                sp.setSize_id(size_id);
                sp.setProduct_name(rs.getString(1));
                sp.setImage(rs.getString(2));
                sp.setSize_name(rs.getString(3));
                sp.setPrice(rs.getDouble(4));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return sp;
    }

    public List<SizeProducts> getSizeProductById(int product_id) {
        List<SizeProducts> list = new ArrayList<>();
        SizeProducts sp = new SizeProducts();
        sql = "Select p.id, s.id, p.name, p.image, s.name, s.price from Products p"
                + "left join Sizes s"
                + "on p.id = s.product_id"
                + "where p.id = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, product_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp.setProduct_id(product_id);
                sp.setSize_id(rs.getInt(2));
                sp.setProduct_name(rs.getString(3));
                sp.setImage(rs.getString(4));
                sp.setSize_name(rs.getString(5));
                sp.setPrice(rs.getDouble(6));
                list.add(sp);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
}
