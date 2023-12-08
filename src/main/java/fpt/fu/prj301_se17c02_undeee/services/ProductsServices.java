/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.models.Paging;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.models.SizeProducts;
import fpt.fu.prj301_se17c02_undeee.models.Sizes;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

    public Paging getAllProductsAvailable(String search, String category_id, int page, int perPage) {
        Paging paging = new Paging();
        List<Products> list = new ArrayList<>();
        try {
            int limit = perPage;
            int offset = (page - 1) * perPage;
            sql = "select * from Products where status = 'Active'";
            String sqlCount = "select count(*) as numberItem from Products where status = 'Active'";
            if (search != null) {
                sql += "and name like '%" + search + "%'";
                sqlCount += "and name like '%" + search + "%'";
            }
            if (category_id != null && !category_id.equals("")) {
                sql += "and category_id = " + category_id;
                sqlCount += "and category_id = " + category_id;
            }

            Statement st = connection.createStatement();
            sql += " limit " + limit + " offset " + offset;
            rs = st.executeQuery(sql);

            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setCategory_id(rs.getInt(3));
                p.setImage(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setStatus(rs.getString(6));
                p.setCreated_at(rs.getDate(7));
                list.add(p);
            }
            paging.setP(list);
            paging.setPage(page);
            paging.setPerPage(perPage);

            ResultSet rsTotal = st.executeQuery(sqlCount);
            int total = 0;
            while (rsTotal.next()) {
                total += rsTotal.getInt(1);
            }
            paging.setTotal(total);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return paging;
    }

    public SizeProducts getSizeProductById(int product_id, int size_id) {
        SizeProducts sp = null;
        sql = "Select p.name, p.image, s.name, s.percent, p.price from Products p left join Sizes s on p.category_id = s.category_id where p.id = ? and s.id = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, product_id);
            pst.setInt(2, size_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp = new SizeProducts();
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
        sql = "Select p.name, p.image, p.price, s.id, s.name, s.percent from Products p left join Sizes s on p.category_id = s.category_id where p.id = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, product_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                SizeProducts sp = new SizeProducts();
                sp.setProduct_id(product_id);
                sp.setProduct_name(rs.getString(1));
                sp.setImage(rs.getString(2));
                sp.setPrice(rs.getDouble(3));
                sp.setSize_id(rs.getInt(4));
                sp.setSize_name(rs.getString(5));
                sp.setPercent(rs.getDouble(6));
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
                product.setCreated_at(res.getDate(7));
                list.add(product);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }

    public List<Products> getTop8BestSellerProducts() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT product_id , name, category_id, image, price, status, products.created_at, count\n"
                + "FROM bestseller JOIN products ON product_id = id\n"
                + "ORDER BY count DESC\n"
                + "LIMIT 8; ";
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
                product.setCreated_at(res.getDate(7));
                list.add(product);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }

    public List<Categories> getCategories() {
        List<Categories> list = new ArrayList<>();
        sql = "SELECT * FROM Categories ";
        Categories category = null;
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                category = new Categories();
                category.setCategory_id(rs.getInt(1));
                category.setName(rs.getString(2));
                category.setCreated_at(rs.getTimestamp(3));
                list.add(category);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }

    public String getSizes(String id) {
        List<Sizes> list = new ArrayList<>();
        String query = "SELECT * FROM Sizes  where product_id = " + id + ";";
        Sizes category = null;
        PreparedStatement preparestatement;
        try {
            preparestatement = connection.prepareStatement(query);
            ResultSet res = preparestatement.executeQuery();
            while (res.next()) {
                category = new Sizes();
                category.setId(res.getInt(1));
                category.setCategory_id(res.getInt(2));
                category.setName(res.getString(3));
                category.setPercent(res.getDouble(4));
                category.setCreated_at(res.getDate(5));
                list.add(category);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        String size = "";

        for (Sizes sizes : list) {
            if (sizes.getName().equals("Small")) {
                size = size + 1;
            }
            if (sizes.getName().equals("Regular")) {
                size = size + 2;
            }
            if (sizes.getName().equals("Large")) {
                size = size + 3;
            }
        }
        return size;
    }

    public List<Products> searchProducts(String search) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE status  ='" + search + "' OR  name LIKE '%" + search + "%';";
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
                product.setCreated_at(res.getDate(7));
                list.add(product);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }

    public List<Products> searchProductsByCategory(String category) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE category_id =" + category + ";";
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
                product.setCreated_at(res.getDate(7));
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

        public Products getProductByName(String name) {
        sql = "SELECT * FROM Products WHERE name =  '" + name + "' ";
        Products product = null;
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                product = new Products();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setCategory_id(rs.getInt(3));
                product.setImage(rs.getString(4));
                product.setPrice(rs.getDouble(5));
                product.setStatus(rs.getString(6));
                product.setCreated_at(rs.getTimestamp(7));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return product;
    }
    public Products getProductById(int id) {
        sql = "SELECT * FROM Products WHERE id =  " + id + " ";
        Products product = null;
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                product = new Products();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setCategory_id(rs.getInt(3));
                product.setImage(rs.getString(4));
                product.setPrice(rs.getDouble(5));
                product.setStatus(rs.getString(6));
                product.setCreated_at(rs.getTimestamp(7));
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

    public List<Products> getProductsByCategoryId(int categoryId) {
        List<Products> productList = new ArrayList<>();
        sql = "SELECT * FROM Products WHERE category_id = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, categoryId);
            rs = pst.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                String status = rs.getString("status");
                Date created_at = rs.getTimestamp("created_at");

                Products product = new Products(product_id, name, category_id, image, price, status, created_at);
                productList.add(product);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return productList;
    }

    public List<Sizes> getSizesByCategoryId(int categoryId) {
        List<Sizes> sizeList = new ArrayList<>();
        sql = "SELECT * FROM Sizes WHERE category_id = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, categoryId);
            rs = pst.executeQuery();
            while (rs.next()) {
                int size_id = rs.getInt("id");
                int category_id = rs.getInt("category_id");
                String name = rs.getString("name");
                double percent = rs.getDouble("percent");
                Date created_at = rs.getTimestamp("created_at");

                Sizes size = new Sizes(size_id, category_id, name, percent, created_at);
                sizeList.add(size);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return sizeList;
    }

    public Sizes getSizeById(int sizeId) {
        sql = "SELECT * FROM Sizes WHERE id =  " + sizeId;
        Sizes size = null;
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                size = new Sizes();
                size.setId(rs.getInt(1));
                size.setCategory_id(rs.getInt(2));
                size.setName(rs.getString(3));
                size.setPercent(rs.getDouble(4));
                size.setCreated_at(rs.getTimestamp(5));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return size;

    }

    public Paging getPetsPage(String search, int page, int perPage) {
        Paging newspaging = new Paging();
        List<Products> list = new ArrayList<>();
        int limit = perPage;
        int offset = (page - 1) * perPage;
        String query = "SELECT* FROM Products ";
        String countQuery = "SELECT COUNT(*)AS NUMBERPET FROM Products ";
        if (search != null) {
            query += "WHERE  category_id ='" + search + "' or status LIKE '%" + search + "%' OR  name LIKE '%" + search + "%'";
            countQuery += "WHERE category_id ='" + search + "' or status  LIKE '%" + search + "%' OR  name LIKE '%" + search + "%'";

        }

        query += "ORDER BY id\n"
                + " LIMIT " + limit
                + " OFFSET " + offset + ";";

        try {

            Statement stm;
            stm = connection.createStatement();
            rs = stm.executeQuery(query);
            while (rs.next()) {
                int product_id = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                String status = rs.getString("status");
                Date created_at = rs.getTimestamp("created_at");

                Products product = new Products(product_id, name, category_id, image, price, status, created_at);
                list.add(product);
            }
            newspaging.setP(list);
            newspaging.setPage(page);
            newspaging.setPerPage(perPage);
            rs = stm.executeQuery(countQuery);
            int total = 0;
            while (rs.next()) {
                total = rs.getInt(1);
            }
            newspaging.setTotal(total);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return newspaging;
    }
}
