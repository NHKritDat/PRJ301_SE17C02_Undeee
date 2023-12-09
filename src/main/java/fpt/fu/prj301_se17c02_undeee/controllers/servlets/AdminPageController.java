/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.Orders;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import fpt.fu.prj301_se17c02_undeee.services.StatisticServices;
import fpt.fu.prj301_se17c02_undeee.services.UsersServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hp
 */
@WebServlet(name = "AdminPageController", urlPatterns = {"/admin"})
public class AdminPageController extends HttpServlet {

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
            out.println("<title>Servlet AdminPageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminPageController at " + request.getContextPath() + "</h1>");
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
        StatisticServices st = new StatisticServices();
        UsersServices us = new UsersServices();
        List<Users> l = us.getAllUsers();
        int views = 1504;
        int number_orders = st.countOrders();
        int number_users = st.countUsers();
        double profits = st.calTotalProfits();

        // Định dạng số với 4 chữ số sau dấu thập phân
        DecimalFormat df = new DecimalFormat("#.00");
        // Format giá trị và in ra màn hình
        String total_profits = df.format(profits);
        
        List<Orders> listOrder = st.getList8Orders();
        List<Users>listUsers = st.getList8Users();
        
        request.setAttribute("views", views);
        request.setAttribute("number_orders", number_orders);
        request.setAttribute("number_users", number_users);
        request.setAttribute("total_profits", total_profits);
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("listUsers", listUsers);
        request.setAttribute("listU", l);
    
   RequestDispatcher rd = request.getRequestDispatcher("/views/admin-views/index.jsp");
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
        processRequest(request, response);
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
