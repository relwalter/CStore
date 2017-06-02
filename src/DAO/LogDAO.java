package DAO;

import Bean.Log;
import Connector.DBConnector;
import com.mysql.jdbc.Connection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LogDAO {

    DBConnector dbconnect=new DBConnector();
    private final Connection conn =dbconnect.getConn();
    private PreparedStatement pre;

    public boolean addLog(Log detail){
        try{

            pre=conn.prepareStatement("INSERT INTO log(userIp, userName, uri, userAction, startTime) VALUES (?,?,?,?,?)");
            pre.setString(1,detail.getUserIp());
            pre.setString(2,detail.getUserName());
            pre.setString(3,detail.getUri());
            pre.setString(4,detail.getAction());
            pre.setObject(5,detail.getStartTime());
//            pre.setObject(6,detail.getEndTime());
            pre.execute();
            return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public List<Log> getLogs(String userName){
        if(conn==null){
            return null;
        }
        try{
            Statement statement=conn.createStatement();
            ResultSet set=statement.executeQuery("SELECT * FROM log WHERE username='"+userName+"'");
            List<Log> logs=new ArrayList<Log>();
            while (set.next()){
                Log current=new Log();
                current.setUserName(set.getString("userName"));
                current.setAction(set.getString("userAction"));
                current.setUri(set.getString("uri"));
                current.setStartTime(set.getDate("startTime"));
//                current.setEndTime(set.getDate("endTime"));
                logs.add(current);
            }
            return logs;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }

}
