package bomb;

public class PaymentModel {
    private String account_number ;
    private String card_type;
    private String expirydate;
    private String cvv;
    private String pin;
    private String security_pin;
    private int shippingId;

    public PaymentModel(String account_number, String card_type, String cvv, String expirydate, String pin, String security_pin,int shippingId) {
        this.account_number = account_number;
        this.card_type = card_type;
        this.cvv = cvv;
        this.expirydate = expirydate;
        this.pin = pin;
        this.security_pin = security_pin;
        this.shippingId = shippingId;
    }

    public String getAccount_number() {
        return account_number;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public void setAccount_number(String account_number) {
        this.account_number = account_number;
    }

    public String getCard_type() {
        return card_type;
    }

    public void setCard_type(String card_type) {
        this.card_type = card_type;
    }

    public String getExpirydate() {
        return expirydate;
    }

    public void setExpirydate(String expirydate) {
        this.expirydate = expirydate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getSecurity_pin() {
        return security_pin;
    }

    public void setSecurity_pin(String security_pin) {
        this.security_pin = security_pin;
    }
}
