package hosp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials and URL
    private final String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
    private final String user = "root";
    private final String password = "1by23is087";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        response.setContentType("text/html");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbURL, user, password)) {

                String sql = "INSERT INTO staff (name, role, phone, email) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, name);
                    stmt.setString(2, role);
                    stmt.setString(3, phone);
                    stmt.setString(4, email);

                    int rows = stmt.executeUpdate();
                    response.getWriter().println(rows > 0 ? "<h3>Staff member added successfully!</h3>"
                            : "<h3>Failed to add staff member.</h3>");
                }
            }
        } catch (Exception e) {
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(response.getWriter());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Staff> staffList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbURL, user, password)) {
                String sql = "SELECT staffID, name, role, phone, email FROM staff";
                try (PreparedStatement stmt = conn.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery()) {

                    while (rs.next()) {
                        Staff s = new Staff();
                        s.setStaffID(rs.getInt("staffID"));
                        s.setName(rs.getString("name"));
                        s.setRole(rs.getString("role"));
                        s.setPhone(rs.getString("phone"));
                        s.setEmail(rs.getString("email"));
                        staffList.add(s);
                    }
                }
            }
        } catch (Exception e) {
            throw new ServletException("Error retrieving staff list", e);
        }

        // Set attribute and forward to JSP
        request.setAttribute("staffList", staffList);
        request.getRequestDispatcher("staffs.jsp").forward(request, response);
    }

    // Simple Staff inner class (ideally put this in a separate file)
    public static class Staff {
        private int staffID;
        private String name;
        private String role;
        private String phone;
        private String email;

        public int getStaffID() { return staffID; }
        public void setStaffID(int staffID) { this.staffID = staffID; }

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }

        public String getRole() { return role; }
        public void setRole(String role) { this.role = role; }

        public String getPhone() { return phone; }
        public void setPhone(String phone) { this.phone = phone; }

        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
    }
}

