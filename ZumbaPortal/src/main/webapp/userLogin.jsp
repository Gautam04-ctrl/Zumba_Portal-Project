<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.zumbaportal.util.DbUtil" %>

<%
    String error = "";

    if (request.getParameter("login") != null) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DbUtil.getdbConn();

            String sql = "SELECT user_id, username FROM users WHERE username=? AND password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("userId", rs.getInt("user_id"));

                response.sendRedirect("viewBatch.jsp");
                return;
            } else {
                error = "Invalid username or password!";
            }

        } catch (Exception e) {
            error = "Error: " + e.getMessage();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (con != null) try { con.close(); } catch (Exception e) {}
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<style>
body { font-family: Arial; background: #f3f3f3; }
.container { width: 350px; margin: 100px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
h2 { text-align: center; }
input[type=text], input[type=password] { width: 100%; padding: 10px; margin: 5px 0 15px 0; border: 1px solid #ccc; border-radius: 4px; }
input[type=submit] { width: 100%; padding: 10px; background: #4a90e2; color: white; border: none; border-radius: 4px; cursor: pointer; }
input[type=submit]:hover { background: #357ABD; }
.logout-btn { display:block; text-align:center; margin-top:15px; color:#e74c3c; font-weight:bold; text-decoration:none; }
.error { color: red; text-align: center; }
</style>
</head>

<body>

<div class="container">
    <h2>User Login</h2>

    <form method="post" action="">
        <input type="text" name="username" placeholder="Enter your username" required />
        <input type="password" name="password" placeholder="Enter your password" required />
        <input type="submit" name="login" value="Login" />
    </form>

    <div class="error"><%= error %></div>
</div>

</body>
</html>
