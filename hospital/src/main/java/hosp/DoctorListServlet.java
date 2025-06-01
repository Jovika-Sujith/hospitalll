package hosp;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DoctorListServlet")
public class DoctorListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hospital_management";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "1by23is087";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Doctor> doctorList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "SELECT name, specialization, email, phone, departmentID FROM doctors";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setName(rs.getString("name"));
                doctor.setSpecialization(rs.getString("specialization"));
                doctor.setEmail(rs.getString("email"));
                doctor.setPhone(rs.getString("phone"));
                doctor.setDepartmentID(rs.getInt("departmentID"));
                doctorList.add(doctor);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("doctorList", doctorList);
        request.getRequestDispatcher("doctorList.jsp").forward(request, response);
    }
}
