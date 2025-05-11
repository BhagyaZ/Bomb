package bomb;

public class CustomerModel {

    private int shippingId;
    private String recipientName;
    private String recipientAddress;
    private String city;
    private int recipientContactNo;
    private int senderContactNo;
    private String shippingMethod;
    private String deliveryDate;
    private String personalMsg;
    private String date;

    public CustomerModel(int shippingId, String recipientName, String recipientAddress, String city, int recipientContactNo,
                     int senderContactNo, String shippingMethod, String deliveryDate, String personalMsg, String date) {
        this.shippingId = shippingId;
        this.recipientName = recipientName;
        this.recipientAddress = recipientAddress;
        this.city = city;
        this.recipientContactNo = recipientContactNo;
        this.senderContactNo = senderContactNo;
        this.shippingMethod = shippingMethod;
        this.deliveryDate = deliveryDate;
        this.personalMsg = personalMsg;
        this.date = date;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getRecipientAddress() {
        return recipientAddress;
    }

    public void setRecipientAddress(String recipientAddress) {
        this.recipientAddress = recipientAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getRecipientContactNo() {
        return recipientContactNo;
    }

    public void setRecipientContactNo(int recipientContactNo) {
        this.recipientContactNo = recipientContactNo;
    }

    public int getSenderContactNo() {
        return senderContactNo;
    }

    public void setSenderContactNo(int senderContactNo) {
        this.senderContactNo = senderContactNo;
    }

    public String getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(String shippingMethod) {
        this.shippingMethod = shippingMethod;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getPersonalMsg() {
        return personalMsg;
    }

    public void setPersonalMsg(String personalMsg) {
        this.personalMsg = personalMsg;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
