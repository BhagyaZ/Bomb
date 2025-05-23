package user;

import bomb.CustomerModel;
import bomb.DBConnectionAdmin;
import bomb.ReportModel;

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

    //login validation
    public static List<UserModel> loginValidate(String username, String password) {
        List<UserModel> users = new ArrayList<>();


        try {

            Connection conn = DBConnectionAdmin.getConnection();
            stmt = conn.createStatement();

            String sql = "SELECT * FROM user WHERE "+" name='"+username+"' AND password= '"+password+"' ";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String pass = rs.getString(4);
                String phone = rs.getString(5);
                String role = rs.getString(6);

                UserModel u = new UserModel(id, name, email, pass, phone, role);
                users.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public static List<UserModel> userProfile(String Id) {

        int convertID = Integer.parseInt(Id);
        ArrayList<UserModel> userList = new ArrayList<>();

        try {
            conn = DBConnectionAdmin.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM user where id = '"+convertID+"' ";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String phone = rs.getString(5);
                String role = rs.getString(6);

                System.out.println(name);
                System.out.println(email);
                System.out.println(password);
                System.out.println(phone);
                System.out.println(role);

                UserModel user = new UserModel(id,name, email, password, phone, role);
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
  }

    //GetByID
    public static List<UserModel> getById(String Id) {

        int convertedId = Integer.parseInt(Id);
        ArrayList<UserModel> userModel = new ArrayList<>();

        String sql = "SELECT * FROM user WHERE id = ?";

        try (Connection conn = DBConnectionAdmin.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, convertedId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String phone = rs.getString(5);
                String role = rs.getString(6);

                UserModel rp = new UserModel(id, name, email, password, phone, role);
                userModel.add(rp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userModel;
    }

  //Update User
  public static boolean updateProfile(int id, String name, String email, String phone) {
      Connection conn = null;
      PreparedStatement stmt = null;
      try {
          conn = DBConnection.getConnection();
          String sql = "UPDATE User SET name=?, email=?, phone=? WHERE id=?";
          stmt = conn.prepareStatement(sql);
          stmt.setString(1, name);
          stmt.setString(2, email);
          stmt.setString(3, phone);
          stmt.setInt(4, id);
          int rowsUpdated = stmt.executeUpdate();
          return rowsUpdated > 0;
      } catch (Exception e) {
          e.printStackTrace();
          return false;
      }
  }

    //Delete Data
    public static  boolean deleteProfile(String id) {
        int convertedId = Integer.parseInt(id);
        try{
            conn = DBConnectionAdmin.getConnection();
            stmt=conn.createStatement();

            String sql = "delete from user where id = '"+convertedId+"'";

            int rs = stmt.executeUpdate(sql);
            if(rs > 0){
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

}
