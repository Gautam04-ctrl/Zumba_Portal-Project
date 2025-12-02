<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members List - Admin Dashboard</title>

<!-- Google Font -->
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
        font-weight: 600;
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

    /* Responsive Table */
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

<h2>Registered Members</h2>

<!-- Add New Member -->
<a href="addMember.jsp" class="add-btn">➕ Add New Member</a>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Gender</th>
    <th>DOB</th>
    <th>Phone</th>
    <th>Address</th>
    <th>Batch</th>
    <th>Actions</th>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/zumba_portal", "root", "Sanjay@30"
    );

    PreparedStatement ps = con.prepareStatement("SELECT * FROM members2");
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("member_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("gender") %></td>
    <td><%= rs.getString("dob") %></td>
    <td><%= rs.getString("phone") %></td>
    <td><%= rs.getString("address") %></td>
    <td><%= rs.getString("batch_id") %></td>
    <td>
        <a class="action-btn edit-btn" href="edit_member.jsp?id=<%= rs.getInt("member_id") %>">Edit</a>
        <a class="action-btn delete-btn" href="delete_member.jsp?id=<%= rs.getInt("member_id") %>"
           onclick="return confirm('Are you sure you want to delete this member?');">Delete</a>
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

<!-- Back to Dashboard -->
<a href="admin_dashboard.jsp" class="back-dashboard">← Back to Dashboard</a>

</body>
</html>
