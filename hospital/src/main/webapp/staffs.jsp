<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Staff</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            justify-content: center; /* center horizontally */
            align-items: center;     /* center vertically */
            height: 100vh;           /* viewport height */
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        form {
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: left;
            width: 300px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 6px 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 8px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        h2 {
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<h2>Add New Staff Member</h2>
<form action="StaffServlet" method="post">
    <label>Name:</label>
    <input type="text" name="name" required>

    <label>Role:</label>
    <input type="text" name="role" required>

    <label>Phone:</label>
    <input type="text" name="phone" required>

    <label>Email:</label>
    <input type="email" name="email" required>

    <input type="submit" value="Add Staff">
</form>
</body>
</html>

