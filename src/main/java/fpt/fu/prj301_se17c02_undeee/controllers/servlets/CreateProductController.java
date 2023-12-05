/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.services.ProductsServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Hp
 */
@MultipartConfig
@WebServlet(name = "CreateProductController", urlPatterns = {"/create"})
public class CreateProductController extends HttpServlet {

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
            out.println("<title>Servlet CreateProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateProductController at " + request.getContextPath() + "</h1>");
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
        ProductsServices ps = new ProductsServices();

        List<Categories> categoryList = ps.getCategories();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher rd = request.getRequestDispatcher("/views/create_product.jsp");
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
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String categoryID = request.getParameter("category");

        String status = request.getParameter("status");
        Part part = request.getPart("image");

        if (name == null || price == null || categoryID == null || status == null
                || name.isEmpty() || price.isEmpty() || categoryID.isEmpty() || status.isEmpty() || part.getSize() == 0) {
            ProductsServices ps = new ProductsServices();

            List<Categories> categoryList = ps.getCategories();
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("report", "thêm sản phẩm thât bại");
            RequestDispatcher rd = request.getRequestDispatcher("/views/create_product.jsp");
            rd.forward(request, response);
        }

        String folderSaveFile = "/views/products";
        String pathUpload = request.getServletContext().getRealPath(folderSaveFile);
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

        if (!Files.exists(Paths.get(pathUpload))) {
            Files.createDirectories(Paths.get(pathUpload));
        }
        part.write(pathUpload + "/" + fileName);
        double priceSave = 0;
        if (price != null) {
            priceSave = Double.parseDouble(price);
        }

        int categoryIDSave = 0;
        if (categoryID != null) {
            categoryIDSave = Integer.parseInt(categoryID);
        }
        if (name != null && price != null && categoryID != null && status != null) {
            ProductsServices productService = new ProductsServices();
            String imageSave = fileName;
            int result = productService.insertProducts(name, categoryIDSave, imageSave, priceSave, status);
            // tam thoi lay luon file name
            if (result > 0) {
                response.sendRedirect("view");
                return;
            }
        }
        response.sendRedirect("create");
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
