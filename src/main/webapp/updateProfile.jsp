<%@ page import="user.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page import="user.UserController" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/12/2025
  Time: 6:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="form-container">
  <div class="form-header">
    <h2>Update Profile</h2>
    <link rel="stylesheet" href="updateProfile.css?v=1">
  </div>

  <%
    String userId = request.getParameter("userID");

    if (userId != null && !userId.trim().isEmpty()) {
      List<UserModel> userList = UserController.getById(userId);
      UserModel user = userList.get(0);
  %>
  <form action="${pageContext.request.contextPath}/updateProfileServlet" class="form-body" method="post">
    <input type="hidden" id="userID" name="userID" value="<%= user.getId() %>">

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%= user.getName() %>" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>

    <label for="phone">Phone:</label>
    <input type="tel" id="phone" name="phone" value="<%= user.getPhone() %>" required>

    <div class="submit-container">
      <button type="submit">Update Profile</button>
    </div>
  </form>
  <%
  }
  %>

</div>

</body>
</html>
