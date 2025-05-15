<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminnavbar.jsp" %>

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
    <title>Manage Users</title>
    <link rel="stylesheet" type="text/css" href="usermanagement.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<div>
    <div class="heading">
        <h1>Manage Users</h1>
    </div>

    <div class="manage-user-container">
        <div class="manage-user-upper-body">
            <button onclick="location.href='addmemberform.jsp'"><i class="fa fa-plus"></i>Add New User </button>
        </div>
        <div class="manage-user-lower-body">
            <table>
                <thead>
                <tr>
                    <th>RegNo</th>
                    <th>Name</th>
                    <th>Billing Address</th>
                    <th>Shipping Address</th>
                    <th>Email</th>
                    <th>Contact No</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>2023001</td>
                    <td>Jane Doe</td>
                    <td>123 Main St, Cityville</td>
                    <td>456 Elm St, Townsville</td>
                    <td>jane.doe@example.com</td>
                    <td>0712345678</td>
                    <td>
                        <button class="action-btn view-btn">View</button>
                        <button class="action-btn update-btn">Update</button>
                        <button class="action-btn delete-btn">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>2023002</td>
                    <td>John Smith</td>
                    <td>789 Oak Rd, Villagetown</td>
                    <td>101 Pine Ln, Hamlet</td>
                    <td>john.smith@example.com</td>
                    <td>0723456789</td>
                    <td>
                        <button class="action-btn view-btn">View</button>
                        <button class="action-btn update-btn">Update</button>
                        <button class="action-btn delete-btn">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>2023003</td>
                    <td>Emily Brown</td>
                    <td>55 Maple St, Suburbia</td>
                    <td>88 Cedar Ave, Countryside</td>
                    <td>emily.brown@example.com</td>
                    <td>0734567890</td>
                    <td>
                        <button class="action-btn view-btn">View</button>
                        <button class="action-btn update-btn">Update</button>
                        <button class="action-btn delete-btn">Delete</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
