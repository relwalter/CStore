package Bean;

public class User {
    private String id;
    private String username;
    private String password;
    private String bName;
    private String bAddress;
    private String charge;
    private String email;
    private String qq;
    private String phone;
    private int admin=0;

    public User(){}

    public User(String id,String name, String password, String bName, String bAddress, String charge, String email, String qq, String phone,int admin) {
        this.id=id;
        this.username = name;
        this.password = password;
        this.bName = bName;
        this.bAddress = bAddress;
        this.charge = charge;
        this.email = email;
        this.qq = qq;
        this.phone = phone;
        this.admin=admin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    public String getbAddress() {
        return bAddress;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public void setbAddress(String bAddress) {
        this.bAddress = bAddress;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
