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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>便利驿站-注册</title>
<script type="text/javascript" src="js/register.js"></script>
</head>
<body>
<div style=" width:85%;">
        <div style="text-align:right;font-size:12px;">
            欢迎光临本店请<a href="Login.jsp" style=" text-decoration:none; color:#fa6407">登录</a>，新用户？
            <a href="Register.jsp" style=" text-decoration:none; color:#60a2fc">免费注册</a>&nbsp;
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
            	<span style="font-size:22px;">&nbsp;注册</span>
            </td>
        </tr>
    </table>
    <div style="background-color:#f4f4f4;width:98%;height:660px;
    position:relative;left:1%;top:5px;bottom:5px; border-top:solid #D4D4D4 4px;border-bottom:solid #D4D4D4 3px;">
        <div style="position:relative;background-color:white;width:60%;height:96%;left:22%;top:2%;">
        <div style="position:relative;left:7%;top:3%;"><b>填写账户信息，以下信息均为必填：</b></div>
            <form action="Register" method="post" onSubmit="return register()" style="position:relative;left:12%;top:6%;">
            	<lable>&nbsp;&nbsp;登录账号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                <input type="text" name="username" value="" id="input11"/>&nbsp;
                <span id="namets" style="font-size:13px;color:red;"></span><br/><br/>
                <lable>&nbsp;&nbsp;登录密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                <input type="password" name="password" value="" id="input12"/>&nbsp;
                <span id="passts" style="font-size:13px;color:red;"></span><br/><br/>
                <lable>&nbsp;&nbsp;确认密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                <input type="password" name="passwordr" value="" id="input13"/>&nbsp;
         		&nbsp;<span id="passrts" style="font-size:12px;color:#BEBEBE">&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;*6-20位字符，可由大小写英文、数字或符号组成</span>
                <span id="passrtss" style="font-size:13px;color:red;"></span><br/><br/>
                <lable>&nbsp;&nbsp;商业名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                <input type="text" name="bName" value="" id="input"/>&nbsp;
                <span id="bsnamets" style="font-size:13px;color:red;"></span><br/><br/>
                <lable>&nbsp;&nbsp;商业地址：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                <a> 
                   <select id="input21" name="badd1" style="width:80px;">
                        <option>广东</option>
                        <option>北京</option> 
                        <option>深圳</option> 
                        <option>上海</option> 
                        <option>天津</option>
                        <option>重庆</option> 
                        <option>浙江</option> 
                        <option>江苏</option> 
                        <option>辽宁</option> 
                        <option>山东</option> 
                    </select> 
                </a> &nbsp;
                   <select id="input22" name="badd2" style="width:80px;">
                        <option>广州</option> 
                        <option>深圳</option> 
                        <option>珠海</option> 
                        <option>汕头</option> 
                        <option>东莞</option>
                        <option>中山</option>
                        <option>河源</option> 
                        <option>梅州</option> 
                        <option>茂名</option> 
                        <option>肇庆</option>
                        <option>湛江</option>
                    </select>
                <a> 
                </a> &nbsp;
                <a>
                </a> 
                   <select id="input23" name="badd3" style="width:80px;">
                        <option>荔湾区</option>
                        <option>天河区</option> 
                        <option>越秀区</option> 
                        <option>海珠区</option> 
                        <option>番禺区</option>
                        <option>黄浦区</option>
                        <option>南沙区</option> 
                        <option>白云区</option> 
                        <option>从化区</option> 
                        <option>增城区</option>
                    </select> 
                <a>
                </a> &nbsp;
                <input type="text" name="badd4" placeholder="街道/路/牌号" id="input3"/>&nbsp;
                <span id="input4" style="font-size:13px;color:red;"></span><br/><br/>
                 <lable>&nbsp;&nbsp;负责人姓名：&nbsp;&nbsp;</lable>
                <input type="text" name="charge" value="" id="input5"/>&nbsp;
                <span id="pnamets" style="font-size:13px;color:red;"></span><br/><br/> 
                <lable>&nbsp;&nbsp;电子邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                <input type="text" name="email" value="" id="input6"/>&nbsp;
                <span id="emailts" style="font-size:13px;color:red;"></span><br/><br/> 
                <lable>&nbsp;&nbsp;&nbsp;&nbsp;QQ：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                <input type="text" name="qq" value="" id="input7"/>&nbsp;
                <span id="qqnamets" style="font-size:13px;color:red;"></span><br/><br/> 
                <lable>&nbsp;&nbsp;&nbsp;&nbsp;手机：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                <input type="text" name="phone" value="" id="input8"/>&nbsp;
                <span id="telts" style="font-size:13px;color:red;"></span><br/><br/> 
                <lable>&nbsp;&nbsp;手机验证码：&nbsp;&nbsp;</lable>
                <input type="text" name="inputcode" value="" id="inputcode"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" id="sendcode" value="免费发送验证码" onclick="sendCode()" style="font-size:12px;width:105px;height:26px;color:white;background-color:#4eb0f8;border:none;padding:0;border-radius:4px 4px 4px 4px;" />&nbsp;
                <span id="cts" style="font-size:13px;color:red;"></span><br/><br/>
                <br/><br/>
                <div style="position:relative; left:63px;width:50%">
                <input type="checkbox" id="agreement" value="" onclick="checkAgreement()" style=" background-color:#FF8000">&nbsp;
                <span style="color:#898888;font-size:14px">我已阅读并同意《用户注册协议》</span>
                </div>
                <br/>
                <div style="position:relative; left:10%;width:25%;">
                <input type="submit" value="立即注册" id="submit" style="font-size:15px;width:200px;height:38px;color:white;border:none;padding:0;border-radius:4px 4px 4px 4px;" />
                </div>
                <div style="position:relative;left:60px;top:16px; font-size:13px;color:#9A9A9A;width:50%;">
                您忘了密码了吗？我已有账号，我要<a href="Login.jsp" style=" text-decoration:none;color:#ef8a33">登录</a>
                </div>
            </form>
         </div>
     </div>
    <div style=" position:absolute;left:30%;top:90%;">
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