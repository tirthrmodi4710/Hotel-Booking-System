package com.hotel.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("Failed to establish database connection.");
                response.sendRedirect("register.jsp");
                return;
            }

            PreparedStatement ps = conn.prepareStatement("INSERT INTO user (name, mobile, password) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, password);

            int i = ps.executeUpdate();  // Executes insertion

            if (i > 0) {
                System.out.println("User registered successfully!");
                response.sendRedirect("login.jsp"); // Success
            } else {
                System.out.println("Registration failed.");
                response.sendRedirect("register.jsp"); // Error
            }
        } catch (Exception e) {
            e.printStackTrace();  // Print stack trace for debugging
            response.sendRedirect("register.jsp"); // Redirect to register page in case of error
        }
    }
}
