package Servlet;
import Bean.Commodity;
import DAO.CommodityDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="Remove",value="/Remove")
public class Remove extends HttpServlet {

    public Remove(){
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
        CommodityDAO service=new CommodityDAO();
        String comName=request.getParameter("name");
        Commodity current=service.getCommodity(comName);
        System.out.println("Deleting: "+current.getComName());
        service.deleteCommodity(current);
        response.sendRedirect("Shelf.jsp");
    }
}
