<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Admissions</title>
</head>
<body>
    <h2>New Admission</h2>
    <form action="AdmissionServlet" method="post">
        Patient ID: <input type="number" name="patientID" required><br><br>
        Room ID: <input type="number" name="roomID" required><br><br>
        Admit Date: <input type="datetime-local" name="admitdate" required><br><br>
        Discharge Date: <input type="datetime-local" name="dischargedate"><br><br>
        <input type="submit" value="Admit Patient">
    </form>
</body>
</html>