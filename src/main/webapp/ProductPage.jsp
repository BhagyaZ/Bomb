<!-- product.html -->
<%@ include file="navbar.jsp" %> <!-- Include navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Products</title>
    <link rel="stylesheet" href="ProductPage.css">
</head>
<body>
<section class="product-section">
    <h2 class="section-heading">Special Offers</h2>
    <div class="product-grid">
        <!-- Row 1 -->
        <div class="product-box" ><a href="Product01.jsp" style="text-decoration: none; color: inherit;">Nebula RAM Module</a>
            </div>
        <div class="product-box"><a href="Product02.jsp" style="text-decoration: none; color: inherit;">500GB NVMe SSD Gen4</a></div>
        <div class="product-box">Product 3</div>
        <div class="product-box">Product 4</div>
        <!-- Row 2 -->
        <div class="product-box">Product 5</div>
        <div class="product-box">Product 6</div>
        <div class="product-box">Product 7</div>
        <div class="product-box">Product 8</div>
        <!-- Row 3 -->
        <div class="product-box">Product 9</div>
        <div class="product-box">Product 10</div>
        <div class="product-box">Product 11</div>
    </div>
</section>

<section class="product-section">
    <h2 class="section-heading">Featured Products</h2>
    <div class="product-grid">
        <!-- 4 Rows of 4 boxes -->
        <div class="product-box"><a href="Product03.jsp" style="text-decoration: none; color: inherit;">Mechanical Gaming Keyboard MK500</a></div>
        <div class="product-box"><a href="Product04.jsp" style="text-decoration: none; color: inherit;">Gaming Mouse Pro X</a></div>
        <div class="product-box">Product C</div>
        <div class="product-box">Product D</div>

        <div class="product-box">Product E</div>
        <div class="product-box">Product F</div>
        <div class="product-box">Product G</div>
        <div class="product-box">Product H</div>

        <div class="product-box">Product I</div>
        <div class="product-box">Product J</div>
        <div class="product-box">Product K</div>
        <div class="product-box">Product L</div>

        <div class="product-box">Product M</div>
        <div class="product-box">Product N</div>
        <div class="product-box">Product O</div>
        <div class="product-box">Product P</div>
    </div>
</section>

<section class="product-section">
    <h2 class="section-heading">Limited Stock</h2>
    <div class="product-grid">
        <!-- 3 Rows, last with 1 box -->
        <div class="product-box">Product X</div>
        <div class="product-box">Product Y</div>
        <div class="product-box">Product Z</div>
        <div class="product-box">Product AA</div>

        <div class="product-box">Product AB</div>
        <div class="product-box">Product AC</div>
        <div class="product-box">Product AD</div>
        <div class="product-box">Product AE</div>

        <div class="product-box">Product AF</div>
    </div>
</section>

<%@ include file="/footer.jsp" %>

</body>
</html>
