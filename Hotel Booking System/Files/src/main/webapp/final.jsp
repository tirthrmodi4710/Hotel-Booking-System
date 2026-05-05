<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmed - Book Your Stay</title>
    <style>
        /* General page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .container {
            width: 70%;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #4CAF50;
            font-size: 2em;
            text-align: center;
            margin-bottom: 20px;
        }

        .hotel-details {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .hotel-details p {
            font-size: 1.2em;
            margin: 10px 0;
        }

        .hotel-details p strong {
            color: #333;
        }

        .price {
            font-size: 1.5em;
            color: #FF5722;
            font-weight: bold;
            margin-top: 10px;
        }

        form {
            text-align: center;
        }

        form input[type="hidden"] {
            display: none;
        }

        form button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            font-size: 1.2em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form button:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-size: 1.1em;
            margin-top: 20px;
            display: inline-block;
            text-align: center;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }

            h2 {
                font-size: 1.8em;
            }

            .hotel-details p {
                font-size: 1em;
            }

            .price {
                font-size: 1.3em;
            }

            form button {
                font-size: 1.1em;
            }
        }
    </style>
</head>
<body>
    <header>
        Book Your Stay
    </header>

    <div class="container">
        <h2>Booking Confirmation</h2>

        <div class="hotel-details">
            <p><strong>User:</strong> ${username}</p>
            <p><strong>Hotel:</strong> ${hotel}</p>
            <p><strong>Check-in Date:</strong> ${checkin}</p>
            <p><strong>Check-out Date:</strong> ${checkout}</p>
            <p class="price"><strong>Price:</strong> ${price} /-</p> <!-- Displaying the price -->
        </div>

        <form action="payment.jsp" method="post">
            <input type="hidden" name="username" value="${username}">
            <input type="hidden" name="hotel" value="${hotel}">
            <input type="hidden" name="checkin" value="${checkin}">
            <input type="hidden" name="checkout" value="${checkout}">
            <input type="hidden" name="price" value="${price}"> <!-- Hidden price field for payment -->
            <button type="submit">Proceed to Payment</button>
        </form>

        <a href="home.jsp">Back to Home</a>
    </div>
</body>
</html>
