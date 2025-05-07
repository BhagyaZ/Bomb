<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/4/2025
  Time: 6:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="viewreport.css">
</head>
<body>
<div class="form-container">
    <c:forEach var="reportModels" items="${AllReport}">
    <div class="form-header">
        <h2>January Stock Report</h2>
        <div class="status-badge">On Target</div>
    </div>
    <div class="form-body">
        <h3>Stock Details</h3>
        <p><strong>Report Month:</strong>${AllReport.reportMonth}</p>
        <p><strong>Generated Date:</strong> ${AllReport.generatedDate}</p>
        <p><strong>All in Stock:</strong> ${AllReport.inStock}</p>
        <p><strong>Sold Items:</strong> ${AllReport.soldItems}</p>
        <p><strong>Low Stock:</strong> ${AllReport.lowStock}</p>
        <p><strong>Sold Out Items:</strong>
            <c:forEach var="item" items="${AllReport.soldOutItems}">
                ${item} |
            </c:forEach>
        </p>
         <p><strong>Total Damaged:</strong> ${AllReport.damaged}</p>

        <h3>Sales Details</h3>
        <p><strong>Total Budget:</strong> Rs${AllReport.budget}</p>
        <p><strong>Total Refunds:</strong> Rs${AllReport.refunds}</p>
        <p><strong>Targeted Sale:</strong> Rs${AllReport.targetSale}</p>
        <p><strong>Total Sale:</strong> Rs${AllReport.totalSale}</p>
    </div>
    </c:forEach>
    <div class="form-footer">
        <button class="action-btn">Update</button>
        <button class="action-btn">Delete</button>
    </div>
</div>
</body>
</html>
