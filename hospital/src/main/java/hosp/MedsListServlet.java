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

@WebServlet("/MedsListServlet")
public class MedsListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/hospital_management";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "1by23is087";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Medication List</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }");
        out.println("h2 { text-align: center; color: #333; }");
        out.println("table { margin: auto; width: 90%; border-collapse: collapse; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }");
        out.println("th, td { border: 1px solid #ccc; padding: 10px 15px; text-align: left; }");
        out.println("th { background-color: #007bff; color: white; }");
        out.println("tr:nth-child(even) { background-color: #f9f9f9; }");
        out.println("</style></head><body>");
        out.println("<h2>Medication List</h2>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM medications");

            out.println("<table>");
            out.println("<tr><th>Medication ID</th><th>Name</th><th>Manufacturer</th><th>Stock</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("medicationID") + "</td>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("manufacturer") + "</td>");
                out.println("<td>" + rs.getInt("stock") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }

        out.println("</body></html>");
    }
}
