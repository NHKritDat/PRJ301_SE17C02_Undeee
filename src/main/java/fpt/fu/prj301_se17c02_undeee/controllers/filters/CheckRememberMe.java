/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.filters;

import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.io.IOException;
import java.util.HashSet;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebFilter(urlPatterns = {"./login"}) //Thêm trang filter này cần kiểm tra trước khi cho phép vào trang. Ví dụ: "/Login"
public class CheckRememberMe implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        Cookie[] cookies = req.getCookies();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("Remember me");

        Users u = new Users();

        Cookie cEmail = new Cookie("cEmail", email);
        Cookie cPassword = new Cookie("cPassword", password);
        Cookie cRemember = new Cookie("cRemember", remember);

        if (remember != null) {
            cEmail.setMaxAge(60 * 60 * 24 * 7); //7 ngày
            cPassword.setMaxAge(60 * 60 * 24 * 7);
            cRemember.setMaxAge(60 * 60 * 24 * 7);
        } else {
            cEmail.setMaxAge(0);
            cPassword.setMaxAge(0);
            cRemember.setMaxAge(0);
        }

        res.addCookie(cEmail);
        res.addCookie(cPassword);
        res.addCookie(cRemember);

        chain.doFilter(request, response); //Tiếp tục đi vào trang mà filter này đang kiểm tra
    }

    @Override
    public void destroy() {
    }

}
