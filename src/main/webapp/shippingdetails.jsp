<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/10/2025
  Time: 12:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Insert Shipping Details</title>
  <link rel="stylesheet" href="shippingdetails.css?v=1">
</head>
<body>
<div class="form-container">
  <h2>Insert Shipping Details</h2>
  <form action="<%= request.getContextPath() %>/CustomerInsertServlet" method="post">

  <label for="recipientName">Recipient Name</label>
    <input type="text" id="recipientName" name="recipientName" required>

    <label for="recipientAddress">Recipient Address</label>
    <textarea id="recipientAddress" name="recipientAddress" rows="3" required></textarea>

    <label for="city">City</label>
    <input type="text" id="city" name="city" required>

    <label for="recipientContactNo">Recipient Contact No</label>
    <input type="tel" id="recipientContactNo" name="recipientContactNo" required>

    <label for="senderContactNo">Sender Contact No</label>
    <input type="tel" id="senderContactNo" name="senderContactNo" required>

    <label for="shippingMethod">Shipping Method</label>
    <select id="shippingMethod" name="shippingMethod" required>
      <option value="Standard">Standard</option>
      <option value="Express">Express</option>
      <option value="Same Day">Same Day</option>
    </select>

    <label for="deliveryDate">Delivery Date</label>
    <input type="date" id="deliveryDate" name="deliveryDate" required>

    <label for="personalMsg">Personal Message</label>
    <textarea id="personalMsg" name="personalMsg" rows="3"></textarea>

    <!--   <label for="date">Order Date & Time</label>
      <input type="datetime-local" id="date" name="date" required> -->
<%--    <form action="getAllShippingDetails" method="post">--%>
      <button type="submit">Insert Details</button>
<%--    </form>--%>
  </form>
</div>
</body>
</html>
