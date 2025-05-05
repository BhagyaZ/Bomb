package bomb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
}
