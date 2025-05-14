<%--
  Created by IntelliJ IDEA.
  User: Bawan
  Date: 11/05/2025
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="navbar.jsp" %> <!-- Include navbar -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="customerpayment.css">  <!-- Link to your CSS -->
    <script src="payment.js"></script>  <!-- Link to your JS for payment validation -->
</head>
<body>

<div class="container">
    <h2>Enter Payment Details</h2>

    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
    <p style="color: <%= message.contains("?") ? "green" : "red" %>; font-weight: bold;">
        <%= message %>
    </p>
    <% } %>


    <form action="PaymentServlet" method="POST" class="payment-form">
        <input type="hidden" name="action" value="payment">

        <div class="form-group">
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="account_number"
                   pattern="\d{10}" maxlength="10"
                   title="Card number must be exactly 10 digits" required>

        </div>

        <div class="form-group">
            <label for="cardType">Card Type:</label>
            <select id="cardType" name="card_type">
                <option value="Visa">Visa</option>
                <option value="Master">Master</option>
            </select>
        </div>

        <div class="form-group">
            <label for="expiryDate">Expiry Date:</label>
            <input type="text" id="expiryDate" name="expirydate"
                   pattern="(0[1-9]|1[0-2])\/\d{2}" placeholder="MM/YY"
                   title="Enter expiry date in MM/YY format" required>

        </div>

        <div class="form-group">
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv"
                   pattern="\d{3}" maxlength="3"
                   title="CVV must be exactly 3 digits" required>

        </div>

        <div class="form-group">
            <label for="pin">PIN:</label>
            <input type="text" id="pin" name="pin"
                   pattern="\d{4}" maxlength="4"
                   title="PIN must be exactly 4 digits" required>

        </div>

        <div class="form-group">
            <label for="securityPin">Security Pin:</label>
            <input type="text" id="securityPin" name="security_pin"
                   pattern="\d{4}" maxlength="4"
                   title="Security Pin must be exactly 4 digits" required>

        </div>

        <div class="form-group">
            <input type="submit" value="Submit Payment" class="submit-btn">
        </div>
    </form>
</div>

<!-- Popup for Payment Status -->
<div id="popup" class="popup">
    <p id="popupMessage"></p>
    <button onclick="closePopup()">Close</button>
</div>

<script>
    // Show the popup based on the payment result
    window.onload = function() {
        var paymentStatus = "<%= request.getAttribute("paymentStatus") %>";  // Use double quotes inside JSP expression

        // Only show the popup if paymentStatus is set to 'success' or 'failure'
        if (paymentStatus === "success") {
            document.getElementById("popupMessage").innerText = "Payment Successful!";
            document.getElementById("popup").style.display = "block";
        } else if (paymentStatus === "failure") {
            document.getElementById("popupMessage").innerText = "Payment Failed. Please try again.";
            document.getElementById("popup").style.display = "block";
        }
    };

    // Close the popup
    function closePopup() {
        document.getElementById("popup").style.display = "none";
    }


    document.querySelector(".payment-form").addEventListener("submit", function(e) {
        const card = document.getElementById("cardNumber").value;
        const cvv = document.getElementById("cvv").value;
        const pin = document.getElementById("pin").value;
        const secPin = document.getElementById("securityPin").value;
        const exp = document.getElementById("expiryDate").value;

        const cardPattern = /^\d{10}$/;
        const cvvPattern = /^\d{3}$/;
        const pinPattern = /^\d{4}$/;
        const expPattern = /^(0[1-9]|1[0-2])\/\d{2}$/;

        if (!cardPattern.test(card) || !cvvPattern.test(cvv) || !pinPattern.test(pin) || !pinPattern.test(secPin) || !expPattern.test(exp)) {
            alert("Please ensure all fields are correctly formatted.");
            e.preventDefault();
        }
    });
</script>



<%@ include file="/footer.jsp" %>
</body>
</html>
