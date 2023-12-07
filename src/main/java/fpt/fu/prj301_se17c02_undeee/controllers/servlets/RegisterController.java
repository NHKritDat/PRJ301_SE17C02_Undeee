/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.RegisterError;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import fpt.fu.prj301_se17c02_undeee.services.UsersServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Phong
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    private static final String REGISTER_PAGE = "/views/register.jsp";
    private static final String LOGIN_PAGE = "/views/login.jsp";
    private static final String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,20}$";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/register.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String fullname = request.getParameter("txtFullName");
        String email = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String url = REGISTER_PAGE;

        RegisterError errors = new RegisterError();
        UsersServices u = new UsersServices();
        boolean foundError = false;
        try {
            List<Users> list = new ArrayList<>();
            list = u.getAllUsers();
            for (Users users : list) {
                if (email.equals(users.getEmail())) {
                    foundError = true;
                    errors.setEmailUniqueError(email + " " + "Already Existed!");
                    break;
                }
            }
            if (email.length() < 6 || email.length() > 30 || !email.contains("@")) {
                foundError = true;
                errors.setEmailError("Email must be from 6 to 10 characters and have the correct email format!");
            }

            if (!(phone.length() == 10)) {
                foundError = true;
                errors.setPhoneError("The phone number must have 10 digits!");
            }
            if (!password.trim().matches(passwordRegex)) {
                foundError = true;
                errors.setPasswordError("Low password security! The password must have an uppercase first letter, lowercase, number and one special character! (eg. Phong@123) ");
            }
            if (!confirm.trim().equals(password.trim())) {
                foundError = true;
                errors.setPasswordError("Confirm the password must match the password you entered above!");
            }
            if (fullname.length() < 2 || fullname.length() > 50) {
                foundError = true;
                errors.setFullnameError("Full name must be from 2 to 50 characters!");
            }
            if (foundError) {
                request.setAttribute("ERROR", errors);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                MessageDigest md = MessageDigest.getInstance("MD5");
                md.update(password.getBytes());
                byte[] digest = md.digest();
                String myPassword = DatatypeConverter.printHexBinary(digest).toUpperCase();

                HttpSession session = request.getSession();
                session.setAttribute("newFullName", fullname);
                session.setAttribute("newEmail", email);
                session.setAttribute("newPhone", phone);
                session.setAttribute("newPassword", myPassword);

                response.sendRedirect("UserVerify");
            }

        } catch (NoSuchAlgorithmException e) {
            String errMsg = e.getMessage();
            log("RegisterController_SQL: " + errMsg);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
