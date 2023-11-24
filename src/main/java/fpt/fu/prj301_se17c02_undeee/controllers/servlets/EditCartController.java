/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.Cart;
import fpt.fu.prj301_se17c02_undeee.models.OrderDetails;
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
public class EditCartController extends HttpServlet {

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
            out.println("<title>Servlet EditCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCartController at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher rd = request.getRequestDispatcher("/views/viewCartJsp.jsp");
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
        String edit = request.getParameter("edit");
        String[] info = edit.split("-");
        String status = info[0];
        String key = info[1];
        String newKey = info[2];
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("CART");
        OrderDetails ods = cart.getByKey(key);
        int fix;

        switch (status) {
            case "up":
                fix = ods.getQuantity() + 1;
                ods.setQuantity(fix);
                cart.update(key, ods);
                session.setAttribute("CART", cart);
                break;
            case "down":
                fix = ods.getQuantity() - 1;
                ods.setQuantity(fix);
                if (ods.getQuantity() == 0) {
                    cart.remove(key);
                } else {
                    cart.update(key, ods);
                }
                session.setAttribute("CART", cart);
                break;
            case "remove":
                cart.remove(key);
                session.setAttribute("CART", cart);
                break;
            case "size":
                cart.update(newKey, ods);
                session.setAttribute("CART", cart);
                break;
        }

        RequestDispatcher rd = request.getRequestDispatcher("/views/viewCartJsp.jsp");
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
