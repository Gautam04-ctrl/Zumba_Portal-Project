<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String username = (String) session.getAttribute("username");
    Integer userId = (Integer) session.getAttribute("userId");

    if (username == null || userId == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
body { font-family: Arial; background: #f3f5f9; padding: 20px; }
.box {
    width: 50%; 
    margin: auto; 
    background: #fff; 
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
h2 { text-align: center; color: #4a90e2; }
p { font-size: 18px; text-align: center; }
a { 
    display: block; 
    margin: 20px auto; 
    text-align: center; 
    width: 180px; 
    padding: 10px; 
    background: #4a90e2; 
    color: white; 
    text-decoration: none; 
    border-radius: 5px; 
}
.back-admin {
    background: #e67e22;
}
</style>
</head>

<body>

<div class="box">
    <h2>Welcome, <%= username %></h2>
    <p>Your User ID: <strong><%= userId %></strong></p>

    <a href="userHome.jsp">Back to Home</a>

    <!-- NEW: Go Back to Admin Dashboard -->
    <a href="admin_dashboard.jsp" class="back-admin">Back to Admin Dashboard</a>
</div>

</body>
</html>
