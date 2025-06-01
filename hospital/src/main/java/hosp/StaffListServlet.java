package hosp;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/StaffListServlet")
public class StaffListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hospital_management";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "1by23is087";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Staff> staffList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "SELECT name, role, phone, email FROM staff";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Staff staff = new Staff();
                staff.setName(rs.getString("name"));
                staff.setSpecialization(rs.getString("role"));
                staff.setEmail(rs.getString("phone"));
                staff.setPhone(rs.getString("email"));
                
                staffList.add(staff);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("doctorList", staffList);
        request.getRequestDispatcher("staffList.jsp").forward(request, response);
    }
}
