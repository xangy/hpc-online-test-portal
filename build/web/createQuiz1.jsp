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
    String quizId = request.getParameter ("quizId");
    String quizTopic = request.getParameter ("quizTopic");
    String ques = request.getParameter ("q");
    String ans1 = request.getParameter ("a1");
    String ans2 = request.getParameter ("a2");
    String ans3 = request.getParameter ("a3");
    String ans4 = request.getParameter ("a4");
    int value = Integer.parseInt(request.getParameter ("nextQuestionOrNot"));
    Class.forName ("com.mysql.jdbc.Driver").newInstance(); 		    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpc", "root", "root");  
    String sql = "INSERT INTO quiz (quizId, quizTopic, q, a1, a2, a3, a4) values (?,?,?,?,?,?,?)";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, quizId);
    stmt.setString(2, quizTopic);
    stmt.setString(3, ques);
    stmt.setString(4, ans1);
    stmt.setString(5, ans2);
    stmt.setString(6, ans3);
    stmt.setString(7, ans4);
    stmt.executeUpdate();
    if(value == 1)
        {
            response.sendRedirect("createQuiz.html");
        }
    else
        {
            response.sendRedirect("insertAnswers.html");
        }
    conn.close();
%>
    </body>
</html>
