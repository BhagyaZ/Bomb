<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Card Details</title>
  <style>
    /* Body */
    body {
      background-color: #d4f0fc;
      font-family: Arial, sans-serif;
      margin: 0;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }


    /* Form Container */
    form#updateCardForm {
      background-color: white;
      width: 400px;
      padding: 25px 30px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    /* Heading */
    form#updateCardForm h2 {
      text-align: center;
      color: #01303f;
      margin-bottom: 20px;
    }

    /* Table Layout */
    form#updateCardForm table {
      width: 100%;
    }

    form#updateCardForm td {
      padding: 8px;
      vertical-align: middle;
    }

    /* Input Fields */
    form#updateCardForm input[type="text"],
    form#updateCardForm input[type="number"],
    form#updateCardForm select {
      width: 100%;
      padding: 8px;
      border: 1px solid #b0c4ce;
      border-radius: 5px;
      font-size: 14px;
      box-sizing: border-box;
    }

    /* Submit Button */
    form#updateCardForm input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #02a9f7;
      color: white;
      font-size: 15px;
      font-weight: bold;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      margin-top: 10px;
    }

    form#updateCardForm input[type="submit"]:hover {
      background-color: #0189c3;
    }

    /* Responsive */
    @media (max-width: 480px) {
      form#updateCardForm {
        width: 90%;
        padding: 20px;
      }
    }

  </style>
</head>
<body>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  String name = request.getParameter("name");
  int number = Integer.parseInt(request.getParameter("number"));
  int month = Integer.parseInt(request.getParameter("month"));
  int year = Integer.parseInt(request.getParameter("year"));
  int cvn = Integer.parseInt(request.getParameter("cvn"));
%>

<form id="updateCardForm" action="UpdateCardDetailsServlet" method="post">
  <h2>Update Card</h2>
  <table>
    <tr>
      <td>ID:</td>
      <td><input type="number" name="id" value="<%=id%>" readonly></td>
    </tr>
    <tr>
      <td>Name:</td>
      <td><input type="text" name="name" value="<%=name%>" required></td>
    </tr>
    <tr>
      <td>Card Number:</td>
      <td><input type="number" id="number" name="number" value="<%=number%>" required oninput="limitInputLength(this, 9)"></td>
    </tr>
    <tr>
      <td>Month:</td>
      <td>
        <select name="month" required>
          <option disabled>Select Month</option>
          <%
            String[] months = { "January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December" };
            for (int i = 1; i <= 12; i++) {
              String selected = (month == i) ? "selected" : "";
          %>
          <option value="<%=i%>" <%=selected%>><%=months[i-1]%></option>
          <%
            }
          %>
        </select>
      </td>
    </tr>
    <tr>
      <td>Year:</td>
      <td>
        <select name="year" required>
          <option disabled>Select Year</option>
          <%
            int currentYear = Calendar.getInstance().get(Calendar.YEAR);
            for (int i = 0; i <= 10; i++) {
              int y = currentYear + i;
              String selected = (year == y) ? "selected" : "";
          %>
          <option value="<%=y%>" <%=selected%>><%=y%></option>
          <%
            }
          %>
        </select>
      </td>
    </tr>
    <tr>
      <td>CVN:</td>
      <td><input type="number" id="cvn" name="cvn" value="<%=cvn%>" required oninput="limitInputLength(this, 3)"></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" value="Update"></td>
    </tr>
  </table>
</form>

<script>
  function limitInputLength(element, maxLength) {
    if (element.value.length > maxLength) {
      element.value = element.value.slice(0, maxLength);
    }
  }

  document.getElementById("updateCardForm").addEventListener("submit", function(event) {
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