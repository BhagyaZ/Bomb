<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bomb.CustomerModel" %>
<%@ page import="java.util.List, bomb.CustomerModel" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shipping Details</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h2>Shipping Records</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Recipient</th>
        <th>Address</th>
        <th>City</th>
        <th>Recipient Phone</th>
        <th>Sender Phone</th>
        <th>Method</th>
        <th>Delivery Date</th>
        <th>Personal Message</th>
    </tr>

    <%
        List<CustomerModel> shippingList = (List<CustomerModel>) request.getAttribute("allShipping");
        if (shippingList != null) {
            for (CustomerModel item : shippingList) {
    %>
    <tr>
        <td><%= item.getShippingId() %></td>
        <td><%= item.getRecipientName() %></td>
        <td><%= item.getRecipientAddress() %></td>
        <td><%= item.getCity() %></td>
        <td><%= item.getRecipientContactNo() %></td>
        <td><%= item.getSenderContactNo() %></td>
        <td><%= item.getShippingMethod() %></td>
        <td><%= item.getDeliveryDate() %></td>
        <td><%= item.getPersonalMsg() %></td>
    </tr>
    <%
            }
        }
    %>
</table>

<div style="margin-top: 20px;">
    <a href="shippingdetails.jsp">Back to Shipping Form</a>
</div>
</body>
</html>