package com.hotel.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class FinalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String hotel = request.getParameter("hotel");
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        int price = 0; // Initialize price variable

        if (hotel == null || checkin == null || checkout == null ||
            hotel.isEmpty() || checkin.isEmpty() || checkout.isEmpty()) {
            response.sendRedirect("booking.jsp");
            return;
        }

        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                // Query to get the price of the selected hotel
                PreparedStatement ps = conn.prepareStatement(
                    "SELECT price FROM hotels WHERE name = ?"
                );
                ps.setString(1, hotel);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    price = rs.getInt("price"); // Fetch the price
                }

                // Insert the booking details into the database
                ps = conn.prepareStatement(
                    "INSERT INTO booking (username, hotel, checkin, checkout) VALUES (?, ?, ?, ?)"
                );
                ps.setString(1, username);
                ps.setString(2, hotel);
                ps.setString(3, checkin);
                ps.setString(4, checkout);
                ps.executeUpdate();
                ps.close();
                conn.close();
            }

            // Set attributes for the final.jsp page
            request.setAttribute("username", username);
            request.setAttribute("hotel", hotel);
            request.setAttribute("checkin", checkin);
            request.setAttribute("checkout", checkout);
            request.setAttribute("price", price); // Add price to the request

            // Forward to final.jsp
            RequestDispatcher rd = request.getRequestDispatcher("final.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp");
        }
    }
}
