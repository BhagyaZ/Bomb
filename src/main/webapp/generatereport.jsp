<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/4/2025
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="generatereport.css">
</head>
<body>
<div class="form-container">
    <div class="form-header">
        <h2>Generate Stock Report</h2>
    </div>
    <form class="form-body">
        <label for="reportMonth">Report Month:</label>
        <input type="text" id="reportMonth" name="reportMonth" placeholder="e.g., January">

        <label for="generatedDate">Generated Date:</label>
        <input type="date" id="generatedDate" name="generatedDate">

        <label for="inStock">All in Stock (units):</label>
        <input type="number" id="inStock" name="inStock" placeholder="Units">

        <label for="soldItems">Sold Items (units):</label>
        <input type="number" id="soldItems" name="soldItems" placeholder="Units">

        <label for="lowStock">Low Stock (units):</label>
        <input type="number" id="lowStock" name="lowStock" placeholder="Units">

        <label for="soldOutItems">Sold Out Items:</label>
        <input type="text" id="soldOutItems" name="soldOutItems" placeholder="e.g., RAM, CPU">

        <label for="damaged">Total Damaged (units):</label>
        <input type="number" id="damaged" name="damaged" placeholder="Units">

        <label for="budget">Total Budget (Rs):</label>
        <input type="number" id="budget" name="budget" placeholder="Rs amount">

        <label for="refunds">Total Refunds (Rs):</label>
        <input type="number" id="refunds" name="refunds" placeholder="Rs amount">

        <label for="targetSale">Targeted Sale (Rs):</label>
        <input type="number" id="targetSale" name="targetSale" placeholder="Rs amount">

        <label for="totalSale">Total Sale (Rs):</label>
        <input type="number" id="totalSale" name="totalSale" placeholder="Rs amount">

        <div class="submit-container">
            <button type="submit">Generate Report</button>
        </div>
    </form>
</div>
</body>
</html>
