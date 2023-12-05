/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.UpdateUsersError;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import fpt.fu.prj301_se17c02_undeee.services.UsersServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Hp
 */
@MultipartConfig
@WebServlet(name = "UpdateUserController", urlPatterns = {"/updateUser"})
public class UpdateUserController extends HttpServlet {

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
            out.println("<title>Servlet UpdateUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUserController at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher rd = request.getRequestDispatcher("/views/updateUser.jsp");
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
        try {
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Users u = (Users) session.getAttribute("user_loged");
            UsersServices us = new UsersServices();
            UpdateUsersError errors = new UpdateUsersError();
            boolean foundError = false;

            String fullname = request.getParameter("fullname");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String imageSave = u.getAvatar();

            Part part = request.getPart("image");
            if (part.getSize() > 0) {
                String folderSaveFile = "/views/users_avatar";
                String pathUpload = request.getServletContext().getRealPath(folderSaveFile);
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(pathUpload))) {
                    Files.createDirectories(Paths.get(pathUpload));
                }
                part.write(pathUpload + "/" + fileName);
                imageSave = fileName;
            }

            if (fullname != null && phone != null && password != null) {
                if (!(phone.length() == 10)) {
                    foundError = true;
                    errors.setUpdatePhoneError("The phone number must have 10 digits!");
                }
                
                if (!u.getPassword().equalsIgnoreCase(password)) {
                    if (!password.trim().matches(passwordRegex)) {
                        foundError = true;
                        errors.setUpdatePasswordError("Low password security! The password must have an uppercase first letter, lowercase, number and one special character! (eg. Phong@123) ");
                    }
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    md.update(password.getBytes());
                    byte[] digest = md.digest();
                    password = DatatypeConverter.printHexBinary(digest).toUpperCase();
                }
                
                if (foundError) {
                    request.setAttribute("UPDATE_ERROR", errors);
                    doGet(request, response);
                }

                int result = us.updateUsers(fullname, password, phone, imageSave, u.getId());
                if (result > 0) {
                    System.out.println("Update successfully!");
                    Users new_user = us.getUserbyID(String.valueOf(u.getId()));
                    session.setAttribute("user_loged", new_user);
                    doGet(request, response);
                } else {
                    System.out.println("Update failed!");
                }
            }
        } catch (IOException | NoSuchAlgorithmException | ServletException e) {
            System.out.println(e.getMessage());
        }
    }

    //  response.sendRedirect("./home"); 
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
