<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Medications</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f8ff;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            margin: 0 auto;
            width: 80%;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px 12px;
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
<h2>Medication List</h2>

<%
    String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
    String dbUser = "root";
    String dbPass = "1by23is087";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM medications");
%>

<table>
    <tr>
        <th>Medication ID</th>
        <th>Name</th>
        <th>Manufacturer</th>
        <th>Stock</th>
    </tr>

<%
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("medicationID") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("manufacturer") %></td>
        <td><%= rs.getInt("stock") %></td>
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
