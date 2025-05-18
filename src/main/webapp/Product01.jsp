<%-- Session check --%>
<%@ page import="user.UserModel" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null || !"customer".equals(user.getRole())) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<%@ include file="navbar.jsp" %> <!-- Include navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details - Nebula RAM Module</title>
    <link rel="stylesheet" href="Product01.css">
</head>
<body>

<section class="product-detail">
    <div class="product-container">
        <div class="product-image">
            <img src="images/desktop.jpeg" alt="Product Image">
        </div>

        <div class="product-info">
            <h1 class="product-name">Nebula RAM Module</h1>
            <p class="product-code">Product Code: GIFTSLCOM513</p>
            <p class="product-price">Rs. 3,950.00</p>

            <div class="product-quantity">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" min="1" value="1">
            </div>

            <div class="product-buttons">
                <button class="add-to-cart">Add to Cart</button>

                <!--Passing Product details-->
                <form action="shippingdetails.jsp" method="get">
                    <input type="hidden" name="productName" value="Sweet Love Pack">
                    <input type="hidden" name="productCode" value="GIFTSLCOM513">
                    <input type="hidden" name="productPrice" value="3950.00">
                    <input type="hidden" name="quantity" id="formQuantity" value="1">
                    <button type="submit" class="buy-now">Buy Now</button>
                </form>

                <script>
                    // Sync quantity input to the form hidden input
                    document.getElementById("quantity").addEventListener("input", function() {
                        document.getElementById("formQuantity").value = this.value;
                    });
                </script>



            </div>

            <div class="product-description">
                <h3>Description</h3>
                <p>
                    This beautifully arranged sweet love pack is perfect for expressing your affection.
                    Comes with chocolates, a plush toy, and a handpicked gift box. Surprise your loved one today!
                </p>
            </div>
        </div>
    </div>
</section>

<%@ include file="/footer.jsp" %>

</body>
</html>
