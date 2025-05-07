<%--
  Created by IntelliJ IDEA.
  User: asusb
  Date: 5/7/2025
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="bomb.ProductController" %>
<%@ page import="bomb.ProductModel" %>
<%@ include file="pmnavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View All Products</title>
  <link rel="stylesheet" href="addproductform.css"> <!-- reuse same CSS -->
</head>
<body>

<main>
  <div class="form-container">
    <h2>Available Products</h2>
    <%
      List<ProductModel> products = ProductController.getAll();
      if (products == null || products.isEmpty()) {
    %>
    <p><strong>No products available.</strong></p>
    <%
    } else {
      for (ProductModel p : products) {
    %>
    <div style="margin-bottom: 20px; padding-bottom: 10px; border-bottom: 1px solid #ccc;">
      <p><strong>Name:</strong> <%= p.getName() %></p>
      <p><strong>Category:</strong> <%= p.getCategory() %></p>
      <p><strong>Price:</strong> Rs <%= p.getPrice() %></p>
      <p><strong>Quantity:</strong> <%= p.getQuantity() %></p>
      <p><strong>Description:</strong> <%= p.getDescription() %></p>
    </div>
    <%
        }
      }
    %>
    <button onclick="window.location.href='addproductform.jsp'">Add New Product</button>
  </div>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>

