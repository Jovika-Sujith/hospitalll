<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Prescription</title>
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
            width: 350px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="number"], input[type="date"], input[type="text"] {
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
    <h2>Create Prescription</h2>
    <form action="PrescriptionServlet" method="post">
        <label>Prescription ID:</label>
        <input type="number" name="prescriptionID" required>

        <label>Patient ID:</label>
        <input type="number" name="patientID" required>

        <label>Doctor ID:</label>
        <input type="number" name="doctorID" required>

        <label>Medication ID:</label>
        <input type="number" name="medicationID" required>

        <label>Date Prescribed:</label>
        <input type="date" name="dateprescribed" required>

        <label>Dosage:</label>
        <input type="text" name="dosage" maxlength="50" required>

        <label>Duration:</label>
        <input type="text" name="duration" maxlength="50" required>

        <input type="submit" value="Save Prescription">
    </form>
</body>
</html>
