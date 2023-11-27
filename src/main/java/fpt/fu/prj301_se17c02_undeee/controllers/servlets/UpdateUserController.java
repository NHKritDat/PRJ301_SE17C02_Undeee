/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.servlets;

import fpt.fu.prj301_se17c02_undeee.models.Users;
import fpt.fu.prj301_se17c02_undeee.services.UsersServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
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
@WebServlet(name = "UpdateUserController", urlPatterns = {"/updateUser"})
public class UpdateUserController extends HttpServlet {

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
            out.println("<title>Servlet UpdateUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUserController at " + request.getContextPath() + "</h1>");
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

        String id = (String) request.getParameter("id");//lấy session
        UsersServices us = new UsersServices();//lấy session
        Users user = us.getUserbyID(id);//lấy session
        if (user != null) {
            request.setAttribute("user", user);
            RequestDispatcher rd = request.getRequestDispatcher("/views/updateUser.jsp");
            rd.forward(request, response);

            //  response.sendRedirect("views/admin_update.jsp");
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

        //validate news update
        String id = request.getParameter("id");//lấy session

        UsersServices us = new UsersServices();//lấy session
        Users user = us.getUserbyID(id); //lấy session
        if (user == null) {
            response.sendError(404);
        }

        // get value form
        //  double price = Double.parseDouble((String)request.getParameter("price"));
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String imageSave = user.getAvatar();
        // xu ly image
        Part part = request.getPart("imageNews");
        if (part.getSize() > 0) {
            // path folder chua anh
            String folderSaveFile = "/images";
            String pathUpload = request.getServletContext().getRealPath(folderSaveFile);
            // file name user upload
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(pathUpload))) {
                Files.createDirectories(Paths.get(pathUpload));
            }
            System.out.println(pathUpload);
            part.write(pathUpload + "/" + fileName);//

            //.io.FileNotFoundException: 
            //E:\New Folder (2)\MyPetShop\target\MyPetShop-1.0-SNAPSHOT\images (Access is denied)
            imageSave = fileName;
        }

        int userID = Integer.parseInt(id);
        if (fullname != null && phone != null && password != null) {
            int result = us.updateUsers(fullname, password, phone, imageSave, userID);
            if (result > 0) {
                String urlRewriting = "./updateUser?id=" + userID;
                RequestDispatcher rd = request.getRequestDispatcher(urlRewriting);
                rd.forward(request, response);
                System.out.println("Update successfully!");
            } else {
                System.out.println("Update failed!");
            }
            return;
        }
    }
        
    //  response.sendRedirect("./home"); 
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
