<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.zumbaportal.util.DbUtil" %>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String id = request.getParameter("id");
    String message = "";

 
    if (request.getParameter("update") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int batchId = Integer.parseInt(request.getParameter("batchId"));

        con = DbUtil.getdbConn();
        String updateSQL = "UPDATE members2 SET name=?, email=?, gender=?, dob=?, phone=?, address=?, batch_id=? WHERE member_id=?";
        ps = con.prepareStatement(updateSQL);

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, gender);
        ps.setString(4, dob);
        ps.setString(5, phone);
        ps.setString(6, address);
        ps.setInt(7, batchId);
        ps.setInt(8, Integer.parseInt(id));

        int row = ps.executeUpdate();
        if (row > 0) {
            message = "Member Updated Successfully!";
        }
    }

  
    con = DbUtil.getdbConn();
    String sql = "SELECT * FROM members2 WHERE member_id=?";
    ps = con.prepareStatement(sql);
    ps.setInt(1, Integer.parseInt(id));
    rs = ps.executeQuery();

    String name="", email="", gender="", dob="", phone="", address="";
    int batchId = 0;

    if (rs.next()) {
        name = rs.getString("name");
        email = rs.getString("email");
        gender = rs.getString("gender");
        dob = rs.getString("dob");
        phone = rs.getString("phone");
        address = rs.getString("address");
        batchId = rs.getInt("batch_id");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Member</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f3f5f9;
        margin: 0;
        padding: 20px;
    }

    h2 {
        text-align: center;
        color: #333;
        font-weight: 600;
        margin-bottom: 20px;
    }

    .message {
        text-align: center;
        color: green;
        font-weight: 500;
        margin-bottom: 20px;
    }

    form {
        max-width: 600px;
        margin: auto;
        background: #fff;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    label {
        display: block;
        font-weight: 500;
        margin-bottom: 6px;
    }

    input[type="text"], input[type="email"], input[type="date"], select, textarea {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        box-sizing: border-box;
    }

    textarea {
        resize: vertical;
        min-height: 80px;
    }

    input[type="submit"] {
        background-color: #4a90e2;
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #357ABD;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #4a90e2;
        text-decoration: none;
        font-weight: 500;
    }

    .back-link:hover {
        text-decoration: underline;
    }

    /* Responsive */
    @media (max-width: 600px) {
        form {
            padding: 20px;
        }
    }
</style>
</head>
<body>

<h2>Edit Member</h2>

<% if(!message.equals("")) { %>
    <p class="message"><%= message %></p>
<% } %>

<form action="edit_member.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= name %>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%= email %>" required>

    <label>Gender:</label>
    <select name="gender">
        <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
        <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
        <option value="Other" <%= gender.equals("Other") ? "selected" : "" %>>Other</option>
    </select>

    <label>Date of Birth:</label>
    <input type="date" name="dob" value="<%= dob %>">

    <label>Phone:</label>
    <input type="text" name="phone" value="<%= phone %>">

    <label>Address:</label>
    <textarea name="address"><%= address %></textarea>

    <label>Select Batch:</label>
    <select name="batchId">
        <option value="1" <%= batchId == 1 ? "selected" : "" %>>Morning</option>
        <option value="2" <%= batchId == 2 ? "selected" : "" %>>Evening</option>
    </select>

    <input type="submit" name="update" value="Update Member">
</form>

<a class="back-link" href="members.jsp">← Back to Members List</a>

</body>
</html>
