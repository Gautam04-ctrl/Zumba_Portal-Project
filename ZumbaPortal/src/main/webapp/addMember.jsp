<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException"%>

<%
    String message = "";
    boolean success = false;

    if (request.getMethod().equalsIgnoreCase("POST")) {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String batchIdStr = request.getParameter("batch_id");

        int batchId = (batchIdStr != null && !batchIdStr.isEmpty()) 
                        ? Integer.parseInt(batchIdStr) : 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/zumba_portal", 
                "root", 
                "Sanjay@30"
            );

          
            String sql = "INSERT INTO members2 (name, email, gender, dob, phone, address, batch_id) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, gender);
            ps.setString(4, dob);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.setInt(7, batchId);

            int row = ps.executeUpdate();

            if (row > 0) {
                success = true;
            } else {
                message = "Failed to add member!";
            }

            con.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            e.printStackTrace();
        }
    }

    if (success) {
        response.sendRedirect("members.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Member</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body { font-family: 'Poppins', sans-serif; background: #f3f5f9; padding: 20px; }
    form {
        max-width: 600px; margin: auto; background: #fff; padding: 25px;
        border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    input, textarea, select {
        width: 100%; padding: 10px; margin: 8px 0 20px 0;
        border: 1px solid #ccc; border-radius: 6px;
    }
    input[type="submit"] {
        background-color: #4a90e2; color: white; padding: 12px;
        border: none; border-radius: 6px; cursor: pointer;
    }
</style>
</head>
<body>

<h2 style="text-align:center;">Add New Member</h2>

<% if (!message.equals("")) { %>
    <p style="text-align:center; color:red;"><%= message %></p>
<% } %>

<form method="post">

    <label>Name:</label>
    <input type="text" name="name" required>

    <label>Email:</label>
    <input type="email" name="email" required>

    <label>Gender:</label>
    <select name="gender">
        <option value="">Select</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>

    <label>Date of Birth:</label>
    <input type="date" name="dob">

    <label>Phone:</label>
    <input type="text" name="phone">

    <label>Address:</label>
    <textarea name="address"></textarea>

    <label>Batch ID:</label>
    <input type="number" name="batch_id">

    <input type="submit" value="Add Member">

</form>

<a href="members.jsp" style="display:block; text-align:center; margin-top:20px; color:#4a90e2;">← Back to Members List</a>

</body>
</html>
