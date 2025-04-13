<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Employee</title>
        <link rel="stylesheet" href="css/remove.css">
    </head>
    <body>
        <h1>Remove Employee</h1>
        
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
                        <td><%= rs.getInt("employee_id") %></td>
                        <td><%= rs.getString("first_name") %></td>
                        <td><%= rs.getString("last_name") %></td>
                        <td><%= rs.getString("department") %></td>
                        <td><%= rs.getString("position") %></td>
                        <td><%= rs.getDouble("salary") %></td>
                        <td>
                            <form action="remove-logic.jsp" method="post">
                                <input type="hidden" name="empId" value="<%= empId %>">
                            <input type="submit" value="Remove">
                            </form>
                        </td>
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
    <br>
    <a href="index.html">Go Back</a>
    </body>
</html>
