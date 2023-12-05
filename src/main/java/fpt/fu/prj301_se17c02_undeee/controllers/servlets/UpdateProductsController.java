/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.Categories;
import fpt.fu.prj301_se17c02_undeee.models.Products;
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
@WebServlet(name = "UpdateProductsController", urlPatterns = {"/update-products"})
public class UpdateProductsController extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductController at " + request.getContextPath() + "</h1>");
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
        String id = (String) request.getParameter("id");
        ProductsServices ps = new ProductsServices();

        Products product = ps.getProductById(Integer.parseInt(id));
        String sizeCode = ps.getSizes(id);

        if (product != null) {
            List<Categories> categoryList = ps.getCategories();
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("product", product);
            request.setAttribute("size-code", sizeCode);
            RequestDispatcher rd = request.getRequestDispatcher("/views/update_product.jsp");
            rd.forward(request, response);

            //  response.sendRedirect("views/admin_update.jsp");
        }
        //    response.sendRedirect("view");
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

        /*
            private String name;
    private int category_id;
    private String image;
    private double price;
    private String status;
         */
        //validate news update
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");

        ProductsServices ps = new ProductsServices();
        Products product = ps.getProductById(Integer.parseInt(id));
        if (product == null) {
            response.sendError(404);
        }
        String price = request.getParameter("price");

        double priceSave = 0;
        if (price != null) {
            priceSave = Double.parseDouble(price);
        } else {
            priceSave = product.getPrice();
        }

        // get value form
        //  double price = Double.parseDouble((String)request.getParameter("price"));
        String name = request.getParameter("name");
        String categoty_id = request.getParameter("category");// coi lai
        String status = request.getParameter("status");
        String imageSave = product.getImage();
        // xu ly image
        Part part = request.getPart("image");
        if (part.getSize() > 0) {
            // path folder chua anh
            String folderSaveFile = "/views/Drinks";
            String pathUpload = request.getServletContext().getRealPath(folderSaveFile);
            // file name user upload
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(pathUpload))) {
                Files.createDirectories(Paths.get(pathUpload));
            }
            System.out.println(pathUpload);
            part.write(pathUpload + "/" + fileName);//

            imageSave = fileName;
        }

        if (name != null && categoty_id != null && status != null) {
            int result = ps.updateProducts(id, name, categoty_id, priceSave, imageSave, status);
            if (result > 0) {
                response.sendRedirect("./view");
                return;
            }
        }
        response.sendRedirect("./views/update_product.jsp");
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
