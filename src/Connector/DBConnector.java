package Connector;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DBConnector {
    final String userName="webapp";
    final String password="0000";
    final String connectURLStr="jdbc:mysql://localhost:3306/cstore";
    private static  Connection conn=null;

    public Connection getConn() {
        return conn;
    }
    public void setConn(Connection conn) {
        this.conn = conn;
    }
    public DBConnector() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                conn=(Connection) DriverManager.getConnection(connectURLStr,userName,password);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if(conn==null){

            }
            else{

            }
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
