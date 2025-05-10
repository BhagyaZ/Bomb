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
  <title>Login</title>
  <link rel="stylesheet" href="register&login.css?v=2">
</head>
<body>
<div class="card">
  <h2>Login</h2>
  <form action="/Bomb_war_exploded/UserRegisterServlet" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
  </form>
  <p class="link">Don't have an account? <a href="register.jsp">Register here</a></p>
</div>
</body>
</html>
