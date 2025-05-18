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
@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int patientID = Integer.parseInt(request.getParameter("patientID"));
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        String appointmentDate = request.getParameter("appointmentdate").replace("T", " "); // format to 'yyyy-MM-dd HH:mm:ss'
        String reason = request.getParameter("reason");

        String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
        String user = "root";   // change this
        String password = "1by23is087"; // change this

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, user, password);

            String sql = "INSERT INTO appointments (patientID, doctorID, appointmentdate, reason) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, patientID);
            stmt.setInt(2, doctorID);
            stmt.setString(3, appointmentDate);
            stmt.setString(4, reason);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Appointment scheduled successfully!</h3>");
            } else {
                out.println("<h3>Failed to schedule appointment.</h3>");
            }

            conn.close();

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}
