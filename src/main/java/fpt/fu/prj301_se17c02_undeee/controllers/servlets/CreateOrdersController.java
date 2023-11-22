/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.Addresses;
import fpt.fu.prj301_se17c02_undeee.models.Cart;
import fpt.fu.prj301_se17c02_undeee.models.OrderDetails;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import fpt.fu.prj301_se17c02_undeee.services.OrdersServices;
import fpt.fu.prj301_se17c02_undeee.services.UsersServices;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CreateOrdersController extends HttpServlet {

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
            out.println("<title>Servlet CreateOrdersController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateOrdersController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String address = request.getParameter("address");
        String total_price_String = request.getParameter("total_price");
        double total_price = Double.parseDouble(total_price_String);
        
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("CART");
        Users u = (Users) session.getAttribute("user_loged");
        
        UsersServices us = new UsersServices();
        Addresses ad = us.getAddressByUserId(u.getId(), address);
        if (ad.getAddress_detail() == null) {
            us.insertAddress(u.getId(), address);
        }
        
        OrdersServices os = new OrdersServices();
        int order_id = os.insertOrder(u.getId(), ad.getId(), total_price, "Pending");
        for (OrderDetails ods : cart.getAll()) {
            os.insertOrderDetails(order_id, ods.getProduct_id(), ods.getSize_id(), ods.getQuantity());
        }
        cart = new Cart();
        session.setAttribute("CART", cart);
        int total_quantity = 0;
        request.setAttribute("total_quantity", total_quantity);
        
        RequestDispatcher rd = request.getRequestDispatcher("/views/viewOrderSuccess.jsp");
        rd.forward(request, response);
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
