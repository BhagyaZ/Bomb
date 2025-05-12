<%@ page import="java.util.List" %>
<%@ page import="bomb.CustomerModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %> <!-- Include navbar -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Review</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 40px 20px;
            background: #f5f7fa;
            color: #2d2d2d;
        }

        .main-box {
            max-width: 950px;
            margin: 160px auto 60px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 18px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            font-size: 2.2em;
            color: #333;
            margin-bottom: 30px;
        }

        section.orders {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        details {
            background: #ffffff;
            border-radius: 12px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: all 0.3s ease;
            transform: translateY(0);
        }

        details:hover {
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
            transform: translateY(-5px) scale(1.01);
        }

        summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 24px;
            font-size: 1.1em;
            font-weight: 600;
            color: #2b6cb0;
            background: #f9fafc;
            cursor: pointer;
            user-select: none;
        }

        summary::marker,
        summary::-webkit-details-marker {
            display: none;
        }

        summary::before {
            content: '📦';
            margin-right: 12px;
            font-size: 1.2em;
        }

        details[open] summary::after {
            content: "▲";
            font-size: 0.8em;
            color: #888;
        }

        summary::after {
            content: "▼";
            font-size: 0.8em;
            color: #888;
        }

        .detail-content {
            padding: 16px 24px;
            background-color: #fff;
            animation: fadeIn 0.3s ease-in-out;
        }

        .detail-content p {
            margin: 8px 0;
            line-height: 1.5;
            color: #444;
        }

        .detail-content p strong {
            color: #1a202c;
        }

        p.no-orders {
            text-align: center;
            font-style: italic;
            font-size: 1.1em;
            color: #555;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<%
    List<CustomerModel> orders = (List<CustomerModel>) request.getAttribute("orders");
%>

<section class="main-box">
    <h2>📋 Order Review</h2>
    <section class="orders">
        <% if (orders != null && !orders.isEmpty()) { %>
        <% for(CustomerModel c : orders) { %>
        <details>
            <summary>Shipping ID: <%= c.getShippingId() %> | Date: <%= c.getDate() %></summary>
            <div class="detail-content">
                <p><strong>Recipient:</strong> <%= c.getRecipientName() %></p>
                <p><strong>Address:</strong> <%= c.getRecipientAddress() %>, <%= c.getCity() %></p>
                <p><strong>Recipient Contact:</strong> <%= c.getRecipientContactNo() %></p>
                <p><strong>Sender Contact:</strong> <%= c.getSenderContactNo() %></p>
                <p><strong>Shipping Method:</strong> <%= c.getShippingMethod() %></p>
                <p><strong>Delivery Date:</strong> <%= c.getDeliveryDate() %></p>
                <p><strong>Message:</strong> <%= c.getPersonalMsg() %></p>

                <form action="DeleteShippingServlet" method="POST">
                    <input type="hidden" name="shippingId" value="<%= c.getShippingId() %>">
                    <button type="submit">Cancel Order</button>
                </form>


            </div>
        </details>
        <% } %>
        <% } else { %>
        <p class="no-orders">No shipping orders to display. Please access this page via the Order Review link.</p>
        <% } %>
    </section>
</section>

<script>
    // Allow only one details open at a time
    document.querySelectorAll("details").forEach((el) => {
        el.addEventListener("toggle", () => {
            if (el.open) {
                document.querySelectorAll("details").forEach((other) => {
                    if (other !== el) other.removeAttribute("open");
                });
            }
        });
    });
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
