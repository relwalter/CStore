package DAO;
import Bean.User;
import Connector.DBConnector;
import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    DBConnector dbconnect=new DBConnector();
    private final Connection conn =dbconnect.getConn();
    private PreparedStatement pre;

    public boolean available(User user){
        try{
            pre=conn.prepareStatement("SELECT * FROM user WHERE username=?");
            pre.setString(1,user.getUsername());
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

    public boolean valid(User user){
        try{
            pre=conn.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");
            pre.setString(1,user.getUsername());
            pre.setString(2,user.getPassword());
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

    public boolean register(User user){
        if(!available(user)){
            return false;
        }
        try{
            pre=conn.prepareStatement("INSERT INTO user(username, password, bname, baddress, charge, email, qq, phone,admin) VALUES(?,?,?,?,?,?,?,?,0)");
            pre.setString(1,user.getUsername());
            pre.setString(2,user.getPassword());
            pre.setString(3,user.getbName());
            pre.setString(4,user.getbAddress());
            pre.setString(5,user.getCharge());
            pre.setString(6,user.getEmail());
            pre.setString(7,user.getQq());
            pre.setString(8,user.getPhone());
            pre.execute();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean modifyPassword(User user,String newPsw){
        if(!valid(user)){
            return false;
        }
        try{
            pre=conn.prepareStatement("UPDATE user SET password=? WHERE username=?");
            pre.setString(1,newPsw);
            pre.setString(2,user.getUsername());
            pre.execute();
            return true;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean modifyInfo(User user,String newPsw){
        if(!valid(user)){
            System.out.println("oops!");
            return false;
        }
        if(newPsw.length()==0||newPsw==""||newPsw.equals("")||newPsw==null||newPsw.equals(null)){
            newPsw=user.getPassword();
        }
        try{
            pre=conn.prepareStatement("UPDATE user SET password=?, bname=?, baddress=?, charge=?, email=?, qq=?, phone=? WHERE username=?");
            pre.setString(1,newPsw);
            pre.setString(2,user.getbName());
            pre.setString(3,user.getbAddress());
            pre.setString(4,user.getCharge());
            pre.setString(5,user.getEmail());
            pre.setString(6,user.getQq());
            pre.setString(7,user.getPhone());
            pre.setString(8,user.getUsername());
            pre.execute();
            return true;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public List<User> getAllUsers(){
        if(conn==null){
            return null;
        }
        try{
            Statement statement=conn.createStatement();
            ResultSet set=statement.executeQuery("SELECT * FROM user");
            List<User> users=new ArrayList<User>();
            while (set.next()){
                users.add(new User(set.getString("id"),set.getString("username"),set.getString("password"),set.getString("bname"),set.getString("baddress"),set.getString("charge"),set.getString("email"),set.getString("qq"),set.getString("phone"),Integer.parseInt(set.getString("admin"))));
            }
            return users;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public User getUser(String name){
        if(conn==null){
            return null;
        }
        try{
            Statement statement=conn.createStatement();
            ResultSet set=statement.executeQuery("SELECT * FROM user WHERE username='"+name+"'");
            while (set.next()){
                return new User(set.getString("id"),set.getString("username"),set.getString("password"),set.getString("bname"),set.getString("baddress"),set.getString("charge"),set.getString("email"),set.getString("qq"),set.getString("phone"),Integer.parseInt(set.getString("admin")));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public boolean delete(User user){
//        if(check()!=1){
//            System.out.println("Failed!");
//            return false;
//        }
        try{
            pre=conn.prepareStatement("DELETE FROM user WHERE username=?");
            pre.setString(1,user.getUsername());
            pre.execute();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}