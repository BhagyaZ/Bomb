package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static String url ="jdbc:mysql://localhost:3308/bomb";
    private static String user ="root";
    private static String pass ="";
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("Database connected successfully!");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection failed (SQL issue).");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unexpected error occurred.");
            e.printStackTrace();
        }
        return con;
    }
}
