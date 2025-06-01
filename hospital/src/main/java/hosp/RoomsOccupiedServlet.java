package hosp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RoomsOccupiedServlet")
public class RoomsOccupiedServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/hospital_management";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "1by23is087";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Occupied Rooms</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; background-color: #f8f9fa; padding: 20px; }");
        out.println("h2 { text-align: center; color: #333; }");
        out.println("table { width: 80%; margin: 0 auto; border-collapse: collapse; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }");
        out.println("th, td { border: 1px solid #ccc; padding: 10px 15px; text-align: center; }");
        out.println("th { background-color: #dc3545; color: white; }");
        out.println("tr:nth-child(even) { background-color: #f2f2f2; }");
        out.println("</style></head><body>");
        out.println("<h2>Occupied Rooms</h2>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM rooms WHERE status = 'Occupied'");

            out.println("<table>");
            out.println("<tr><th>Room Number</th><th>Type</th><th>Status</th></tr>");

            while (rs.next()) {
                String roomNumber = rs.getString("roomnumber");
                String type = rs.getString("type");
                String status = rs.getString("status");

                out.println("<tr>");
                out.println("<td>" + roomNumber + "</td>");
                out.println("<td>" + type + "</td>");
                out.println("<td>" + status + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        }

        out.println("</body></html>");
    }
}
