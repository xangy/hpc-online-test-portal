<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Creation</title>
    </head>
    <body bgcolor='#5B4CFF'>
        <img src="images/background.png" alt="hpc logo" height="136" width="800" />
<%  
    String username = request.getParameter ("username");
    String password = request.getParameter ("password");
    String name = request.getParameter ("name");
    
    Class.forName ("com.mysql.jdbc.Driver").newInstance(); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    String sql = "INSERT INTO user (userName, userPassword, name) values (?,?,?)";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, username);
    stmt.setString(2, password);
    stmt.setString(3, name);
    stmt.executeUpdate();
    
    Statement statement = conn.createStatement();
    ResultSet rs = statement.executeQuery("SELECT rollNo from user WHERE userName='"+username+"'");
    if(rs.next())
    {
        String rollNo = rs.getString("rollNo");
    
%>
You're Roll No. is <%= rollNo %>
<%
    }
    conn.close();
%>
    </body>
</html>
