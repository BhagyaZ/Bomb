package bomb;

import java.util.Date;

public class ReportModel {

    private int reportID;
    private String reportMonth;
    private String generatedDate;
    private int inStock;
    private int soldItems;
    private int lowStock;
    private String soldOutItems;
    private int damaged;
    private double budget;
    private double refunds;
    private double targetSale;
    private double totalSale;

    public ReportModel(int reportID, String reportMonth, String generatedDate, int inStock, int soldItems, int lowStock, String soldOutItems, int damaged, double budget, double refunds, double targetSale, double totalSale) {
        this.reportID = reportID;
        this.reportMonth = reportMonth;
        this.generatedDate = generatedDate;
        this.inStock = inStock;
        this.soldItems = soldItems;
        this.lowStock = lowStock;
        this.soldOutItems = soldOutItems;
        this.damaged = damaged;
        this.budget = budget;
        this.refunds = refunds;
        this.targetSale = targetSale;
        this.totalSale = totalSale;
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
    }

    public String getReportMonth() {
        return reportMonth;
    }

    public void setReportMonth(String reportMonth) {
        this.reportMonth = reportMonth;
    }

    public String getGeneratedDate() {
        return generatedDate;
    }

    public void setGeneratedDate(String generatedDate) {
        this.generatedDate = generatedDate;
    }

    public int getInStock() {
        return inStock;
    }

    public void setInStock(int inStock) {
        this.inStock = inStock;
    }

    public int getSoldItems() {
        return soldItems;
    }

    public void setSoldItems(int soldItems) {
        this.soldItems = soldItems;
    }

    public int getLowStock() {
        return lowStock;
    }

    public void setLowStock(int lowStock) {
        this.lowStock = lowStock;
    }

    public String getSoldOutItems() {
        return soldOutItems;
    }

    public void setSoldOutItems(String soldOutItems) {
        this.soldOutItems = soldOutItems;
    }

    public int getDamaged() {
        return damaged;
    }

    public void setDamaged(int damaged) {
        this.damaged = damaged;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    public double getRefunds() {
        return refunds;
    }

    public void setRefunds(double refunds) {
        this.refunds = refunds;
    }

    public double getTargetSale() {
        return targetSale;
    }

    public void setTargetSale(double targetSale) {
        this.targetSale = targetSale;
    }

    public double getTotalSale() {
        return totalSale;
    }

    public void setTotalSale(double totalSale) {
        this.totalSale = totalSale;
    }
}
