<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Patient Prescriptions</title>
</head>
<body>
    <h2>Enter Patient ID to View Prescriptions</h2>
    <form action="PatientPrescriptionsServlet" method="get">
        <label for="patientID">Patient ID:</label>
        <input type="number" name="patientID" id="patientID" required>
        <input type="submit" value="View Prescriptions">
    </form>
</body>
</html>
