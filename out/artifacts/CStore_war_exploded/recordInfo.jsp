<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.catalina.connector.Request" %>
<%@ page import="DAO.CommodityDAO" %>
<%@ page import="Bean.Commodity" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>便利驿站-添加成功</title>

<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    Commodity current=new Commodity();
    if(session.getAttribute("comName")!=null&&session.getAttribute("username")!=null){
        String comName=session.getAttribute("comName").toString();
        CommodityDAO service=new CommodityDAO();
        current=service.getCommodity(comName);
    }else{
        response.sendRedirect("recordRedirection.jsp");
    }
%>
</head>
<style>
    table {
        border-collapse: collapse;
        font-family: Futura, Arial, sans-serif;
    }

    caption {
        font-size: larger;
        font-weight: bolder;
        margin: 1em auto;
    }

    th,td {
        padding: .65em;
    }

    th {
        background: #faba70;
        border: 1px solid #777;
        color: #ffffff;
    }

</style>
<body>
<div style=" width:85%;">
        <div style="text-align:right;font-size:12px;">
            返回上一菜单请点击<a href="Shelf.jsp" style=" text-decoration:none; color:#fa6407">此处</a>，
            <a href="Index.jsp" style="text-decoration:none; color:#60a2fc">去主页</a>&nbsp;
            <a href="" style=" text-decoration:none;">查看购物车</a>&nbsp;|&nbsp;
            <a href="onlineView.jsp" style=" text-decoration:none;">在线视图</a>&nbsp;|&nbsp;
            <a href="" style=" text-decoration:none;">帮助中心</a>&nbsp;|&nbsp;
            <a href="" style=" text-decoration:none;">在线客服</a>&nbsp;|&nbsp;
            <img src="pic\log_out.png" alt="退出" width="13" height="13"/>
            <a href="logoutRedirection.jsp" style="text-decoration:none; color:red;">退出</a>.
        </div>
    </div>
	<hr style="size:6px;width:98%;"/>
    <table>
    	<tr>
        	<td>
            	<a href="Index.jsp"><img src="pic\logo.png" style="margin-left:140px;border-right:solid #e3e3e3 2px"/></a>
            </td>
            <td>
            	<span style="font-size:22px;">&nbsp;添加商品成功</span>
            </td>
        </tr>
    </table>
    <form action="" method="" style="background-color:#f4f4f4;width:98%;height:650px;
    position:relative;left:1%;top:5px;bottom:5px; border-top:solid #D4D4D4 4px;border-bottom:solid #D4D4D4 3px;">
        <center><br/><br/><br/><p style="color:#fa9b04"><b>以下是您本次添加的商品信息：</b><p/><br/>
            <div id="info">
                <table>
                    <caption>帐户信息</caption>
                    <thead>
                    <tr>
                        <th>商品ID</th>
                        <th>标&nbsp;识</th>
                        <th>商品名</th>
                        <th>子类名</th>
                        <th>父类名</th>
                        <th>品牌名</th>
                        <th>生产地</th>
                        <th>售&nbsp;价</th>
                        <th>折扣</th>
                        <th>上架时间</th>
                        <th>库存</th>
                        <th>描述</th>
                    </tr>
                    </thead>
                    <thread>
                        <tbody>
                            <tr style="border: 1px solid#777;background: #fdf6f1;">
                                <td><%=current.getId()%></td>
                                <td style="color: crimson">
                                    <%=current.getSaleTime().before(new Date())?"已上架":"未上架"%>
                                </td>
                                <td style="font-weight: bold"><%=current.getComName()%></td>
                                <td><%=current.getCatName()%></td>
                                <td><%=current.getParentCatName()%></td>
                                <td><%=current.getBrandName()%></td>
                                <td><%=current.getMadeIn()%></td>
                                <td><%=current.getPrice()%></td>
                                <td><%=current.getDiscount()%></td>
                                <td><%=current.getSaleTime()%></td>
                                <td><%=current.getStock()%></td>
                                <td><%=current.getDiscription()%></td>
                            </tr>
                        </tbody>
                    </thread>
                </table>
            </div>
		<br/>
		<input type="button" value="返回商品架" onclick="location='Shelf.jsp'" id="return" style="font-size:15px;width:200px;height:38px;color:white;background-color:#2BD591;border:none;padding:0;border-radius:4px 4px 4px 4px;" />
		</center>
    </form>
    <div style=" position:absolute;left:30%;top:89%;">
     <table align="center">
     	<tr>
        	<td>
               <img src="pic\Quality_assurance.gif" />
           </td>    
            <td style="color:#5f5e5e">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正品保障&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a style="color:#d6d6d6">|</a>            
            </td>    
            <td >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="pic\Seven_days.gif" />
            </td>
             <td style="color:#5f5e5e">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;七天包退&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a style="color:#d6d6d6">|</a>
             </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="pic\Fake_a_lose_three.gif" />
            </td>
            <td style="color:#5f5e5e">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;假一赔三
            </td>        
        </tr>
     </table>
     <table align="center">
     	<tr>
        	<td style="font-size:9px; width:70%; border-right:solid #d6d6d6 1.5px;">&nbsp;&nbsp;
              <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">免责条款</a>&nbsp;&nbsp;&nbsp;
               <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">隐私保护</a>&nbsp;&nbsp;&nbsp;
                <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d;font-size:12px;color:#9f9d9d;font-size:12px;color:#9f9d9d">咨询热点</a>&nbsp;&nbsp;&nbsp;
                <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d;font-size:12px;color:#9f9d9d">联系我们</a>&nbsp;&nbsp;&nbsp;
                <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">公司简介</a>&nbsp;&nbsp;&nbsp;
                <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">配送方式</a><br/><br/>
                <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">&copy2016-2018&nbsp;便利驿站 &nbsp;<b>版权所有，并保留所有权利。</b>GUANGDONG PHARMACEUTICAL UNIVERSITY&nbsp;&nbsp;&nbsp;</a>
                <br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">Tel:32292315&nbsp;&nbsp;
                Email：relwalter@hotmail.com&nbsp;&nbsp;&nbsp;&nbsp;Powered by <a href="https://ngrok.com" style="text-decoration:none;font-size:12px;color:#9f9d9d">ngrok</a>.</a>
            </td>
            <td width=30%>
            	&nbsp;&nbsp;<img src="pic\unionpay_ico.gif" />&nbsp;&nbsp;<img src="pic\alipay_ico.gif" />
            </td>
        </tr>
     </table>
     </div>
</body>
</html>