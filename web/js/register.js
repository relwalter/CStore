// JavaScript Document
    var code,agree=false;
    var valid=new Array();
    for(var i=0;i<9;i++){
        valid[i]=true;
    }

    function register() { 
		checkUName();
		checkPass();
		checkRPass();
		checkBName();
		checkPName();
		checkEmail(); 
		checkQQ();
		checkPhone();
        checkCode();
        if(validate()==true){
            return true;
        }else{
            return false;
        }
    }

	function checkUName() { 
		var name = document.getElementsByName("username")[0].value;
		var ts = document.getElementById("namets"); 
		if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入用户名!";
            valid[0]=false;
			return false;
        }
        if(name.length<3|| name.length>15){    
			ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*用户名长度须在3-15之间!";
            valid[0]=false;
			return false; 
		} 
		ts.innerHTML ="";
        valid[0]=true;
		return true; 
	} 
	function checkPass(){ 
		var userPass = document.getElementsByName("password")[0].value; 
		var pts = document.getElementById("passts");
        if(userPass.length==0){
            pts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入密码!";
            valid[1]=false;
			return false;
        }
		if(userPass.length<6 || userPass.length >15){    
			pts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*密码长度须在6-15之间!";
            valid[1]=false;
			return false; 
		} 
		pts.innerHTML ="";
        valid[1]=true;
		return true; 
	}

function checkRPass(){
		var userPass = document.getElementsByName("password")[0].value; 
		var userRPass = document.getElementsByName("passwordr")[0].value;
        var prts =  document.getElementById("passrts"); 
		var prtss =  document.getElementById("passrtss");
        if(userRPass.length==0){
            prts.innerHTML="";
            prtss.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请再次输入密码!";
            valid[2]=false;
            return false;
        }
        if(userRPass.length<6&&userRPass.length>0){
            prts.innerHTML="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*密码长度须在6-15之间!";
            valid[2]=false;
            return false;
        }
		if (userPass != userRPass) {
            prts.innerHTML="";
			prtss.innerHTML="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*两次密码输入不一致!";
            valid[2]=false;
			return false; 
		} 
		prtss.innerHTML ="";
        valid[2]=true;
		return true; 
}

function checkBName() {
		var name = document.getElementsByName("bName")[0].value;
		var ts = document.getElementById("bsnamets");
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入商业名称!";
            valid[3]=false;
			return false;
        }
		if(name.length<3|| name.length>10)     
		{    
			ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*商业名称长度须在3-10之间!";
            valid[3]=false;
			return false; 
		} 
		ts.innerHTML ="";
        valid[3]=true;
		return true; 
}

function checkPName() {
		var name = document.getElementsByName("charge")[0].value;
		var ts = document.getElementById("pnamets"); 
		var reg = /[a-zA-Z]/;
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入负责人姓名!";
            valid[4]=false;
			return false;
        }
		if(name.length<2|| name.length>4)     
		{    
			ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*负责人姓名长度须在2-4之间!";
            valid[4]=false;
			return false; 
		} 
		ts.innerHTML ="";
        valid[4]=true;
		return true; 
}

function checkEmail(){
		var userEmail = document.getElementsByName("email")[0].value;
		var ets = document.getElementById("emailts");
		var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(userEmail.length==0){
            ets.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入电子邮箱地址!";
            valid[5]=false;
			return false;
        }
		if(!reg.test(userEmail)){ 
			ets.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*邮箱格式不正确!";
            valid[5]=false;
			return false; 
		}  
		ets.innerHTML ="";
        valid[5]=true;
		return true; 
}

function checkQQ() {
		var name = document.getElementsByName("qq")[0].value;   
		var ts = document.getElementById("qqnamets"); 
		var reg = /^[1-9][0-9]{4,}$/;
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入QQ号码!";
            valid[6]=false;
			return false;
        }
		if(!reg.test(name)){    
			ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*QQ格式不正确!";
            valid[6]=false;
			return false; 
		} 
		ts.innerHTML ="";
        valid[6]=true;
		return true; 
}

function checkPhone() {
		var name = document.getElementsByName("phone")[0].value;
		var ts = document.getElementById("telts");
		var reg = /^[1]\d{10}$/;
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入手机号码!";
            valid[7]=false;
			return false;
        }
		if(!reg.test(name)) {    
			ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*手机格式不正确!";
            valid[7]=false;
			ts.style.color="red"; 
			return false; 
		} 
		ts.innerHTML ="";
        valid[7]=true;
		return true; 
}

