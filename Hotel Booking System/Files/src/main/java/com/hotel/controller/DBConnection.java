package com.hotel.controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
            	    "jdbc:mysql://localhost:3306/hotel_system", "root", ""
            	);

            if (conn != null) {
                System.out.println("Connection established successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();  // Print the error for better visibility
        }
        return conn;
    }
}
