// JavaScript Document
function login() {
	var pass = false;
	var valid=new Array();
	for(var i=0;i<2;i++){
		valid[i]=false;
	}
	var userName = document.getElementsByName("username")[0].value;	 
	var userPass = document.getElementsByName("password")[0].value;	
    if (userName == "" || userName == null) { 
        document.getElementById("nameCheck").innerHTML = "×";
    }else{
        document.getElementById("nameCheck").innerHTML = "";
        valid[0]=true;
    }
    if (userPass == "" || userPass == null) { 
        document.getElementById("passCheck").innerHTML = "×";
    }else{
        document.getElementById("passCheck").innerHTML = "";
        valid[1]=true;
    }
    if(valid[0]&&valid[1]){
    	pass=true;
    }
    return pass;
}
