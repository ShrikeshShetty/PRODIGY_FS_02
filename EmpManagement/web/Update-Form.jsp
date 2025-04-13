<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
        <link rel="stylesheet" href="css/update-form.css">
    </head>
    <body>
        <h1>Update Employee</h1>

        <%
            String empId = request.getParameter("empId");
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String fname = "", lname = "", dept = "", position = "";
            double salary = 0.0;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "");

                String sql = "SELECT * FROM employees WHERE employee_id=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(empId));
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    fname = rs.getString("first_name");
                    lname = rs.getString("last_name");
                    dept = rs.getString("department");
                    position = rs.getString("position");
                    salary = rs.getDouble("salary");
                }
            } catch (Exception e) {
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    out.println("<h3>Error closing resources: " + e.getMessage() + "</h3>");
                }
            }
        %>

        <form action="Update.jsp" method="post">
            <input type="hidden" name="empId" value="<%= empId %>">

            <label>First Name:</label>
            <input type="text" name="fname" value="<%= fname %>" required><br>

            <label>Last Name:</label>
            <input type="text" name="lname" value="<%= lname %>" required><br>

            <label>Department:</label>
            <input type="text" name="dept" value="<%= dept %>" required><br>

            <label>Position:</label>
            <input type="text" name="position" value="<%= position %>" required><br>

            <label>Salary:</label>
            <input type="number" step="0.01" name="sal" value="<%= salary %>" required><br>

            <input type="submit" value="Update Employee">
        </form>

        <br>
        <a href="Update.jsp">Go Back</a>
    </body>
</html>
