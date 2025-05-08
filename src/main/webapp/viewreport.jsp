<%@ page import="bomb.ReportModel" %>
<%@ page import="bomb.ReportControl" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Stock Report</title>
    <link rel="stylesheet" href="viewreport.css">
</head>
<body>
<div class="form-container">
    <%
        String reportIDParam = request.getParameter("reportID");
        if (reportIDParam != null) {
            List<ReportModel> reports = ReportControl.getById(reportIDParam);
            if (reports != null && !reports.isEmpty()) {
                ReportModel R = reports.get(0); // get the first (and only) report
    %>

    <div class="form-header">
        <h2><%= R.getReportMonth() %> Stock Report</h2>
        <div class="status-badge">On Target</div>
    </div>
    <div class="form-body">
        <h3>Stock Details</h3>
        <p><strong>Report Month:</strong> <%= R.getReportMonth() %></p>
        <p><strong>Generated Date:</strong> <%= R.getGeneratedDate() %></p>
        <p><strong>All in Stock:</strong> <%= R.getInStock() %></p>
        <p><strong>Sold Items:</strong> <%= R.getSoldItems() %></p>
        <p><strong>Low Stock:</strong> <%= R.getLowStock() %></p>
        <p><strong>Sold Out Items:</strong> <%= R.getSoldOutItems() %></p>
        <p><strong>Total Damaged:</strong> <%= R.getDamaged() %></p>
        <h3>Sales Details</h3>
        <p><strong>Total Budget:</strong> Rs <%= R.getBudget() %></p>
        <p><strong>Total Refunds:</strong> Rs <%= R.getRefunds() %></p>
        <p><strong>Targeted Sale:</strong> Rs <%= R.getTargetSale() %></p>
        <p><strong>Total Sale:</strong> Rs <%= R.getTotalSale() %></p>
    </div>

    <div class="form-footer">
        <a href="updatereport.jsp?reportID=<%= R.getReportID() %>">
            <button type="button" class="action-btn">Update</button>
        </a>
        <button class="action-btn">Delete</button>
    </div>
    <%
    } else {
    %>
    <p><strong>Report not found.</strong></p>
    <%
        }
    } else {
    %>
    <p><strong>No Report ID provided.</strong></p>
    <%
        }
    %>
</div>
</body>
</html>
