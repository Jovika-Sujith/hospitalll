<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Appointment</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            justify-content: center;   /* center horizontally */
            align-items: center;       /* center vertically */
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
        }
        form {
            background-color: #fff;
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
        input[type="datetime-local"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
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
    <form action="AppointmentServlet" method="post">
        <h2>Schedule Appointment</h2>

        <label>Patient ID:</label>
        <input type="number" name="patientID" required>

        <label>Doctor ID:</label>
        <input type="number" name="doctorID" required>

        <label>Appointment Date & Time:</label>
        <input type="datetime-local" name="appointmentdate" required>

        <label>Reason:</label>
        <textarea name="reason" rows="4" cols="30"></textarea>

        <input type="submit" value="Schedule">
    </form>
</body>
</html>
