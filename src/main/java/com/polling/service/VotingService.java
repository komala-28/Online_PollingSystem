package com.polling.service;

import java.sql.*;

import com.polling.db.DBConnection;

public class VotingService {

    public static void showCandidates() {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM candidates");

            while (rs.next()) {
                System.out.println(rs.getInt("candidate_id") + " - " +
                                   rs.getString("name") + " (" +
                                   rs.getString("party") + ")");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean vote(int voterId, int candidateId) {
        // Use try-with-resources to ensure the connection closes automatically
        try (Connection con = DBConnection.getConnection()) {
            
            // 1. Check if the user has already voted
            String checkSql = "SELECT * FROM votes WHERE voter_id = ?";
            PreparedStatement check = con.prepareStatement(checkSql);
            check.setInt(1, voterId);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                System.out.println("❌ You already voted!");
                return false; // Returns false to the Servlet if a record exists
            }

            // 2. Insert the new vote
            String insertSql = "INSERT INTO votes(voter_id, candidate_id) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(insertSql);
            ps.setInt(1, voterId);
            ps.setInt(2, candidateId);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Returns true if the vote was successfully saved

        } catch (Exception e) {
            e.printStackTrace();
            return false; // Returns false if a database error occurs
        }
    }
}