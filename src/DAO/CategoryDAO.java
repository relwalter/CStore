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

public class CategoryDAO {

    DBConnector dbconnect=new DBConnector();
    private final Connection conn =dbconnect.getConn();
    private PreparedStatement pre;

    public boolean available(Category category){
        try{
            pre=conn.prepareStatement("SELECT * FROM categories WHERE catName=?");
            pre.setString(1,category.getCatName());
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

    public boolean checkCatName(String catName){
        try{
            pre=conn.prepareStatement("SELECT * FROM categories WHERE catName=?");
            pre.setString(1,catName);
            ResultSet set=pre.executeQuery();
            if(set.next()){
                return true;
            }
            else{
                return false;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean addCategory(Category category){
        if(!available(category)||category==null){
            return false;
        }
        if(category.getParentId()==-1){
            int parentId=0;
            Category parent=getCategory(category.getParentName());
            System.out.println(parent.getId()+": "+parent.getCatName());
            if(parent!=null){
                parentId=parent.getId();
            }
            category.setParentId(parentId);
        }
        try{
            pre=conn.prepareStatement("INSERT INTO categories(id,catName,parentId) VALUES(?,?,?)");
            pre.setInt(1,category.getId());
            pre.setString(2,category.getCatName());
            pre.setInt(3,category.getParentId());
            pre.execute();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean modifyCategory(Category category){
        try{
            pre=conn.prepareStatement("UPDATE categories SET catName=?,parentId=?");
            pre.setString(1,category.getCatName());
            pre.setInt(2,category.getParentId());
            pre.execute();
            return true;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public List<Category> getAllCategories(){
        if(conn==null){
            return null;
        }
        try{
            Statement statement=conn.createStatement();
            ResultSet set=statement.executeQuery("SELECT * FROM categories");
            List<Category> categories=new ArrayList<Category>();
            while (set.next()){
                String current=set.getString("catName");
                categories.add(getCategory(current));
            }
            return categories;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public Category getCategory(String name){
        if(conn==null){
            return null;
        }
        try{
            Statement statement=conn.createStatement();
            ResultSet set=statement.executeQuery("SELECT a.catName c_name,a.id c_id,b.catName f_name,b.id f_id FROM categories a,categories b WHERE a.parentId=b.id AND a.catName='"+name+"'");
            while (set.next()){
                Category category=new Category(set.getString("c_name"),set.getString("f_name"));
                category.setId(set.getInt("c_id"));
                category.setParentId(set.getInt("f_id"));
                return category;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteCategory(Category category){
        try{
            pre=conn.prepareStatement("DELETE FROM categories WHERE catName=?");
            pre.setString(1,category.getCatName());
            pre.execute();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    public String[] getCategoryNames(Commodity commodity){
        try{
            Statement statement=conn.createStatement();
            String[] categoryNames=new String[2];
            int id=commodity.getCatId();
            ResultSet set=statement.executeQuery("SELECT a.catName child,b.catName father FROM categories a,categories b WHERE a.parentId=b.id AND a.id='"+id+"'");
            while(set.next()){
                categoryNames[0]=set.getString("child");
                categoryNames[1]=set.getString("father");
                return categoryNames;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}