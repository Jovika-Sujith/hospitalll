package hosp;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DepartmentStaffListServlet")
public class DepartmentStaffListServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hospital_management";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "1by23is087";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Map of department name to list of staff maps
        Map<String, List<Map<String, String>>> deptStaffMap = new LinkedHashMap<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {

                String sql = "SELECT s.staffID, s.name, s.role, s.phone, s.email, d.name AS department_name " +
                             "FROM staff s " +
                             "JOIN departments d ON s.departmentID = d.departmentID " +
                             "ORDER BY d.name, s.name";

                try (PreparedStatement ps = conn.prepareStatement(sql);
                     ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {
                        String deptName = rs.getString("department_name");

                        Map<String, String> staff = new HashMap<>();
                        staff.put("staffID", String.valueOf(rs.getInt("staffID")));
                        staff.put("name", rs.getString("name"));
                        staff.put("role", rs.getString("role"));
                        staff.put("phone", rs.getString("phone"));
                        staff.put("email", rs.getString("email"));

                        deptStaffMap.computeIfAbsent(deptName, k -> new ArrayList<>()).add(staff);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving staff list: " + e.getMessage());
        }

        // Set the map as request attribute
        request.setAttribute("deptStaffMap", deptStaffMap);

        // Forward to JSP page
        request.getRequestDispatcher("departmentStaffList.jsp").forward(request, response);
    }
}
