<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Room</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            justify-content: center;  /* center horizontally */
            align-items: center;      /* center vertically */
            height: 100vh;            /* full viewport height */
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        form {
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: left;
            width: 320px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"], select {
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
<h2>Add New Room</h2>
<form action="RoomServlet" method="post">
    <label>Room Number:</label>
    <input type="text" name="roomnumber" required>

    <label>Type:</label>
    <select name="type" required>
        <option value="General">General</option>
        <option value="ICU">ICU</option>
        <option value="Private">Private</option>
    </select>

    <label>Status:</label>
    <select name="status" required>
        <option value="Available">Available</option>
        <option value="Occupied">Occupied</option>
    </select>

    <input type="submit" value="Add Room">
</form>
</body>
</html>
