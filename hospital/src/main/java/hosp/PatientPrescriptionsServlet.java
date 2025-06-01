package hosp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/PatientPrescriptionsServlet")
public class PatientPrescriptionsServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hospital_management";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "1by23is087";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientIDParam = request.getParameter("patientID");

        if (patientIDParam == null || patientIDParam.isEmpty()) {
            request.setAttribute("error", "Patient ID is required.");
            request.getRequestDispatcher("prescriptionResults.jsp").forward(request, response);
            return;
        }

        int patientID = Integer.parseInt(patientIDParam);

        List<Map<String, String>> prescriptions = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "SELECT * FROM prescriptions WHERE patientID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, patientID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, String> prescription = new HashMap<>();
                prescription.put("prescriptionID", String.valueOf(rs.getInt("prescriptionID")));
                prescription.put("doctorID", String.valueOf(rs.getInt("doctorID")));
                prescription.put("medicationID", String.valueOf(rs.getInt("medicationID")));
                prescription.put("dateprescribed", rs.getString("dateprescribed"));
                prescription.put("dosage", rs.getString("dosage"));
                prescription.put("duration", rs.getString("duration"));
                prescriptions.add(prescription);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("patientID", patientID);
        request.setAttribute("prescriptions", prescriptions);
        request.getRequestDispatcher("prescriptionResults.jsp").forward(request, response);
    }
}
