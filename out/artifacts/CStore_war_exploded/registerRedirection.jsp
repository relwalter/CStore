<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>便利驿站-提示信息</title>

<%
	boolean success=false;
	int delay=5;
	String msg,pageInfo,dir;
    if(session.getAttribute("valid").equals(true)&&session.getAttribute("username")!=null){
        success=true;
        msg="注册成功！";
        pageInfo="下一页面";
        dir="registerInfo.jsp";
    }else{
        msg="注册失败！";
        pageInfo="注册页面";
        dir="Register.jsp";
    }
%>
<style>
html, body{
    height: 100%;
}  
#login{
    background-color: #fff;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#eee));
    background-image: -webkit-linear-gradient(top, #fff, #eee);
    background-image: -moz-linear-gradient(top, #fff, #eee);
    background-image: -ms-linear-gradient(top, #fff, #eee);
    background-image: -o-linear-gradient(top, #fff, #eee);
    background-image: linear-gradient(top, #fff, #eee);  
    height: 240px;
    width: 400px;
    margin: -150px 0 0 -230px;
    padding: 30px;
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 0;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;  
    -webkit-box-shadow:
          0 0 2px rgba(0, 0, 0, 0.2),
          0 1px 1px rgba(0, 0, 0, .2),
          0 3px 0 #fff,
          0 4px 0 rgba(0, 0, 0, .2),
          0 6px 0 #fff,  
          0 7px 0 rgba(0, 0, 0, .2);
    -moz-box-shadow:
          0 0 2px rgba(0, 0, 0, 0.2),  
          1px 1px   0 rgba(0,   0,   0,   .1),
          3px 3px   0 rgba(255, 255, 255, 1),
          4px 4px   0 rgba(0,   0,   0,   .1),
          6px 6px   0 rgba(255, 255, 255, 1),  
          7px 7px   0 rgba(0,   0,   0,   .1);
    box-shadow:
          0 0 2px rgba(0, 0, 0, 0.2),  
          0 1px 1px rgba(0, 0, 0, .2),
          0 3px 0 #fff,
          0 4px 0 rgba(0, 0, 0, .2),
          0 6px 0 #fff,  
          0 7px 0 rgba(0, 0, 0, .2);
}

#login:before{
    content: '';
    position: absolute;
    z-index: -1;
    border: 1px dashed #ccc;
    top: 5px;
    bottom: 5px;
    left: 5px;
    right: 5px;
    -moz-box-shadow: 0 0 0 1px #fff;
    -webkit-box-shadow: 0 0 0 1px #fff;
    box-shadow: 0 0 0 1px #fff;
}
 
/*--------------------*/

h1{
    text-shadow: 0 1px 0 rgba(255, 255, 255, .7), 0px 2px 0 rgba(0, 0, 0, .5);
    text-transform: uppercase;
    text-align: center;
    color: #666;
    margin: 0 0 30px 0;
    letter-spacing: 4px;
    font: normal 28px/1 Verdana, Helvetica;
    position: relative;
}

h2{
    text-transform: uppercase;
    text-align: center;
    color: #525151;
    margin: 0 0 30px 0;
    letter-spacing: 2px;
    font: normal 19px/1 Verdana, Helvetica;
    position: relative;
}
    
h1:after, h1:before{
    background-color: #777777;
    content: "";
    height: 1px;
    position: absolute;
    top: 15px;
    width: 120px;   
}

h1:after{ 
    background-image: -webkit-gradient(linear, left top, right top, from(#777), to(#fff));
    background-image: -webkit-linear-gradient(left, #777, #fff);
    background-image: -moz-linear-gradient(left, #777, #fff);
    background-image: -ms-linear-gradient(left, #777, #fff);
    background-image: -o-linear-gradient(left, #777, #fff);
    background-image: linear-gradient(left, #777, #fff);      
    right: 0;
}

h1:before{
    background-image: -webkit-gradient(linear, right top, left top, from(#777), to(#fff));
    background-image: -webkit-linear-gradient(right, #777, #fff);
    background-image: -moz-linear-gradient(right, #777, #fff);
    background-image: -ms-linear-gradient(right, #777, #fff);
    background-image: -o-linear-gradient(right, #777, #fff);
    background-image: linear-gradient(right, #777, #fff);
    left: 0;
}

#back{
    display: block;
    text-align: center;
    position: relative;
    top: 60px;
    color: #999;
}
</style>
</head>
<body>
 <form id="login">
    <h1>便利驿站</h1>
    <h2><% out.print(msg); %></h2>
    <div style="font-size:15px;text-align:center;letter-spacing:1px">即将跳转，
    <span id="totalSecond" style="color:#fa6c04"><%=delay %></span>&nbsp;秒后转到<%=pageInfo %>。<br>
    <i style="font-size:12px">（若浏览器无反应，请点<a href=<%=dir%> style="color:#050505">这里</a>）</i>
    </div>
    <a href="Register.jsp" id="back" style="font-size:12px;letter-spacing:1px">返回注册界面...</a>
    </form>
    <script language="javascript" type="text/javascript">
        var second = document.getElementById('totalSecond').textContent;
        var flag= <%=success%>;
        if (navigator.appName.indexOf("Explorer") > -1){
            second = document.getElementById('totalSecond').innerText;
        } else{
            second = document.getElementById('totalSecond').textContent;
        }
        	setInterval("redirect()", 1000);
        function redirect(){
            if (second < 0){
            	if(flag==false){
            		location.href="<%=dir%>";
            	}else{
            		location.href="<%=dir%>";
            	}
            } else{
                if (navigator.appName.indexOf("Explorer") > -1){
                    document.getElementById('totalSecond').innerText = second--;
                } else{
                    document.getElementById('totalSecond').textContent = second--;
                }
            }
        }
    </script>
</body>
</html>