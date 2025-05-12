package bomb;

public class CardDetailsModel {
    private int id;
    private String name;
    private int number;
    private int month;
    private int year;
    private int cvn;

    public CardDetailsModel(int id, String name, int number, int month, int year, int cvn) {
        super();
        this.id = id;
        this.name = name;
        this.number = number;
        this.month = month;
        this.year = year;
        this.cvn = cvn;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getCvn() {
        return cvn;
    }

    public void setCvn(int cvn) {
        this.cvn = cvn;
    }



}