package com.hotel.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

@WebServlet("/ViewHotelsServlet")
public class ViewHotelsServlet extends HttpServlet {

    public static class Hotel {
        public int id;
        public String name;
        public int price;
        public String city;

        public Hotel(int id, String name, int price, String city) {
            this.id = id;
            this.name = name;
            this.price = price;
            this.city = city;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Hotel> hotels = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_system", "root", "");

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hotels");

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                String city = rs.getString("city");
                hotels.add(new Hotel(id, name, price, city));
            }

            con.close();

            request.setAttribute("hotelsList", hotels);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view_hotels.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
