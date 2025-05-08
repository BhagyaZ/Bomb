<%@ page import="bomb.DBConnectionPM" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="pmnavbar.jsp" %> <!-- Include navbar -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Delete Product Form</title>
  <link rel="stylesheet" href="addproductform.css">
</head>
<body>

<%

  String id=request.getParameter("id");

  DBConnectionPM DBUtil =  null;
  Connection conn = DBUtil.getConnection();
  String sql = "SELECT * FROM products WHERE product_id = ?";
  PreparedStatement stmt = conn.prepareStatement(sql);
  stmt.setString(1, id);
  ResultSet rs = stmt.executeQuery();

  String name = "";
  String category = "";
  String price = "";
  String quantity = "";
  String description = "";


  if(rs.next()) {
    name = rs.getString("name");
    category = rs.getString("category");
    price = rs.getString("price");
    quantity = rs.getString("quantity");
    description = rs.getString("description");
  }


%>

<main>
  <div class="form-container">
    <h2>Delete Product</h2>
    <form action="${pageContext.request.contextPath}/DeleteProductServlet" method="post">

      <label for="id">Product ID</label>
      <input type="text" id="id" name="id" value="<%=id%>" readonly>


      <label for="name">Product Name</label>
      <input type="text" id="name" name="name" value="<%=name%>"  readonly>

      <label for="category">Category</label>
      <input type="text" id="category" name="category" value="<%=category%>"  readonly>

      <label for="price">Price ($)</label>
      <input type="number" id="price" name="price" step="0.01" value="<%=price%>"  readonly>

      <label for="quantity">Quantity</label>
      <input type="number" id="quantity" name="quantity" value="<%=quantity%>"  readonly>

      <label for="description">Description</label>
      <textarea id="description" name="description" rows="4"><%=description%></textarea>

      <button type="submit">Delete</button>
    </form>
  </div>
</main>

<!-- Footer -->
<%-- Include footer --%>
<%@ include file="footer.jsp" %>

</body>
</html>

