package user;

import java.sql.*;

public class UserController {

    private static Boolean isSuccess;
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    //Insert Data Function
    public static Boolean insertdata(String name, String email, String password, String phone) {
        Boolean isSuccess = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("Database connection is null");
                return false;
            }

            String sql = "INSERT INTO user (name, email, password, phone) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);

            int i = ps.executeUpdate();
            System.out.println("executeUpdate returned: " + i); // add this

            if (i > 0) {
                isSuccess = true;
            }

        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("General Exception: " + e.getMessage());
            e.printStackTrace();
        }
        return isSuccess;
    }


}
