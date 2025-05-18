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

@WebServlet("/BillsServlet")
public class BillsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int patientID = Integer.parseInt(request.getParameter("patientID"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentStatus = request.getParameter("paymentStatus");
        String paymentDate = request.getParameter("paymentdate");

        String dbURL = "jdbc:mysql://localhost:3306/hospital_management";
        String user = "root"; // change if needed
        String password = "1by23is087"; // change if needed

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, user, password);

            String sql = "INSERT INTO bills (patientID, amount, paymentStatus, paymentdate) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, patientID);
            stmt.setDouble(2, amount);
            stmt.setString(3, paymentStatus);
            stmt.setString(4, paymentDate);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Bill generated successfully!</h3>");
            } else {
                out.println("<h3>Failed to generate bill.</h3>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}

