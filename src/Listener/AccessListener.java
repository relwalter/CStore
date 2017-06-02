package Listener;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class AccessListener implements ServletContextListener,HttpSessionListener,HttpSessionAttributeListener{
    private ServletContext application = null;

    public void contextInitialized(ServletContextEvent event) {
        this.application = event.getServletContext();
        this.application.setAttribute("allusers", new ArrayList());
    }

    public void sessionDestroyed(HttpSessionEvent event) {
        List users = (List) this.application.getAttribute("allusers");
        String current = (String) event.getSession().getAttribute("username");
        users.remove(current);
        this.application.setAttribute("allusers", users);
    }

    public void attributeAdded(HttpSessionBindingEvent event) {
        List users = (List) this.application.getAttribute("allusers");
        if(event.getName()=="username"){
            users.add(event.getValue());
        }
        this.application.setAttribute("allusers", users);
    }
}
