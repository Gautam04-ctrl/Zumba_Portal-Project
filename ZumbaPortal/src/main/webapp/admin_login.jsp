<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Handle login logic inside JSP
    String msg = "";
    String u = request.getParameter("username");
    String p = request.getParameter("password");

    if (u != null && p != null) {
       
        if (u.equals("Rohit") && p.equals("admin@123")) {

            session.setAttribute("admin", u); 
            response.sendRedirect("admin_dashboard.jsp");  
            return;
        } else {
            msg = "Invalid username or password!";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #4a90e2, #9013fe);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-container {
        background: white;
        width: 350px;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.3);
        animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        font-weight: 600;
        margin-bottom: 20px;
        color: #333;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-top: 8px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
    }

    .btn-login {
        width: 100%;
        padding: 12px;
        background: #4a90e2;
        border: none;
        color: white;
        font-size: 17px;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
        font-weight: bold;
    }

    .btn-login:hover {
        background: #357ABD;
    }

    .error {
        color: #ff3333;
        font-weight: 600;
        text-align: center;
        margin-bottom: 12px;
    }

    /* Mobile Responsive */
    @media (max-width: 480px) {
        .login-container {
            width: 88%;
            padding: 25px;
        }
    }
</style>

</head>
<body>

<div class="login-container">

    <h2>Admin Login</h2>

    <% if (!msg.equals("")) { %>
        <div class="error"><%= msg %></div>
    <% } %>

    <form method="post" action="admin_login.jsp">
        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button class="btn-login">Login</button>
    </form>

</div>

</body>
</html>
