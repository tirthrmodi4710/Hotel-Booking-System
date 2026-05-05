<%@ page import="java.sql.*, java.util.Random" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Your Stay</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/city_lights_inn.jpg'); /* Replace with the path to your image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: rgba(44, 62, 80, 0.85);
            color: white;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        header h1 {
            margin: 0;
            font-size: 32px;
        }

        .container {
            width: 90%;
            max-width: 900px;
            margin: 30px auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
            color: #34495e;
        }

        .hotel-option {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .hotel-option input[type="radio"] {
            margin-right: 10px;
        }

        .hotel-details {
            display: none;
            padding: 10px 15px;
            background-color: #f4f8fb;
            border-radius: 5px;
            margin-top: 5px;
            font-size: 14px;
        }

        .hotel-price {
            color: #27ae60;
            font-weight: bold;
            margin-top: 5px;
        }

        .form-group {
            margin: 20px 0;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="date"] {
            padding: 10px;
            width: 100%;
            max-width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button, input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover, input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .logout-form {
            margin-top: 20px;
            text-align: right;
        }

        @media (max-width: 600px) {
            .hotel-option {
                flex-direction: column;
                align-items: flex-start;
            }

            input[type="date"] {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>Book Your Stay</h1>
</header>

<div class="container">
    <h2>Welcome, ${sessionScope.username}!</h2>
    <p>Select a hotel and choose your check-in & check-out dates:</p>

    <form action="FinalServlet" method="post">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Update with new driver class
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_system", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT id, name, price FROM hotels");

                while(rs.next()) {
                    int hotelId = rs.getInt("id");
                    String hotelName = rs.getString("name");
                    int hotelPrice = rs.getInt("price"); // Retrieve the actual price from the database
                    String elementId = "hotel" + hotelId;
        %>
            <div class="hotel-option">
                <label>
                    <input type="radio" name="hotel" value="<%=hotelName%>" onclick="showHotelDetails('<%=elementId%>')" required>
                    <%=hotelName%> - Book Your Stay
                </label>
            </div>
            <div id="<%=elementId%>" class="hotel-details">
                Enjoy your stay at <strong><%=hotelName%></strong>!
                <div class="hotel-price"><%=hotelPrice%>/-</div>
            </div>
        <%
                }
                con.close();
            } catch(Exception e) {
                out.println("Database Error: " + e.getMessage());
            }
        %>

        <div class="form-group">
            <label for="checkin">Check-in Date:</label>
            <input type="date" name="checkin" required>
        </div>

        <div class="form-group">
            <label for="checkout">Check-out Date:</label>
            <input type="date" name="checkout" required>
        </div>

        <button type="submit">Confirm Booking</button>
    </form>

    <div class="logout-form">
        <form action="logout.jsp" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</div>

<script>
    function showHotelDetails(hotelId) {
        var details = document.getElementsByClassName("hotel-details");
        for (var i = 0; i < details.length; i++) {
            details[i].style.display = "none";
        }
        document.getElementById(hotelId).style.display = "block";
    }
</script>

</body>
</html>
