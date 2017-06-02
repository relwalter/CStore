package Servlet;
import Bean.Category;
import Bean.Commodity;
import DAO.CategoryDAO;
import DAO.CommodityDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet(name="Update",value="/Update")
public class Update extends HttpServlet {

    public Update(){
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
        String catName=request.getParameter("catName");
        Commodity current=new Commodity();
        CommodityDAO service1=new CommodityDAO();
        Category category=new Category();
        CategoryDAO service2=new CategoryDAO();
        try{
            if(!service2.checkCatName(catName)){     //Check the catName if already exists.
                category.setCatName(catName);
                category.setParentName(request.getParameter("parentName"));
                System.out.println(category.getParentName());
                service2.addCategory(category);     //Add new category.
            }
            category=service2.getCategory(catName);
            current.setComName(request.getParameter("comName"));
            current.setCatId(category.getId());
            current.setBrandName(request.getParameter("brandName"));
            current.setMadeIn(request.getParameter("madeIn"));
            current.setPrice(Double.parseDouble(request.getParameter("price")));
            current.setDiscount(Double.parseDouble(request.getParameter("discount")));
            current.setDiscription(request.getParameter("discription"));
            current.setSaleTime(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("saleTime")));
            current.setStock(Integer.parseInt(request.getParameter("stock")));
            Commodity old=service1.getCommodity(request.getSession().getAttribute("comName").toString());
            System.out.println("old: "+old.getComName());
            if(service1.modifyCommodity(current,old.getId())){
                request.getSession().setAttribute("comName",current.getComName());
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            response.sendRedirect("Shelf.jsp");
        }
    }
}