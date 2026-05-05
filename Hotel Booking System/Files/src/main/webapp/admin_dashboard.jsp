<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
        }

        .dashboard-container {
            margin-top: 60px;
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin-bottom: 30px;
        }

        ul li {
            margin: 15px 0;
        }

        ul li a {
            text-decoration: none;
            font-size: 16px;
            color: #3498db;
            transition: color 0.3s;
        }

        ul li a:hover {
            color: #2c3e50;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #e74c3c;
            border: none;
            color: white;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome, Admin</h2>
        <ul>
            <li><a href="add_hotel.jsp">Add Hotel</a></li>
            <li><a href="ViewHotelsServlet">View Hotels</a></li>
            <li><a href="ViewBookingsServlet">View Bookings</a></li>
        </ul>
        <form action="logout.jsp" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
