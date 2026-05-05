<%@ page import="java.sql.*" %>
<html>
<head>
    <title>View Bookings</title>
    <style>
        /* Basic styling for body and page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            padding-top: 20px;
        }

        /* Styling for the table */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Styling for links */
        a {
            color: #2196F3;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Styling for the "Back to Dashboard" link */
        .back-link {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
        }

        .back-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>All Bookings</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Hotel</th>
            <th>Check-in</th>
            <th>Check-out</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_system", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM booking");

                while(rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("hotel") %></td>
                        <td><%= rs.getDate("checkin") %></td>
                        <td><%= rs.getDate("checkout") %></td>
                        <td><a href="DeleteBookingServlet?id=<%= rs.getInt("id") %>">Delete</a></td>
                    </tr>
        <%
                }
                con.close();
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    <a href="admin_dashboard.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>
