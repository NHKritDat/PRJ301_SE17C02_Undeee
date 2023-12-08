/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.email;

import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Hp
 */
public class SendEmail {

    public String getRandom() {
        Random rnd = new Random();
        int code = rnd.nextInt(999999);
        return String.format("%06d", code);
    }

    public boolean sendEmail(UserDTO user) {
        boolean test = false;
        // Email configuration
        final String fromEmail = "undeeeloveu@gmail.com"; //  email undeee
        final String password = "wcfl kgvd mxva eurj"; //  mật khẩu 
        final String toEmail = user.getEmail(); //  email user muon register

        // SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Session
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
// Message
        Message message = new MimeMessage(session);
        try {
            message.addHeader("Content-type", "text/HTML ; chartset=UTF-8");
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("User Email Verification");
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
                    + "            text-align: center;\n"
                    + "            width: 550px;\n"
                    + "            height: 250px;\n"
                    + "            padding: 20px;\n"
                    + "            border: 2px solid #3498db;\n"
                    + "            border-radius: 5px;\n"
                    + "            background-color: #ffffff;\n"
                    + "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n"
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
                    + "            width: 100%;\n"
                    + "            padding: 10px;\n"
                    + "            background-color: #3498db;\n"
                    + "            color: #ffffff;\n"
                    + "            border: none;\n"
                    + "            border-radius: 3px;\n"
                    + "            cursor: pointer;\n"
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
                    + "    </style>\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "\n"
                    + "    <div class=\"verification-form\">\n"
                    + "        <h2>Welcomes to the Undeee Coffee & MilkTea !</h2>\n"
                    + "        <p>Thank you for being one of our beloved customers</p>\n"
                    + "        <p style=\"    font-size: 12px;\">Please enter this code in the verification form to confirm your account</p>\n"
                    + "\n"
                    + "        <div class=\"form-group\">\n"
                    + "            <label for=\"verificationCode\">Verification Code:</label>\n"
                    + "            <p id=\"verificationCode\" name=\"verificationCode\">" + user.getCode() + "</p>\n"
                    + "        </div>\n"
                    + "\n"
                    + "\n"
                    + "    </div>\n"
                    + "\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>", "text/html");
            // Noi dung
        
            // Send the email
            Transport.send(message);
            test = true;

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        return test;
    }
}
