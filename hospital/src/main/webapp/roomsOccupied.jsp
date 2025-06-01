<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Occupied Rooms</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px 15px;
            text-align: center;
        }
        th {
            background-color: #dc3545;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h2>Occupied Rooms</h2>

<%
    String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
    String dbUser = "root";
    String dbPass = "1by23is087";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM rooms WHERE status = 'Occupied'");
%>

<table>
    <tr>
        <th>Room Number</th>
        <th>Type</th>
        <th>Status</th>
    </tr>

<%
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString("roomnumber") %></td>
        <td><%= rs.getString("type") %></td>
        <td><%= rs.getString("status") %></td>
    </tr>
<%
    }
    conn.close();
} catch (Exception e) {
    out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
}
%>
</table>
</body>
</html>
