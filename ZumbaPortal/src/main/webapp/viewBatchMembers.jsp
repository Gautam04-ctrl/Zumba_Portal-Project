<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.zumbaportal.util.DbUtil" %>

<%
    
    String user = (String) session.getAttribute("user");
    Integer memberId = (Integer) session.getAttribute("memberId");

    if (user == null || memberId == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String memberName = "";
    String batchName = "";
%>

<!DOCTYPE html>
<html>
<head>
<title>Your Batch Details</title>
<style>
    body { font-family: Arial; background: #f3f5f9; padding:20px; }
    table { width:60%; margin:auto; border-collapse: collapse; background:#fff; }
    th, td { padding:12px; border-bottom:1px solid #ddd; }
    th { background:#4a90e2; color:#fff; }
</style>
</head>
<body>

<h2 style="text-align:center;">Your Batch Details</h2>

<%
try {
    con = DbUtil.getdbConn();

    String sql = "SELECT m.member_id, m.name, b.batch_name " +
                 "FROM members2 m JOIN batches b ON m.batch_id = b.batch_id " +
                 "WHERE m.member_id = ?";

    ps = con.prepareStatement(sql);
    ps.setInt(1, memberId);
    rs = ps.executeQuery();

    if (rs.next()) {
        memberName = rs.getString("name");
        batchName = rs.getString("batch_name");
%>

<table>
<tr><th>Member ID</th><td><%= memberId %></td></tr>
<tr><th>Name</th><td><%= memberName %></td></tr>
<tr><th>Batch</th><td><%= batchName %></td></tr>
</table>

<%
    } else {
        out.println("<h3 style='color:red; text-align:center;'>No details found.</h3>");
    }

} catch (Exception e) {
    out.println("<h3 style='color:red; text-align:center;'>Error: " + e.getMessage() + "</h3>");
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
}
%>

<br>
<div style="text-align:center;">
    <a href="userHome.jsp">← Back to Home</a>
</div>

</body>
</html>
