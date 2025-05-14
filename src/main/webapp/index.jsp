<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="index.css?v=2">
</head>
<body>
    <div class="upper-body">
        <div>
            <h2>Powering Your Tech, One Part at a Time</h2>
            <h1>Welcome to B<span class="letter-icon">O</span>MB Inventory</h1>
        </div>
    </div>
    <div class="lower-body">
        <div class="login-card">
            <h2>Your journey starts here</h2>
            <a href="login.jsp">
                <button>Login</button>
            </a>
        </div>
    </div>
<%--    <%@ include file="footer.jsp" %>--%>
    <script>
        window.addEventListener("load", () => {
            document.querySelector(".bomb-icon img").style.transform = "scale(1)";
        });
    </script>
</body>
</html>