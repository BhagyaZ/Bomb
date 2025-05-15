<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Initialize cartCount (you can replace 0 with dynamic value later)
    int cartCount = 0;
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="navbar.css?v=2">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<nav class="navbar">
    <div class="navbar-container">
        <!-- First row: icon -->
        <div class="navbar-icon">
            <i class="fa fa-desktop"></i> BOMB
        </div>

        <!-- Second row: list + right items -->
        <div class="navbar-bottom-row">
            <ul class="navbar-list">
                <li><a href="Home.jsp" style="color: #ccc; text-decoration: none;" >Home</a></li>
                <li class="dropdown">
                    <a href="ProductPage.jsp" style="color: #ccc; text-decoration: none;" >Products</a>
                    <ul class="dropdown-menu">
                        <li>HDD</li>
                        <li>CPU</li>
                        <li>MotherBoard</li>
                        <li>SSD</li>
                        <li>NVMe SSD</li>
                        <li>Power Supply Unit</li>
                        <li>RAM</li>
                    </ul>
                </li>
                <li><a href="OrderReviewServlet" style="color: #ccc; text-decoration: none;" >Orders</a></li>
                <li>About Us</li>
                <li>Contact Us</li>
                <li>Other</li>
            </ul>

            <div class="navbar-right">
                <div class="navbar-search">
                    <i class="fa fa-magnifying-glass search-icon"></i>
                    <input
                            type="text"
                            placeholder="Search Here"
                            name="searchQuery"
                    />
                </div>

                <div class="navbar-profile-wrapper">
                    <div class="navbar-profile">
                        <a href="userProfile.jsp">
                            <i class="fa fa-user"></i>
                        </a>
                    </div>
                    <div class="logout-popup">
                        <a href="LogoutServlet"><i class="fa fa-sign-out"></i> Logout</a>
                    </div>
                </div>


                <div class="navbar-cart">
                    <i class="fa fa-cart-shopping"></i>
                    <% if (cartCount > 0) { %>
                    <span class="cart-badge"><%= cartCount %></span>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</nav>
<script>
    const wrapper = document.getElementById('profileWrapper');
    const popup = document.getElementById('logoutPopup');
    let showTimer, hideTimer;

    wrapper.addEventListener('mouseenter', () => {
        clearTimeout(hideTimer);
        showTimer = setTimeout(() => {
            popup.style.display = 'block';
        }, 1000); // 1 second delay
    });

    wrapper.addEventListener('mouseleave', () => {
        clearTimeout(showTimer);
        hideTimer = setTimeout(() => {
            popup.style.display = 'none';
        }, 100); // optional quick hide
    });
</script>
</body>
</html>