<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.util.Map" %>
<html>
<head><title>Patient Prescriptions</title></head>
<body>
<h2>Prescriptions for Patient ID: ${patientID}</h2>

<%
    List<Map<String, String>> prescriptions = (List<Map<String, String>>) request.getAttribute("prescriptions");
    if (prescriptions != null && !prescriptions.isEmpty()) {
%>
    <table border="1">
        <tr>
            <th>Prescription ID</th>
            <th>Doctor ID</th>
            <th>Medication ID</th>
            <th>Date Prescribed</th>
            <th>Dosage</th>
            <th>Duration</th>
        </tr>
        <%
            for (Map<String, String> p : prescriptions) {
        %>
        <tr>
            <td><%= p.get("prescriptionID") %></td>
            <td><%= p.get("doctorID") %></td>
            <td><%= p.get("medicationID") %></td>
            <td><%= p.get("dateprescribed") %></td>
            <td><%= p.get("dosage") %></td>
            <td><%= p.get("duration") %></td>
        </tr>
        <%
            }
        %>
    </table>
<%
    } else {
%>
    <p>No prescriptions found.</p>
<%
    }
%>
</body>
</html>
