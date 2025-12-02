<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Batch List - Admin Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f4f6f8;
        margin: 0;
        padding: 30px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .add-btn {
        display: inline-block;
        background: #4a90e2;
        color: white;
        padding: 10px 18px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 500;
        margin-bottom: 20px;
        transition: 0.3s;
    }

    .add-btn:hover {
        background: #357ABD;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    th {
        background: #4a90e2;
        color: white;
        padding: 12px;
        text-align: left;
    }

    td {
        padding: 12px;
        color: #333;
    }

    tr:nth-child(even) {
        background: #f9f9f9;
    }

    tr:hover {
        background: #eef4ff;
    }

    .action-btn {
        text-decoration: none;
        padding: 6px 12px;
        border-radius: 5px;
        font-size: 14px;
        margin-right: 5px;
        color: white;
        transition: 0.3s;
    }

    .edit-btn {
        background: #28a745;
    }

    .edit-btn:hover {
        background: #1e7e34;
    }

    .delete-btn {
        background: #dc3545;
    }

    .delete-btn:hover {
        background: #a71d2a;
    }

    .back-dashboard {
        display: inline-block;
        margin-top: 20px;
        font-size: 16px;
        text-decoration: none;
        color: #2c3e50;
        font-weight: bold;
        transition: 0.3s;
    }

    .back-dashboard:hover {
        color: #2980b9;
        text-decoration: underline;
    }

    @media (max-width: 768px) {
        table, th, td {
            font-size: 14px;
        }

        .add-btn {
            padding: 8px 12px;
        }

        .action-btn {
            padding: 4px 8px;
            font-size: 12px;
        }

        .back-dashboard {
            font-size: 14px;
        }
    }
</style>

</head>
<body>

<h2>Batch List</h2>

<!-- Add New Batch -->
<a href="add_batch.jsp" class="add-btn">➕ Add New Batch</a>

<table>
<tr>
    <th>ID</th>
    <th>Batch Name</th>
    <th>Timing</th>
    <th>Actions</th>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/zumba_portal", "root", "Sanjay@30"
    );

    PreparedStatement ps = con.prepareStatement("SELECT * FROM batches");
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("batch_id") %></td>
    <td><%= rs.getString("batch_name") %></td>
    <td><%= rs.getString("timing") %></td>
    <td>
        <a class="action-btn edit-btn" 
           href="edit_batch.jsp?id=<%= rs.getInt("batch_id") %>">Edit</a>

        <a class="action-btn delete-btn"
           href="delete_batch.jsp?id=<%= rs.getInt("batch_id") %>"
           onclick="return confirm('Are you sure you want to delete this batch?');">
           Delete
        </a>
    </td>
</tr>

<%
    }
    con.close();
} catch (Exception e) {
    out.println("<p style='color:red; font-weight:bold;'>Error: " + e.getMessage() + "</p>");
}
%>

</table>

<!-- Back to Dashboard at bottom -->
<a href="admin_dashboard.jsp" class="back-dashboard">← Back to Dashboard</a>

</body>
</html>
