<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Batch</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f3f5f9;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 100%;
        max-width: 420px;
        margin: 60px auto;
        padding: 25px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.12);
    }

    h2 {
        text-align: center;
        font-weight: 600;
        margin-bottom: 25px;
        color: #333;
    }

    label {
        font-weight: 500;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 15px;
    }

    input[type="text"]:focus {
        border-color: #4a90e2;
        outline: none;
        box-shadow: 0 0 4px rgba(74,144,226,0.4);
    }

    .btn {
        width: 100%;
        padding: 12px;
        background: #4a90e2;
        color: white;
        border: none;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s ease;
        margin-top: 8px;
    }

    .btn:hover {
        background: #357ABD;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 15px;
        color: #555;
        text-decoration: none;
        font-size: 14px;
    }

    .back-link:hover {
        text-decoration: underline;
    }

</style>

</head>
<body>

<div class="container">
    <h2>Add New Batch</h2>

    <form action="insert_batch.jsp" method="post">
        <label>Batch Name:</label>
        <input type="text" name="name" placeholder="Enter batch name" required>

        <label>Timing:</label>
        <input type="text" name="timing" placeholder="e.g. 7 AM - 8 AM" required>

        <input type="submit" value="Save Batch" class="btn">
    </form>

    <a class="back-link" href="batches.jsp">← Back to Batch List</a>
</div>

</body>
</html>
