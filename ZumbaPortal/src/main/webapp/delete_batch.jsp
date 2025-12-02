<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Batch</title>
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));

try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/zumba_portal","root","Sanjay@30");

    
    PreparedStatement ps = con.prepareStatement(
        "DELETE FROM batches WHERE batch_id=?");
    ps.setInt(1, id);

    try {
        ps.executeUpdate();
        con.close();
        response.sendRedirect("batches.jsp");
        return;

    } catch (SQLException e) {
        out.println("<h3 style='color:red;'>Cannot delete batch. Members are assigned to this batch.</h3>");
        out.println("<a href='batches.jsp'>Go Back</a>");
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

</body>
</html>
