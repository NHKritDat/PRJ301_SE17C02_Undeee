/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hp
 */
/*
CREATE TABLE Products (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    image VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    status VARCHAR(45) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY products_name_unique (name),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);
 */
public class ProductService extends DBConnect {

    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM Products ";
        Products product = null;
        PreparedStatement preparestatement;
        try {
            preparestatement = connection.prepareStatement(query);
            ResultSet res = preparestatement.executeQuery();
            while (res.next()) {
                product = new Products();
                product.setId(res.getInt(1));
                product.setName(res.getString(2));
                product.setCategory_id(res.getInt(3));
                product.setImage(res.getString(4));
                product.setPrice(res.getDouble(5));
                product.setStatus(res.getString(6));
                product.setCreate_at(res.getDate(7));
                list.add(product);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }

    public List<Categories> getCategories() {
        List<Categories> list = new ArrayList<>();
        String query = "SELECT * FROM Categories ";
        Categories category = null;
        PreparedStatement preparestatement;
        try {
            preparestatement = connection.prepareStatement(query);
            ResultSet res = preparestatement.executeQuery();
            while (res.next()) {
                category = new Categories();
                category.setCategory_id(res.getInt(1));
                category.setName(res.getString(2));
                category.setCreate_at(res.getDate(3));
                list.add(category);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }

    public List<Products> searchProducts(String search) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE name LIKE '%" + search + "%';";
        Products product = null;
        PreparedStatement preparestatement;
        try {
            preparestatement = connection.prepareStatement(query);
            ResultSet res = preparestatement.executeQuery();
            while (res.next()) {
                product = new Products();
                product.setId(res.getInt(1));
                product.setName(res.getString(2));
                product.setCategory_id(res.getInt(3));
                product.setImage(res.getString(4));
                product.setPrice(res.getDouble(5));
                product.setStatus(res.getString(6));
                product.setCreate_at(res.getDate(7));
                list.add(product);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }

    public int insertProducts(String name, int categoryID, String image, double price, String status) {
        try {
            String insertQuery = "INSERT INTO Products (name, category_id, image, price, status) VALUES (?, ?, ?, ?,?)";

            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);

            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, categoryID);
            preparedStatement.setString(3, image);
            preparedStatement.setDouble(4, price);
            preparedStatement.setString(5, status);

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }
    
        public int deleteProducts(String id) {
        try {
            String deleteQuery = "DELETE FROM Products WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setString(1, id);
            int rowsDeleted = preparedStatement.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("success.");
                return 1;
            } else {
                System.out.println("fail.");
            }
        } catch (SQLException ex) {
            System.out.println("delete error" + ex.getMessage());
        }
        return 0;
    }
        
          public Products getProductById(String id) {
        String query = "SELECT * FROM Products WHERE id =  "+id+" ";
        Products product = null;
        PreparedStatement preparestatement;
        try {
            preparestatement = connection.prepareStatement(query);
            ResultSet res = preparestatement.executeQuery();
            while (res.next()) {
                product = new Products();
                product.setId(res.getInt(1));
                product.setName(res.getString(2));
                product.setCategory_id(res.getInt(3));
                product.setImage(res.getString(4));
                product.setPrice(res.getDouble(5));
                product.setStatus(res.getString(6));
                product.setCreate_at(res.getDate(7));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return product;
    }
          
              public int updateProducts(String id , String name, String category_id, double price, String image, String status) {
        try {
            String insertQuery = "UPDATE Products  SET name= ? ,  category_id = ?, price =?, image =?, status=? Where id =?";          // Táº¡o PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiáº¿t láº­p cÃ¡c tham sá»‘ trong truy váº¥n
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, category_id);
            preparedStatement.setDouble(3, price);
            preparedStatement.setString(4, image);
            preparedStatement.setString(5, status);
            preparedStatement.setString(6, id);

            // Thá»±c hiá»‡n INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }
}
