<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>便利驿站-登录</title>
<script type="text/javascript" src="js/login.js"></script>
</head>
<%
    if(session.getAttribute("username")!=null&&session.getAttribute("valid").equals(true)){
        response.sendRedirect("loginRedirection.jsp");
    }
%>
<body>
<div style=" width:85%;">
        <div style="text-align:right;font-size:12px;">
            欢迎光临本店请<a href="Login.jsp" style=" text-decoration:none; color:#fa6407">登录</a>，新用户？&nbsp;|&nbsp;
            <a href="Register.jsp" style=" text-decoration:none; color:#60a2fc">免费注册</a>&nbsp;&nbsp;
            <a href="" style=" text-decoration:none;">我的订单</a>&nbsp;|&nbsp;
            <a href="" style=" text-decoration:none;">查看购物车</a>&nbsp;|&nbsp;
            <a href="onlineView.jsp" style=" text-decoration:none;">在线视图</a>&nbsp;|&nbsp;
            <a href="" style=" text-decoration:none;">帮助中心</a>&nbsp;|&nbsp;
            <a href="" style=" text-decoration:none;">在线客服</a>
        </div>
    </div>
	<hr style="size:6px;width:100%;"/>
    <table>
    	<tr>
        	<td>
            	<a href="Login.jsp"><img src="pic\logo.png" style="margin-left:140px;border-right:solid #e3e3e3 2px"/></a> 
            </td>
            <td>
            	<span style="font-size:22px;">&nbsp;登录</span>
            </td>
        </tr>
    </table>
    <div style="background-color:#f4f4f4;width:98%;height:620px;
    position:relative;left:1%;border-top:solid #D4D4D4 4px;border-bottom:solid #D4D4D4 3px;">
    <img src="pic\login-bg.png" style=" position:relative;left:5%;width:90%;top:65px;"/>
        <div style="background-color:#fff;width:300px;height:310px;position:absolute;left:71%;top:22%;border-radius:4px 4px 4px 4px;">
            <form action="Login" method="post" onSubmit="return login()" style="position:relative;margin-left:36px;margin-top:50px;">
                <input type="text" name="username" placeholder="  用户名" onFocus="if(value==defaultValue)
                {value='';this.style.color='#7b7b7b'}" onBlur="if(!value){value=defaultValue;this.style.color='#B8B8B8'}" 
                style="font-size:14px;width:200px;height:30px;"/>&nbsp;
                <b id="nameCheck" style="color:#ff6301;font-size:20px;"></b><br/><br/>
                <input type="password" name="password" placeholder="  密码" onFocus="if(value==defaultValue)
                {value='';this.style.color='#7b7b7b'}" onBlur="if(!value){value=defaultValue;this.style.color='#B8B8B8'}"
                style="font-size:14px;width:200px;height:30px;"/>&nbsp;
                <b id="passCheck" style="color:#ff6301;font-size:20px;"></b><br/><br/>
                <input type="submit" id="submit" value="登   录" style="font-size:15px;width:200px;height:35px;color:white;background-color:#fa9b04;border:none;padding:0;border-radius:4px 4px 4px 4px;" /><br/><br/>
                <div id="autologin" style="font-size:14px;color:#0293e0;">
                    <input type="checkbox" value="自动登录" style="background-color:#4dacfd;width:14px;height:14px;"><span>&nbsp;&nbsp;自动登录</span><br/><br/>
                </div>
                <a href="" style=" text-decoration:none;color:#7b7a7a;font-size:14px;">忘记密码？</a> 
                <a style="color:#9f9d9d">|</a>
                <a href="Register.jsp" style=" text-decoration:none;color:#0293e0;font-size:14px">&nbsp;注册</a>
            </form>
         </div>
    </div>
     <div style=" position:absolute;left:30%;top:85%;">
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
     </div>
     <div style="position:absolute;left:27%;top:90%;">
         <table align="center">
            <tr>
                <td style="font-size:9px; width:70%; border-right:solid #d6d6d6 1.5px;">&nbsp;&nbsp;
                  <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">免责条款</a>&nbsp;&nbsp;&nbsp;
                   <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                    <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">隐私保护</a>&nbsp;&nbsp;&nbsp;
                    <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                    <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">咨询热点</a>&nbsp;&nbsp;&nbsp;
                    <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                    <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">联系我们</a>&nbsp;&nbsp;&nbsp;
                    <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                    <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">公司简介</a>&nbsp;&nbsp;&nbsp;
                    <a style="color:#d6d6d6">|</a>&nbsp;&nbsp;
                    <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">配送方式</a><br/><br/>
                    <a href="" style=" text-decoration:none;font-size:12px;color:#9f9d9d">&copy2016-2018&nbsp;&nbsp;便利驿站 &nbsp;&nbsp;<b>版权所有，并保留所有权利。</b>GUANGDONG PHARMACEUTICAL UNIVERSITY&nbsp;&nbsp;&nbsp;</a>
                    <br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" style="text-decoration:none;font-size:12px;color:#9f9d9d">Tel：32292315&nbsp;&nbsp;
                    Email：relwalter@hotmail.com&nbsp;&nbsp;&nbsp;&nbsp;Powered by <a href="https://ngrok.com" style="text-decoration:none;font-size:12px;color:#9f9d9d">ngrok</a>.</a>
                </td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <td width="33%">
                    &nbsp;&nbsp;<img src="pic\unionpay_ico.gif"/>&nbsp;&nbsp;&nbsp;&nbsp;<img src="pic\alipay_ico.gif"/>
                </td>
            </tr>
         </table>
    </div>
</body>
</html>