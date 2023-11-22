/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Products;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Phong
 */
public class ViewProductsServices implements Serializable{
    DBConnect db = new DBConnect();
    
    public List<Products> getProducts(){
        List<Products> list = new ArrayList<>();
        
        try {
            String sql = "Select * from Products";
            PreparedStatement stm = db.connection.prepareCall(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                int product_id = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                String status = rs.getString("status");
                Date created_at = rs.getDate("created_at");
                
                Products p = new Products(product_id, name, category_id, image, price, status, created_at);
                list.add(p);
                
            }
            
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return list;
        
    }
    
}
