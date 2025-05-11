package bomb;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionCustomer {
    private static String url ="jdbc:mysql://localhost:3306/bomb";
    private static String user ="root";
    private static String pass ="3196";
    private static Connection con;

    public static Connection getConnection (){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,user,pass);
            System.out.println("Database connected successfully!");
        }
        catch(Exception e) {
            System.out.println("Database is not connected !");
        }
        return con;
    }
}