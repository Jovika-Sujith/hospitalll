package hosp;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Types;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdmissionServlet")
public class AdmissionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Replace with your actual DB info
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hospital_management";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "1by23is087";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int patientID = Integer.parseInt(request.getParameter("patientID"));
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        String admitDate = request.getParameter("admitdate").replace("T", " ") + ":00";
        String dischargeDate = request.getParameter("dischargedate");

        if (dischargeDate != null && !dischargeDate.isEmpty()) {
            dischargeDate = dischargeDate.replace("T", " ") + ":00";
        } else {
            dischargeDate = null;
        }

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            String sql = "INSERT INTO admissions (patientID, roomID, admitdate, dischargedate) VALUES (?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, patientID);
            stmt.setInt(2, roomID);
            stmt.setString(3, admitDate);

            if (dischargeDate != null) {
                stmt.setString(4, dischargeDate);
            } else {
                stmt.setNull(4, Types.TIMESTAMP);
            }

            int result = stmt.executeUpdate();
            conn.close();

            response.setContentType("text/html");
            response.getWriter().println("<h3>Admission Successful! (" + result + " row inserted)</h3>");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
