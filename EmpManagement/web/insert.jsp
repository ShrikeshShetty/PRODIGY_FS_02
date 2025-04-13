<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Employee</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
                <div class="header">
            <h1>Employee Management System</h1>
            <div class="nav-header">
                <a href="insert.jsp">Add Employee</a>
                <a href="Update.jsp">Update Employee</a>
                <a href="Show.jsp">Show Employees</a>
                <a href="Remove.jsp">Remove Employee</a>
                <a href="../AuthSystem/logout.jsp" class="logout-btn">Logout</a>
            </div>
        </div>
        <br><br>
        <div class="main-container">
        <div class="body-img">
                <img src="Image/insert-img.jpg" class="insert-img">
            </div>
        <div class="body">
            
                <div class="insert-form">
      <h1 class="insert-msg">Insert Employee</h1>
         <form action="insert.jsp" method="post">
            <label for="fname">Enter First Name: </label>
            <input type="text" name="fname" placeholder="Enter First Name">
            <br>
            <label for="lname">Enter Last Name: </label>
            <input type="text" name="lname" placeholder="Enter Last Name">
            <br>
            <label for="dept">Enter Department: </label>
            <input type="text" name="dept" placeholder="Enter Department">
            <br>
            <label for="position">Enter Position: </label>
            <input type="text" name="position" placeholder="Enter Position">
            <br>
            <label for="sal">Enter Salary: </label>
            <input type="text" name="sal" placeholder="Enter Salary">
            <br><br><br>
            <input type="submit" value="Submit" class="submit-btn">
        </form>
        
    <a href="index.html" class="back-btn">Go Back</a>
</div>
            </div>
        </div>
         <%
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String dept = request.getParameter("dept");
        String position = request.getParameter("position");
        String sal = request.getParameter("sal");
        
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", ""); // Update DB credentials
            
            String sql = "INSERT INTO employees (first_name, last_name, department, position, salary) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, dept);
            pstmt.setString(4, position);
            pstmt.setDouble(5, Double.parseDouble(sal));
            
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<div class='result'>");
                out.println("<h3 class='success'>Record Inserted Successfully!</h3>");
            } else {
                out.println("<h3 class='fail'>Failed to Insert Record.</h3>");
                out.println("</div>");
            }
        } catch (Exception e) {
            out.println("<h3></h3>");
        } 
        
    %>
    </body>
</html>
