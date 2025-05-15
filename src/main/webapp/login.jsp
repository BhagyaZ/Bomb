<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/10/2025
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="register&login.css?v=2">

  <script>
    function validateLoginForm() {
      const username = document.forms["loginForm"]["username"].value.trim();
      const password = document.forms["loginForm"]["password"].value;

      if (username === "") {
        alert("Username cannot be empty.");
        return false;
      }

      if (password === "") {
        alert("Password cannot be empty.");
        return false;
      }

      if (password.length < 6) {
        alert("Password must be at least 6 characters.");
        return false;
      }

      return true;
    }
  </script>
</head>
<body>
<div class="card">
  <h2>Login</h2>
  <form name="loginForm" action="/Bomb_war_exploded/UserLoginServlet" method="post" onsubmit="return validateLoginForm()">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
  </form>

  <% if (request.getAttribute("error") != null) { %>
  <p style="color:red;"><%= request.getAttribute("error") %></p>
  <% } %>

  <p class="link">Don't have an account? <a href="register.jsp">Register here</a></p>
</div>
</body>
</html>
