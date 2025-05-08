package bomb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportControl {

    //Connection DB
    private static Boolean isSuccess;
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    //Insert Data Function
    public static Boolean insertdata(String reportMonth, String generatedDate, int inStock, int soldItems, int lowStock, String soldOutItems, int damaged, double budget, double refunds, double targetSale, double totalSale) {
        Boolean isSuccess = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnectionAdmin.getConnection();

            String sql = "INSERT INTO monthlyreport (reportMonth, generatedDate, inStock, soldItems, lowStock, soldOutItems, damaged, budget, refunds, targetSale, totalSale) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, reportMonth);
            ps.setDate(2, java.sql.Date.valueOf(generatedDate)); // generatedDate format: yyyy-MM-dd
            ps.setInt(3, inStock);
            ps.setInt(4, soldItems);
            ps.setInt(5, lowStock);
            ps.setString(6, soldOutItems);
            ps.setInt(7, damaged);
            ps.setDouble(8, budget);
            ps.setDouble(9, refunds);
            ps.setDouble(10, targetSale);
            ps.setDouble(11, totalSale);

            int i = ps.executeUpdate();
            if (i > 0) {
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
    public static List<ReportModel> getById(String id) {

        int convertedId = Integer.parseInt(id);
        ArrayList<ReportModel> reportModels = new ArrayList<>();

        String sql = "SELECT * FROM monthlyreport WHERE reportID = ?";

        try (Connection conn = DBConnectionAdmin.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, convertedId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int reportID = rs.getInt(1);
                String reportMonth = rs.getString(2);
                String generatedDate = rs.getString(3);
                int inStock = rs.getInt(4);
                int soldItems = rs.getInt(5);
                int lowStock = rs.getInt(6);
                String soldOutItems = rs.getString(7);
                int damaged = rs.getInt(8);
                double budget = rs.getDouble(9);
                double refunds = rs.getDouble(10);
                double targetSale = rs.getDouble(11);
                double totalSale = rs.getDouble(12);

                ReportModel rp = new ReportModel(reportID, reportMonth, generatedDate, inStock, soldItems, lowStock, soldOutItems, damaged, budget, refunds, targetSale, totalSale);
                reportModels.add(rp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reportModels;
    }


    //GetAll
    public static List<ReportModel> getAllReport() {
        ArrayList<ReportModel> reportModels = new ArrayList<>();
        String sql = "SELECT * FROM monthlyreport";

        try (Connection conn = DBConnectionAdmin.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int reportID = rs.getInt(1);
                String reportMonth = rs.getString(2);
                String generatedDate = rs.getString(3);
                int inStock = rs.getInt(4);
                int soldItems = rs.getInt(5);
                int lowStock = rs.getInt(6);
                String soldOutItems = rs.getString(7);
                int damaged = rs.getInt(8);
                double budget = rs.getDouble(9);
                double refunds = rs.getDouble(10);
                double targetSale = rs.getDouble(11);
                double totalSale = rs.getDouble(12);

                ReportModel rp = new ReportModel(reportID, reportMonth, generatedDate, inStock, soldItems, lowStock, soldOutItems, damaged, budget, refunds, targetSale, totalSale);
                reportModels.add(rp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reportModels;
    }


    //Update Data
    public static boolean updatedata(int reportID, String reportMonth, String generatedDate, int inStock, int soldItems, int lowStock, String soldOutItems, int damaged, double budget, double refunds, double targetSale, double totalSale) {
        boolean isSuccess = false;
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // DB connection
            conn = DBConnectionAdmin.getConnection();

            // SQL update query using reportID in WHERE clause
            String sql = "UPDATE monthlyreport SET reportMonth = ?, generatedDate = ?, inStock = ?, soldItems = ?, lowStock = ?, soldOutItems = ?, damaged = ?, budget = ?, refunds = ?, targetSale = ?, totalSale = ? WHERE reportID = ?";

            // Prepare statement
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reportMonth);
            pstmt.setString(2, generatedDate);
            pstmt.setInt(3, inStock);
            pstmt.setInt(4, soldItems);
            pstmt.setInt(5, lowStock);
            pstmt.setString(6, soldOutItems);
            pstmt.setInt(7, damaged);
            pstmt.setDouble(8, budget);
            pstmt.setDouble(9, refunds);
            pstmt.setDouble(10, targetSale);
            pstmt.setDouble(11, totalSale);
            pstmt.setInt(12, reportID);  // reportID in WHERE condition

            // Execute update
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }


    //Delete Data
    public static  boolean deletedata(String id) {
        int convertedId = Integer.parseInt(id);
        try{
            conn = DBConnectionAdmin.getConnection();
            stmt=conn.createStatement();

            String sql = "delete from monthlyreport where reportID = '"+convertedId+"'";

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
