<%@ include file="pmnavbar.jsp" %> <!-- Include navbar -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Product Form</title>
  <link rel="stylesheet" href="addproductform.css">
</head>
<body>

<%

  String id=request.getParameter("id");
  String name=request.getParameter("name");
  String category=request.getParameter("category");
  String price=request.getParameter("price");
  String quantity=request.getParameter("quantity");
  String description=request.getParameter("description");


%>






<main>
  <div class="form-container">
    <h2>Edit Product</h2>
    <form action="${pageContext.request.contextPath}/UpdateProductsServlet" method="post">

      <label for="id">Product ID</label>
      <input type="text" id="id" name="id" value="<%=id%>" readonly>


      <label for="name">Product Name</label>
      <input type="text" id="name" name="name" value="<%=name%>"  required>

      <label for="category">Category</label>
      <input type="text" id="category" name="category" value="<%=category%>"  required>

      <label for="price">Price ($)</label>
      <input type="number" id="price" name="price" step="0.01" value="<%=price%>"  required>

      <label for="quantity">Quantity</label>
      <input type="number" id="quantity" name="quantity" value="<%=quantity%>"  required>

      <label for="description">Description</label>
      <textarea id="description" name="description" value="<%=description%>"  rows="4"></textarea>

      <button type="submit">Save changes</button>
    </form>
  </div>
</main>

<!-- Footer -->
<%-- Include footer --%>
<%@ include file="footer.jsp" %>

</body>
</html>

