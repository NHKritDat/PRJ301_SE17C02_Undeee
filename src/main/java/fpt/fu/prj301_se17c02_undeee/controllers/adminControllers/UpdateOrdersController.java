/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.adminControllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.models.OrderDetailDto;
import fpt.fu.prj301_se17c02_undeee.models.OrderDto;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.models.Sizes;

import fpt.fu.prj301_se17c02_undeee.services.OrdersServices;
import fpt.fu.prj301_se17c02_undeee.services.ProductsServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
@WebServlet(name = "UpdateOrdersController", urlPatterns = {"/update-orders"})
public class UpdateOrdersController extends HttpServlet {

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
            out.println("<title>Servlet UpdateOrdersController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateOrdersController at " + request.getContextPath() + "</h1>");
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
        String order_detail_id = request.getParameter("order_detail_id");
        String category_id = request.getParameter("category_id");

        OrdersServices orderService = new OrdersServices();
        ProductsServices productService = new ProductsServices();

        OrderDto orderDetail = orderService.getOrderDetailsByOrderDetailId(Integer.parseInt(order_detail_id));
        if (orderDetail != null) {
            List<Categories> allCategories = productService.getCategories();
            List<Products> productList = productService.getProductsByCategoryId(Integer.parseInt(category_id));
            List<Sizes> sizeList = productService.getSizesByCategoryId(Integer.parseInt(category_id));

            request.setAttribute("orderDetail", orderDetail);
            request.setAttribute("allCategories", allCategories);
            request.setAttribute("productList", productList);
            request.setAttribute("sizeList", sizeList);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/updateOrders.jsp");
            rd.forward(request, response);
        } else {
            response.sendError(404);
        }
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
//        String id = request.getParameter("id");
//        
        ProductsServices productService = new ProductsServices();
////        Products p = productService.getProductById(Integer.parseInt(productId));
////        double price = p.getPrice();
////        String priceAsString = Double.toString(price);
////        response.getWriter().write(priceAsString);
////        OrderDto orderToUpdate = orderService.getOrdersById(Integer.parseInt(id));
        String category = request.getParameter("category");
//        String productId = request.getParameter("productId");
//        String sizeId = request.getParameter("sizeId");
//        // Truy vấn CSDL để lấy danh sách sản phẩm theo Category
        List<Products> productList = productService.getProductsByCategoryId(Integer.parseInt(category));
        List<Sizes> sizeList = productService.getSizesByCategoryId(Integer.parseInt(category));
//        Products product = productService.getProductById(Integer.parseInt(productId));
//        Sizes size = productService.getSizeById(Integer.parseInt(sizeId));
//        request.setAttribute("productList", productList);
//         Gửi danh sách sản phẩm dưới dạng JSON về trang JSP
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(new Gson().toJson(productList));
//        response.getWriter().write(new Gson().toJson(sizeList));
//
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.add("products", new Gson().toJsonTree(productList));
        jsonResponse.add("sizes", new Gson().toJsonTree(sizeList));
//        jsonResponse.addProperty("product", product.getPrice());
//        jsonResponse.addProperty("size", size.getPercent());
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
////        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/updateOrders.jsp");
////        rd.forward(request, response);
////        if (orderToUpdate == null) {
////            response.sendError(404);
////        }
////        String status = request.getParameter("status");
////        if (status != null) {
////            orderToUpdate.getOrder().setStatus(status);
////            orderService.updateOrders(orderToUpdate.getOrder());
////            response.sendRedirect("./view-orders");
////            return;
////        } else {
////            response.sendRedirect("./update-orders?id=" + id);
////            return;
////        }
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
