<%@ page import="bomb.CardDetailsModel" %>
<%@ page import="bomb.CardDetailsController" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Card Details</title>
  <style>
    /* Page Body */
    body {
      background-color: #d4f0fc;
      font-family: Arial, sans-serif;
      color: #01303f;
      margin: 0;
      padding: 20px;
    }

    /* Heading */
    h2 {
      text-align: center;
      color: #01303f;
      margin-bottom: 20px;
    }

    /* Table Styling */
    table {
      width: 90%;
      margin: 0 auto;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      border-radius: 10px;
      overflow: hidden;
    }

    /* Table Header */
    table th {
      background-color: #01303f;
      color: white;
      padding: 12px 8px;
      text-align: left;
    }

    /* Table Cells */
    table td {
      padding: 10px 8px;
      border-bottom: 1px solid #e0e0e0;
      color: #02577a;
    }

    /* Narrow Action Column */
    table th:last-child,
    table td:last-child {
      width: 140px;
      white-space: nowrap;
      text-align: center;
    }

    /* Action Buttons */
    .update-btn,
    .delete-btn {
      padding: 5px 10px;
      font-size: 13px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      color: white;
    }

    /* Specific Button Colors */
    .update-btn {
      background-color: #02a9f7;
    }

    .update-btn:hover {
      background-color: #0189c3;
    }

    .delete-btn {
      background-color: #d9534f;
    }

    .delete-btn:hover {
      background-color: #c9302c;
    }

    /* No Cards Message */
    p {
      text-align: center;
      color: #02577a;
      font-size: 16px;
      margin-top: 30px;
    }

    /* Responsive Table */
    @media (max-width: 768px) {
      table {
        font-size: 13px;
      }

      table, th, td {
        word-wrap: break-word;
      }

      table th:last-child,
      table td:last-child {
        width: auto;
      }
    }

  </style>
</head>
<body>

<h2>User Cards</h2>

<%
  List<CardDetailsModel> cards = CardDetailsController.getAllCardDetails();
  if (cards == null || cards.isEmpty()) {
%>
<p><strong>No Card available.</strong></p>
<%
} else {
%>
<table border="1">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Number</th>
    <th>Month</th>
    <th>Year</th>
    <th>CVN</th>
    <th>Action</th>
  </tr>
  <%
    for (CardDetailsModel C : cards) {
  %>
  <tr>
    <td><%= C.getId() %></td>
    <td><%= C.getName() %></td>
    <td><%= C.getNumber() %></td>
    <td><%= C.getMonth() %></td>
    <td><%= C.getYear() %></td>
    <td><%= C.getCvn() %></td>
    <td>
      <a href="updatecarddetails.jsp?id=<%= C.getId() %>&name=<%= C.getName() %>&number=<%= C.getNumber() %>&month=<%= C.getMonth() %>&year=<%= C.getYear() %>&cvn=<%= C.getCvn() %>">
        <button class="update-btn">Update</button>
      </a>
      <form action="DeleteCardDetailsServlet" method="post" style="display:inline;">
        <input type="hidden" name="id" value="<%= C.getId() %>">
        <button class="delete-btn" type="submit">Delete</button>
      </form>
    </td>
  </tr>
  <%
    } // end for
  %>
</table>
<%
  } // end else
%>

</body>
</html>
