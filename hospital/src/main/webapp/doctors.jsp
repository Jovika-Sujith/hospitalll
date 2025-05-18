<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Doctor</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            justify-content: center;  /* center horizontally */
            align-items: center;      /* center vertically */
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }
        form {
            background-color: #ffffff;
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form action="DoctorServlet" method="post">
        <h2>Add New Doctor</h2>

        <label>Name:</label>
        <input type="text" name="name" maxlength="100" required>

        <label>Specialization:</label>
        <input type="text" name="specialization" maxlength="100" required>

        <label>Email:</label>
        <input type="email" name="email" maxlength="100" required>

        <label>Phone:</label>
        <input type="text" name="phone" maxlength="15" required>

        <label>Department ID:</label>
        <input type="number" name="departmentID" required>

        <input type="submit" value="Add Doctor">
    </form>
</body>
</html>

