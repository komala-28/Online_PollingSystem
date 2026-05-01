package com;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import com.polling.db.DBConnection;

@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String candidateId = request.getParameter("cid");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO votes (candidate_id) VALUES (?)");
            ps.setString(1, candidateId);
            ps.executeUpdate();

            response.sendRedirect("success.jsp");          con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}