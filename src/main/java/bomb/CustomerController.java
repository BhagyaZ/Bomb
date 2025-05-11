package bomb;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
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
            conn = DBConnectionCustomer.getConnection();

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
    public static List<CustomerModel> getById (String Id) {

        int convertedShippingId = Integer.parseInt(Id);
        ArrayList<CustomerModel> customer = new ArrayList<>();

        try {
            //DBConnection
            conn = DBConnectionCustomer.getConnection();
            stmt = conn.createStatement();

            //query
            String sql = "SELECT * FROM shippingdetails WHERE shippingId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, convertedShippingId);
            rs = ps.executeQuery();


            while (rs.next()) {
                int shippingId = rs.getInt(1);
                String recipientName = rs.getString(2);
                String recipientAddress = rs.getString(3);
                String city = rs.getString(4);
                int recipientContactNo = rs.getInt(5);
                int senderContactNo = rs.getInt(6);
                String shippingMethod = rs.getString(7);
                String deliveryDate = rs.getString(8);
                String personalMsg = rs.getString(9);
                //String date = LocalDateTime.parse(deliveryDate);

                CustomerModel cus = new CustomerModel(shippingId, recipientName, recipientAddress, city, recipientContactNo, senderContactNo, shippingMethod, deliveryDate, personalMsg,null);
                customer.add(cus);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customer;

    }

    //GetALL
    public static List<CustomerModel> getAll() {

        ArrayList<CustomerModel> customers = new ArrayList<>();

        try {
            //DBConnection
            conn = DBConnectionCustomer.getConnection();
            stmt = conn.createStatement();

            //query
            String sql = "select * from shippingdetails";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int shippingId = rs.getInt(1);
                String recipientName = rs.getString(2);
                String recipientAddress = rs.getString(3);
                String city = rs.getString(4);
                int recipientContactNo = rs.getInt(5);
                int senderContactNo = rs.getInt(6);
                String shippingMethod = rs.getString(7);
                String deliveryDate = rs.getString(8);
                String personalMsg = rs.getString(9);
                //String date = LocalDateTime.parse(deliveryDate);

                CustomerModel cus = new CustomerModel(shippingId, recipientName, recipientAddress, city, recipientContactNo, senderContactNo, shippingMethod, deliveryDate, personalMsg,null);
                customers.add(cus);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customers;

    }





}
