<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminnavbar.jsp" %> <!-- Include navbar -->
<html>
<head>
  <title>Admin Dashboard - Graphs</title>
  <!-- Include Chart.js CDN -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!-- Include external CSS -->
  <link rel="stylesheet" type="text/css" href="admindashboard.css">
</head>
<body>
<div class="dashboard-container">
  <div class="monthly-total-sale">
    <h2><i class="fas fa-chart-line"></i> Monthly Total Sale</h2>
    <div class="cost">Rs 430 664/=</div>
  </div>

  <div class="today-total-sale">
    <h2><i class="fas fa-money-bill-wave"></i> Today Total Sale</h2>
    <div class="cost">Rs 223 865/=</div>
  </div>

  <div class="total-refunds">
    <h2><i class="fas fa-undo-alt"></i> Total Refunds</h2>
    <div class="cost">Rs - 30 664/=</div>
  </div>

  <div class="cancel-orders">
    <h2><i class="fas fa-ban"></i> Cancel Orders</h2>
    <div class="cost">32</div>
  </div>
</div>
<div class="dashboard-container-graphs-1">
  <div class="last-week">
    <h2>Last Week Sales</h2>
    <canvas id="salesChart" width="500" height="300"></canvas>
  </div>

  <div class="items-store">
    <h2>Items in the Store</h2>
    <canvas id="itemsChart" width="500" height="300"></canvas>
  </div>

  <!-- Example of a new graph -->
  <div class="monthly-sale">
    <h2>Monthly Sales Growth</h2>
    <canvas id="monthlySalesGrowthChart" width="500" height="300"></canvas>
  </div>
</div>

<div class="dashboard-container-graphs-2">
  <!-- Order Status Pie Chart -->
  <div class="order-status">
    <h2>Order Status</h2>
    <canvas id="orderStatusChart" width="500" height="300"></canvas>
  </div>

  <!-- Next Week Targets Bar Chart -->
  <div class="target">
    <h2>Next Week Targets</h2>
    <canvas id="nextWeekTargetsChart" width="500" height="300"></canvas>
  </div>

  <!-- Example of an additional graph (Line Chart for Sales Trend) -->
  <div class="sales-trend">
    <h2>Sales Trend</h2>
    <canvas id="salesTrendChart" width="500" height="300"></canvas>
  </div>
</div>



<%-- Include footer --%>
<%@ include file="footer.jsp" %>

