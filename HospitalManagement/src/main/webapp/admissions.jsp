<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>New Admission</title>
</head>
<body>
    <h2>New Admission</h2>
    <form action="AdmissionServlet" method="post">
        <label>Patient ID:</label>
        <input type="number" name="patientID" required><br><br>

        <label>Room ID:</label>
        <input type="number" name="roomID" required><br><br>

        <label>Admit Date:</label>
        <input type="datetime-local" name="admitdate" required><br><br>

        <label>Discharge Date:</label>
        <input type="datetime-local" name="dischargedate"><br><br>

        <input type="submit" value="Admit Patient">
    </form>
</body>
</html>