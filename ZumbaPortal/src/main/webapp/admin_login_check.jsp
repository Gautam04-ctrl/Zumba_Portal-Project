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
String u = request.getParameter("username");
String p = request.getParameter("password");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/zumba_portal","root","Sanjay@30");

PreparedStatement ps = con.prepareStatement(
    "select * from admin_login Where username=? and password=?");

ps.setString(1, u);
ps.setString(2, p);

ResultSet rs = ps.executeQuery();

if(rs.next()) {
    session.setAttribute("admin", u);
    response.sendRedirect("admin_home.jsp");
} else {
    out.println("<h3>Invalid login!</h3>");
}

con.close();
%>
</body>
</html>