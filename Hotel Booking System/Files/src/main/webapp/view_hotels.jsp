<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.hotel.controller.ViewHotelsServlet.Hotel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Hotels</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #aaa;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        a {
            text-decoration: none;
            color: blue;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Hotel List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price (per day)</th>
            <th>Actions</th>
        </tr>
        <%
            List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotelsList");
            if (hotels != null && !hotels.isEmpty()) {
                for (Hotel h : hotels) {
        %>
        <tr>
            <td><%= h.id %></td>
            <td><%= h.name %></td>
            <td>₹<%= h.price %></td>
            <td>
                <a href="edit_hotel.jsp?id=<%= h.id %>">Edit</a> |
                <a href="DeleteHotelServlet?id=<%= h.id %>" onclick="return confirm('Are you sure you want to delete this hotel?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No hotels found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="back-link">
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
