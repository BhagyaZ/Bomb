<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/10/2025
  Time: 2:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="register&login.css?v=2">
</head>
<body>
<div class="card">
  <h2>Register</h2>
  <form action="/Bomb_war_exploded/UserRegisterServlet" method="post">
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
