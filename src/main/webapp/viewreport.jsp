<%@ page import="bomb.ReportModel" %>
<%@ page import="bomb.ReportControl" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        <%
            String statusText;
            String statusClass;
            if (R.getTotalSale() > (R.getTargetSale())) {
                statusText = "On Target";
                statusClass = "on-target";
            } else {
                statusText = "Below Target";
                statusClass = "below-target";
            }
        %>
        <div class="status-badge <%= statusClass %>"><%= statusText %></div>

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
        <form action="<%= request.getContextPath() %>/DeleteReport" method="post" onsubmit="return confirm('Are you sure you want to delete this report?');">
            <input type="hidden" name="id" value="<%= R.getReportID() %>">
            <button type="submit" class="action-btn">Delete</button>
        </form>

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
