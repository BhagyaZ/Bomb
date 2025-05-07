<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/3/2025
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminnavbar.jsp" %> <!-- Include navbar -->
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="monthlyreport.css">

</head>
<body>
    <div class="body-container">
        <div class="generate-report-btn">
            <button onclick="location.href='generatereport.jsp'">Generate New Report</button>
        </div>
        <div class="report-container">
            <div class="latest-reports">
                <ol>
                    <li>
                        <c:forEach var="reportModels" items="${AllReport}">
                            <div class="report-item">
                                <div class="report-title">${AllReport.reportMonth} Stock Report</div>
                                <div class="report-date">Generated: ${AllReport.generatedDate}</div>
                                <div class="report-stats">In Stock: ${AllReport.inStock} | Sold: ${AllReport.soldItems} | Low Stock: ${AllReport.lowStock}</div>
                                <button class="view-btn" onclick="location.href='viewreport.jsp'">View Report</button>
                            </div>
                        </c:forEach>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>
                    <li>
                        <div class="report-item">
                            <div class="report-title">January Stock Report</div>
                            <div class="report-date">Generated: 03 Feb 2025</div>
                            <div class="report-stats">In Stock: 1500 | Sold: 340 | Low Stock: 12</div>
                            <button class="view-btn">View Report</button>
                        </div>
                    </li>

                </ol>
            </div>
        </div>

        <div class="graph-container">
            <div class="graph-topic"><h2>Monthly Growth Graph</h2></div>
            <div class="graph">
                <canvas id="monthlyGrowthChart"></canvas>
            </div>

        </div>
    </div>

<%@ include file="footer.jsp" %>
    <script>
        const ctx = document.getElementById('monthlyGrowthChart').getContext('2d');
        const monthlyGrowthChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June'],
                datasets: [{
                    label: 'Ticket Growth',
                    data: [12, 19, 15, 22, 30, 25],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    tension: 0.3,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: {
                        display: true,
                        text: 'Monthly Ticket Growth'
                    }
                },
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    </script>
</body>
</html>

