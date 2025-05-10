<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>

<%
  String name = request.getParameter("name");  // renamed to 'name' for clarity
  String email = request.getParameter("email");
  String password = request.getParameter("password"); // assuming you pass it too
  String phone = request.getParameter("phone");

  // Fallback defaults for testing directly
  if (name == null) name = "DemoUser";
  if (email == null) email = "demo@example.com";
  if (password == null) password = "********";
  if (phone == null) phone = "+1 000 000 0000";
%>

<html>
<head>
  <title>User Profile</title>
  <link rel="stylesheet" href="userProfile.css">
</head>
<body>
<main class="profile-container">
  <h2>User Profile</h2>
  <div class="profile-card">

    <div class="profile-details">
      <p><strong>Name:</strong> <%= name %></p>
      <p><strong>Email:</strong> <%= email %></p>
      <p><strong>Password:</strong> <%= password %></p>
      <p><strong>Phone:</strong> <%= phone %></p>
    </div>
  </div>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>
