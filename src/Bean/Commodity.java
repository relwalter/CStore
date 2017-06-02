package Bean;
import java.util.Date;

public class Commodity {
    int id;
    int catId;
    String comName;
    String catName=null;
    String parentCatName=null;
    String brandName;
    String madeIn;
    double price;
    double discount;
    String discription;
    Date saleTime;
    int stock;

    public Commodity() {
    }

    public Commodity(int id, int catId, String comName, String brandName, String madeIn, double price, double discount, String discription, Date saleTime, int stock) {
        this.id = id;
        this.catId = catId;
        this.comName = comName;
        this.brandName = brandName;
        this.madeIn = madeIn;
        this.price = price;
        this.discount = discount;
        this.discription = discription;
        this.saleTime = saleTime;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }

    public String getCatName() {
        return catName;
    }

    public String getParentCatName() {
        return parentCatName;
    }

    public void setParentCatName(String parentCatName) {
        this.parentCatName = parentCatName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public Date getSaleTime() {
        return saleTime;
    }

    public void setSaleTime(Date saleTime) {
        this.saleTime = saleTime;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
