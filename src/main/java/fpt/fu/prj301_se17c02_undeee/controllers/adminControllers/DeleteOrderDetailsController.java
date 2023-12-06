/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.adminControllers;

import fpt.fu.prj301_se17c02_undeee.models.OrderDto;
import fpt.fu.prj301_se17c02_undeee.services.OrdersServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
@WebServlet(name = "DeleteOrderDetailsController", urlPatterns = {"/delete-orderDetails"})
public class DeleteOrderDetailsController extends HttpServlet {

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
            out.println("<title>Servlet DeleteOrderDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteOrderDetailsController at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("./");
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
        String id = request.getParameter("id");
        String orderDetailId = request.getParameter("order_detail_id");
        OrdersServices orderService = new OrdersServices();
        double total_price = 0;
        if (orderDetailId != null) {
            orderService.deleteOrderDetails(Integer.parseInt(orderDetailId));
            List<OrderDto> orderList = orderService.getOrderDetailsByOrderId(Integer.parseInt(id));

            if (orderList.isEmpty()) {
                orderService.deleteOrders(Integer.parseInt(id));
                response.sendRedirect("./view-orders?updateSuccess=true");
            } else {
                for (OrderDto order : orderList) {
                    total_price += order.getProduct().getPrice() * order.getSize().getPercent() * order.getOrderDetail().getQuantity();
                }
                DecimalFormat decimalFormat = new DecimalFormat("#.###");
                String formattedPrice = decimalFormat.format(total_price);
                orderService.updateTotalPrice(Double.parseDouble(formattedPrice), Integer.parseInt(id));
                response.sendRedirect("./view-orderDetails?id=" + id);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order detail not found");
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
