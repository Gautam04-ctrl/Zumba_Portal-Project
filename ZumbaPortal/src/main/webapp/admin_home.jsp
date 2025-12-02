<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zumba Admin Dashboard</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Poppins", Arial, sans-serif;
        background: #eef2f7;
        display: flex;
    }

    /* Sidebar */
    .sidebar {
        width: 250px;
        background: #1a73e8;
        height: 100vh;
        padding-top: 40px;
        color: white;
        position: fixed;
        left: 0;
        top: 0;
    }

    .sidebar h2 {
        text-align: center;
        margin-bottom: 40px;
        font-size: 22px;
    }

    .sidebar a {
        display: block;
        padding: 15px 25px;
        font-size: 16px;
        color: white;
        text-decoration: none;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        transition: 0.3s;
    }

    .sidebar a i {
        margin-right: 12px;
    }

    .sidebar a:hover {
        background: #0b5ed7;
    }

    /* Main Content */
    .main {
        margin-left: 250px;
        padding: 30px;
        width: 100%;
    }

    .top-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .top-bar h2 {
        color: #333;
    }

    .logout-btn {
        background: #dc3545;
        color: white;
        padding: 10px 18px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
    }

    .logout-btn:hover {
        background: #b02a37;
    }

    /* Profile Card */
    .profile-card {
        background: white;
        padding: 20px;
        margin-top: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        display: flex;
        align-items: center;
        gap: 20px;
        width: 400px;
    }

    .profile-card img {
        width: 70px;
        height: 70px;
        border-radius: 50%;
    }

    /* Dashboard Cards */
    .cards {
        display: flex;
        gap: 20px;
        margin-top: 30px;
    }

    .card {
        background: white;
        flex: 1;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .card h3 {
        color: #444;
        margin-bottom: 10px;
    }

    .chart-area {
        margin-top: 30px;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
</style>
</head>

<body>

<%
if(session.getAttribute("admin")==null){
    response.sendRedirect("admin_login.jsp");
    return;
}
%>

<!-- Sidebar -->
<div class="sidebar">
    <h2><i class="fa-solid fa-dumbbell"></i> Zumba Admin</h2>

    <a href="admin_dashboard.jsp"><i class="fa-solid fa-home"></i> Dashboard</a>
    <a href="batches.jsp"><i class="fa-solid fa-layer-group"></i> Manage Batches</a>
    <a href="members.jsp"><i class="fa-solid fa-users"></i> Manage Members</a>
    <a href="user_register.jsp"><i class="fa-solid fa-user-plus"></i> User Registration</a>
    <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="main">
    
    <!-- Top Bar -->
    <div class="top-bar">
        <h2>Welcome, Rohit 👋</h2>

        <a href="logout.jsp" class="logout-btn">
            <i class="fa-solid fa-arrow-right-from-bracket"></i> Logout
        </a>
    </div>

    <!-- Profile Card -->
    <div class="profile-card">
        <img src="https://via.placeholder.com/70" alt="Admin Photo">
        <div>
            <h3>Rohit | Admin</h3>
            <p>Email: admin@zumba.com</p>
        </div>
    </div>

    <!-- Dashboard Cards -->
    <div class="cards">
        <div class="card">
            <h3>Total Members</h3>
            <p>128</p>
        </div>

        <div class="card">
            <h3>Total Batches</h3>
            <p>12</p>
        </div>

        <div class="card">
            <h3>Active Users</h3>
            <p>34</p>
        </div>
    </div>

    <!-- Chart Area -->
    <div class="chart-area">
        <h3>Activity Chart</h3>
        <p>(You can add a chart library later like Chart.js)</p>
    </div>

</div>

</body>
</html>