function sendCode(){
        var sleep = 60, interval = null,flag=true;
        var btn = document.getElementById ('sendcode');
        var input = document.getElementById('inputcode');
            if (!interval&&flag){
                codeGenerator();
                alert("验证码已发送，请留意您的手机短信！\n本次获取的验证码是："+code+"。");
                input.value="";
                btn.style.backgroundColor = '';
                btn.style.cursor = "default";
                btn.disabled = "disabled";
                btn.value = "发送验证码 (" + sleep-- + ")";
                interval = setInterval (function (){
                    if (sleep == 0){
                        if (!!interval){
                            clearInterval (interval);
                            interval = null;
                            sleep = 60;
                            btn.style.cursor = "pointer";
                            btn.removeAttribute ('disabled');
                            btn.value = "免费发送验证码";
                            btn.style.backgroundColor = '#4eb0f8';
                        }
                        return false;
                    }
                    btn.value = "发送验证码 (" + sleep-- + ")";
                }, 1000);
            }
        return true;
}

    function checkCode(){
        var input = document.getElementsByName("inputcode")[0].value;   
		var cts = document.getElementById("cts");
		var reg = /\d{5}$/;
        if(input.length==0){
            cts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入验证码!";
            valid[8]=false;
			return false;
        }
		if(!reg.test(input)) {    
			cts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*验证码格式不正确!";
            valid[8]=false;
			cts.style.color="red"; 
			return false; 
		}
        if(input!=code){
            cts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*验证码不正确!";
            valid[8]=false;
			cts.style.color="red"; 
			return false;
        }
        cts.innerHTML ="";
        valid[8]=true;
		return true; 
    }

    function checkAgreement(){
        if(!agree){
            agree=true;
        }else{
            agree=false;
        }
        var btn = document.getElementById ('submit');
        if (!agree){
            btn.style.backgroundColor = '';
            btn.style.cursor = "default";
            btn.disabled = "disabled";
        }else{
            btn.style.backgroundColor = '#fa9b04';
            btn.style.cursor = "auto";
        }
    }

    function codeGenerator(){
        code = "";   
        var codeLength = 6;    
        var random = new Array(0,1,2,3,4,5,6,7,8,9);
        for(var i = 0; i < codeLength; i++) { 
            var index = Math.floor(Math.random()*10);  
            code += random[index];
        }
    }

    function validate(){
        for(var i=0;i<9;i++){
            if(valid[i]==false){
                return false;
            }
        }
        return true;
    }
        
//	function checkUName() { 
//		var name = document.getElementsByName("username")[0].value;   
//		var ts = document.getElementById("namets"); 
//		if(name.length<3|| name.length>15)     
//		{    
//			ts.innerHTML ="&nbsp;*用户名长度须在3-15之间!"; 
//			ts.style.color="red"; 
//			return false; 
//		} 
//		return true; 
//	} 
//	function checkPass(){ 
//		var userPass = document.getElementsByName("password")[0].value; 
//		  
//		var pts = document.getElementById("passts"); 
//		  
//		if(userPass.length<6 || userPass.length >15)   
//		{    
//			pts.innerHTML ="&nbsp;*密码长度须在6-15之间!"; 
//			pts.style.color="red"; 
//			return false; 
//		} 
//		return true; 
//	} 
//	function checkRPass(){ 
//		var userPass = document.getElementsByName("password")[0].value; 
//		var userRPass = document.getElementsByName("passwordr")[0].value;
//		var prts =  document.getElementById("passrts"); 
//		if (userPass != userRPass) { 
//			prts.innerHTML="&nbsp;*两次密码输入不一致!"; 
//			prts.style.color="red"; 
//			return false; 
//		} 
//		return true; 
//	}
//	function checkBName() { 
//		var name = document.getElementsByName("businessname")[0].value;   
//		var ts = document.getElementById("bsnamets"); 
//		if(name.length<3|| name.length>10)     
//		{    
//			ts.innerHTML ="&nbsp;*商业名称长度须在3-10之间!"; 
//			ts.style.color="red"; 
//			return false; 
//		} 
//		return true; 
//	} 
//	function checkPName() { 
//		var name = document.getElementsByName("peoplename")[0].value;   
//		var ts = document.getElementById("pnamets"); 
//		var reg = /[a-zA-Z]/;
//		if(name.length<2|| name.length>4)     
//		{    
//			ts.innerHTML ="&nbsp;*负责人姓名长度须在2-4之间!"; 
//			ts.style.color="red"; 
//			return false; 
//		} 
//		ts.innerHTML ='&nbsp;*负责人姓名可以使用！'; 
//		ts.style.color='green'; 
//		return true; 
//	}
//	function checkEmail(){ 
//		var userEmail = document.getElementsByName("email")[0].value;
//		var ets = document.getElementById("emailts");
//		var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
//		if(!reg.test(userEmail)){ 
//			ets.innerHTML ="&nbsp;*邮箱格式不正确!"; 
//			ets.style.color="red"; 
//			return false; 
//		}  
//		return true; 
//	} 
//	function checkQQ() { 
//		var name = document.getElementsByName("qq")[0].value;   
//		var ts = document.getElementById("qqnamets"); 
//		var reg = /^[1-9][0-9]{4,}$/; 
//		if(!reg.test(name))    
//		{    
//			ts.innerHTML ="&nbsp;*QQ格式不正确!"; 
//			ts.style.color="red"; 
//			return false; 
//		} 
//		return true; 
//	}
//	function checkPhone() { 
//		var name = document.getElementsByName("tel")[0].value;   
//		var ts = document.getElementById("telts");
//		var reg = /^[1]\d{10}$/; 
//		if(!reg.test(name)) {    
//			ts.innerHTML ="&nbsp;*手机格式不正确!"; 
//			ts.style.color="red"; 
//			return false; 
//		} 
//		return true; 
//	}