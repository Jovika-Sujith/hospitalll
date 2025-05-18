<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Generate Bill</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            justify-content: center;   /* center horizontally */
            align-items: center;       /* center vertically */
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }
        form {
            background-color: #fff;
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form action="BillsServlet" method="post">
        <h2>Bill Details</h2>

        <label>Patient ID:</label>
        <input type="number" name="patientID" required>

        <label>Amount:</label>
        <input type="number" step="0.01" name="amount" required>

        <label>Payment Status:</label>
        <select name="paymentStatus" required>
            <option value="Paid">Paid</option>
            <option value="Unpaid">Unpaid</option>
        </select>

        <label>Payment Date:</label>
        <input type="date" name="paymentdate" required>

        <input type="submit" value="Generate Bill">
    </form>
</body>
</html>
