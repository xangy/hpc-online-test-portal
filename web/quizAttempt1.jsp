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
    <center><h2>Hope, you attempt well.</h2></center>
<%  
    String quizId = request.getParameter ("quizId");
    
    Class.forName ("com.mysql.jdbc.Driver"); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * from quiz WHERE quizId='"+quizId+"'");
%>
    <center>
        <h2><u>Your Quiz ID::<%= quizId %></u></h2>
    </center>
    <hr />
<%
    if(rs !=null)
    {
        while(rs.next())
        {
         //Retrieve by column name
            String qNo = rs.getString("qNumber");
            String q = rs.getString("q");
            String a1 = rs.getString("a1");
            String a2 = rs.getString("a2");
            String a3 = rs.getString("a3");
            String a4 = rs.getString("a4");
%>
    
    <table align="center">
        <tr> 
            <td><%= qNo %>&hybull;<%= q %></td>
        </tr>
        <tr> 
            <td>a&hybull;<%= a1 %></td>
        </tr>
        <tr> 
            <td>b&hybull;<%= a2 %></td>
        </tr>
        <tr> 
            <td>c&hybull;<%= a3 %></td>
        </tr>
        <tr> 
            <td>d&hybull;<%= a4 %></td>
        </tr>
    </table>
    <hr />
    <br />
<%
        }
      }
      
      stmt.close();
      conn.close();
      
%>
<center>
        <iframe src="quizAttempt2.html" width="450" frameborder="1" scrolling="yes">
        </iframe>
</center>
    </body>
</html>