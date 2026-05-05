package com.hotel.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddHotelServlet")
public class AddHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String city = request.getParameter("city");
        String priceStr = request.getParameter("price");

        try {
            int price = Integer.parseInt(priceStr);

            Class.forName("com.mysql.jdbc.Driver"); // For newer versions use "com.mysql.cj.jdbc.Driver"
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_system", "root", "");

            String query = "INSERT INTO hotels (name, city, price) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, city);
            ps.setInt(3, price);

            ps.executeUpdate();
            con.close();

            response.sendRedirect("ViewHotelsServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
