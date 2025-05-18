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

<%-- Session check --%>
<%@ page import="user.UserModel" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("index.jsp");
        return;
    }
%>


<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="monthlyreport.css">
</head>
<body>
<div class="body-container">
<%--    <div class="search-bar-container">--%>
<%--        <input type="text" id="reportSearch" onkeyup="filterTable()" placeholder="Search reports by month, date, or ID...">--%>
<%--    </div>--%>

    <div class="search-bar-container" style="text-align: center; margin: 40px 0;">
        <input
                type="text"
                id="reportSearch"
                onkeyup="filterTable()"
                placeholder="Search reports by month, date, or ID..."
                style="
            padding: 12px 20px;
            width: 60%;
            max-width: 500px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 30px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            outline: none;
            transition: box-shadow 0.3s ease;
        "
                onfocus="this.style.boxShadow='0 6px 16px rgba(0,0,0,0.15)'"
                onblur="this.style.boxShadow='0 4px 10px rgba(0,0,0,0.1)'"
        />
    </div>



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
                        <div class="report-id"><%= R.getReportID() %> .</div>
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

    function filterTable() {
        const input = document.getElementById("reportSearch");
        const filter = input.value.toLowerCase();
        const reports = document.querySelectorAll(".report-item");

        reports.forEach(report => {
            const text = report.textContent.toLowerCase();
            if (text.includes(filter)) {
                report.parentElement.style.display = "";
            } else {
                report.parentElement.style.display = "none";
            }
        });
    }
</script>
</body>
</html>