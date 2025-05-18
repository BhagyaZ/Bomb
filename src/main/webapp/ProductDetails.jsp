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
  <link rel="stylesheet" href="addproductform.css">
  <style>
    .product-actions {
      margin-top: 10px;
    }
    .product-actions button {
      margin-right: 10px;
    }
  </style>
</head>
<body>

<main>
  <div class="form-container">
    <h2>Available Products</h2>
    <input type="text" id="searchInput" placeholder="search">
    <%
      List<ProductModel> products = ProductController.getAll();
      if (products == null || products.isEmpty()) {
    %>
    <p><strong>No products available.</strong></p>
    <%
    } else {
      for (ProductModel p : products) {
    %>
    <div class ="product-card" style="margin-bottom: 20px; padding-bottom: 10px; border-bottom: 1px solid #ccc;">
      <p><strong>Name:</strong> <%= p.getName() %></p>
      <p><strong>Category:</strong> <%= p.getCategory() %></p>
      <p><strong>Price:</strong> Rs <%= p.getPrice() %></p>
      <p><strong>Quantity:</strong> <%= p.getQuantity() %></p>
      <p><strong>Description:</strong> <%= p.getDescription() %></p>

      <div class="product-actions">
        <button onclick="window.location.href='editproductform.jsp?id=<%= p.getId() %>'">Edit</button>
        <button onclick="if(confirm('Are you sure you want to delete this product?')) window.location.href='deleteproduct.jsp?id=<%= p.getId() %>'">Delete</button>
      </div>
    </div>
    <%
        }
      }
    %>
    <button onclick="window.location.href='addproductform.jsp'">Add New Product</button>
  </div>
</main>

<%@ include file="footer.jsp" %>
<script>
  function filterDivs() {
    const input = document.getElementById("searchInput");
    const filter = input.value.toUpperCase();
    const cards = document.getElementsByClassName("product-card");

    for (let i = 0; i < cards.length; i++) {
      const card = cards[i];
      const text = card.textContent || card.innerText;

      if (text.toUpperCase().includes(filter)) {
        card.style.display = "";
      } else {
        card.style.display = "none";
      }
    }
  }

  window.onload = function () {
    document.getElementById("searchInput").addEventListener("input", filterDivs);
  }
</script>

<script>
  function filterDivs() {
    const input = document.getElementById("searchInput");
    const filter = input.value.toUpperCase();
    const cards = document.getElementsByClassName("product-card");

    for (let i = 0; i < cards.length; i++) {
      const card = cards[i];
      const text = card.textContent || card.innerText;

      if (text.toUpperCase().includes(filter)) {
        card.style.display = "";
      } else {
        card.style.display = "none";
      }
    }
  }

  window.onload = function () {
    document.getElementById("searchInput").addEventListener("input", filterDivs);
  }
</script>

</body>
</html>