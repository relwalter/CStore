<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<title>便利驿站-在线视图</title>
<html>
<body>
<div style=" width:85%;">
    <div style="text-align:right;font-size:12px;">
        欢迎光临!回到<a href="Index.jsp" style=" text-decoration:none; color:#dc3fa9">首页</a>&nbsp;|&nbsp;
        <a href="" style=" text-decoration:none;">我的订单</a>&nbsp;|&nbsp;
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
            <span style="font-size:22px;">&nbsp;在线视图</span>
        </td>
    </tr>
</table>
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("loginRedirection.jsp");
    }else{
        List allUsers = (List)application.getAttribute("allusers");
        allUsers.remove(false);
        allUsers.remove(true);
%>
<form style="background-color:#f4f4f4;width:98%;height:650px;
        position:relative;left:1%;top:5px;bottom:5px; border-top:solid #D4D4D4 4px;border-bottom:solid #D4D4D4 3px;">
    <center><br/><br/><br/><p style="color:#fa9b04"><b style="font-size:21px;">在线用户视图</b><p/><br/>
        <div id="info">
            <table>
                <thead>
                <tr style="font-size:14px;">
                    <th style="font-weight:300;">&nbsp;</th>
                    <th style="font-weight:300;">1</th>
                    <th style="font-weight:300;">2</th>
                    <th style="font-weight:300;">3</th>
                    <th style="font-weight:300;">4</th>
                    <th style="font-weight:300;">5</th>
                    <th style="font-weight:300;">6</th>
                    <th style="font-weight:300;">7</th>
                    <th style="font-weight:300;">8</th>
                    <th style="font-weight:300;">9</th>
                    <th style="font-weight:300;">10</th>
                </tr>
                </thead>
                <thread>
                    <tbody>
                    <%
                        for(int i=0;i<=allUsers.size()/10;i++){
                    %>
                            <tr style="border: 1px solid#777;">
                            <td style="font-weight:300;font-size:14px;"><%=i*10%></td>
                            <%
                                for(int j=0;j<(i==allUsers.size()/10?allUsers.size()%10:10);j++){
                            %>
                                    <td style="font-weight:100;color:rgb(230, 16, 155);">
                                        <img src="pic\user_avatar.png" alt="user" width="14" height="14">
                                        <%=allUsers.get(j+i*10)%>
                                    </td>
                            <%
                                }
                            %>
                    <%
                        }
                    %>
                    </tr>
                    </tbody>
                </thread>
            </table>
        </div>
        <br/>
        <br>
        <a style="font-size:15px;font-weight:300;">总人数：&nbsp;</a>
        <a style="font-size:15px;color:rgb(230, 16, 155);"><%=allUsers.size()%></a><br><br>
        <input type="button" value="返 回" id="return" style="font-size:15px;width:140px;height:28px;color:white;background-color:#2BD591;border:none;padding:0;border-radius:4px 4px 4px 4px;" onclick="javascript:history.back(-1);"/>
    </center>
<%
    }
%>
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