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
        <title>Admin Login</title>
    </head>
    <body bgcolor='#5B4CFF'>
<%  
    String rollNo = request.getParameter ("rollNo");
    String quizId = request.getParameter ("quizId");
    String q1 = request.getParameter ("q1");
    String q2 = request.getParameter ("q2");
    String q3 = request.getParameter ("q3");
    String q4 = request.getParameter ("q4");
    String q5 = request.getParameter ("q5");
    int marks = 0;
    
    Class.forName ("com.mysql.jdbc.Driver").newInstance(); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM answers WHERE quizID = '"+quizId+"'");
    
    if(rs.next())
    {
        String a1 = rs.getString("q1");
        String a2 = rs.getString("q2");
        String a3 = rs.getString("q3");
        String a4 = rs.getString("q4");
        String a5 = rs.getString("q5");
        if(a1.equals(q1)==true)
        {
            marks+=1;
        }
        if(a2.equals(q2)==true)
        {
            marks+=1;
        }
        if(a3.equals(q3)==true)
        {
            marks+=1;
        }
        if(a4.equals(q4)==true)
        {
            marks+=1;
        }
        if(a5.equals(q5)==true)
        {
            marks+=1;
        }
    
    }
    String sql = "INSERT INTO viewMarks (rollNo, marks, quizId) values (?,?,?)";
    PreparedStatement stmt1 = conn.prepareStatement(sql);
    stmt1.setString(1, rollNo);
    stmt1.setInt(2, marks);
    stmt1.setString(3, quizId);
    stmt1.executeUpdate();
    conn.close();
%>
    Your Marks for this quiz is <%= marks %> out of 5.
    </body>
</html>
