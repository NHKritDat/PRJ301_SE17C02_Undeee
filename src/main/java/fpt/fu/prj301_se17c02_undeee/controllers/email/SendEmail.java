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
    public String getRandom(){
        Random rnd = new Random();
        int code = rnd.nextInt(999999);
        return String.format("%06d", code); 
    }
    
    public boolean sendEmail(UserDTO user){
        boolean test = false ;
               // Email configuration
        final String fromEmail ="undeeeloveu@gmail.com"; //  email undeee
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

        try {
            // Message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("User Email Verification");
            message.setText("Registered successfully. Please verify your account using this code: "+ getRandom());

            // Send the email
            Transport.send(message);
           test=true;
           
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        return test;
    }
}
