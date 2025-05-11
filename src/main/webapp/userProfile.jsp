<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>

<%
<<<<<<< HEAD
  user.UserModel user = (user.UserModel) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
=======

  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String phone = request.getParameter("phone");

  // Fallback defaults for testing directly
//  if (name == null) name = "DemoUser";
//  if (email == null) email = "demo@example.com";
//  if (password == null) password = "********";
//  if (phone == null) phone = "+1 000 000 0000";
>>>>>>> 1db4f7c74d59c7f19e4a953e7abd6c8b43843c10
%>

<html>
<head>
  <title>User Profile</title>
<<<<<<< HEAD
  <link rel="stylesheet" href="userProfile.css?v=3">
=======
  <link rel="stylesheet" href="userProfile.css">
>>>>>>> 1db4f7c74d59c7f19e4a953e7abd6c8b43843c10
</head>
<body>
<main class="profile-container">
  <div class="profile-card">
<<<<<<< HEAD
    <div class="profile-avatar"></div>

    <div class="profile-details">
      <h2><%= user.getName() %></h2>
      <p><strong>ID:</strong> <%= user.getId() %></p>
      <p><strong>Email:</strong> <%= user.getEmail() %></p>
      <p><strong>Phone:</strong> <%= user.getPhone() != null ? user.getPhone() : "Not provided" %></p>
      <a href="addCardDetails.jsp" class="btn card-btn">Add Card Details</a>
    </div>

    <div class="profile-actions">
      <a href="updateProfile.jsp" class="btn update-btn">Update Profile</a>
      <a href="deleteProfileServlet?id=<%= user.getId() %>" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete your profile?');">Delete Profile</a>
=======

    <div class="profile-details">
      <p><strong>Name:</strong> <%= name %></p>
      <p><strong>Email:</strong> <%= email %></p>
      <p><strong>Password:</strong> <%= password %></p>
      <p><strong>Phone:</strong> <%= phone %></p>
>>>>>>> 1db4f7c74d59c7f19e4a953e7abd6c8b43843c10
    </div>
  </div>
</main>
<%@ include file="footer.jsp" %>
<script>
  const name = `<%= user.getName() %>`.trim();
  const initials = name.split(" ").map(word => word[0]).slice(0, 2).join("").toUpperCase();
  document.querySelector('.profile-avatar').textContent = initials;
</script>
</body>
</html>
