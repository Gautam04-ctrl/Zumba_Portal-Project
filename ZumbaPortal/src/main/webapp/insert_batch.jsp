<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String time = request.getParameter("timing");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/zumba_portal","root","Sanjay@30");

PreparedStatement ps = con.prepareStatement(
"insert into batches(batch_name, timing) VALUES (?, ?)");

ps.setString(1,name);
ps.setString(2,time);

ps.executeUpdate();
con.close();
response.sendRedirect("batches.jsp");
%>
</body>
</html>