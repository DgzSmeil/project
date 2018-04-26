var http_request=false;

//初始化，指定处理函数，发送请求的函数
function send_request(url){
	http_request=false;
	//开始初始化XMLHttpRequest对象
	if(window.XMLHttpRequest){		//Mozilla浏览器
		http_request=new XMLHttpRequest();
		if(http_request.overrideMimeType){		//设置MIME类别
			http_request.overrideMimeType("text/xml");
		}
	}else if(window.ActiveXObject){			//IE浏览器
  		try{
  			http_request=new ActiveXObject("Msxml2.XMLHttp");
  		}catch(e){
   			try{
   				http_request=new ActiveXobject("Microsoft.XMLHttp");
   			}catch(e){}
  		}
	}
 	if(!http_request){		//异常，创建对象实例失败
  		window.alert("创建XMLHttp对象失败!");
  		return false;
 	}
 	http_request.onreadystatechange = processrequest;
	//确定发送请求方式，URL，及是否同步执行下段代码
    http_request.open("GET",url,true);
 	http_request.send(null);
	
}

//处理返回信息的函数
function processrequest(){
	if(http_request.readyState==4){		//判断对象状态
		if(http_request.status==200){	
		//信息已成功返回，开始处理信息
		   var stringArray = http_request.responseText.split("||");
		    document.getElementById(reobj).innerHTML=stringArray[0];
		   if(http_request.responseText.indexOf("font_green12")==-1){
				 if(stringArray[1]==1 && typeof(stringArray[2]) == "undefined"){
				     document.getElementById("usernameexist").value=1;
				  }
			     	 if(stringArray[1] == 1 && typeof(stringArray[2]) != "undefined"){
					  document.getElementById("emailexist").value=1;
				  }
				// if(stringArray[1]==1){
				//    document.getElementById("usernameexist").value=1;
				// }
				// if(stringArray[1]==2){
				//    document.getElementById("emailexist").value=1;
				// }
				  if(stringArray[1]==3){
				     document.getElementById("yumingexist").value=1;
				  }
				  if(stringArray[1]==4){
				     document.getElementById("yanzhengexsit").value=1;
				  }
				  if(stringArray[1]==5){
				     document.getElementById("nowpassok").value=1;
				  }
		   }else{
			 	 if(stringArray[1]==2 && typeof(stringArray[2]) == "undefined"){
				    document.getElementById("usernameexist").value=0;
				 }
				 if(stringArray[1]==2 && typeof(stringArray[2]) != "undefined"){
				    document.getElementById("emailexist").value=0;
				 }
			    	// if(stringArray[1]==1){
				//     document.getElementById("usernameexist").value=0;
				//  }
				//  if(stringArray[1]==2){
				//     document.getElementById("emailexist").value=0;
				//  }
				  if(stringArray[1]==3){
				     document.getElementById("yumingexist").value=0;
				  }
				  if(stringArray[1]==4){
				     document.getElementById("yanzhengexsit").value=0;
				  }
				  if(stringArray[1]==5){
				     document.getElementById("nowpassok").value=0;
				  }
			}
			
  		}
	}
}

//计算字符长度
function checkStrLen(string){
	var str,Num = 0;
	for(var i=0;i<string.length;i++){
		str = string.substring(i,i+1);
		if(str<="~"){  //判断是否双字节
   			Num+=1;
		}else{
   			Num+=3;
 		}
	}
 	return Num;
}

