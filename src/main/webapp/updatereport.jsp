<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>x
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

    <c:forEach var="reportModels" items="${AllReport}">
        <form action="/Bomb_war_exploded/updatereport" class="form-body" method="post">
            <label for="reportID">Report ID:</label>
            <input type="number" id="reportID" name="reportID" value="${reportModels.reportID}" readonly>

            <label for="reportMonth">Report Month:</label>
            <input type="text" id="reportMonth" name="reportMonth" value="${reportModels.reportMonth}" placeholder="e.g., January">

            <label for="generatedDate">Generated Date:</label>
            <input type="date" id="generatedDate" name="generatedDate" value="${reportModels.generatedDate}">

            <label for="inStock">All in Stock (units):</label>
            <input type="number" id="inStock" name="inStock" value="${reportModels.inStock}" placeholder="Units">

            <label for="soldItems">Sold Items (units):</label>
            <input type="number" id="soldItems" name="soldItems" value="${reportModels.soldItems}" placeholder="Units">

            <label for="lowStock">Low Stock (units):</label>
            <input type="number" id="lowStock" name="lowStock" value="${reportModels.lowStock}" placeholder="Units">

            <label for="soldOutItems">Sold Out Items:</label>
            <input type="text" id="soldOutItems" name="soldOutItems" value="${reportModels.soldOutItems}" placeholder="e.g., RAM, CPU">

            <label for="damaged">Total Damaged (units):</label>
            <input type="number" id="damaged" name="damaged" value="${reportModels.damaged}" placeholder="Units">

            <label for="budget">Total Budget (Rs):</label>
            <input type="number" step="0.01" id="budget" name="budget" value="${reportModels.budget}" placeholder="Rs amount">

            <label for="refunds">Total Refunds (Rs):</label>
            <input type="number" step="0.01" id="refunds" name="refunds" value="${reportModels.refunds}" placeholder="Rs amount">

            <label for="targetSale">Targeted Sale (Rs):</label>
            <input type="number" step="0.01" id="targetSale" name="targetSale" value="${reportModels.targetSale}" placeholder="Rs amount">

            <label for="totalSale">Total Sale (Rs):</label>
            <input type="number" step="0.01" id="totalSale" name="totalSale" value="${reportModels.totalSale}" placeholder="Rs amount">

            <div class="submit-container">
                <button type="submit">Update Report</button>
            </div>
        </form>
    </c:forEach>
</div>
</body>
</html>
