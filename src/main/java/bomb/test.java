package bomb;

import java.sql.Connection;
import java.sql.SQLException;

public class test {
    public static void main(String[] args) {
        Connection connection = DBConnectionAdmin.getConnection();

        if (connection != null) {
            try {
                System.out.println("Database connection successful!");
                System.out.println("Connection details: " + connection.getCatalog());

                // Close the connection when done
                connection.close();
            } catch (SQLException e) {
                System.out.println("Error while checking connection: " + e.getMessage());
            }
        } else {
            System.out.println("Failed to make database connection!");
        }
    }
}