package com.hotel.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteHotelServlet")
public class DeleteHotelServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_system", "root", "");

            PreparedStatement ps = con.prepareStatement("DELETE FROM hotels WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();

            con.close();

            response.sendRedirect("ViewHotelsServlet"); // refresh hotel list after deletion

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
