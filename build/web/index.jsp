<%-- 
    Document   : index
    Created on : 17 Jun, 2013, 9:39:15 AM
    Author     : xang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <% response.setIntHeader("Refresh", 10); %>
    </head>
    <body bgcolor='#5B4CFF'>
        <img src="images/background.png" alt="hpc logo" height="136" width="800" />
        <center>    
            <ul>     
                <hr />
                <li><a href="adminLogin.html"><h1>ADMIN LOGIN</h1></a></li>
                <hr />
                <li><a href="userLogin.html"><h1>APPLICANT LOGIN</h1></a></li>
                <hr />
                <li><a href="apply.html"><h1>APPLY NOW</h1></a></li>
                <hr />
            </ul>
        </center>
    </body>
</html>
