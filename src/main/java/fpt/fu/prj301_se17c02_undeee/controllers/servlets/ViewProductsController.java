/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.models.Paging;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.services.ProductsServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "ViewProductsController", urlPatterns = {"/view"})
public class ViewProductsController extends HttpServlet {

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
            out.println("<title>Servlet ViewProductsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewProductsController at " + request.getContextPath() + "</h1>");
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

        int category_id = 0;
        String status = null;
        ProductsServices ps = new ProductsServices();
        // List<Products> list = ps.getAllProducts();
        List<Categories> categoryList = ps.getCategories();
        List<String> statusList = new ArrayList<>();
        statusList.add("Status");
        statusList.add("Active");
        statusList.add("Sold out");
        request.setAttribute("categoryList", categoryList);
        //  request.setAttribute("list", list);

        String search = request.getParameter("searchKeyWord");

        if (search == null) {
            search = "";
        }
        String pageInput = request.getParameter("page");
        String perpageInput = request.getParameter("perPage");

        int page = pageInput != null ? Integer.parseInt(pageInput) : 1;
        int perpage = perpageInput != null ? Integer.parseInt(perpageInput) : 8;
        ProductsServices newservice = new ProductsServices();
        Paging newspaging = newservice.getPetsPage(search, page, perpage);
        List<Products> p = newspaging.getP();
        if (search.matches("\\d+")) {
            category_id = Integer.parseInt(search);
        }

        if (search.equalsIgnoreCase("Active")) {
            status = "Active";
        }
        if (search.equalsIgnoreCase("Sold out")) {
            status = "Sold out";
        }
        
        request.setAttribute("searchKeyword", search);
        request.setAttribute("newsPaging", newspaging);
        request.setAttribute("category_id", category_id);
        request.setAttribute("status", status);
        request.setAttribute("page", pageInput);
        request.setAttribute("statusList", statusList);

        RequestDispatcher rd = request.getRequestDispatcher("/views/view.jsp");
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
//        ProductsServices ps = new ProductsServices();
//        List<Products> list = new ArrayList<>();
//        String search = (String) request.getParameter("searchKeyword");
//        String category = (String) request.getParameter("searchCategory");
//        if (category == null) {
//            list = ps.searchProducts(search);
//        } else {
//            list = ps.searchProductsByCategory(category);
//        }
//        request.setAttribute("list", list);
//        List<Categories> categoryList = ps.getCategories();
//        request.setAttribute("categoryList", categoryList);
//         
//        String pageInput = request.getParameter("page");
//        String perpageInput = request.getParameter("perPage");
//
//        int page = pageInput != null ? Integer.parseInt(pageInput) : 1;
//        int perpage = perpageInput != null ? Integer.parseInt(perpageInput) : 8;
//        ProductsServices newservice = new ProductsServices();
//        Paging newspaging = newservice.getPetsPage(search, page, perpage);
//        request.setAttribute("searchKeyword", search);
//
//        request.setAttribute("newsPaging", newspaging);
//        request.setAttribute("category", category);
//        RequestDispatcher rd = request.getRequestDispatcher("/views/view.jsp");
//        rd.forward(request, response);
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
