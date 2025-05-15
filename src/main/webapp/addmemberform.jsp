<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/3/2025
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Session check --%>
<%@ page import="user.UserModel" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="addmemberform.css">
</head>
<body>
<div class="form-container">
    <form class="add-member-form">
        <div class="form-header"><h2>Add a new User</h2></div>
        <div class="form-body">
            <label for="regNo">Registration No:</label>
            <input type="text" id="regNo" name="regNo" placeholder="Enter registration number" required>

            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="fname" placeholder="Enter first name" required>

            <label for="lname">Last Name:</label>
            <input type="text" id="lname" name="lname" placeholder="Enter last name" required>

            <label for="uname">User Name:</label>
            <input type="text" id="uname" name="uname" placeholder="Enter username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <label for="bAddress">Billing Address:</label>
            <input type="text" id="bAddress" name="bAddress" placeholder="Enter billing address" required>

            <label for="sAddress">Shipping Address:</label>
            <input type="text" id="sAddress" name="sAddress" placeholder="Enter shipping address" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter email address" required>

            <label for="telNo">Contact No:</label>
            <input type="tel" id="telNo" name="telNo" placeholder="Enter contact number" required>

            <div class="submit-container">
                <button type="submit" id="submit" name="submit">Submit</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
