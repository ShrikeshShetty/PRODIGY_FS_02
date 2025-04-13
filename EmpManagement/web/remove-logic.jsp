<%@ page import="java.sql.*" %>
<%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
             String empId = request.getParameter("empId");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", ""); // Update DB credentials
            
            stmt = con.createStatement();
            String sql = "DELETE FROM employees where employee_id="+ empId;
            
            int rowsDeleted = stmt.executeUpdate(sql);
            if (rowsDeleted > 0) {
                out.println("<h3>Employee Record Removed Successfully!</h3>");
            } 
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                out.println("<h3>Error closing resources: " + e.getMessage() + "</h3>");
            }
        }
    %>