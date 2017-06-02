package Listener;
import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.annotation.WebListener;

@WebListener
public final class ContextListener implements ServletContextListener, ServletContextAttributeListener{
    private ServletContext context = null;
    public void contextInitialized(ServletContextEvent sce){
        context = sce.getServletContext();
        context.log("应用程序已启动："+new Date());
    }
    public void contextDestroyed(ServletContextEvent sce){
        context = sce.getServletContext();
        context.log("应用程序已关闭："+new Date());
    }
    public void attributeAdded(ServletContextAttributeEvent sce){
        context = sce.getServletContext();
        context.log("添加一个属性："+sce.getName()+"："+sce.getValue());
    }
    public void attributeRemoved(ServletContextAttributeEvent sce){
        context = sce.getServletContext();
        context.log("删除一个属性："+sce.getName()+"："+sce.getValue());
    }
    public void attributeReplaced(ServletContextAttributeEvent sce){
        context = sce.getServletContext();
        context.log("替换一个属性："+sce.getName()+"："+sce.getValue());
    }
}
