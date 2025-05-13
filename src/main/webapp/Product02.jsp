<%--
  Created by IntelliJ IDEA.
  User: Bawan
  Date: 13/05/2025
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="navbar.jsp" %> <!-- Include navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details - 500GB NVMe SSD Gen4</title>
    <link rel="stylesheet" href="Product01.css">
</head>
<body>

<section class="product-detail">
    <div class="product-container">
        <div class="product-image">
            <img src="images/nvme-ssd.jpg" alt="SSD Image">
        </div>

        <div class="product-info">
            <h1 class="product-name">500GB NVMe SSD Gen4</h1>
            <p class="product-code">Product Code: COMPSSDGEN4500</p>
            <p class="product-price">Rs. 13,500.00</p>

            <div class="product-quantity">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" min="1" value="1">
            </div>

            <div class="product-buttons">
                <button class="add-to-cart">Add to Cart</button>

                <form action="shippingdetails.jsp" method="get">
                    <input type="hidden" name="productName" value="500GB NVMe SSD Gen4">
                    <input type="hidden" name="productCode" value="COMPSSDGEN4500">
                    <input type="hidden" name="productPrice" value="13500.00">
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
                    Experience lightning-fast boot times and application loading with this 500GB Gen4 NVMe SSD.
                    Ideal for gamers and professionals needing superior performance and reliability.
                </p>
            </div>
        </div>
    </div>
</section>

<%@ include file="/footer.jsp" %>

</body>
</html>

