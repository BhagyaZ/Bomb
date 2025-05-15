<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/10/2025
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="register&login.css?v=2">
  <script>
    function validateRegisterForm() {
      const username = document.forms["registerForm"]["username"].value.trim();
      const email = document.forms["registerForm"]["email"].value.trim();
      const password = document.forms["registerForm"]["password"].value;
      const phone = document.forms["registerForm"]["phone"].value.trim();

      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const phoneRegex = /^\d{10}$/;

      if (username === "") {
        alert("Username cannot be empty.");
        return false;
      }

      if (!emailRegex.test(email)) {
        alert("Please enter a valid email address.");
        return false;
      }

      if (password.length < 6) {
        alert("Password must be at least 6 characters.");
        return false;
      }

      if (!phoneRegex.test(phone)) {
        alert("Phone number must be 10 digits.");
        return false;
      }

      return true;
    }
  </script>
</head>
<body>
<div class="card">
  <h2>Register</h2>
  <form name="registerForm" action="/Bomb_war_exploded/UserRegisterServlet" method="post" onsubmit="return validateRegisterForm()">
    <input type="text" name="username" placeholder="Username" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="tel" name="phone" placeholder="Phone" required>
    <button type="submit">Register</button>
  </form>
  <p class="link">Already have an account? <a href="login.jsp">Login here</a></p>
</div>
</body>
</html>
