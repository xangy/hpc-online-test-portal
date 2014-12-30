<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : adminLogin
    Created on : 23 Jul, 2013, 4:26:07 AM
    Author     : SAmsung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body bgcolor='#5B4CFF'>
        <img src="images/background.png" alt="hpc logo" height="136" width="800" />
<%  
    
    String username = request.getParameter ("username");
    String password = request.getParameter ("password");
    
    Class.forName ("com.mysql.jdbc.Driver").newInstance(); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT adminPassword from admin WHERE adminName='"+username+"'and adminPassword='"+password+"'");
    
    if(rs.next())
    {
        String pass=rs.getString("adminPassword");
        if(pass.equals(password)==true)
        {
            response.sendRedirect("adminIndex.html");
        }
        else
        {
            response.sendRedirect("adminLoginError.html");
        }
    }
    conn.close();
%>
    </body>
</html>