<script>
  // Data for Last Week Sales (This data can come from your JSP model)
  var salesData = [120, 150, 170, 200, 180, 220, 250];  // Example static data
  var salesLabels = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];  // Example labels

  // Creating the Last Week Sales Line Chart
  var ctx1 = document.getElementById('salesChart').getContext('2d');
  var salesChart = new Chart(ctx1, {
    type: 'line',
    data: {
      labels: salesLabels,
      datasets: [{
        label: 'Sales',
        data: salesData,
        borderColor: '#8884d8',
        fill: false,
      }]
    },
    options: {
      scales: {
        x: { title: { display: true, text: 'Days of the Week' }},
        y: { title: { display: true, text: 'Sales (Rs)' }}
      }
    }
  });

  // Data for Items in the Store (Example)
  var itemsData = [
    { name: 'Motherboard', quantity: 30 },
    { name: 'CPU', quantity: 50 },
    { name: 'RAM', quantity: 40 },
    { name: 'Storage', quantity: 20 },
    { name: 'Power Supply', quantity: 80 },
    { name: 'GPU', quantity: 70 },
    { name: 'CPU Coolers', quantity: 60 },
    { name: 'Other', quantity: 35 },
  ];

  var itemNames = itemsData.map(item => item.name);
  var itemQuantities = itemsData.map(item => item.quantity);

  // Creating the Items in the Store Bar Chart
  var ctx2 = document.getElementById('itemsChart').getContext('2d');
  var itemsChart = new Chart(ctx2, {
    type: 'bar',
    data: {
      labels: itemNames,
      datasets: [{
        label: 'Item Quantity',
        data: itemQuantities,
        backgroundColor: '#8884d8',
      }]
    },
    options: {
      scales: {
        x: { title: { display: true, text: 'Items' }},
        y: { title: { display: true, text: 'Quantity' }}
      }
    }
  });

  // New Graph: Monthly Sales Growth
  var monthlySalesData = [1000, 1200, 1500, 1300, 1700, 1600, 1800, 1900, 2200, 2500, 2100, 2300]; // Example Data for Monthly Sales
  var monthlyLabels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  // Creating the Monthly Sales Growth Line Chart
  var ctx3 = document.getElementById('monthlySalesGrowthChart').getContext('2d');
  var monthlySalesChart = new Chart(ctx3, {
    type: 'line',
    data: {
      labels: monthlyLabels,
      datasets: [{
        label: 'Monthly Sales',
        data: monthlySalesData,
        borderColor: '#4caf50',
        fill: false,
      }]
    },
    options: {
      scales: {
        x: { title: { display: true, text: 'Months' }},
        y: { title: { display: true, text: 'Sales (Rs)' }}
      }
    }
  });

  // Example Order Data for Pie Chart
  var orderData = [
    { name: 'Completed', value: 70 },
    { name: 'Pending', value: 20 },
    { name: 'Cancelled', value: 10 }
  ];

  var orderLabels = orderData.map(item => item.name);
  var orderValues = orderData.map(item => item.value);

  // Creating the Order Status Pie Chart
  var ctx1 = document.getElementById('orderStatusChart').getContext('2d');
  var orderStatusChart = new Chart(ctx1, {
    type: 'pie',
    data: {
      labels: orderLabels,
      datasets: [{
        data: orderValues,
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56'],  // Pie slice colors
        hoverBackgroundColor: ['#FF8C94', '#5D9BFF', '#FFE270']
      }]
    },
    options: {
      responsive: true,
      plugins: {
        tooltip: {
          callbacks: {
            label: function(tooltipItem) {
              return tooltipItem.label + ': ' + tooltipItem.raw + '%';  // Display percentage
            }
          }
        }
      }
    }
  });

  // Example Target Data for Bar Chart
  var targetData = [
    { name: 'Monday', target: 50 },
    { name: 'Tuesday', target: 60 },
    { name: 'Wednesday', target: 70 },
    { name: 'Thursday', target: 80 },
    { name: 'Friday', target: 90 }
  ];

  var targetLabels = targetData.map(item => item.name);
  var targetValues = targetData.map(item => item.target);

  // Creating the Next Week Targets Bar Chart
  var ctx2 = document.getElementById('nextWeekTargetsChart').getContext('2d');
  var nextWeekTargetsChart = new Chart(ctx2, {
    type: 'bar',
    data: {
      labels: targetLabels,
      datasets: [{
        label: 'Target Sales',
        data: targetValues,
        backgroundColor: '#82ca9d',
        borderColor: '#66bb6a',
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      },
      responsive: true,
      plugins: {
        tooltip: {
          callbacks: {
            label: function(tooltipItem) {
              return 'Target: Rs ' + tooltipItem.raw;  // Display target amount
            }
          }
        }
      }
    }
  });

  // Example Sales Trend Data for Line Chart
  var salesTrendData = [1000, 1300, 1200, 1100, 1600, 1550, 1800, 1400, 1850, 1900, 2100, 2400];
  var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  // Creating the Sales Trend Line Chart
  var ctx3 = document.getElementById('salesTrendChart').getContext('2d');
  var salesTrendChart = new Chart(ctx3, {
    type: 'line',
    data: {
      labels: months,
      datasets: [{
        label: 'Sales Growth',
        data: salesTrendData,
        borderColor: '#4caf50',
        fill: false
      }]
    },
    options: {
      scales: {
        x: { title: { display: true, text: 'Months' }},
        y: { title: { display: true, text: 'Sales (Rs)' }}
      },
      responsive: true,
      plugins: {
        tooltip: {
          callbacks: {
            label: function(tooltipItem) {
              return 'Sales: Rs ' + tooltipItem.raw;
            }
          }
        }
      }
    }
  });
</script>
</body>
</html>
