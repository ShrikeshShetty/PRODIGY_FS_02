<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br><br>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp" class="option">Register</a></p>
    </div>
</body>
</html>
