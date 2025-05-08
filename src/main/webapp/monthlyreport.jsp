<%@ page import="bomb.ReportModel" %>
<%@ page import="bomb.ReportControl" %>
<%@ page import="java.util.List" %><%--
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
                <%
                    List<ReportModel> reports = ReportControl.getAllReport();
                    if (reports == null || reports.isEmpty()) {
                %>
                <p><strong>No Report available.</strong></p>
                <%
                } else {
                    for (ReportModel R : reports) {
                %>
                <ul>
                    <li>
                        <div class="report-item">
                            <div class="report-id"><%= R.getReportID() %></div>
                            <div class="report-title"><%= R.getReportMonth() %> Stock Report</div>
                            <div class="report-date">Generated: <%= R.getGeneratedDate() %></div>
                            <div class="report-stats">In Stock: <%= R.getInStock() %> | Sold: <%= R.getSoldItems() %> | Low Stock: <%= R.getLowStock() %></div>
                            <a href="viewreport.jsp?reportID=<%= R.getReportID() %>">
                                <button class="view-btn">View Report</button>
                            </a>
                        </div>
                    </li>
                </ul>
                <%
                        }
                    }
                %>
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

