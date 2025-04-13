<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    session.invalidate();  // Destroy session
    response.sendRedirect("index.jsp"); // Redirect to login
%>
