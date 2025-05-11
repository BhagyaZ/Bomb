<%@ page import="bomb.CustomerModel" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Bawan
  Date: 12/05/2025
  Time: 02:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- reviewshippingdetails.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Review</title>
    <link rel="stylesheet" href="orderreview.css">
    <script src="orderreview.js" defer></script>
</head>
<body>
<div class="container">
    <h2>Order Review</h2>
    <div class="accordion-container">
        <%
            List<CustomerModel> allShipping = (List<bomb.CustomerModel>) request.getAttribute("allShipping");
            if (allShipping != null) {
                for (bomb.CustomerModel c : allShipping) {
        %>
        <div class="accordion">
            <div class="accordion-header">
                <p>Order ID: <%= c.getShippingId() %> | Recipient: <%= c.getRecipientName() %> | City: <%= c.getCity() %></p>
                <button class="toggle-btn">View Details</button>
            </div>
            <div class="accordion-body">
                <p><strong>Address:</strong> <%= c.getRecipientAddress() %></p>
                <p><strong>Recipient Contact:</strong> <%= c.getRecipientContactNo() %></p>
                <p><strong>Sender Contact:</strong> <%= c.getSenderContactNo() %></p>
                <p><strong>Shipping Method:</strong> <%= c.getShippingMethod() %></p>
                <p><strong>Delivery Date:</strong> <%= c.getDeliveryDate() %></p>
                <p><strong>Message:</strong> <%= c.getPersonalMsg() %></p>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>

