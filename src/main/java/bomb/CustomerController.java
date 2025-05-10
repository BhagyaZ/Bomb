package bomb;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class CustomerController {

    // Insert data function
    public static boolean insertdata(String recipientName, String recipientAddress, String city, int recipientContactNo,
                                     int senderContactNo, String shippingMethod, String deliveryDate,
                                     String personalMsg) {
        boolean isSuccess = false;
        Connection conn = null;
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

    //GetByID
    public static List<CustomerModel> getById(String id) {

        int convertedId = Integer.parseInt(id);
        ArrayList<CustomerModel> reportModels = new ArrayList<>();

        String sql = "SELECT * FROM shippingdetails WHERE reportID = ?";

        try (Connection conn = DBConnectionAdmin.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, convertedId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int shippingId = rs.getInt(1);
                String recipientName = rs.getString(2);
                String recipientAddress = rs.getString(3);
                String city = rs.getString(4);
                int recipientContactNo = rs.getInt(5);
                int senderContactNo = rs.getInt(6);
                String shippingMethod = rs.getString(7);
                String deliveryDate = rs.getString(8);  // if you store as String, otherwise use rs.getDate(8)
                String personalMsg = rs.getString(9);
                String date = rs.getString(10);         // if you store as String, otherwise use rs.getTimestamp(10)

                CustomerModel cm = new CustomerModel(
                        shippingId, recipientName, recipientAddress, city,
                        recipientContactNo, senderContactNo, shippingMethod,
                        deliveryDate, personalMsg, date
                );
                reportModels.add(cm);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return reportModels;
    }

    //getAll data
    public static List<CustomerModel> getAllShippingDetails() {
        List<CustomerModel> shippingList = new ArrayList<>();
        String sql = "SELECT * FROM shippingdetails";

        try (Connection conn = DBConnectionAdmin.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int shippingId = rs.getInt(1);
                String recipientName = rs.getString(2);
                String recipientAddress = rs.getString(3);
                String city = rs.getString(4);
                int recipientContactNo = rs.getInt(5);
                int senderContactNo = rs.getInt(6);
                String shippingMethod = rs.getString(7);
                String deliveryDate = rs.getString(8);  // or rs.getString(8) if you want it as String
                String personalMsg = rs.getString(9);
                String date = rs.getString(10); // or rs.getString(10) if you want it as String

                CustomerModel shipping = new CustomerModel(
                        shippingId, recipientName, recipientAddress, city,
                        recipientContactNo, senderContactNo, shippingMethod,
                        deliveryDate, personalMsg, date
                );
                shippingList.add(shipping);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shippingList;
    }

}
