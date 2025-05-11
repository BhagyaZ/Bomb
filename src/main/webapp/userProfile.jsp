<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>

<%
  user.UserModel user = (user.UserModel) session.getAttribute("user");
  if (user == null) {
    // User is not logged in, redirect to login page
    response.sendRedirect("login.jsp");
    return;
  }
%>

<html>
<head>
  <title>User Profile</title>
  <link rel="stylesheet" href="userProfile.css?v=1">
</head>
<body>
<main class="profile-container">
  <h2>User Profile</h2>
  <div class="profile-card">
    <div class="profile-details">
      <p><strong>ID:</strong> <%= user.getId() %></p>
      <p><strong>Name:</strong> <%= user.getName() %></p>
      <p><strong>Email:</strong> <%= user.getEmail() %></p>
      <p><strong>Phone:</strong> <%= user.getPhone() != null ? user.getPhone() : "Not provided" %></p>
    </div>
  </div>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>
