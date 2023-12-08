/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.Users;
import fpt.fu.prj301_se17c02_undeee.services.UsersServices;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String remember = request.getParameter("RememberMe");

            Cookie cEmail = new Cookie("cEmail", email);
            Cookie cPassword = new Cookie("cPassword", password);
            Cookie cRemember = new Cookie("cRemember", remember);
            if (email == null || password == null) {
                response.sendRedirect("login");
                return;
            }
            UsersServices userServices = new UsersServices();
            Users user = userServices.checkLogin(email, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user_loged", user);
                int role = user.getRole();

                if (remember != null && remember.equals("ON")) {
                    cEmail.setMaxAge(60 * 60 * 24 * 7);
                    cPassword.setMaxAge(60 * 60 * 24 * 7);
                    cRemember.setMaxAge(60 * 60 * 24 * 7);
                } else {
                    cEmail.setMaxAge(0);
                    cPassword.setMaxAge(0);
                    cRemember.setMaxAge(0);
                }

                response.addCookie(cEmail);
                response.addCookie(cPassword);
                response.addCookie(cRemember);

                if (role == 2) {
                    response.sendRedirect("./admin-page");
                } else {
                    response.sendRedirect("./customer-product");
                }

            } else {
                request.setAttribute("LOGIN_ERROR", "Incorrect email or password!");
                response.sendRedirect("login");
            }

        } catch (IOException e) {
            System.out.println(e.getMessage());
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
