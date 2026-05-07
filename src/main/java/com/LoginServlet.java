package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve inputs (accepting whatever they give)
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Bypass database check and create a session
        HttpSession session = request.getSession();
        session.setAttribute("userEmail", email);
        
        // Redirect directly to the updated voting page
        response.sendRedirect("vote.jsp");
    }
}