package hosp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PrescriptionServlet")
public class PrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int prescriptionID = Integer.parseInt(request.getParameter("prescriptionID"));
        int patientID = Integer.parseInt(request.getParameter("patientID"));
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        int medicationID = Integer.parseInt(request.getParameter("medicationID"));
        String datePrescribed = request.getParameter("dateprescribed");
        String dosage = request.getParameter("dosage");
        String duration = request.getParameter("duration");

        String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
        String user = "root";
        String password = "1by23is087";  // change if needed

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, user, password);

            String sql = "INSERT INTO prescriptions (prescriptionID, patientID, doctorID, medicationID, dateprescribed, dosage, duration) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, prescriptionID);
            stmt.setInt(2, patientID);
            stmt.setInt(3, doctorID);
            stmt.setInt(4, medicationID);
            stmt.setString(5, datePrescribed);
            stmt.setString(6, dosage);
            stmt.setString(7, duration);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Prescription saved successfully!</h3>");
            } else {
                out.println("<h3>Failed to save prescription.</h3>");
            }

            conn.close();

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
    

}
