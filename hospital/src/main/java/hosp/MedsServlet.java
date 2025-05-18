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

@WebServlet("/MedsServlet")
public class MedsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int medicationID = Integer.parseInt(request.getParameter("medicationID"));
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        int stock = Integer.parseInt(request.getParameter("stock"));

        String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
        String user = "root";         // your DB username
        String password = "1by23is087"; // your DB password

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, user, password);

            String sql = "INSERT INTO medications (medicationID, name, manufacturer, stock) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, medicationID);
            stmt.setString(2, name);
            stmt.setString(3, manufacturer);
            stmt.setInt(4, stock);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Medication added successfully!</h3>");
            } else {
                out.println("<h3>Failed to add medication.</h3>");
            }

            conn.close();

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}

