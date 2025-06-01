<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Patients</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            margin: 0 auto;
            width: 90%;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px 15px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
<h2>Patient List</h2>

<%
    String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
    String dbUser = "root";
    String dbPass = "1by23is087";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM patients");
%>

<table>
    <tr>
        <th>Patient ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
    </tr>

<%
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("patientID") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getInt("age") %></td>
        <td><%= rs.getString("gender") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("address") %></td>
    </tr>
<%
    }
    conn.close();
} catch (Exception e) {
    out.println("<p>Error: " + e.getMessage() + "</p>");
}
%>
</table>

</body>
</html>


