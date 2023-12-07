/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.forgotpassword;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/undeee";
    ;
    private static final String JDBC_USER = "root";
    ;
    private static final String JDBC_PASSWORD = "123";
     String token;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("views/forgot-email.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        
        if (isEmailValid(email)) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
             token = generateToken();
            saveToken(email, token);
            sendResetEmail(email, token);
            
            response.sendRedirect("views/forgotPasswordConfirmation.jsp");
        } else {
            deleteToken(token);
            response.sendRedirect("views/forgotPasswordError.jsp");
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
    
    private String generateToken() {
        return UUID.randomUUID().toString();
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
    private void saveToken(String email, String token) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "INSERT INTO forgot_pass (email, token) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                statement.setString(2, token);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
    
    private void sendResetEmail(String email, String token) {
        // Use JavaMail API or any other email library to send the reset email
        // Example: Sending email using JavaMail API
        // Make sure to replace the placeholders with your email server details
// Email configuration
        final String fromEmail = "undeeeloveu@gmail.com"; // Điền email của bạn
        final String password = "wcfl kgvd mxva eurj"; // Điền mật khẩu email của bạn

        // SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("[Undeee]Password Reset");
            message.setContent("<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "<head>\n"
                    + "    <meta charset=\"UTF-8\">\n"
                    + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    <title>Email Verification Code</title>\n"
                    + "    <style>\n"
                    + "        body {\n"
                    + "            display: flex;\n"
                    + "            justify-content: center;\n"
                    + "            align-items: center;\n"
                    + "            height: 100vh;\n"
                    + "            margin: 0;\n"
                    + "            background-color: #f4f4f4;\n"
                    + "        }\n"
                    + "        \n"
                    + "        .verification-form {\n"
                    + "            width: 550px;\n"
                    + "            height: 250px;\n"
                    + "            padding: 20px;\n"
                    + "            border: 2px solid #3498db;\n"
                    + "            border-radius: 5px;\n"
                    + "            background-color: #ffffff;\n"
                    + "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n"
                    + "            padding-bottom: 100px;\n"
                    + "        }\n"
                    + "        \n"
                    + "        .form-group {\n"
                    + "            margin-bottom: 15px;\n"
                    + "            text-align: center;\n"
                    + "        }\n"
                    + "        \n"
                    + "        label {\n"
                    + "            display: block;\n"
                    + "            margin-bottom: 5px;\n"
                    + "            font-weight: bold;\n"
                    + "        }\n"
                    + "        \n"
                    + "        input {\n"
                    + "            width: 100%;\n"
                    + "            padding: 8px;\n"
                    + "            box-sizing: border-box;\n"
                    + "            border: 1px solid #ccc;\n"
                    + "            border-radius: 3px;\n"
                    + "        }\n"
                    + "        \n"
                    + "        button {\n"
                    + "            width: 35%;\n"
                    + "            padding: 20px;\n"
                    + "            background-color: #3498db;\n"
                    + "            color: #ffffff;\n"
                    + "            border: none;\n"
                    + "            border-radius: 3px;\n"
                    + "            cursor: pointer;\n"
                    + "            margin-top: 10px;\n"
                    + "            margin-bottom: 10px;\n"
                    + "        }\n"
                    + "        \n"
                    + "        button>a {\n"
                    + "            text-decoration: none;\n"
                    + "            color: white !important;\n"
                    + "            font-size: 16px;\n"
                    + "        }\n"
                    + "        \n"
                    + "        button:hover {\n"
                    + "            background-color: #2980b9;\n"
                    + "        }\n"
                    + "        \n"
                    + "        #verificationCode {\n"
                    + "            font-size: 30px;\n"
                    + "            background-color: #c5d5e4;\n"
                    + "            width: 25%;\n"
                    + "            margin-left: 190px;\n"
                    + "            padding: 15px;\n"
                    + "        }\n"
                    + "        \n"
                    + "        h2 {\n"
                    + "            text-align: center;\n"
                    + "        }\n"
                    + "        \n"
                    + "        img {\n"
                    + "            width: 30px;\n"
                    + "            height: 30px;\n"
                    + "        }\n"
                    + "    </style>\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "    <div>\n"
                    + "        <div style=\"margin-left: 250px;\"><img src=\"views/layout/logo.jsp\" alt=\"\"></div>\n"
                    + "        <p style=\"    font-size: 28px;\n"
                    + "    margin-left: 75px;\n"
                    + "    margin-top: 15px;\">\n"
                    + "            Reset your Undeee password\n"
                    + "        </p>\n"
                    + "        <div class=\"verification-form\">\n"
                    + "            <h2>Undeee password reset</h2>\n"
                    + "            <p> We heard that you lost your password. Sorry about that!</p>\n"
                    + "            <p>But don’t worry! You can use the following button to reset your password:</p>\n"
                    + "\n"
                    + "            <div class=\"form-group\">\n"
                    + "                <button><a href=" + "http://localhost:8080/PRJ301_SE17C02_Undeee/PasswordResetServlet?token=" + token + "&email=" + email + ">Reset your password</a></button>\n"
                    + "            </div>\n"
                    + "\n"
                    + "            <p style=\"line-height: 1px;\">Have a nice day :3 \n"
                    + "            </p>\n"
                    + "            <p>Visit us: http://localhost:8080/PRJ301_SE17C02_Undeee/home</p>\n"
                    + "            <p>Thanks, </p>\n"
                    + "            <p> The Undeee Admin Team. </p>\n"
                    + "\n"
                    + "        </div>\n"
                    + "    </div>\n"
                    + "\n"
                    + "\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>", "text/html");
//            message.setText("Click the link below to reset your password:\n\n"
//                    + "http://localhost:8080/PRJ301_SE17C02_Undeee/PasswordResetServlet?token=" + token + "&email=" + email);
            
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
}
