<%--
  Created by IntelliJ IDEA.
  User: Bawan
  Date: 13/05/2025
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %> <!-- Include navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details - Mechanical Gaming Keyboard MK500</title>
    <link rel="stylesheet" href="Product01.css">
</head>
<body>

<section class="product-detail">
    <div class="product-container">
        <div class="product-image">
            <img src="images/desktop1.jpeg" alt="Keyboard Image">
        </div>

        <div class="product-info">
            <h1 class="product-name">Mechanical Gaming Keyboard MK500</h1>
            <p class="product-code">Product Code: COMPKEYMK500</p>
            <p class="product-price">Rs. 11,990.00</p>

            <div class="product-quantity">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" min="1" value="1">
            </div>

            <div class="product-buttons">
                <button class="add-to-cart">Add to Cart</button>

                <form action="shippingdetails.jsp" method="get">
                    <input type="hidden" name="productName" value="Mechanical Gaming Keyboard MK500">
                    <input type="hidden" name="productCode" value="COMPKEYMK500">
                    <input type="hidden" name="productPrice" value="11990.00">
                    <input type="hidden" name="quantity" id="formQuantity" value="1">
                    <button type="submit" class="buy-now">Buy Now</button>
                </form>

                <script>
                    document.getElementById("quantity").addEventListener("input", function() {
                        document.getElementById("formQuantity").value = this.value;
                    });
                </script>
            </div>

            <div class="product-description">
                <h3>Description</h3>
                <p>
                    Enjoy responsive mechanical switches and vibrant RGB backlighting with the MK500.
                    Perfect for gamers and typists who demand durability, comfort, and performance.
                </p>
            </div>
        </div>
    </div>
</section>

<%@ include file="/footer.jsp" %>

</body>
</html>

