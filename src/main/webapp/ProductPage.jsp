<!-- product.html -->
<%@ include file="navbar.jsp" %> <!-- Include navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Products</title>
    <link rel="stylesheet" href="ProductPage.css">

    <style>
        .product-box{
            background: linear-gradient(90deg, #f0f0f0, #d9d9d9);
        }

    </style>

</head>
<body>
<section class="product-section">
    <h2 class="section-heading">Special Offers</h2>
    <div class="product-grid">
        <!-- Row 1 -->
        <div class="product-box" ><a href="Product01.jsp" style="text-decoration: none; color: inherit;">Nebula RAM Module</a>
            </div>
        <div class="product-box"><a href="Product02.jsp" style="text-decoration: none; color: inherit;">500GB NVMe SSD Gen4</a></div>
        <div class="product-box">SATA SSD</div>
        <div class="product-box">Ryzen 5 CPU</div>
        <!-- Row 2 -->
        <div class="product-box">ASUS B550 Board</div>
        <div class="product-box">Corsair 16GB RAM</div>
        <div class="product-box">Samsung 1TB SSD</div>
        <div class="product-box">WD 1TB SSD</div>
        <!-- Row 3 -->
        <div class="product-box">Kingston 128GB USB</div>
        <div class="product-box">Crucial 500GB NVMe</div>
        <div class="product-box">Samsung T7 SSD</div>
    </div>
</section>

<section class="product-section">
    <h2 class="section-heading">Featured Products</h2>
    <div class="product-grid">
        <!-- 4 Rows of 4 boxes -->
        <div class="product-box"><a href="Product03.jsp" style="text-decoration: none; color: inherit;">Mechanical Gaming Keyboard MK500</a></div>
        <div class="product-box"><a href="Product04.jsp" style="text-decoration: none; color: inherit;">Gaming Mouse Pro X</a></div>
        <div class="product-box">Logitech Keyboard</div>
        <div class="product-box">Razer Mouse</div>

        <div class="product-box">Logitech G Mouse</div>
        <div class="product-box">Dell 27" Monitor</div>
        <div class="product-box">Logitech Webcam</div>
        <div class="product-box">HyperX Headset</div>

        <div class="product-box">USB Hub</div>
        <div class="product-box">DisplayPort Cable</div>
        <div class="product-box">Ethernet Cable</div>
        <div class="product-box">NVMe Adapter</div>

        <div class="product-box">ASUS Sound Card</div>
        <div class="product-box">NVMe Adapter</div>
        <div class="product-box">Noctua Fan</div>
        <div class="product-box">APC UPS</div>
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
