<%@ page import="Bean.Commodity" %>
<%@ page import="DAO.CommodityDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
    #input1{
        width:200px;
        height:20px;
    }
    #input2{
        width:55px;
        height:20px;
    }
</style>
<head>
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Commodity current=new Commodity();
        String comName=request.getParameter("name");
        session.setAttribute("comName",comName);
        if(comName!=null&&session.getAttribute("username")!=null){
            System.out.println(comName);
            CommodityDAO service=new CommodityDAO();
            current=service.getCommodity(comName);
        }else{
            response.sendRedirect("recordRedirection.jsp");
        }
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>便利驿站-修改商品</title>
    <script type="text/javascript" src="js/record.js"></script>
</head>
<body>
<div style=" width:85%;">
    <div style="text-align:right;font-size:12px;">
        返回上一菜单请点击<a href="Shelf.jsp" style=" text-decoration:none; color:#fa6407">此处</a>，
        <a href="Index.jsp" style="text-decoration:none; color:#60a2fc">去主页</a>&nbsp;
        <a href="" style=" text-decoration:none;">我的订单</a>&nbsp;|&nbsp;
        <a href="" style=" text-decoration:none;">查看购物车</a>&nbsp;|&nbsp;
        <a href="onlineView.jsp" style=" text-decoration:none;">在线视图</a>&nbsp;|&nbsp;
        <a href="" style=" text-decoration:none;">帮助中心</a>&nbsp;|&nbsp;
        <a href="" style=" text-decoration:none;">在线客服</a>
    </div>
</div>
<hr style="size:6px;width:98%;"/>
<table>
    <tr>
        <td>
            <a href="Index.jsp"><img src="pic\logo.png" style="margin-left:140px;border-right:solid #e3e3e3 2px"/></a>
        </td>
        <td>
            <span style="font-size:22px;">&nbsp;修改商品</span>
        </td>
    </tr>
</table>
<div style="background-color:#f4f4f4;width:98%;height:660px;
    position:relative;left:1%;top:5px;bottom:5px; border-top:solid #D4D4D4 4px;border-bottom:solid #D4D4D4 3px;">
    <div style="position:relative;background-color:white;width:60%;height:96%;left:22%;top:2%;">
        <div style="position:relative;left:7%;top:3%;"><b>请重新填写商品信息，以下信息均为必填：</b></div>
        <form action="Update" method="post" onSubmit="return register()" style="position:relative;left:12%;top:6%;">
            <lable>&nbsp;&nbsp;商品名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
            <input type="text" name="comName" value=<%=current.getComName()%> id="input11"/>&nbsp;
            <span id="check1" style="font-size:13px;color:red;"></span><br/><br/>
            <lable>&nbsp;&nbsp;品牌名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
            <input type="text" name="brandName" value=<%=current.getBrandName()%> id="input12"/>&nbsp;
            <span id="check2" style="font-size:13px;color:red;"></span><br/><br/>
            <lable>&nbsp;&nbsp;生产地：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
            <input type="text" name="madeIn" value=<%=current.getMadeIn()%> id="input13"/>&nbsp;
            <span id="check3" style="font-size:13px;color:red"></span><br/><br/>
            <lable>&nbsp;&nbsp;销售价格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
            <input type="text" name="price" value=<%=current.getPrice()%> id="input14"/>&nbsp;
            <span id="check4" style="font-size:13px;color:red;"></span><br/><br/>
            <lable>&nbsp;&nbsp;折扣：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
            <input type="text" name="discount" value=<%=current.getDiscount()%> id="input15"/>&nbsp;
            <span id="check5" style="font-size:13px;color:red;"></span><br/><br/>
            <lable>&nbsp;&nbsp;子类别名称：&nbsp;&nbsp;</lable>
            <input type="text" name="catName" value=<%=current.getCatName()%> id="input32"/>&nbsp;
            <span id="check6" style="font-size:13px;color:red;"></span><br/><br/>
            <lable>&nbsp;&nbsp;父类别名称：&nbsp;&nbsp;</lable>
            <input type="text" name="parentName" value=<%=current.getParentCatName()%> id="input42"/>&nbsp;
            <span id="check7" style="font-size:13px;color:red;"></span><br/><br/>
            <textarea rows="5" cols="70" name="discription" id="input6"><%=current.getDiscription()%></textarea>
            <span id="check8" style="font-size:13px;color:red;"></span><br/><br/>
            <lable>&nbsp;&nbsp;上架时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
            <input type="text" name="saleTime" value=<%=current.getSaleTime()%> id="input7"/>&nbsp;
            <span id="check9" style="font-size:13px;color:red;"></span><br/><br/>
            <lable>&nbsp;&nbsp;&nbsp;数量：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
            <input type="text" name="stock" value=<%=current.getStock()%> id="input8"/>&nbsp;
            <span id="check10" style="font-size:13px;color:red;"></span><br/><br/>
            <div style="position:relative; left:10%;width:25%;">
                <input type="submit" value="重新录入" id="submit" style="background-color:#fa9b04;font-size:15px;width:160px;height:38px;color:white;border:none;padding:0;border-radius:4px 4px 4px 4px;" />
            </div>
        </form>
    </div>
</div>
<div style=" position:absolute;left:30%;top:93%;">
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