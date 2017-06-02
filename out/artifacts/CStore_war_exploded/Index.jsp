<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="Bean.User" %>
<%@ page import="org.apache.catalina.connector.Request" %>
<%@ page import="DAO.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>便利驿站-首页</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="css/jquery.countdown.css" />
	<script src="js/jquery.js"></script>
	<script src="js/jquery.countdown.js"></script>
	<script src="js/script.js"></script>
</head>
<%
	boolean admin=false;
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}
	else{
		System.out.println(session.getAttribute("username"));
		String username=session.getAttribute("username").toString();
		UserDAO service=new UserDAO();
		User current=service.getUser(username);
		if(current.getAdmin()==1){
			admin=true;
		}
	}
%>
<div align=center>
<div style=“width:960px; margin:0 auto; height:90px;”>
<script>
(function() {
    var s = "_" + Math.random().toString(36).slice(2);
    document.write('<div id="' + s + '"></div>');
    (window.slotbydup=window.slotbydup || []).push({
        id: '730419',
        container: s,
        size: '960,90',
        display: 'inlay-fix'
    });
})();
</script>
<script language="javascript">
function custom_close(){
    var email=document.getElementsByClassName("email")[0].value;
    var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    var success=false;
    if(email.length>0&&reg.test(email)){
	alert("订阅成功！");
	success=true;
    }
    if(success){
	if(confirm("欢迎再次光临驿站，再见！")){
	    window.opener=null;
	    window.open('','_self');
	    window.close();
   	 }
    }
}
</script>
</div>
</div>
<body>
<div class="header">
		<h1>Oops...驿站正在装修！</h1>
	</div>
	<div class="content">
		<div class="content1"> 
			<img src="pic/work.png" alt="under-construction">
		</div>
		<div class="content2">
			<div class="timer_wrap">
				<div id="counter"> </div>		
			</div>
		</div>
		<div class="content3">
			<p style="letter-spacing: 2px;font-size:28px">SUBSCRIPTION</p>
			<br>
			<ul class="form">
				<li>						
					<form>
						<input type="text" class="email" placeholder="Enter your email address" required>
						<input type="submit" value="关注驿站动态" onClick="custom_close()"/>
						<div class="clear"> </div> 
					</form>
				</li>
			</ul>
		</div>
	</div>
	<br><br><br><br>
	<center>
		<br><br><img src="pic\user_shield.png" alt="用户" width="15" height="15"/>
		<a href="Manage.jsp" style="color:#dc3fa9">用户中心</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<% if(admin){
		%>
			<img src="pic\store.ico" alt="商品" width="16" height="15"/>
			<a href="Shelf.jsp" style="color:#fa9b04">商品架</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%
			}
		%>
		<img src="pic\log_out.png" alt="退出" width="15" height="15"/>
		<a href="logoutRedirection.jsp" style="text-decoration:none; color: #d54043;">退出</a>.
		<br><br><br>
	</center>
</body>
</html>