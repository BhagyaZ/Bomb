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
    <link rel="stylesheet" type="text/css" href="adminnavbar.css?v=1">
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
                <li><a href="admindashboard.jsp" style="text-decoration: none; color: inherit;">Home</a></li>
                <li><a href="usermanagement.jsp" style="text-decoration: none; color: inherit;">Manage User</a></li>
                <li><a href="pmdashboard.jsp" style="text-decoration: none; color: inherit;">Manage Product</a></li>
                <li><a href="monthlyreport.jsp" style="text-decoration: none; color: inherit;">Report</a></li>
                <li>Inquiries</li>
                <li>Payments</li>
<%--                <li>Orders</li>--%>
                <li>Feedback</li>
                <li>Refunds</li>
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

                <div class="navbar-profile-wrapper" id="profileWrapper">
                    <div class="navbar-profile">
                        <a href="userProfile.jsp">
                            <i class="fa fa-user"></i>
                        </a>
                    </div>
                    <div class="logout-popup" id="logoutPopup">
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
        }, 1000);
    });

    wrapper.addEventListener('mouseleave', () => {
        clearTimeout(showTimer);
        hideTimer = setTimeout(() => {
            popup.style.display = 'none';
        }, 100);
    });

    wrapper.addEventListener('mouseenter', showPopup);
    wrapper.addEventListener('mouseleave', hidePopup);
    popup.addEventListener('mouseenter', showPopup);
    popup.addEventListener('mouseleave', hidePopup);
</script>

</body>
</html>
