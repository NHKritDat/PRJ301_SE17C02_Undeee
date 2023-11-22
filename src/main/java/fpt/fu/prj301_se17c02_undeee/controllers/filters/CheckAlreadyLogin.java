/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.filters;

import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebFilter(urlPatterns = {"/"}) //Thêm trang filter này cần kiểm tra trước khi cho phép vào trang. Ví dụ: "/Login"
public class CheckAlreadyLogin implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        Users u = new Users();
        Object status = session.getAttribute("");
        if (status != null) {
            u = (Users) status;
        }
        if (u.getEmail() != null) {
            res.sendRedirect("./"); //Thêm trang sẽ được điều hướng đến
        } else {
            chain.doFilter(request, response); //Tiếp tục đi vào trang mà filter này đang kiểm tra
        }
    }

    @Override
    public void destroy() {
    }

}
