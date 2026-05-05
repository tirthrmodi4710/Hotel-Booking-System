package com.hotel.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditHotelServlet")
public class EditHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String city = request.getParameter("city");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_system", "root", "");

            PreparedStatement ps = con.prepareStatement("UPDATE hotels SET name=?, price=?, city=? WHERE id=?");
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setString(3, city);
            ps.setInt(4, id);
            ps.executeUpdate();

            con.close();

            response.sendRedirect("ViewHotelsServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
