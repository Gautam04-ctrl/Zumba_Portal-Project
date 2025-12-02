<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.zumbaportal.util.DbUtil" %>

<%
String id = request.getParameter("id");

if (id != null) {
    int memberId = Integer.parseInt(id);

    try {
        Connection con = DbUtil.getdbConn();
        String sql = "DELETE FROM members2 WHERE member_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, memberId);

        ps.executeUpdate();
        con.close();

        response.sendRedirect("members.jsp");

    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error deleting member: " + e.getMessage() + "</h3>");
        out.println("<a href='members.jsp'>Back to Members List</a>");
    }
}
%>
