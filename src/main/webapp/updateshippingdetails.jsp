<%--
  Created by IntelliJ IDEA.
  User: Bawan
  Date: 11/05/2025
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Details</title>
    <link rel="stylesheet" href="updateshippingdetails.css?v=1">
</head>
<body>

<%
    int shippingId = Integer.parseInt(request.getParameter("shippingId"));
    String recipientName = request.getParameter("recipientName");
    String recipientAddress = request.getParameter("recipientAddress");
    String city = request.getParameter("city");
    int recipientContactNo = Integer.parseInt(request.getParameter("recipientContactNo"));
    int senderContactNo = Integer.parseInt(request.getParameter("senderContactNo"));
    String shippingMethod = request.getParameter("shippingMethod");
    String deliveryDate = request.getParameter("deliveryDate");
    String personalMsg = request.getParameter("personalMsg");
%>

<div class="form-container">
    <h2>Update Shipping Details</h2>
    <form action="UpdateCustomerServlet" method="post">

        <label for="recipientName">Shipping ID</label>
        <input type="text" id="shippingId" name="shippingId" value="<%=shippingId%>" readonly>


        <label for="recipientName">Recipient Name</label>
        <input type="text" id="recipientName" name="recipientName" value="<%=recipientName%>" required>

        <label for="recipientAddress">Recipient Address</label>
        <textarea id="recipientAddress" name="recipientAddress" rows="3" required><%=recipientAddress%></textarea>

        <label for="city">City</label>
        <input type="text" id="city" name="city" value="<%=city%>" required>

        <label for="recipientContactNo">Recipient Contact No</label>
        <input type="tel" id="recipientContactNo" name="recipientContactNo" value="<%=recipientContactNo%>" required>

        <label for="senderContactNo">Sender Contact No</label>
        <input type="tel" id="senderContactNo" name="senderContactNo" value="<%=senderContactNo%>" required>

        <label for="shippingMethod">Shipping Method</label>
        <select id="shippingMethod" name="shippingMethod" value="<%=shippingMethod%>" required>
            <option value="Standard">Standard</option>
            <option value="Express">Express</option>
            <option value="Same Day">Same Day</option>
        </select>

        <label for="deliveryDate">Delivery Date</label>
        <input type="date" id="deliveryDate" name="deliveryDate" value="<%=deliveryDate%>" required>

        <label for="personalMsg">Personal Message</label>
        <textarea id="personalMsg" name="personalMsg" rows="3"><%=personalMsg%></textarea>

        <!--   <label for="date">Order Date & Time</label>
          <input type="datetime-local" id="date" name="date" required> -->
        <%--    <form action="getAllShippingDetails" method="post">--%>
        <button type="submit">Update Details</button>
        <%--    </form>--%>
    </form>
</div>


</body>
</html>
