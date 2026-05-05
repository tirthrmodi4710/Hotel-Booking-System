<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        .payment-option {
            margin: 15px 0;
        }
        label {
            font-size: 16px;
            color: #555;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #45a049;
        }
        .payment-details {
            display: none;
        }
        .payment-methods {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .payment-methods label {
            flex: 1;
            text-align: center;
            padding: 10px;
            background-color: #f0f0f0;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .payment-methods input {
            display: none;
        }
        .payment-methods label:hover {
            background-color: #ddd;
        }
        .payment-methods input:checked + label {
            background-color: #4CAF50;
            color: white;
        }
        #qrCodeImage {
            width: 200px;
            height: 200px;
            margin: 20px 0;
        }
        .details-section {
            margin-bottom: 20px;
        }
        .details-section p {
            font-size: 18px;
            color: #555;
        }
        .details-section strong {
            color: #2c3e50;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Payment for Booking</h2>

        <!-- Display booking details -->
        <div class="details-section">
            <p><strong>User:</strong> ${param.username}</p>
            <p><strong>Hotel:</strong> ${param.hotel}</p>
            <p><strong>Check-in Date:</strong> ${param.checkin}</p>
            <p><strong>Check-out Date:</strong> ${param.checkout}</p>
            <p><strong>Price:</strong> ${param.price}</p> <!-- Display price -->
        </div>

        <form action="PaymentServlet" method="post">
            <!-- Payment Method Selection -->
            <div class="payment-methods">
                <div class="payment-option">
                    <input type="radio" id="credit" name="paymentMode" value="credit" checked>
                    <label for="credit">Credit/Debit Card</label>
                </div>
                <div class="payment-option">
                    <input type="radio" id="upi" name="paymentMode" value="upi">
                    <label for="upi">UPI Payment</label>
                </div>
                <div class="payment-option">
                    <input type="radio" id="qr" name="paymentMode" value="qr">
                    <label for="qr">QR Code Payment</label>
                </div>
            </div>

            <!-- Credit/Debit Card Payment -->
            <div id="cardPaymentDetails" class="payment-details">
                <p>Amount: <input type="text" name="amount" value="${param.price}" readonly><br><br></p>
                <p>Card Number: <input type="text" name="cardNumber" required><br><br></p>
                <p>CVV: <input type="password" name="cvv" required><br><br></p>
            </div>

            <!-- UPI Payment -->
            <div id="upiPaymentDetails" class="payment-details">
                <p>UPI ID: <input type="text" name="upiId" required><br><br></p>
            </div>

            <!-- QR Code Payment -->
            <div id="qrPaymentDetails" class="payment-details">
                <p>Scan this QR Code to make payment:</p>
                <img id="qrCodeImage" src="" alt="QR Code" style="display:none;"><br><br>
            </div>

            <button type="submit">Make Payment</button>
        </form>
    </div>

    <script>
        const radioButtons = document.getElementsByName('paymentMode');
        const cardPaymentDetails = document.getElementById('cardPaymentDetails');
        const upiPaymentDetails = document.getElementById('upiPaymentDetails');
        const qrPaymentDetails = document.getElementById('qrPaymentDetails');
        const qrCodeImage = document.getElementById('qrCodeImage');

        // Event listener for payment mode selection
        radioButtons.forEach(radio => {
            radio.addEventListener('change', (event) => {
                const selectedMode = event.target.value;

                // Hide all payment options
                cardPaymentDetails.style.display = 'none';
                upiPaymentDetails.style.display = 'none';
                qrPaymentDetails.style.display = 'none';
                qrCodeImage.style.display = 'none';

                // Show the selected payment option
                if (selectedMode === 'credit') {
                    cardPaymentDetails.style.display = 'block';
                } else if (selectedMode === 'upi') {
                    upiPaymentDetails.style.display = 'block';
                } else if (selectedMode === 'qr') {
                    qrPaymentDetails.style.display = 'block';
                    generateQRCode(); // Generate the QR code dynamically
                }
            });
        });

        function generateQRCode() {
            // Here, you would generate a QR code URL or string for payment.
            // For example, let's assume we generate a URL:
            const qrURL = "https://paymentgateway.com/pay?amount=" + ${param.price} + "&transactionId=xyz123";
            qrCodeImage.src = "https://api.qrserver.com/v1/create-qr-code/?data=" + encodeURIComponent(qrURL) + "&size=200x200";
            qrCodeImage.style.display = 'block';
        }
    </script>

</body>
</html>
