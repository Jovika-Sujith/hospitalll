<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Medications</title>
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
            background-color: #f4f4f4;
        }
        form {
            background-color: #ffffff;
            padding: 25px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
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
    <form action="MedsServlet" method="post">
        <h2>Add Medication</h2>

        <label>Medication ID:</label>
        <input type="number" name="medicationID" required>

        <label>Name:</label>
        <input type="text" name="name" maxlength="100" required>

        <label>Manufacturer:</label>
        <input type="text" name="manufacturer" maxlength="100" required>

        <label>Stock:</label>
        <input type="number" name="stock" required>

        <input type="submit" value="Add Medication">
    </form>
</body>
</html>

