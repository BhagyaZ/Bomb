<%@ page import="java.util.List" %>
<%@ page import="bomb.ReportModel" %>
<%@ page import="bomb.ReportControl" %>
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

<!DOCTYPE html>
<html>
<head>
    <title>Update Stock Report</title>
    <link rel="stylesheet" href="updatereport.css">
</head>
<body>
<div class="form-container">
    <div class="form-header">
        <h2>Update Stock Report</h2>
    </div>

    <%
        String idParam = request.getParameter("reportID");
        List<ReportModel> reportList = ReportControl.getById(idParam);
        ReportModel R = reportList.get(0);
    %>

    <form action="${pageContext.request.contextPath}/UpdateReport" class="form-body" method="post">
        <input type="hidden" id="reportID" name="reportID" value="<%= R.getReportID() %>">

        <label for="reportMonth">Report Month:</label>
        <input type="text" id="reportMonth" name="reportMonth" value="<%= R.getReportMonth() %>">

        <label for="generatedDate">Generated Date:</label>
        <input type="date" id="generatedDate" name="generatedDate" value="<%= R.getGeneratedDate() %>">

        <label for="inStock">All in Stock (units):</label>
        <input type="number" id="inStock" name="inStock" value="<%= R.getInStock() %>">

        <label for="soldItems">Sold Items (units):</label>
        <input type="number" id="soldItems" name="soldItems" value="<%= R.getSoldItems() %>">

        <label for="lowStock">Low Stock (units):</label>
        <input type="number" id="lowStock" name="lowStock" value="<%= R.getLowStock() %>">

        <label for="soldOutItems">Sold Out Items:</label>
        <input type="text" id="soldOutItems" name="soldOutItems" value="<%= R.getSoldOutItems() %>">

        <label for="damaged">Total Damaged (units):</label>
        <input type="number" id="damaged" name="damaged" value="<%= R.getDamaged() %>">

        <label for="budget">Total Budget (Rs):</label>
        <input type="number" step="0.01" id="budget" name="budget" value="<%= R.getBudget() %>">

        <label for="refunds">Total Refunds (Rs):</label>
        <input type="number" step="0.01" id="refunds" name="refunds" value="<%= R.getRefunds() %>">

        <label for="targetSale">Targeted Sale (Rs):</label>
        <input type="number" step="0.01" id="targetSale" name="targetSale" value="<%= R.getTargetSale() %>">

        <label for="totalSale">Total Sale (Rs):</label>
        <input type="number" step="0.01" id="totalSale" name="totalSale" value="<%= R.getTotalSale() %>">

        <div class="submit-container">
            <button type="submit">Update Report</button>
        </div>
    </form>
</div>
</body>
</html>
