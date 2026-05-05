package com.hotel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewBookingsServlet")
public class ViewBookingsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>All Bookings</title></head><body>");
        out.println("<h2>All Bookings</h2>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Use the newer driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_system?serverTimezone=UTC", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM booking");

            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Username</th><th>Hotel</th><th>Check-in</th><th>Check-out</th><th>Action</th></tr>");

            while (rs.next()) {
                int id = rs.getInt("id");
                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + rs.getString("username") + "</td>");  // Changed 'user' to 'username'
                out.println("<td>" + rs.getString("hotel") + "</td>");
                out.println("<td>" + rs.getDate("checkin") + "</td>");
                out.println("<td>" + rs.getDate("checkout") + "</td>");
                out.println("<td><a href='DeleteBookingServlet?id=" + id + "' onclick=\"return confirm('Are you sure?')\">Delete</a></td>");
                out.println("</tr>");
            }

            out.println("</table>");
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }

        out.println("<br><a href='admin_dashboard.jsp'>Back to Dashboard</a>");
        out.println("</body></html>");
    }
}
