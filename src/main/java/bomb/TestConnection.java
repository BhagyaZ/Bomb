package bomb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestConnection {

    public static void main(String[] args) {
        // Change these details to match your setup
        String url = "jdbc:mysql://localhost:3306/bomb"; // use 3307 if your MySQL runs on that
        String user = "root";
        String password = "3196";

        try {
            // Load the JDBC driver (MySQL 8+)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Attempt to connect
            Connection conn = DriverManager.getConnection(url, user, password);

            System.out.println("✅ Connection successful!");

            // Close connection after test
            conn.close();

        } catch (ClassNotFoundException e) {
            System.out.println("❌ JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Connection failed!");
            e.printStackTrace();
        }
    }
}

