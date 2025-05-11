package user;

import bomb.DBConnectionAdmin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

    public static List<UserModel> loginValidate(String username, String password) {
        List<UserModel> users = new ArrayList<>();

        String sql = "SELECT * FROM user WHERE "+" username='"+username+"' AND password= '"+password+"' ";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String pass = rs.getString(4);
                String phone = rs.getString(5);

                UserModel u = new UserModel(id, name, email, pass, phone);
                users.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public static List<UserModel> getAll() {
        List<UserModel> userList = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionAdmin.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM user";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String phone = rs.getString(5);

                UserModel user = new UserModel(id,name, email, password, phone);
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return userList;
  }

  //DisplayUser

}
