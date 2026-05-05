package com.hotel.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String hotel = request.getParameter("hotel");
        HttpSession session = request.getSession();
        session.setAttribute("selectedHotel", hotel);
        response.sendRedirect("booking.jsp");
    }
}
