package bomb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
        try {
            //DB Connection call
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();

            String sql = "insert into monthlyreport values(0,'"+reportMonth +"', '"+generatedDate+"','"+inStock+"','"+soldItems+"','"+lowStock+"','"+soldOutItems+"','"+damaged+"','"+budget+"','"+refunds+"','"+targetSale+"')";
            int i = stmt.executeUpdate(sql);
            if (i > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    //GetByID
    public static List<ReportModel> getById(String id) {

        int convertedId = Integer.parseInt(id);

        ArrayList<ReportModel> reportModels = new ArrayList<>();

        try{
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();

            String sql = "select * from monthlyreport where reportID = '"+convertedId+"'";

            rs = stmt.executeQuery(sql);

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

        } catch (Exception e){
            e.printStackTrace();
        }
        return reportModels;
    }

    //GetAll
    public static List<ReportModel> getAllReport() {
        ArrayList<ReportModel> reportModels = new ArrayList<>();

        try{
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();

            String sql = "select * from monthlyreport";

            rs = stmt.executeQuery(sql);

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

        } catch (Exception e){
            e.printStackTrace();
        }
        return reportModels;


    }
}
