package Servlet;
import Bean.User;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;

@WebServlet(name="Login",value="/Login")
public class Login extends HttpServlet {

    public Login(){
        super();
    }

    public void destroy(){
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        request.getSession().setAttribute("valid",false);
        User current=new User();
        UserDAO service=new UserDAO();
        current.setUsername(request.getParameter("username"));
        current.setPassword(request.getParameter("password"));
        System.out.println(current.getUsername()+"  "+current.getPassword());
        if(service.valid(current)){
            request.getSession().setAttribute("username",current.getUsername());
            request.getSession().setAttribute("valid",true);
        }else{
            request.getSession().setAttribute("username",null);
        }
        response.sendRedirect("loginRedirection.jsp");
    }
}
