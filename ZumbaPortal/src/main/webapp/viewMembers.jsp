<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.zumbaportal.util.DbUtil" %>

<%
    
    Integer memberId = (Integer) session.getAttribute("memberId");

    if (memberId == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f3f5f9;
        padding: 20px;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    table {
        width: 60%;
        margin: 20px auto;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    th, td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
    }
    th {
        background: #4a90e2;
        color: #fff;
        text-align: left;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 25px;
        text-decoration: none;
        color: #4a90e2;
        font-weight: bold;
    }
</style>
</head>
<body>

<h2>Your Zumba Profile</h2>

<table>
    <tr>
        <th>Field</th>
        <th>Details</th>
    </tr>

<%
try {
    Connection con = DbUtil.getdbConn();
    String sql = "SELECT m.member_id, m.name, b.batch_name " +
                 "FROM members2 m JOIN batches b ON m.batch_id = b.batch_id " +
                 "WHERE m.member_id = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, memberId);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
%>
    <tr>
        <td>Zumba ID</td>
        <td><%= rs.getInt("member_id") %></td>
    </tr>
    <tr>
        <td>Name</td>
        <td><%= rs.getString("name") %></td>
    </tr>
    <tr>
        <td>Batch</td>
        <td><%= rs.getString("batch_name") %></td>
    </tr>
<%
    } else {
%>
    <tr>
        <td colspan="2" style="text-align:center; color:red;">No profile found!</td>
    </tr>
<%
    }
    con.close();
} catch (Exception e) {
    out.println("<tr><td colspan='2' style='color:red; text-align:center;'>Error: " + e.getMessage() + "</td></tr>");
}
%>

</table>

<a class="back-link" href="userHome.jsp">← Back to Dashboard</a>

</body>
</html>
