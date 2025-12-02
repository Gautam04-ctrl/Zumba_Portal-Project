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
<title>Edit Batch</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #eef2f7;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 100%;
        max-width: 450px;
        background: white;
        padding: 25px;
        margin: 60px auto;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.15);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        font-weight: 600;
        color: #333;
    }

    label {
        font-weight: 500;
        color: #444;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        margin-bottom: 18px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 15px;
    }

    input[type="text"]:focus {
        outline: none;
        border-color: #4a90e2;
        box-shadow: 0 0 4px rgba(74,144,226,0.4);
    }

    .btn {
        width: 100%;
        padding: 12px;
        border: none;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        background: #4a90e2;
        color: white;
        font-weight: 600;
        transition: 0.3s ease;
        margin-top: 5px;
    }

    .btn:hover {
        background: #357ABD;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 15px;
        color: #444;
        text-decoration: none;
        font-size: 14px;
    }

    .back-link:hover {
        text-decoration: underline;
    }
</style>

</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/zumba_portal","root","Sanjay@30");

PreparedStatement ps = con.prepareStatement(
"select * from batches where batch_id=?");
ps.setInt(1,id);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<div class="container">
    <h2>Edit Batch</h2>

    <form action="update_batch.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">

        <label>Batch Name:</label>
        <input type="text" name="name" value="<%= rs.getString("batch_name") %>" required>

        <label>Timing:</label>
        <input type="text" name="timing" value="<%= rs.getString("timing") %>" required>

        <input type="submit" value="Update Batch" class="btn">
    </form>

    <a href="batches.jsp" class="back-link">← Back to Batch List</a>
</div>

<%
con.close();
%>

</body>
</html>
