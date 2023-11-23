/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.models.SizeProducts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
        sql = "Select p.name, p.image, s.name, s.percent, p.price from Products p left join Sizes s on p.id = s.product_id where p.id = ? and s.id = ?";
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
                sp.setPercent(rs.getDouble(4));
                sp.setPrice(rs.getDouble(5));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return sp;
    }

    public List<SizeProducts> getSizeProductById(int product_id) {
        List<SizeProducts> list = new ArrayList<>();
        sql = "Select p.id, s.id, p.name, p.image, s.name, s.percent, p.price from Products p left join Sizes s on p.id = s.product_id where p.id = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, product_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                SizeProducts sp = new SizeProducts();
                sp.setProduct_id(product_id);
                sp.setSize_id(rs.getInt(2));
                sp.setProduct_name(rs.getString(3));
                sp.setImage(rs.getString(4));
                sp.setSize_name(rs.getString(5));
                sp.setPercent(rs.getDouble(6));
                sp.setPrice(rs.getDouble(7));
                list.add(sp);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM Products ";
        try {
            pst = connection.prepareStatement(query);
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Products product = new Products();
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
        String query = "SELECT * FROM Products WHERE id =  " + id + " ";
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

    public int updateProducts(String id, String name, String category_id, double price, String image, String status) {
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

    public List<Products> getProducts() {
        List<Products> list = new ArrayList<>();

        try {
            sql = "Select * from Products";
            PreparedStatement stm = connection.prepareCall(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
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

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return list;

    }
}
