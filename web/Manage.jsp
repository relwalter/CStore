<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.User,java.util.*" %>
<%@ page import="org.apache.catalina.connector.Request" %>
<%@ page import="DAO.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>便利驿站-用户中心</title>
<script type="text/javascript" src="js/confirm.js"></script>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    List<User> allUsers=new ArrayList<>();
    String[] selfStyle=new String[3];
    selfStyle[0]="";
    selfStyle[1]="#000000";
    selfStyle[2]="normal";
    int size=0;
    try{
        String username=session.getAttribute("username").toString();
        System.out.println(session.getAttribute("username"));
        if(session.getAttribute("username")==null||!session.getAttribute("valid").equals(true)){
            out.print("<script>alert('请您先登录！');</script>");
            response.sendRedirect("Login.jsp");
        }else{
            UserDAO service=new UserDAO();
            User current=service.getUser(username);
            if(current.getAdmin()==1){
                allUsers=service.getAllUsers();
            }
            else{
                allUsers.add(current);
            }
            size=allUsers.size();
            System.out.println(size);
        }
    %>
</head>
<body>
<div style=" width:85%;">
        <div style="text-align:right;font-size:12px;">
            欢迎光临！<a href="Index.jsp" style=" text-decoration:none; color:#dc3fa9">首页</a>&nbsp;|&nbsp;
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
            	<span style="font-size:22px;">&nbsp;查看信息</span>
            </td>
        </tr>
    </table>
    <div style="background-color:#f4f4f4;width:98%;height:680px;
    position:relative;left:1%;top:5px;bottom:5px; border-top:solid #D4D4D4 4px;border-bottom:solid #D4D4D4 3px;">
        <div style="position:relative;background-color:white;width:80%;height:94%;left:16%;top:2%;">
            <div style="position:relative;left:5%;top:3%;"><br><b>注意：以下为个人注册信息，请小心操作！</b></div>
            <div style="position:relative;left:8%;;top:6%;">
                <form action="" method="post" name="manage" style="font-family:Futura,Arial,sans-serif;font-size:13px">
                    <table style="border-collapse: collapse;font-size: 13px;">
                        <caption style="font-size: 28px;margin: 1em auto;letter-spacing: 2px;">
                            <img src="pic\user_info.png" width="36" height="36">&nbsp;帐户信息
                        </caption>
                        <thead>
                        <tr style="font-size: 14px;font-weight:normal;">
                            <%--<th></th>--%>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                帐户ID</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                帐户身份</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                登录名</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                密码</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                商业名称</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                商业地址</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                QQ号码</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                电子邮箱</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                手机号码</th>
                            <th style="padding: .65em;background: #faba70;border: 1px solid #777;color: #ffffff;">
                                操作</th>
                        </tr>
                        </thead>
                        <tbody>

                            <%  int showPage;
                                int pageSize=5;
                                if(pageSize>size){
                                    pageSize=size;
                                }
                                if(size<=0){
                                    pageSize=1;
                                }
                                int pageCount=(size%pageSize==0)?size/pageSize:size/pageSize+1;
                                String integer=request.getParameter("showPage");
                                if(integer==null){
                                    integer="1";
                                }
                                try{
                                    showPage=Integer.parseInt(integer);
                                }catch(NumberFormatException e){
                                    showPage=1;
                                }
                                if(showPage<=1){
                                    showPage=1;
                                }
                                if(showPage>=pageCount){
                                    showPage=pageCount;
                                }
                                if(pageCount<=0){
                                    showPage=1;
                                }
                                int position=(showPage-1)*pageSize;
                                int end=(showPage==pageCount)?size:(pageSize*showPage);
                                System.out.println(showPage+" "+pageSize+" "+pageCount+" "+position+"  "+end);
                                if(size>0) for(int i=position;i<end;i++){
                                    System.out.print(i+"  ");
                                    System.out.println(allUsers.get(i).getUsername());
                                    if(allUsers.get(i).getUsername().equals(username)){
                                     selfStyle[0]="<img src='"+"pic\\user_info.png'"+"width='"+"16'"+"height='"+"16'>";
                                     selfStyle[1]="#C027DC";
                                     selfStyle[2]="bolder";
                                    }
                            %>
                           <tr id="light" align="center" style="color:<%=selfStyle[1]%>;font-weight:<%=selfStyle[2]%>">
                                <%--<td><input type="radio" value="<%=allUsers.get(i).getUsername()%>"--%>
                                           <%--name="username"></td>--%>
                                    <td style="padding: .65em;border: 1px solid#777;background: #fdfaf6;">
                                        <%=selfStyle[0]%>
                                        <%=allUsers.get(i).getId()%></td>
                                    <%  if(allUsers.get(i).getAdmin()==1){
                                    %>
                                        <td style="color: crimson;border: 1px solid#777;background: #fdfffe;">管理员</td>
                                    <%  }else{
                                    %>
                                        <td style="border: 1px solid#777;background: #fdfffe;">普通用户</td>
                                    <%}
                                    %>
                                <td id="username" style="font-weight: bold;border: 1px solid#777;background: #fdfaf6;">
                                        <%=allUsers.get(i).getUsername()%></td>
                                    <td style="font-weight: bold;border: 1px solid#777;background: #fdfaf6;">
                                        <%=allUsers.get(i).getPassword()%></td>
                                    <td style="padding: .65em;border: 1px solid#777;background: #fdfaf6;">
                                        <%=allUsers.get(i).getbName()%></td>
                                    <td style="padding: .65em;border: 1px solid#777;background: #fdfaf6;">
                                        <%=allUsers.get(i).getbAddress()%></td>
                                    <td style="padding: .65em;border: 1px solid#777;background: #fdfaf6;">
                                        <%=allUsers.get(i).getQq()%></td>
                                    <td style="padding: .65em;border: 1px solid#777;background: #fdfaf6;">
                                        <%=allUsers.get(i).getEmail()%></td>
                                    <td style="padding: .65em;border: 1px solid#777;background: #fdf6f1;">
                                        <%=allUsers.get(i).getPhone()%></td>
                                    <td style="padding: .65em;border: 1px solid#777;background: #ffefee;">&nbsp;
                                        <a href="Modify.jsp?name=<%=allUsers.get(i).getUsername()%>"
                                           style="text-decoration: none;">
                                            <img src="pic\user_edit.png" alt="修改" width="21" height="21">&nbsp;</a>
                                        <a href="Delete?name=<%=allUsers.get(i).getUsername()%>"
                                            style="text-decoration: none;" onclick="return deleteConfirm();">
                                            <img src="pic\user_delete.png" alt="删除" width="21" height="21"></a>
                                    </td>
                                </tr>
                            <% }
                            %>
                        </tbody>
                    </table>
                    <br>
                    第<%=showPage %>页（共<%=pageCount %>页）<br><br>
                    <% for(int i=1;i<=pageCount;i++){
                    %>
                        <a href="Manage.jsp?showPage=<%=i%>"> [<%=i%>]</a>
                    <% }
                    %>
                    <br><br>
                    <%--<table>--%>
                        <%--<tr>--%>
                            <%--<input type="button" value="变更" name="modify" onclick="modify()" style="font-size:15px;width:100px;height:33px;color:white;background-color:#2BD591;border:none;padding:0;border-radius:4px 4px 4px 4px;" />--%>
                            <%--&nbsp;&nbsp;--%>
                            <%--<input type="button" value="注销" name="delete" onclick="del()" style="font-size:15px;width:100px;height:33px;color:white;background-color:#d54043;border:none;padding:0;border-radius:4px 4px 4px 4px;" />--%>
                        <%--</tr>--%>
                    <%--</table>--%>
                </form>
                <br><form action="" name="pages" method="get">
                    <input type="submit" name="submit" value="转到" style="font-size:13px;width:45px;height:25px;color:white;background-color:#2398d5;border:none;padding:0;border-radius:2px 2px 2px 2px;">
                    &nbsp;第<input type="text" name="showPage"
                    value="<%=showPage==pageCount?pageCount:showPage+1 %>" style="width: 60px;">页&nbsp;&nbsp;&nbsp;
                <input type="button" value="返回" id="return" style="font-size:13px;width:50px;height:25px;color:white;background-color:#2BD591;border:none;padding:0;border-radius:2px 2px 2px 2px;" onclick="javascript:history.back(-1);"/>
                </form>
            </div>
        </div>
    </div>
<%
    }catch(Exception e){
        out.print("<script>alert('操作有误，请重新登录！');</script>");
        response.sendRedirect("Login.jsp");
    }
%>
    <div style=" position:absolute;left:30%;top:92%;">
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