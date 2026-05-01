package com.polling.service;

import java.sql.*;

import com.polling.db.DBConnection;

public class VoterService {

    public static int login(String email, String password) {
        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT * FROM voters WHERE email=? AND password=? AND verified=TRUE";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("voter_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}

