<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Employee</title>
        <link rel="stylesheet" href="css/show.css">
    </head>
    <body>
        <h1>Employee List:</h1>
        <table border="1">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Department</th>
            <th>Position</th>
            <th>Salary</th>
        </tr>
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", ""); // Update DB credentials
                
                stmt = con.createStatement();
                String sql = "SELECT * FROM employees";
                rs = stmt.executeQuery(sql);
                
                while (rs.next()) {
                    int empId=rs.getInt("employee_id");
        %>
                    <tr>
                        <td><%= empId %></td>
                        <td><%= rs.getString("first_name") %></td>
                        <td><%= rs.getString("last_name") %></td>
                        <td><%= rs.getString("department") %></td>
                        <td><%= rs.getString("position") %></td>
                        <td><%= rs.getDouble("salary") %></td>
                         </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<h3></h3>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    out.println("<h3>Error closing resources: " + e.getMessage() + "</h3>");
                }
            }
        %>
    </table>
    <a href="index.html" class="back-btn">Go Back</a>   
    </body>
</html>
