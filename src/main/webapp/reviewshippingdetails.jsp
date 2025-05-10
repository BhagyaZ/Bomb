<%@ page import="bomb.CustomerModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Review Shipping Details</title>
    <link rel="stylesheet" href="reviewshippingdetails.css?v=1">
</head>
<body>
<div class="body-container">
    <div class="page-title">
        <h2>Review Shipping Details</h2>
    </div>

    <div class="shipping-container">
        <%
            List<CustomerModel> shippingList = (List<CustomerModel>) request.getAttribute("allBOMB");
            if (shippingList == null || shippingList.isEmpty()) {
        %>
        <p><strong>No Shipping Details Available.</strong></p>
        <%
        } else {
            for (CustomerModel ship : shippingList) {
        %>
        <ul>
            <li>
                <div class="shipping-item">
                    <div class="shipping-id"><%= ship.getShippingId() %>.</div>
                    <div class="shipping-recipient"><strong>Recipient:</strong> <%= ship.getRecipientName() %></div>
                    <div class="shipping-address"><strong>Address:</strong> <%= ship.getRecipientAdress() %>, <%= ship.getCity() %></div>
                    <div class="shipping-contacts">
                        <strong>Recipient Contact:</strong> <%= ship.getRecipientContactNo() %> |
                        <strong>Sender Contact:</strong> <%= ship.getSenderContactNo() %>
                    </div>
                    <div class="shipping-method"><strong>Method:</strong> <%= ship.getShippingMethod() %></div>
                    <div class="shipping-dates">
                        <strong>Delivery Date:</strong> <%= ship.getDeliveryDate() %> |
                        <strong>Created Date:</strong> <%= ship.getDate() %>
                    </div>
                    <div class="shipping-message"><strong>Message:</strong> <%= ship.getPersonalMsg() %></div>
                </div>
            </li>
        </ul>
        <%
                }
            }
        %>
    </div>
</div>

</body>
</html>
