// JavaScript Document
    var valid=new Array();
    for(var i=0;i<10;i++){
        valid[i]=true;
    }

    function register() { 
		checkComName();
		checkBrandName();
		checkMadeIn();
		checkPrice();
		checkDiscount();
        checkCatName();
        checkParentName();
        checkDiscription();
        checkSaleTime();
		checkStock();
        if(validate()==true){
            return true;
        }else{
            return false;
        }
    }

	function checkComName() {
		var name = document.getElementsByName("comName")[0].value;
		var ts = document.getElementById("check1");
		if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入商品名!";
            valid[0]=false;
			return false;
        }
        if(name.length<2|| name.length>20){
			ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*商品名长度须在2-20之间!";
            valid[0]=false;
			return false; 
		} 
		ts.innerHTML ="";
        valid[0]=true;
		return true; 
	} 
	function checkBrandName(){
        var name = document.getElementsByName("brandName")[0].value;
        var ts = document.getElementById("check2");
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入品牌名!";
            valid[1]=false;
            return false;
        }
        if(name.length<2|| name.length>20){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*品牌名长度须在2-20之间!";
            valid[1]=false;
            return false;
        }
        ts.innerHTML ="";
        valid[1]=true;
        return true;
    }

function checkMadeIn(){
    var name = document.getElementsByName("madeIn")[0].value;
    var ts = document.getElementById("check3");
    if(name.length==0){
        ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入产地!";
        valid[2]=false;
        return false;
    }
    if(name.length<2|| name.length>20){
        ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*长度须在2-20之间!";
        valid[2]=false;
        return false;
    }
    ts.innerHTML ="";
    valid[2]=true;
    return true;
}

function checkPrice() {
    var name = document.getElementsByName("price")[0].value;
    var ts = document.getElementById("check4");
    var reg = /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
    if(name.length==0){
        ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入售价!";
        valid[3]=false;
        return false;
    }
    if(!reg.test(name)){
        ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*售价格式不正确!";
        valid[3]=false;
        return false;
    }
    ts.innerHTML ="";
    valid[3]=true;
    return true;
}

function checkDiscount() {
		var name = document.getElementsByName("discount")[0].value;
		var ts = document.getElementById("check5");
        var reg = /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入折扣!";
            valid[4]=false;
			return false;
        }
        if(!reg.test(name)){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*输入格式不正确!";
            valid[4]=false;
            return false;
        }
        if(parseFloat(name)>1.0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*折扣应在0到1.0之间!";
            valid[4]=false;
            return false;
        }
		ts.innerHTML ="";
        valid[4]=true;
		return true; 
}

function checkCatName(){
        var name = document.getElementsByName("catName")[0].value;
        var ts = document.getElementById("check6");
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入子类别名!";
            valid[5]=false;
            return false;
        }
        if(name.length<2|| name.length>20){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*长度须在2-20之间!";
            valid[5]=false;
            return false;
        }
        ts.innerHTML ="";
        valid[5]=true;
        return true;
}

function checkParentName(){
        var name = document.getElementsByName("parentName")[0].value;
        var ts = document.getElementById("check7");
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入父类别名!";
            valid[6]=false;
            return false;
        }
        if(name.length<2|| name.length>20){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*长度须在2-20之间!";
            valid[6]=false;
            return false;
        }
        ts.innerHTML ="";
        valid[6]=true;
        return true;
}

function checkDiscription(){
        var name = document.getElementsByName("discription")[0].value;
        var ts = document.getElementById("check8");
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入描述!";
            valid[7]=false;
            return false;
        }
        if(name.length<5|| name.length>250){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*长度须在5-250之间!";
            valid[7]=false;
            return false;
        }
        ts.innerHTML ="";
        valid[7]=true;
        return true;
}

function checkSaleTime(){
        var name = document.getElementsByName("saleTime")[0].value;
        var ts = document.getElementById("check9");
        var reg = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入上架时间!";
            valid[8]=false;
            return false;
        }
        if(!reg.test(name)){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*时间格式不正确!";
            valid[8]=false;
            return false;
        }
        ts.innerHTML ="";
        valid[8]=true;
        return true;
}

function checkStock(){
        var name = document.getElementsByName("stock")[0].value;
        var ts = document.getElementById("check10");
        var reg = /^[0-9]*$/;
        if(name.length==0){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*请输入库存数量!";
            valid[9]=false;
            return false;
        }
        if(!reg.test(name)){
            ts.innerHTML ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*数量格式不正确!";
            valid[9]=false;
            return false;
        }
        ts.innerHTML ="";
        valid[9]=true;
        return true;
}

function validate(){
    for(var i=0;i<10;i++){
        if(valid[i]==false){
            return false;
        }
    }
    return true;
}
