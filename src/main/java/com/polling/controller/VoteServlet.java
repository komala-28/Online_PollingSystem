package com.polling.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // Essential import
import com.polling.service.VotingService;

public class VoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("voterId") != null) {
            int voterId = (int) session.getAttribute("voterId");
            int cid = Integer.parseInt(request.getParameter("cid"));

            if (VotingService.vote(voterId, cid)) {
                response.getWriter().println("Vote cast successfully! <a href='home.jsp'>Back</a>");
                
            } else {
                response.getWriter().println("Error: Already voted or invalid candidate.");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}