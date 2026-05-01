package com.polling.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.polling.service.VoterService;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        int voterId = VoterService.login(email, pass); 

        if (voterId != -1) {
            HttpSession session = request.getSession();
            session.setAttribute("voterId", voterId);
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}