//验证username
function usercheck(obj){
	var userAgent = navigator.userAgent.toLowerCase();
    var is_opera = userAgent.indexOf('opera') != -1 && opera.version();
    var is_moz = (navigator.product == 'Gecko') && userAgent.substr(userAgent.indexOf('firefox') + 8, 3);
    var isie = (userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5, 3);
	var is_ie=0;
	if(isie) is_ie=1;
	var uservalue=document.getElementById("username").value;
	
	
	var userlen=checkStrLen(uservalue);
	var nostr="51cto|51ct0|root|妈的|傻逼|王八|admin|管理|bbs|blog|group";
	//var ustr="51cto云特卖";
	var pattern = new RegExp(nostr,"gi");
	var userformat=/^(\w|[\u4E00-\u9FA5])+$/
	if(uservalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>用户名不能为空。</span>";
		/*f.username.focus();*/
		return false;
 	}else if(userlen<4){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>用户名不能小于4个字符。</span>";
   		
   		return false;
 	}else if(userlen>15){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>用户名不能大于15个字符或5个汉字。</span>";
   		
   		return false;
 	}else if(!userformat.test(uservalue)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>用户名不能使用特殊字符。</span>";
   		
   		return false;
	}else if(pattern.test(uservalue) /*&& ustr!=uservalue*/ ){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>用户名包含敏感字符或被系统屏蔽。</span>";
   		
   		return false;
	}else{
		document.getElementById(obj).innerHTML="正在读取数据...";
		reobj=obj;
		
		send_request('checkuser.php?username='+uservalue+"&is_ie="+is_ie);
		
	}
}

//验证blogname
function blognamecheck(obj){
	
	var blognamevalue=document.getElementById("blogname").value;
	var uidvalue=document.getElementById("uid").value;
	var blognamelen=checkStrLen(blognamevalue);
	 var patrn=/^[a-z0-9]{5,15}$/; 
	var nostr="51cto|51ct0|root|妈的|傻逼|王八|admin|管理|bbs|blog|group";
	var pattern = new RegExp(nostr,"gi");
	
	if(blognamevalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名不能为空。</span>";
		
		return false;
 	}else if(blognamelen<5){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名不能小于5个字符!</span>";
   		
   		return false;
 	}else if(blognamelen>15){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名不能大于15个字符。</span>";
   		
   		return false;
 	}else if(!patrn.test(blognamevalue)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名应该是5-15个字符长度小写字母/数字。</span>";
   		
   		return false;
 	}else if(pattern.exec(blognamevalue)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名包含敏感字符或被系统屏蔽。</span>";
   		
   		return false;
	}else{
		document.getElementById(obj).innerHTML="正在读取数据...";
		reobj=obj;
		send_request('checkblogname.php?blogname='+blognamevalue+'&uid='+uidvalue);
		
	}
}

//验证numsone
function numsonecheck(obj){

	var numsonevalue=document.getElementById("numsone").value;
	
	
	if(numsonevalue>30 || numsonevalue<1){
		document.getElementById(obj).innerHTML="<span class='font_red12'>评论显示数量应填写1－30之间的数字。</span>";
		/*f.username.focus();*/
		return false;
 	}else{
		document.getElementById(obj).innerHTML="<span class='font_green12'>评论显示数量填写正确。</span>";
	}
}

//验证numsone
function numszerocheck(obj){
	
	var numszerovalue=document.getElementById("numszero").value;
	if(numszerovalue>25 || numszerovalue<1){
		document.getElementById(obj).innerHTML="<span class='font_red12'>文章显示数量应填写1－25之间的数字。</span>";
		/*f.username.focus();*/
		return false;
 	}else{
		document.getElementById(obj).innerHTML="<span class='font_green12'>文章显示数量填写正确。</span>";
	}
}

