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

@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomNumber = request.getParameter("roomnumber");
        String type = request.getParameter("type");
        String status = request.getParameter("status");

        String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
        String user = "root";   // change if needed
        String password = "1by23is087"; // change if needed

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, user, password);

            String sql = "INSERT INTO rooms (roomnumber, type, status) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, roomNumber);
            stmt.setString(2, type);
            stmt.setString(3, status);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Room added successfully!</h3>");
            } else {
                out.println("<h3>Failed to add room.</h3>");
            }

            conn.close();

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet triggered");
        response.getWriter().println("Served at: " + request.getContextPath());
    }
}
