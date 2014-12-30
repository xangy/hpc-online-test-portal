<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : adminLogin
    Created on : 23 Jul, 2013, 4:26:07 AM
    Author     : SAmsung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Answer Checking</title>
    </head>
    <body bgcolor='#5B4CFF'>
        <img src="images/background.png" alt="hpc logo" height="136" width="800" />
<%  
    String quizId = request.getParameter ("quizId");
    String q1 = request.getParameter ("q1");
    String q2 = request.getParameter ("q2");
    String q3 = request.getParameter ("q3");
    String q4 = request.getParameter ("q4");
    String q5 = request.getParameter ("q5");
    
    Class.forName ("com.mysql.jdbc.Driver").newInstance(); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");
    String sql = "INSERT INTO answers (quizId, q1, q2, q3, q4, q5) values (?,?,?,?,?,?)";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, quizId);
    stmt.setString(2, q1);
    stmt.setString(3, q2);
    stmt.setString(4, q3);
    stmt.setString(5, q4);
    stmt.setString(6, q5);
    stmt.executeUpdate();
    response.sendRedirect("adminIndex.html");
    conn.close();
%>
        
    </body>
</html>
