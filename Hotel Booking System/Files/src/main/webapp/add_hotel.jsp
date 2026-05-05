<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Hotel</title>
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

        .form-container {
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

        form label {
            display: block;
            margin: 15px 0 5px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #2ecc71;
            border: none;
            color: white;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #27ae60;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #3498db;
            text-decoration: none;
        }

        .back-link:hover {
            color: #2c3e50;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Hotel</h2>
        <form action="AddHotelServlet" method="post">
            <label for="name">Hotel Name:</label>
            <input type="text" name="name" required>

            <label for="city">City:</label>
            <input type="text" name="city" required>

            <label for="price">Price (per day):</label>
            <input type="number" name="price" required>

            <input type="submit" value="Add Hotel">
        </form>
        <a class="back-link" href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
