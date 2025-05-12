<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="bomb.CustomerModel" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shipping Details</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 40px;
            background: linear-gradient(135deg, #f0f4f8, #d9e4f5);
        }

        .container {
            display: flex;
            gap: 30px;
            justify-content: center;
            align-items: flex-start;
            flex-wrap: wrap;
        }

        /* Shipping Info Section */
        .shipping-info, .order-summary {
            background: #ffffff;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 650px;
            flex: 1 1 500px;
        }

        h2, h3 {
            margin-bottom: 20px;
            color: #2c3e50;
            border-bottom: 2px solid #eee;
            padding-bottom: 8px;
        }

        /* List Style for Shipping Details */
        .shipping-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .shipping-item {
            background: #f9fafb;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .shipping-item h3 {
            margin-top: 0;
            font-size: 18px;
            color: #333;
        }

        .shipping-item p {
            margin: 8px 0;
            color: #555;
        }

        /* Button Styles */
        a.btn-update-details {
            display: inline-block;
            background-color: #0077cc;
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 12px;
            transition: background-color 0.3s ease;
        }

        a.btn-update-details:hover {
            background-color: #005fa3;
        }

        /* Button Styles for Continue */
        a.btn-continue {
            display: inline-block;
            margin-top: 20px;
            background-color: #0077cc;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a.btn-continue:hover {
            background-color: #005fa3;
        }

        .btn-right {
            text-align: right;
            margin-top: 20px;
        }


        /* Order Summary Styles */
        .order-summary p {
            font-size: 15px;
            margin: 12px 0;
            color: #444;
        }

        .order-summary strong {
            font-size: 17px;
            color: #e91e63;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Shipping Info Section -->
    <div class="shipping-info">
        <h2>Shipping Details</h2>
        <ul class="shipping-list">
            <%
                List<CustomerModel> shippingList = (List<CustomerModel>) request.getAttribute("allShipping");
                if (shippingList != null) {
                    for (CustomerModel item : shippingList) {
            %>
            <li class="shipping-item">
                <h3>Shipping ID: <%= item.getShippingId() %></h3>
                <p><strong>Recipient:</strong> <%= item.getRecipientName() %></p>
                <p><strong>Address:</strong> <%= item.getRecipientAddress() %></p>
                <p><strong>City:</strong> <%= item.getCity() %></p>
                <p><strong>Recipient Phone:</strong> <%= item.getRecipientContactNo() %></p>
                <p><strong>Sender Phone:</strong> <%= item.getSenderContactNo() %></p>
                <p><strong>Shipping Method:</strong> <%= item.getShippingMethod() %></p>
                <p><strong>Delivery Date:</strong> <%= item.getDeliveryDate() %></p>
                <p><strong>Personal Message:</strong> <%= item.getPersonalMsg() %></p>
                <p><a class="btn-update-details" href="updateshippingdetails.jsp?shippingId=<%= item.getShippingId() %>
                            &recipientName=<%= java.net.URLEncoder.encode(item.getRecipientName(), "UTF-8") %>
                            &recipientAddress=<%= java.net.URLEncoder.encode(item.getRecipientAddress(), "UTF-8") %>
                            &city=<%= java.net.URLEncoder.encode(item.getCity(), "UTF-8") %>
                            &recipientContactNo=<%= item.getRecipientContactNo() %>
                            &senderContactNo=<%= item.getSenderContactNo() %>
                            &shippingMethod=<%= java.net.URLEncoder.encode(item.getShippingMethod(), "UTF-8") %>
                            &deliveryDate=<%= java.net.URLEncoder.encode(item.getDeliveryDate(), "UTF-8") %>
                            &personalMsg=<%= java.net.URLEncoder.encode(item.getPersonalMsg(), "UTF-8") %>">Update Details</a></p>
            </li>
            <%
                    }
                }
            %>
        </ul>
        <!--<a class="btn-continue" href="customerpayment.jsp">Continue</a> -->

        <div class="btn-right">
            <a class="btn-continue" href="customerpayment.jsp">Continue</a>
        </div>


    </div>

    <!-- Order Summary Section -->
    <div class="order-summary">
        <h3>Order Summary</h3>
        <p>Product: Custom Gift Box</p>
        <p>Shipping Price: Rs. 350.00</p>
        <p>Tax: Rs. 50.00</p>
        <p><strong>Total: Rs. 400.00</strong></p>
    </div>
</div>
</body>
</html>
