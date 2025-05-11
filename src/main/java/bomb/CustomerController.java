package bomb;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerController {

    private static boolean isSuccess;
    private static Connection conn=null;
    private static Statement stmt=null;
    private static ResultSet rs=null;
    private static PreparedStatement ps=null;

    // Insert data function
    public static boolean insertdata(String recipientName, String recipientAddress, String city, int recipientContactNo,
                                     int senderContactNo, String shippingMethod, String deliveryDate,
                                     String personalMsg) {
        isSuccess = false;
        conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnectionAdmin.getConnection();

            String sql = "INSERT INTO shippingdetails (recipientName, recipientAddress, city, recipientContactNo, senderContactNo, shippingMethod, deliveryDate, personalMsg, date) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            ps.setString(1, recipientName);
            ps.setString(2, recipientAddress);
            ps.setString(3, city);
            ps.setInt(4, recipientContactNo);
            ps.setInt(5, senderContactNo);
            ps.setString(6, shippingMethod);
            ps.setDate(7, java.sql.Date.valueOf(deliveryDate)); // expects yyyy-MM-dd
            ps.setString(8, personalMsg);

            // Set current system date-time for the 'date' column
            LocalDateTime now = LocalDateTime.now();
            ps.setTimestamp(9, java.sql.Timestamp.valueOf(now));

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                isSuccess = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
        }

    //getById
    public static List<CustomerModel> getById (String Id){

        int convertedId = Integer.parseInt(Id);

        ArrayList <CustomerModel> bomb = new ArrayList<>();

        try {
            //DBconnection
            Connection con=DBConnectionAdmin.getConnection();
            stmt=con.createStatement();

            //Query
            String sql ="select * from shippingdetails where id '"+convertedId+"'";

            rs = stmt.executeQuery(sql);

            while(rs.next()) {
                int shippingId = rs.getInt(1);
                String recipientName = rs.getString(2);
                String recipientAddress = rs.getString(3);
                String city = rs.getString(4);
                int recipientContactNo = rs.getInt(5);
                int senderContactNo = rs.getInt(6);
                String shippingMethod = rs.getString(7);
                String deliveryDate = rs.getString(8);
                String personalMsg = rs.getString(9);
                String date = rs.getString(10);

                CustomerModel bk = new CustomerModel(shippingId,recipientName,recipientAddress,city,recipientContactNo,senderContactNo,shippingMethod,deliveryDate,personalMsg, date);
                bomb.add(bk);

            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return bomb;
    }

    //GetAll data
    public static List<CustomerModel> getAllShippingDetails() {
        List<CustomerModel> shippingList = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionAdmin.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM shippingdetails ORDER BY shippingId DESC";
            rs = stmt.executeQuery(sql);

            while(rs.next()) {
                CustomerModel shipping = new CustomerModel(
                        rs.getInt("shippingId"),
                        rs.getString("recipientName"),
                        rs.getString("recipientAddress"),
                        rs.getString("city"),
                        rs.getInt("recipientContactNo"),
                        rs.getInt("senderContactNo"),
                        rs.getString("shippingMethod"),
                        rs.getString("deliveryDate"),
                        rs.getString("personalMsg"),
                        rs.getString("date")
                );

                //Testing
                System.out.println(rs.getString("shippingId"));
                System.out.println(rs.getString("recipientName"));
                System.out.println(rs.getString("recipientAddress"));

                shippingList.add(shipping);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return shippingList;
    }

}
