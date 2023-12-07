/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.forgotpassword;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hp
 */
@WebServlet("/PasswordResetServlet")

public class PasswordResetServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/undeee";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "123";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String email = request.getParameter("email");
        
        if (isTokenValid(token)) {
            request.setAttribute("token", token);
            request.setAttribute("email", email);
            request.getRequestDispatcher("views/passwordReset.jsp").forward(request, response);
        } else {
            deleteToken(token);
            response.sendRedirect("views/resetTokenError.jsp");
        }
    }
    
    private boolean isTokenValid(String token) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "SELECT * FROM forgot_pass WHERE token = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, token);
                try (ResultSet resultSet = statement.executeQuery()) {
                    return resultSet.next();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
            return false;
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");
        String token = request.getParameter("token");
        String email = request.getParameter("email");
        System.out.println("email kkia"+email);
        if (isTokenValid(token)) {
            // TODO: Process the new password and update the database
            updatePassword(email, newPassword);
            // TODO: Delete the token from the "forgot_pass" table
            deleteToken(token);
           
            response.sendRedirect("login");
        } else {
            deleteToken(token);
            response.sendRedirect("views/resetTokenError.jsp");
        }
    }
    
    private void updatePassword(String email, String newPassword) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "UPDATE users SET password = ? WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, newPassword);
                statement.setString(2, email);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
        private boolean isEmailValid(String email) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "SELECT * FROM users WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                try (ResultSet resultSet = statement.executeQuery()) {
                    return resultSet.next();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
            return false;
        }
    }
    private void deleteToken(String token) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "DELETE FROM forgot_pass WHERE token = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, token);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
}
