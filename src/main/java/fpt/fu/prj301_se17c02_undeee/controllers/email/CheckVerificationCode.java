package fpt.fu.prj301_se17c02_undeee.controllers.email;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import fpt.fu.prj301_se17c02_undeee.services.UsersServices;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hiennt
 */
/**
 *
 * @author hiennt
 */
@WebServlet(name = "CheckVerificationCode", urlPatterns = {"/check-code"})
public class CheckVerificationCode extends HttpServlet {
    private static final String LOGIN_PAGE = "/views/login.jsp";

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
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("authcode");

        String code1 = request.getParameter("num1");
        String code2 = request.getParameter("num2");
        String code3 = request.getParameter("num3");
        String code4 = request.getParameter("num4");
        String code5 = request.getParameter("num5");
        String code6 = request.getParameter("num6");

        String usercode = code1 + code2 + code3 + code4 + code5 + code6;
        if (usercode.equals(user.getCode())) {
            HttpSession ses = request.getSession();
            String fullname = (String) ses.getAttribute("newFullName");
            String email = (String) ses.getAttribute("newEmail");
            String phone = (String) ses.getAttribute("newPhone");
            String myPassword = (String) ses.getAttribute("newPassword");

            UsersServices u = new UsersServices();
            boolean result;
            try {
                result = u.registerAccount(email, fullname, phone, myPassword, 1, "avataruser.jpg");
         if (result) {
            request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
            }
            } catch (SQLException ex) {
                Logger.getLogger(CheckVerificationCode.class.getName()).log(Level.SEVERE, null, ex);
            }
            

            
        } else {
            response.sendRedirect("register");
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
