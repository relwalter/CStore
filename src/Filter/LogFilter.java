package Filter;

import Bean.Log;
import DAO.LogDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebFilter(filterName="LogFilter",urlPatterns="/*")
public class LogFilter implements Filter{
    private FilterConfig config;

    public void init(FilterConfig config) {
        this.config = config;
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException,ServletException {
        ServletContext context = this.config.getServletContext();
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session=request.getSession();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String contextPath= request.getContextPath();
        String requestURI = request.getRequestURI();
        requestURI = request.getQueryString() == null ? requestURI: (requestURI + "?" + request.getQueryString());
        try{
            String userIp=request.getRemoteAddr();
            String userName=session.getAttribute("username").toString();
            String userAction;
            LogDAO service=new LogDAO();
            if(userIp.length()>0 && userName.length()>0 && requestURI.length()>0){
                if(requestURI.contains("jsp")){
                    if(requestURI.contains("Redirection")){
                        char[] tmp=requestURI.substring(1,requestURI.indexOf("Redirection")).toCharArray();
                        tmp[0]-=32;
                        userAction=String.valueOf(tmp);
                    }else{
                        userAction="Access";
                    }
                    Log current=new Log(userIp,userName,requestURI,userAction,new Date());
                    service.addLog(current);
                }
                try{
                    chain.doFilter(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
//                current.setEndTime(new Date());
            }
        }catch(Exception e){
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
        this.config = null;
    }

}
