<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminnavbar.jsp" %> <!-- Include navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home - Spare Part Management</title>
    <link rel="stylesheet" href="HomeStyle.css" />
</head>
<body>

<!-- Top Advertisement Banner (Automatic Image Change) -->
<section class="top-banner">
    <img class="top-banner-img" src="images/banner1.jpg" alt="Ad 1">
    <img class="top-banner-img" src="images/banner2.jpg" alt="Ad 2">
    <img class="top-banner-img" src="images/banner3.jpg" alt="Ad 3">
</section>

<!-- Advertisement Boxes -->
<section class="ad-boxes">
    <div class="ad-box">Ad Box 1</div>
    <div class="ad-box">Ad Box 2</div>
    <div class="ad-box">Ad Box 3</div>
    <div class="ad-box">Ad Box 4</div>
</section>

<!-- Product Categories / Boxes -->
<section class="product-section">
    <h2>Featured Products</h2>
    <div class="product-grid">
        <div class="product-card"><span class="product-title">Product 1</span></div>
        <div class="product-card"><span class="product-title">Product 2</span></div>
        <div class="product-card"><span class="product-title">Product 3</span></div>
        <div class="product-card"><span class="product-title">Product 4</span></div>
    </div>
</section>

<!-- Specials / Popular / Discount Products -->
<section class="specials-section">
    <h2>Special Offers</h2>
    <div class="product-grid">
        <div class="product-card">Discount 1</div>
        <div class="product-card">Popular 2</div>
        <div class="product-card">Deal 3</div>
        <div class="product-card">Sale 4</div>
    </div>
</section>

<!-- Knowledge Base Section -->
<section class="knowledge-section">
    <h2>Articles & Self-Help</h2>
    <div class="article-list">
        <div class="article-card">
            <h3>How to Replace a Brake Pad</h3>
            <p>Step-by-step guide for DIY car owners...</p>
        </div>
        <div class="article-card">
            <h3>Engine Maintenance Tips</h3>
            <p>Keep your engine running smoothly with these tips.</p>
        </div>
        <div class="article-card">
            <h3>Battery Care Advice</h3>
            <p>Learn how to maintain and replace your vehicle battery.</p>
        </div>
    </div>
</section>

<!-- Additional Section -->
<section class="extra-section">
    <h2>Why Shop With Us?</h2>
    <p>We offer the best spare parts at affordable prices. Fast delivery & trusted service!</p>
</section>

<!-- Delivery Time Info -->
<section class="delivery-info">
    <div class="delivery-box">
        <h3>Standard Delivery</h3>
        <p>3–5 Business Days</p>
    </div>
    <div class="delivery-box">
        <h3>Express Delivery</h3>
        <p>1–2 Business Days</p>
    </div>
</section>

<!-- Subscribe Section -->
<section class="subscribe-section">
    <h2>Subscribe for Updates</h2>
    <input type="email" placeholder="Enter your email">
    <button>Subscribe</button>
</section>

<%@ include file="/footer.jsp" %>

</body>
</html>