//验证blogtitle
function blogtitlecheck(obj){
	
	var blogtitle=document.getElementById("blogtitle").value;
	var titlelen=checkStrLen(blogtitle);
	var nostr="51cto|51ct0|root|妈的|傻逼|王八|admin|管理|bbs|blog|group";
	var pattern = new RegExp(nostr,"gi");
	var userformat=/^.*[\~\!\#\$\%\^\&\*\(\)\+\=\`\{\}\[\]\:\"\|\;\'\\\<\>\?\,\.\/\x20].*$/
	if(blogtitle==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>博客标题不能为空。</span>";
		/*f.username.focus();*/
		return false;
 	}else if(titlelen<1){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>博客标题不能小于1个字符。</span>";
   		
   		return false;
 	}else if(titlelen>24){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>博客标题不能大于24个字符。</span>";
   		
   		return false;
 	}else if(userformat.test(blogtitle)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>博客标题不能使用特殊字符。</span>";
   		
   		return false;
	}else if(pattern.test(blogtitle)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>博客标题包含敏感字符或被系统屏蔽。</span>";
   		
   		return false;
	}else{
		document.getElementById(obj).innerHTML="<span class='font_green12'>博客标题填写正确。</span>";
	}
}

//验证blogname2
function blognamechecktwo(obj){
	
	var blognamevalue=document.getElementById("blogname").value;
	var uidvalue=document.getElementById("uid").value;
	var blognamelen=checkStrLen(blognamevalue);
	 var patrn=/^[a-z0-9]{5,15}$/; 
	var nostr="51cto|51ct0|root|妈的|傻逼|王八|admin|管理|bbs|blog|group";
	var pattern = new RegExp(nostr,"gi");
	
	if(blognamevalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名不能为空。</span>";
		
		return false;
 	}else if(blognamelen<5){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名不能小于5个字符!</span>";
   		return false;
 	}else if(blognamelen>15){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名不能大于15个字符。</span>";
   		
   		return false;
 	}else if(!patrn.test(blognamevalue)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名应该是5-15个字符长度小写字母/数字。</span>";
   		
   		return false;
 	}else if(pattern.exec(blognamevalue)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>个性域名包含敏感字符或被系统屏蔽。</span>";
   		
   		return false;
	}else{
		document.getElementById(obj).innerHTML="正在读取数据...";
		reobj=obj;
		send_request('checkblogname.php?blogname='+blognamevalue+'&uid='+uidvalue);
		
	}
}


//验证password
function pwdcheck(obj){
	
 	var pwdvalue=document.getElementById("userpwd").value;
 	if(pwdvalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>密码不能为空。</span>";
   		/*f.userpwd.focus();*/
   		return false;
 	}else if(pwdvalue.length<6){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>密码长度不能小于6个字符。</span>";
   		
   		return false;
 	}else if(pwdvalue.length>20){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>密码长度不能大于20个字符。</span>";
   		//f.userpwd.focus();
   		return false;
 	}else{
   		document.getElementById(obj).innerHTML="<span class='font_green12'>密码填写正确。为了您的账号安全，强烈建议您使用安全强度高的密码：8-20个字符，包含数字、大小写字母、符号，并且尽量没有规律。</span>";
 	}
}

//验证password
function chk1(obj,uid){
	
 	var pwdvalue=document.getElementById("nowpwd").value;
 	if(pwdvalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>密码不能为空。</span>";
   		/*f.userpwd.focus();*/
   		return false;
 	}else if(pwdvalue.length<6 || pwdvalue.length>20){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>原密码长度应该为6-20个字符。。</span>";
   		
   		return false;
 	}else{
   		document.getElementById(obj).innerHTML="正在验证原密码...";
		reobj=obj;
		send_request('checkpass.php?pass='+pwdvalue+'&uid='+uid);

 	}
}

//验证password
function chk2(obj){
	
 	var pwdvalue=document.getElementById("password").value;
 	if(pwdvalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>新密码不能为空。</span>";
   		/*f.userpwd.focus();*/
   		return false;
 	}else if(pwdvalue.length<6 || pwdvalue.length>20){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>新密码长度应该为6-20个字符。。</span>";
   		
   		return false;
 	}else{
   		document.getElementById(obj).innerHTML="<span class='font_green12'>新密码输入正确。</span>";
 	}
}

//验证password
function chk3(obj){
	
 	var pwdvalue=document.getElementById("password2").value;
 	if(pwdvalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>请再输入一次新密码。</span>";
   		/*f.userpwd.focus();*/
   		return false;
 	}else if(document.getElementById("password").value!=document.getElementById("password2").value){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>两次输入的新密码不同。</span>";
   		return false;
 	}else{
   		document.getElementById(obj).innerHTML="<span class='font_green12'>新密码输入正确。</span>";
 	}
}

//验证password2
function pwdrecheck(obj){
	
	var repwd=document.getElementById("password2").value;
	if(repwd==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>请再输入一次密码。</span>";
		/*f.password2.focus();*/
		return false;
	}else if(document.getElementById("userpwd").value!=document.getElementById("password2").value){
		document.getElementById(obj).innerHTML="<span class='font_red12'>两次输入的密码不同。</span>";
		//f.password2.focus();
		return false;
	}else{
   		document.getElementById(obj).innerHTML="<span class='font_green12'>密码输入正确。</span>";
	}
}

//验证email
function mailcheck(obj){
	
 	var mailvalue=document.getElementById("email").value;
	var email_arr = ["qq.com","vip.qq.com","gmail.com","126.com","163.com","139.com","hotmail.com","sohu.com","sina.com","yeah.net","vip.sina.com"];
	var loping = mailvalue.indexOf("@");
	var email_ext = mailvalue.substr(loping+1);
 	var pamail=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/
	var email_arr_full = email_arr;
	email_arr_full.push('51cto.com');
	if(mailvalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>邮箱不能为空。</span>";
   		/*f.email.focus();*/
   		return false;
 	}else if(!pamail.test(mailvalue)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>请填写有效邮箱</span>";
   		//f.email.focus();
   		return false;
 	}else if($.inArray(email_ext, email_arr_full) == -1){
	   document.getElementById(obj).innerHTML="<span class='font_red12'>该邮箱非常用邮箱，请您更换163、sina、qq、gmail等常用邮箱注册。</span>";
	   return false;
	}else{
   		document.getElementById(obj).innerHTML="正在读取数据...";
		reobj=obj;
		send_request('checkemails.php?email='+mailvalue);
		
 	}
}

//验证email
function mailchecktwo(obj){
	
 	var mailvalue=document.getElementById("email").value;
	var oldmailvalue=document.getElementById("oldemail").value;
 	var pamail=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/
 	if(mailvalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>邮箱不能为空。</span>";
   		/*f.email.focus();*/
   		return false;
 	}else if(!pamail.test(mailvalue)){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>请填写有效邮箱。</span>";
   		//f.email.focus();
   		return false;
 	}else if(oldmailvalue==mailvalue){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>新邮箱不能与原邮箱一致。</span>";
   		//f.email.focus();
   		return false;
 	}else{
   		document.getElementById(obj).innerHTML="正在读取数据...";
		reobj=obj;
		send_request('checkemails.php?email='+mailvalue);
		
 	}
}

function ckabout(obj){
	
 	var aboutvalue=f.about.value;
   		document.getElementById(obj).innerHTML="";
		send_request('checkiframe.php?about='+aboutvalue);
		reobj=obj;
}



//验证blogname
function blogcheck(obj){
	
 	var blogvalue=document.getElementById("blogname").value;
 	var bloglen=checkStrLen(blogvalue);
 	if(blogvalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>请输入博客名称。</span>";
   		/*f.blogname.focus();*/
   		return false;
 	}else if(bloglen>50){
   		document.getElementById(obj).innerHTML="<span class='font_red12'>博客名称不能超过50字符。</span>";
   		//f.blogname.focus();
   		return false;
 	}else{
   		document.getElementById(obj).innerHTML="<span class='font_green12'>博客名称填写正确。</span>";
 	}
}

//验证full_name
function fnamecheck(obj){
	
 	var fnavalue=document.getElementById("full_name").value;
 	var fnalen=checkStrLen(fnavalue);
 	var nostr="51cto|51ct0|root|妈的|傻逼|王八|admin|管理|bbs|blog|group";
	var pattern = new RegExp(nostr,"gi");
 	if(fnalen>16){
   		document.getElementById(obj).innerHTML="<span class='font_3'>姓名不能超过50字符!</span>";
   		//f.full_name.focus();
   		return false;
 	}else if(pattern.exec(fnavalue)){
   		document.getElementById(obj).innerHTML="<span class='font_3'>姓名包含敏感字符!</span>";
   		f.full_name.focus();
   		return false;
 	}else{
   		document.getElementById(obj).innerHTML="";
 	}
}

//验证验证码
function codecheck(obj){
	
 	var codevalue = document.getElementById("code").value;
 	if(codevalue==""){
		document.getElementById(obj).innerHTML="<span class='font_red12'>请输入验证码!</span>";
   		/*f.email.focus();*/
   		return false;
 	}else{
   		document.getElementById(obj).innerHTML="正在读取数据...";
		reobj = obj;
		//codevalue = base64encode(utf8ToUnicode(codevalue));
		send_request('checkyanzheng.php?code='+codevalue);
 	}
}

