<%@ include file="pmnavbar.jsp" %> <!-- Include navbar -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Product Form</title>
  <link rel="stylesheet" href="addproductform.css">
</head>
<body>



<!-- Main Form Section -->
<main>
  <div class="form-container">
    <h2>Add New Product</h2>
    <form action="#" method="post">
      <label for="name">Product Name</label>
      <input type="text" id="name" name="name" required>

      <label for="category">Category</label>
      <input type="text" id="category" name="category" required>

      <label for="price">Price ($)</label>
      <input type="number" id="price" name="price" step="0.01" required>

      <label for="quantity">Quantity</label>
      <input type="number" id="quantity" name="quantity" required>

      <label for="description">Description</label>
      <textarea id="description" name="description" rows="4"></textarea>

      <button type="submit">Add Product</button>
    </form>
  </div>
</main>

<!-- Footer -->
<%-- Include footer --%>
<%@ include file="footer.jsp" %>

</body>
</html>
