<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hospital Management System</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        a.card {
            display: block;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 30px 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: 0.3s;
            color: #007bff;
            text-decoration: none;
            cursor: pointer;
        }

        a.card:hover {
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            color: #0056b3;
        }

        .card i {
            font-size: 28px;
            margin-bottom: 10px;
            color: #555;
            display: block;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to Hospital Management System</h1>
    <p>Select a module to manage:</p>
    <div class="grid">
        <a href="admissions.jsp" class="card"><i class="fas fa-procedures"></i>Admissions</a>
        <a href="appointments.jsp" class="card"><i class="fas fa-calendar-check"></i>Appointments</a>
        <a href="bills.jsp" class="card"><i class="fas fa-file-invoice-dollar"></i>Bills</a>
        <a href="departments.jsp" class="card"><i class="fas fa-building"></i>Departments</a>
        <a href="doctors.jsp" class="card"><i class="fas fa-user-md"></i>Doctors</a>
        <a href="medications.jsp" class="card"><i class="fas fa-pills"></i>Medications</a>
        <a href="patients.jsp" class="card"><i class="fas fa-user-injured"></i>Patients</a>
        <a href="rooms.jsp" class="card"><i class="fas fa-bed"></i>Rooms</a>
        <a href="staffs.jsp" class="card"><i class="fas fa-users-cog"></i>Staff</a>
        <a href="prescriptions.jsp" class="card"><i class="fas fa-prescription"></i>Prescriptions</a>
    </div>
</div>
</body>
</html>
