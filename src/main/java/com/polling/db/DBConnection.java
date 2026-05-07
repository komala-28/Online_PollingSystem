package com.polling.db;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/polling_db", 
                "root",
                ""  // 👈 Clear this! Use empty quotes because your terminal didn't need a password.
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
