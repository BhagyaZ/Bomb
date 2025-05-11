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
<<<<<<< HEAD
        <th>Personal Message</th>
        <th>Action</th>

=======
>>>>>>> d2076dfa6e1c74dc4893bc6a603fa0acdd8c1e3e
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
<<<<<<< HEAD
        <td><%= item.getPersonalMsg() %></td>
        <td> <a href="updateshippingdetails.jsp?shippingId=<%= item.getShippingId() %>
&recipientName=<%= java.net.URLEncoder.encode(item.getRecipientName(), "UTF-8") %>
&recipientAddress=<%= java.net.URLEncoder.encode(item.getRecipientAddress(), "UTF-8") %>
&city=<%= java.net.URLEncoder.encode(item.getCity(), "UTF-8") %>
&recipientContactNo=<%= item.getRecipientContactNo() %>
&senderContactNo=<%= item.getSenderContactNo() %>
&shippingMethod=<%= java.net.URLEncoder.encode(item.getShippingMethod(), "UTF-8") %>
&deliveryDate=<%= java.net.URLEncoder.encode(item.getDeliveryDate(), "UTF-8") %>
&personalMsg=<%= java.net.URLEncoder.encode(item.getPersonalMsg(), "UTF-8") %>">
            update details
        </a>

        </td>
=======
>>>>>>> d2076dfa6e1c74dc4893bc6a603fa0acdd8c1e3e
    </tr>
    <%
            }
        }
    %>
</table>

<div style="margin-top: 20px;">
   <a href="customerpayment.jsp">Continue</a>
</div>
</body>
</html>