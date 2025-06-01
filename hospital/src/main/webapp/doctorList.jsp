<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
        }
        th, td {
            border: 1px solid #888;
            padding: 10px;
        }
        th {
            background-color: #f2f2f2;
        }
        h2 {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<h2>List of Doctors</h2>

<%
    String url = "jdbc:mysql://localhost:3306/hospital_management";
    String user = "root";
    String password = "1by23is087"; // replace with your password

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT name, specialization, email, phone, departmentID FROM doctors");
%>

<table>
    <tr>
        <th>Name</th>
        <th>Specialization</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Department ID</th>
    </tr>
<%
        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("specialization") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getInt("departmentID") %></td>
    </tr>
<%
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
</table>
</body>
</html>
