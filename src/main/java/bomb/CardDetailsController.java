package bomb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CardDetailsController {

    // Insert data
    public static void insertData(String name, int number, int month, int year, int cvn) {
        String sql = "INSERT INTO carddetails (id, name, number, month, year, cvn) VALUES (0, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnectionAdmin.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setInt(2, number);
            ps.setInt(3, month);
            ps.setInt(4, year);
            ps.setInt(5, cvn);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get data by ID
    public static List<CardDetailsModel> getById(int id) {
        List<CardDetailsModel> cardDetails = new ArrayList<>();
        String sql = "SELECT * FROM carddetails WHERE id = ?";

        try (Connection con = DBConnectionAdmin.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    cardDetails.add(new CardDetailsModel(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getInt("number"),
                            rs.getInt("month"),
                            rs.getInt("year"),
                            rs.getInt("cvn")));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cardDetails;
    }

    // Get all card details
    public static List<CardDetailsModel> getAllCardDetails() {
        List<CardDetailsModel> cardDetails = new ArrayList<>();
        String sql = "SELECT * FROM carddetails";

        try (Connection con = DBConnectionAdmin.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                cardDetails.add(new CardDetailsModel(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("number"),
                        rs.getInt("month"),
                        rs.getInt("year"),
                        rs.getInt("cvn")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cardDetails;
    }

    // Update data
    public static void updateData(int id, String name, int number, int month, int year, int cvn) {
        String sql = "UPDATE carddetails SET name = ?, number = ?, month = ?, year = ?, cvn = ? WHERE id = ?";

        try (Connection con = DBConnectionAdmin.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setInt(2, number);
            ps.setInt(3, month);
            ps.setInt(4, year);
            ps.setInt(5, cvn);
            ps.setInt(6, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete data
    public static boolean deleteData(int id) {
        String sql = "DELETE FROM carddetails WHERE id = ?";
        boolean isSuccess = false;

        try (Connection con = DBConnectionAdmin.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            isSuccess = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}