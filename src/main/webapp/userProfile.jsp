<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>

<%
  user.UserModel user = (user.UserModel) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>

<html>
<head>
  <title>User Profile</title>
  <link rel="stylesheet" href="userProfile.css?v=3">
</head>
<body>
<main class="profile-container">
  <div class="profile-card">
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
