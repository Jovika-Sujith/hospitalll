<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patients</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            justify-content: center;  /* horizontally center */
            align-items: center;      /* vertically center */
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        form {
            background-color: #fff;
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
        input[type="number"],
        input[type="email"],
        select,
        textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
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
    <form action="PatientServlet" method="post">
        <h2>Register New Patient</h2>

        <label>Patient ID:</label>
        <input type="number" name="patientID" required>

        <label>Name:</label>
        <input type="text" name="name" maxlength="100" required>

        <label>Age:</label>
        <input type="number" name="age" required>

        <label>Gender:</label>
        <select name="gender" required>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select>

        <label>Phone:</label>
        <input type="text" name="phone" maxlength="15" required>

        <label>Email:</label>
        <input type="email" name="email" maxlength="100">

        <label>Address:</label>
        <textarea name="address" rows="4" cols="40"></textarea>

        <input type="submit" value="Register">
    </form>
</body>
</html>

