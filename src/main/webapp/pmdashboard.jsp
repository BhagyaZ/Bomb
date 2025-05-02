<%@ include file="pmnavbar.jsp" %> <!-- Include navbar -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Manager Dashboard</title>
    <link rel="stylesheet" href="pmdashboard.css">
</head>
<body>
<div class="pm-dashboard">



    <!-- Dashboard Content -->
    <div class="dashboard-container">


        <div class="dashboard-grid">
            <!-- Stat Cards -->
            <div class="dashboard-card stat-card">
                <h3>Total Products</h3>
                <p class="stat-value">124</p>
            </div>
            <div class="dashboard-card stat-card">
                <h3>Low Stock Items</h3>
                <p class="stat-value">8</p>
            </div>
            <div class="dashboard-card stat-card">
                <h3>Out-of-Stock Products</h3>
                <p class="stat-value">5</p>
            </div>

            <!-- Action Cards -->
            <div class="dashboard-card action-card add-product">
                <h3> Top-Selling Product</h3>
                <p class="stat-value">15</p>
            </div>

            <div class="dashboard-card action-card add-product">
                <h3>Products Added This Week</h3>
                <p class="stat-value">25</p>
            </div>
            <div class="dashboard-card action-card add-product">
                <h3>Recent Edits / Updates</h3>
                <p class="stat-value">5</p>
            </div>
        </div>
    </div>

    <%-- Include footer --%>
    <%@ include file="footer.jsp" %>
</div>
</body>
</html>

