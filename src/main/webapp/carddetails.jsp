<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Card Details Form</title>
  <style>
    body {
      background: #f4f7f8;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    form {
      background-color: white;
      padding: 30px 40px;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      width: 400px;
    }

    table {
      width: 100%;
    }

    td {
      padding: 10px 0;
    }

    input[type="text"], input[type="number"], select {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
    }

    input[type="submit"] {
      width: 100%;
      background-color: #007bff;
      color: white;
      border: none;
      padding: 12px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      margin-top: 15px;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

<form id="cardForm" action="InsertCardDetailsServlet" method="post">
  <h2>Card Details</h2>
  <table>
    <tr>
      <td>Name:</td>
      <td><input type="text" name="name" required></td>
    </tr>
    <tr>
      <td>Card Number:</td>
      <td><input type="number" id="number" name="number" required oninput="limitInputLength(this, 9)"></td>
    </tr>
    <tr>
      <td>Month:</td>
      <td>
        <select name="month" required>
          <option value="" disabled selected>Select Month</option>
          <option value="1">January</option>
          <option value="2">February</option>
          <option value="3">March</option>
          <option value="4">April</option>
          <option value="5">May</option>
          <option value="6">June</option>
          <option value="7">July</option>
          <option value="8">August</option>
          <option value="9">September</option>
          <option value="10">October</option>
          <option value="11">November</option>
          <option value="12">December</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>Year:</td>
      <td>
        <select name="year" id="year" required>
          <option value="" disabled selected>Select Year</option>
          <%
            int currentYear = Calendar.getInstance().get(Calendar.YEAR);
            for (int i = 0; i <= 10; i++) {
              int year = currentYear + i;
          %>
          <option value="<%=year%>"><%=year%></option>
          <%
            }
          %>
        </select>
      </td>
    </tr>
    <tr>
      <td>CVN:</td>
      <td><input type="number" id="cvn" name="cvn" required oninput="limitInputLength(this, 3)"></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" value="Submit"></td>
    </tr>
  </table>
</form>

<script>
  function limitInputLength(element, maxLength) {
    if (element.value.length > maxLength) {
      element.value = element.value.slice(0, maxLength);
    }
  }

  document.getElementById("cardForm").addEventListener("submit", function(event) {
    const cardNumber = document.getElementById("number");
    const cvn = document.getElementById("cvn");

    if (cardNumber.value.trim().length !== 9) {
      alert("Card Number must be exactly 9 digits.");
      cardNumber.value = "";
      event.preventDefault();
    }

    if (cvn.value.trim().length !== 3) {
      alert("CVN must be exactly 3 digits.");
      cvn.value = "";
      event.preventDefault();
    }
  });
</script>

</body>
</html>