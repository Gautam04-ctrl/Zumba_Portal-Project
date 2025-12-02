<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.zumbaportal.util.DbUtil" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f3f5f9;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        padding: 20px;
    }

    .container {
        background: #fff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        max-width: 400px;
        width: 100%;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
        font-weight: 600;
    }

    form label {
        display: block;
        margin-bottom: 5px;
        font-weight: 500;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 6px;
        background: #4a90e2;
        color: white;
        font-size: 16px;
        cursor: pointer;
        font-weight: 500;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background: #357ABD;
    }

    h3 {
        text-align: center;
        margin-top: 15px;
    }

    h3 a {
        color: #4a90e2;
        text-decoration: none;
        font-weight: 500;
    }

    h3 a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="container">
    <h2>User Registration</h2>

<%
   
    String uname = request.getParameter("username");

    if (uname != null && !uname.trim().equals("")) {
        String pwd = request.getParameter("password");
        String email = request.getParameter("email");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DbUtil.getdbConn();
            String sql = "INSERT INTO users(username, password, email) VALUES(?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setString(2, pwd);
            ps.setString(3, email);

            int row = ps.executeUpdate();

            if (row > 0) {
               
                response.sendRedirect("userLogin.jsp");
            } else {
%>
                <h3 style="color:red;">Registration Failed</h3>
<%
            }

        } catch (Exception e) {
%>
            <h3 style="color:red;">Error: <%= e.getMessage() %></h3>
<%
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ex) {}
            try { if (con != null) con.close(); } catch (Exception ex) {}
        }
    } else {
      
%>
        <form method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <input type="submit" value="Register">
        </form>
<%
    } // close else
%>

</div>
</body>
</html>
