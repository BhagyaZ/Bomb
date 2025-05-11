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

}
