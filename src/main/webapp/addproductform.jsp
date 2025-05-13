<%@ include file="pmnavbar.jsp" %> <!-- Include navbar -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Product Form</title>
  <link rel="stylesheet" href="addproductform.css">
  <script>
    function validateForm() {
      const name = document.getElementById("name").value.trim();
      const category = document.getElementById("category").value.trim();
      const price = parseFloat(document.getElementById("price").value);
      const quantity = parseInt(document.getElementById("quantity").value);
      const description = document.getElementById("description").value.trim();

      if (name.length < 2) {
        alert("Product name must be at least 2 characters long.");
        return false;
      }

      if (category.length < 3) {
        alert("Category must be at least 3 characters long.");
        return false;
      }

      if (isNaN(price) || price <= 0) {
        alert("Please enter a valid price greater than 0.");
        return false;
      }

      if (isNaN(quantity) || quantity < 1) {
        alert("Quantity must be at least 1.");
        return false;
      }

      if (description.length > 500) {
        alert("Description can't be longer than 500 characters.");
        return false;
      }

      return true; // allow form submission
    }
  </script>
</head>
<body>

<!-- Main Form Section -->
<main>
  <div class="form-container">
    <h2>Add New Product</h2>
    <form action="${pageContext.request.contextPath}/InsertProductServlet" method="post" onsubmit="return validateForm();">
      <label for="name">Product Name</label>
      <input type="text" id="name" name="name" required minlength="2" maxlength="100">

      <label for="category">Category</label>
      <input type="text" id="category" name="category" required minlength="3" maxlength="50">

      <label for="price">Price </label>
      <input type="number" id="price" name="price" step="0.01" min="0.01" required>

      <label for="quantity">Quantity</label>
      <input type="number" id="quantity" name="quantity" min="1" required>

      <label for="description">Description</label>
      <textarea id="description" name="description" rows="4" maxlength="500" placeholder="Max 500 characters..."></textarea>

      <button type="submit">Add Product</button>
    </form>
  </div>
</main>

<!-- Footer -->
<%@ include file="footer.jsp" %>

</body>
</html>
