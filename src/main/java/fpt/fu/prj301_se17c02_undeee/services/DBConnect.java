/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DBConnect implements Serializable {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/undeee";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "123";
    public Connection connection = null;

    public DBConnect() {
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
}
