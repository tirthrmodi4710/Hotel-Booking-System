<%@ page import="java.sql.*" %>
<%@ page import="com.hotel.controller.ViewHotelsServlet.Hotel" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Hotel hotel = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_system", "root", "");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM hotels WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            hotel = new Hotel(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("city"));
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (hotel == null) {
%>
    <h3>Hotel not found.</h3>
    <a href="ViewHotelsServlet">Back to Hotel List</a>
<%
    return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Hotel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        form {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            padding: 10px 20px;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
    <form action="EditHotelServlet" method="post">
        <h2>Edit Hotel</h2>
        <input type="hidden" name="id" value="<%= hotel.id %>">
        
        <label>Name:</label>
        <input type="text" name="name" value="<%= hotel.name %>" required>
        
        <label>Price (per day):</label>
        <input type="number" name="price" value="<%= hotel.price %>" required>
        
        <label>City:</label>
        <input type="text" name="city" value="<%= hotel.city %>" required>
        
        <input type="submit" value="Update">
        <br>
        <a href="ViewHotelsServlet">Cancel</a>
    </form>
</body>
</html>
