package hosp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Test {
	public static void main(String[] args) {
        // Replace with your actual values
        String jdbcURL = "jdbc:mysql://localhost:3306/hospital_management"; // example: hospital_db
        String dbUser = "root";   // example: root
        String dbPassword = "1by23is087";  // example: admin123

        try {
            // Try to connect
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            System.out.println("✅ Connected to MySQL successfully!");
            connection.close();
        } catch (SQLException e) {
            System.out.println("❌ Connection failed:");
            e.printStackTrace();
        }
    }
}


