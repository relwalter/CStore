package DAO;
import Bean.Category;
import Bean.Commodity;
import Connector.DBConnector;
import com.mysql.jdbc.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CommodityDAO {

    DBConnector dbconnect=new DBConnector();
    private final Connection conn =dbconnect.getConn();
    private PreparedStatement pre;

    public boolean available(Commodity commodity){
        try{
            pre=conn.prepareStatement("SELECT * FROM commodities WHERE comName=?");
            pre.setString(1,commodity.getComName());
            ResultSet set=pre.executeQuery();
            if(set.next()){
                return false;
            }
            else{
                return true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean addCommodity(Commodity commodity){
        if(!available(commodity)){
            return false;
        }
        try{
            pre=conn.prepareStatement("INSERT INTO commodities(catId,comName,brandName,madeIn,price,discount,discription,saleTime,stock) VALUES(?,?,?,?,?,?,?,?,?)");
            pre.setInt(1,commodity.getCatId());
            pre.setString(2,commodity.getComName());
            pre.setString(3,commodity.getBrandName());
            pre.setString(4,commodity.getMadeIn());
            pre.setDouble(5,commodity.getPrice());
            pre.setDouble(6,commodity.getDiscount());
            pre.setString(7,commodity.getDiscription());
            pre.setObject(8,commodity.getSaleTime());
            pre.setInt(9,commodity.getStock());
            pre.execute();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean modifyCommodity(Commodity commodity,int id){
        try{
            pre=conn.prepareStatement("UPDATE commodities SET catId=?,comName=?,brandName=?,madeIn=?,price=?,discount=?,discription=?,saleTime=?,stock=? WHERE id=?");
            pre.setInt(1,commodity.getCatId());
            pre.setString(2,commodity.getComName());
            pre.setString(3,commodity.getBrandName());
            pre.setString(4,commodity.getMadeIn());
            pre.setDouble(5,commodity.getPrice());
            pre.setDouble(6,commodity.getDiscount());
            pre.setString(7,commodity.getDiscription());
            pre.setObject(8,commodity.getSaleTime());
            pre.setInt(9,commodity.getStock());
            pre.setInt(10,id);
            pre.execute();
            return true;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public List<Commodity> getAllCommodities(){
        if(conn==null){
            return null;
        }
        try{
            Statement statement=conn.createStatement();
            ResultSet set=statement.executeQuery("SELECT * FROM commodities");
            List<Commodity> commodities=new ArrayList<Commodity>();
            while (set.next()){
                Commodity commodity=new Commodity(set.getInt("id"),set.getInt("catId"),set.getString("comName"),set.getString("brandName"),set.getString("madeIn"),set.getDouble("price"),set.getDouble("discount"),set.getString("discription"),set.getDate("saletime"),set.getInt("stock"));
                CategoryDAO service=new CategoryDAO();
                String[] catNames=service.getCategoryNames(commodity);
                commodity.setCatName(catNames[0]);
                commodity.setParentCatName(catNames[1]);
                commodities.add(commodity);
            }
            return commodities;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public Commodity getCommodity(String name){
        if(conn==null){
            return null;
        }
        try{
            Statement statement=conn.createStatement();
            ResultSet set=statement.executeQuery("SELECT * FROM commodities WHERE comName='"+name+"'");
            while (set.next()){
                Commodity commodity=new Commodity(set.getInt("id"),set.getInt("catId"),set.getString("comName"),set.getString("brandName"),set.getString("madeIn"),set.getDouble("price"),set.getDouble("discount"),set.getString("discription"),set.getDate("saletime"),set.getInt("stock"));
                CategoryDAO service=new CategoryDAO();
                String[] catNames=service.getCategoryNames(commodity);
                commodity.setCatName(catNames[0]);
                commodity.setParentCatName(catNames[1]);
                return commodity;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteCommodity(Commodity commodity){
        try{
            pre=conn.prepareStatement("DELETE FROM commodities WHERE comName=?");
            pre.setString(1,commodity.getComName());
            pre.execute();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}