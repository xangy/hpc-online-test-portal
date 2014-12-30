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
        <title>User Login</title>
    </head>
    <body bgcolor='#5B4CFF'>
        <img src="images/background.png" alt="hpc logo" height="136" width="800" />
<%  
    
    String username = request.getParameter ("username1");
    String password = request.getParameter ("password1");
    
    Class.forName ("com.mysql.jdbc.Driver").newInstance(); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT userPassword from user WHERE userName='"+username+"' and userPassword='"+password+"'");
    
    if(rs.next())
    {
        String pass=rs.getString("userPassword");
        if(pass.equals(password)==true)
        {
            response.sendRedirect("userIndex.html");
        }
        else
        {
            response.sendRedirect("userLoginError.html");
        }
    }
    conn.close();
%>
    </body>
</html>
