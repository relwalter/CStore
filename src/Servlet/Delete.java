package Servlet;
import Bean.User;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="Delete",value="/Delete")
public class Delete extends HttpServlet {

    public Delete(){
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
        request.getSession().setAttribute("deleted",false);
        User current=new User();
        UserDAO service=new UserDAO();
        current.setUsername(request.getParameter("name"));
        current=service.getUser(current.getUsername());

        System.out.println(current.getUsername()+"  "+current.getPassword()+"  "+current.getbName()+"  "+current.getbAddress()+"  "+current.getCharge()+"  "+current.getQq()+"  "+current.getEmail()+"  "+current.getPhone());

        if(request.getSession().getAttribute("valid").equals(true)){
            if(service.delete(current)){
                request.getSession().setAttribute("deleting",current.getUsername());
                request.getSession().setAttribute("deleted",true);
                if(request.getParameter("name").equals(request.getSession().getAttribute("username"))){
                    request.getSession().setAttribute("valid",false);
                }
                System.out.println("Deleted!");
            }
            response.sendRedirect("deleteRedirection.jsp");
        }else{
            response.sendRedirect("Login.jsp");
        }
    }
}
