package Servlet;
import Bean.User;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="Modify",value="/Modify")
public class Modify extends HttpServlet {

    public Modify(){
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
        request.getSession().setAttribute("modified",false);
        User current=new User();
        UserDAO service=new UserDAO();
        current.setUsername(request.getParameter("username"));
        current.setPassword(request.getParameter("password"));
        current.setbName(request.getParameter("bName"));
        current.setbAddress(request.getParameter("badd1")+request.getParameter("badd2")+request.getParameter("badd3")+request.getParameter("badd4"));
        current.setCharge(request.getParameter("charge"));
        current.setEmail(request.getParameter("email"));
        current.setPhone(request.getParameter("phone"));
        current.setQq(request.getParameter("qq"));

        System.out.println(current.getUsername()+"  "+current.getPassword()+"  "+current.getbName()+"  "+current.getbAddress()+"  "+current.getCharge()+"  "+current.getQq()+"  "+current.getEmail()+"  "+current.getPhone());

        if(request.getSession().getAttribute("valid").equals(true)){
            if(service.modifyInfo(current,request.getParameter("passwordn"))){
                request.getSession().setAttribute("modifying",current.getUsername());
                request.getSession().setAttribute("modified",true);
                System.out.println("Modified!");
            }
            response.sendRedirect("modifyRedirection.jsp");
        }else{
            response.sendRedirect("Login.jsp");
        }
    }
}
