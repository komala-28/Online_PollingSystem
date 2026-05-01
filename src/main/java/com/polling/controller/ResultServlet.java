package com.polling.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.polling.db.DBConnection;

public class ResultServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT c.name, COUNT(v.vote_id) AS total FROM candidates c " +
                         "LEFT JOIN votes v ON c.candidate_id = v.candidate_id GROUP BY c.name";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            out.println("<h2>Poll Results</h2>");
            while (rs.next()) {
                out.println(rs.getString("name") + ": " + rs.getInt("total") + "<br>");
            }
            out.println("<br><a href='home.jsp'>Back to Dashboard</a>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error fetching results.");
        }
    }
}