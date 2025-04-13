<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
        <link rel="stylesheet" href="css/update.css">
        
    </head>
    <body>
        <h1>Update Employee</h1>
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
                        <td>
    <form action="Update-Form.jsp" method="get">
        <input type="hidden" name="empId" value="<%= empId %>">
        <input type="submit" value="Update">
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

        
         <%
    String empId = request.getParameter("empId");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String dept = request.getParameter("dept");
    String position = request.getParameter("position");
    String sal = request.getParameter("sal");

    if (empId != null && fname != null && lname != null && dept != null && position != null && sal != null) {
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "");

            String sql = "UPDATE employees SET first_name=?, last_name=?, department=?, position=?, salary=? WHERE employee_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, dept);
            pstmt.setString(4, position);
            pstmt.setDouble(5, Double.parseDouble(sal));
            pstmt.setInt(6, Integer.parseInt(empId));

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                out.println("<h3>Data Updated Successfully!</h3>");
            } else {
                out.println("<h3>Failed to Update. Employee ID not found.</h3>");
            }
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                out.println("<h3>Error closing resources: " + e.getMessage() + "</h3>");
            }
        }
    }
%>
<br>
<a href="index.html">Go Back</a>

    </body>
</html>
