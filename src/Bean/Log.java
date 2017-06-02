package Bean;

import java.util.Date;

public class Log {
    private int id;
    private String userIp;
    private String userName;
    private String uri;
    private String userAction;
    private Date startTime;
//    private Date endTime;

    public Log() {
        this.id=0;
        this.userIp = null;
        this.userName = null;
        this.uri = null;
        this.userAction = null;
        this.startTime = null;
//        this.endTime = null;
    }

    public Log(int id, String userIp, String userName, String uri, String userAction, Date startTime) {
        this.id = id;
        this.userIp = userIp;
        this.userName = userName;
        this.uri = uri;
        this.userAction = userAction;
        this.startTime = startTime;
    }

    public Log(String ip, String userName, String uri, String userAction, Date startTime) {
        this.userIp=ip;
        this.userName = userName;
        this.uri = uri;
        this.userAction=userAction;
        this.startTime=startTime;
    }

    public String getUserIp() {
        return userIp;
    }

    public void setUserIp(String ip) {
        this.userIp = ip;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getAction() {
        return userAction;
    }

    public void setAction(String userAction) {
        this.userAction = userAction;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

//    public Date getEndTime() {
//        return endTime;
//    }

//    public void setEndTime(Date endTime) {
//        this.endTime = endTime;
//    }

}
