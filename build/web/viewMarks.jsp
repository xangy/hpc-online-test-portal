<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marks View</title>
    </head>
    <body bgcolor='#5B4CFF'>
        <img src="images/background.png" alt="hpc logo" height="136" width="800" />
        <table border="1" cellpadding="20" cellspacing="10" align="center">
    <tr>
        <td><a href="createQuiz.html"><h3>Quiz Creation</h3></a></td>
        <td><a href="insertAnswers.html"><h3>Answers Insertion</h3></td>
        <td><a href="viewMarks.html"><h3>View Marks</h3></a></td>
    </tr>
</table>
        
<%  
    String quizId = request.getParameter("quizId");
    Class.forName ("com.mysql.jdbc.Driver").newInstance(); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM viewmarks WHERE quizId='"+quizId+"'ORDER BY marks DESC");

    if(rs !=null)
    {
        while(rs.next())
        {
         //Retrieve by column name
            String rollNo = rs.getString("rollNo");
            String marks = rs.getString("marks");
            String quizid = rs.getString("quizId");
%>
    <table border="1" cellpadding="20" cellspacing="10" align="center">
        <tr>
            <td>QUIZ ID</td>
            <td>ROLL NO.</td>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <td>MARKS OBTAINED</td>
        </tr>
        <tr> 
            <td><%= quizid %></td>
            <td><%= rollNo %></td>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <td><%= marks %></td>
        </tr>
    </table>
    <br />
<%
        }
      }
      stmt.close();
      conn.close();
%>
    </body>
</html>