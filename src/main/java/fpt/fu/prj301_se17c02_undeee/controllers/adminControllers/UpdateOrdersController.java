/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.adminControllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.models.OrderDto;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.models.Sizes;
import fpt.fu.prj301_se17c02_undeee.services.OrdersServices;
import fpt.fu.prj301_se17c02_undeee.services.ProductsServices;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        request.setCharacterEncoding("UTF-8");
        String[] allCategoriesId = request.getParameterValues("all_categories");
        String order_id = request.getParameter("order_id");

        OrdersServices orderService = new OrdersServices();
        ProductsServices productService = new ProductsServices();

        List<OrderDto> orderDetailList = orderService.getOrderDetailsByOrderId(Integer.parseInt(order_id));
        OrderDto order = orderService.getOrdersById(Integer.parseInt(order_id));
        Map<String, List<Categories>> categoryMap = new HashMap<>();
        Map<String, List<Products>> productMap = new HashMap<>();
        Map<String, List<Sizes>> sizeMap = new HashMap<>();

        if (allCategoriesId != null) {
            for (String category_id : allCategoriesId) {
                List<Categories> allCategories = productService.getCategories();
                List<Products> productList = productService.getProductsByCategoryId(Integer.parseInt(category_id));
                List<Sizes> sizeList = productService.getSizesByCategoryId(Integer.parseInt(category_id));
                categoryMap.put(category_id, allCategories);
                productMap.put(category_id, productList);
                sizeMap.put(category_id, sizeList);
            }
        }
        request.setAttribute("order", order);
        request.setAttribute("orderDetailList", orderDetailList);
        request.setAttribute("categoryMap", categoryMap);
        request.setAttribute("productMap", productMap);
        request.setAttribute("sizeMap", sizeMap);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/updateOrders.jsp");
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

        ProductsServices productService = new ProductsServices();

        String category = request.getParameter("category");

        List<Products> productList = productService.getProductsByCategoryId(Integer.parseInt(category));
        List<Sizes> sizeList = productService.getSizesByCategoryId(Integer.parseInt(category));

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.add("products", new Gson().toJsonTree(productList));
        jsonResponse.add("sizes", new Gson().toJsonTree(sizeList));
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
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
