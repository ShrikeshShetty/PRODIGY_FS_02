<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="RegisterServlet" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <button type="submit">Register</button>
        </form>
        <p>Already have an account? <a href="index.jsp" class="option">Login</a></p>
    </div>
</body>
</html>
