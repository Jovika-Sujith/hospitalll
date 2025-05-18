<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>New Admission</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
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
        input[type="number"],
        input[type="datetime-local"] {
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
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form action="AdmissionServlet" method="post">
        <h2>New Admission</h2>

        <label>Patient ID:</label>
        <input type="number" name="patientID" required>

        <label>Room ID:</label>
        <input type="number" name="roomID" required>

        <label>Admit Date:</label>
        <input type="datetime-local" name="admitdate" required>

        <label>Discharge Date:</label>
        <input type="datetime-local" name="dischargedate">

        <input type="submit" value="Admit Patient">
    </form>
</body>
</html>
