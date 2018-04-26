$(function(){
        $("#captchaImage").click();
		$('.hidmail li').live("click",function(){
			var txt = $(this).text();
			$('#registerName').val(txt);
			$('.hidmail').hide();
			checkEmail("registerName",$("#registerName").val());
			$(".registerName").blur(function(){
				$(".hidmail").hide();
			})
		});
		$(".form-group input").focus(function(){
			var type = $(this).attr("name");
			var mess = "";
			if($(this).val() ==''){
				switch(type){
					case 'registerName':
						mess ="<span class='font-grgy'>请您输入QQ、163、126、gmail等常用邮箱，或者11位手机号。</span>";
						break;
					case 'checkUser':
						mess ="<span class='font-grgy'>请输入4-15个字符长度的中文/字母/数字，请勿使用特殊字符 。</span>";
						break;
					case 'password':
						mess ="<span class='font-grgy'>强烈建议密码长度为8-20个字符，包含数字、大小写字母和符号，且尽量没有规律。</span>";
						break;
				}
				showMess(type,mess);
			}


		})
	});
	$(document).click(function(){
		$(".hidmail").hide();
	});
	function checkReisterType(name){
		var regValue = $("#"+name).val();
		if(!regValue){
			$(".regr").hide();	$(".hidmail").hide();
			 showMess(name,"<span class='font-grgy'>请您输入QQ、163、126、gmail等常用邮箱，或者11位手机号。</span>"); return false;
		}
		if(regValue.indexOf("@") != -1){
			regValue = regValue.split("@")[0];
			$(".hidmail").show();
			checkEmail(name,regValue);
			hideMess("verify_code");
			$("#verify_code").val("");
			$(".noncode").hide();
		}else if(/(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/.test(regValue)){
			checkMob(name,regValue);
			$(".hidmail").hide();
			hideMess("codev");
			$(".noncode").show();
			//$("#codev").val("");
			return false;
		}else{
			$(".hidmail").hide();
			$(".regr").hide();
			showMess(name,"请您输有效的邮箱，或者手机号。"); return false;
		}
	}

	function checkReisterEmail(name){
		var regValue = $("#"+name).val();
		if(!regValue){
			$(".regr").hide();
			showMess(name,"请您输入邮箱，或者手机号。"); return false;
		}
		if(regValue.indexOf("@") != -1){
			regValue = regValue.split("@")[0];
			$(".hidmail").show();
			checkEmail(name,regValue);
		}else if(/(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/.test(regValue)){
			checkMob(name,regValue);
			$(".hidmail").hide();
			return false;
		}else{
			showMess(name,"请您输有效的邮箱，或者手机号。"); return false;
		}
	}

	function checkMob(name,regValue){
		var patten = /(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
		if(!patten.test(regValue)){
			showMess(name,"请输入正确的手机号"); return false;
		}
		showCode("mob");
		//$("#codev").val("");
		$.post("/user/check-mobile",{'mobile':regValue},function (sta){
			var classN = "";
			var flag =0;
			if(sta.error == 0){
				classN = 'font_green12';
				flag =1;
			}
			showMess(name,'<span class='+classN+'>'+sta.msg+'</span>');
			$("#regType").val("mob");
			$(".loading").hide();
			$("#re_"+name).val(flag);
		})
	}

	function checkEmail(name,regValue){
		showCode("ema");
		var emailformat = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		//var email_arr = ["@qq.com","@vip.qq.com","@gmail.com","@126.com","@163.com","@139.com","@hotmail.com","@sohu.com","@51cto.com","@nokia.com","@51cto.com","@sina.com","@sina.cn","@vip.sina.com","@redisfans.com","@dongeejiao.com"];
		var email_arr = ["@qq.com","@vip.qq.com","@126.com","@163.com","@139.com","@hotmail.com","@sohu.com","@sina.com","@sina.cn","@vip.sina.com"];
		var sina_arr = [];
		var regValue = $("#"+name).val();
		var suffix = "",suffixp="",emailNew =new Array(),prefix="";
		var html="";
		suffix = regValue.substr(regValue.indexOf("@"));
		prefix = regValue.substr(0,regValue.indexOf("@"));
		suffixp = suffix+".*";
		var p = new RegExp(suffixp);
		for(var c in email_arr){
			if(p.test(email_arr[c])){
				emailNew.push(email_arr[c]);
			}
		}
		if(emailNew.length)
		{
			html += "<ul>";
			for(var d in emailNew){
				html +='<li><span class="strEma">'+prefix+'</span>'+emailNew[d]+'</li>';
			}
			html += "</ul>";
			html += "<p>请使用以上邮箱进行注册</p> ";
		}
		$(".hidmail").html(html);
		if(regValue.indexOf("@") == -1)
		{
			showMess(name,"请输入邮箱"); return false;
		}else if(!emailformat.test(regValue))
		{
			showMess(name,"请输入正确的邮箱格式"); return false;
		}

		var email_arr_full = email_arr;
		email_arr_full.push('@51cto.com');
		if($.inArray(suffix,sina_arr) >= 0){
			showMess(name,"sina邮箱暂时无法使用,请尝试其它邮箱帐号,给你带来的不便,敬请谅解。");
			return false;
		}	
		else if($.inArray(suffix,email_arr_full) == -1){
			showMess(name,"该邮箱非常用邮箱，请您更换QQ、163、126、gmail等常用邮箱。");
			return false;
		}
		$(".loading").show();
		$(".hidmail").hide();
		$.get('/user/check-email?email='+regValue,function (data){
			data = data.split("||")[0];
			showMess(name,data);
			$(".loading").hide();
			$("#regType").val("email");
			$("#re_"+name).val(1);
		})
	}

	function showCode(type){
		$(".regr").show();
		if(type == "mob"){
			$("#sms_verify_code").show();
			$("#sms_verify_code_wrapper").show();
			return false;
		}
		$("#sms_verify_code_wrapper").show();
		$("#sms_verify_code").hide();
	}


	//验证验证码
	function checkVerify(obj){
		var codevalue = $("#"+obj).val();
		var classN = "";
		var falg = false;
		if(codevalue==""){
			showMess(obj,"请输入验证码!");
			return false;
		}else{
			$.get('/user/check-verify?code='+codevalue,function(data){
				var msg = "验证码输入不正确!";
				if(data == 1){
					classN = 'font_green12';
					msg = "输入正确";
					falg = true;
				}
				showMess(obj,'<span class='+classN+'>'+msg+'</span>');
				if(falg){
					$("#re_"+obj).val(1);
				}
				return falg;
			});
		}
	}

	function checkCode(name,mob){
		var regCode = "";
		regCode = $("#"+name).val();

		var regValue = $("#"+mob).val();

		if(!regCode ){
			showMess(name,"请输入短信验证码") ; return false;
		}
	 	$.post("/user/check-mobile-code",{'mobile':regValue,'type':'checkcode','code':regCode},function (sta){
			var classN = "";
			var msg = "短信验证码，验证无效";
			var falg = false
			if(sta.error == 0){
				classN = 'font_green12';
				msg = "输入正确";
				falg = true;
			}
			showMess(name,'<span class='+classN+'>'+msg+'</span>');
			if(falg){
				$("#re_"+name).val(1);
			}
			return falg;
		})
	}

	//验证username
	function checkIsUser(obj){
		var userAgent = navigator.userAgent.toLowerCase();
		var is_opera = userAgent.indexOf('opera') != -1 && opera.version();
		var is_moz = (navigator.product == 'Gecko') && userAgent.substr(userAgent.indexOf('firefox') + 8, 3);
		var isie = (userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5, 3);
		var is_ie=0;
		var fun_is_ie = isIE();
		if(isie || fun_is_ie) is_ie=1;
		var uservalue=document.getElementById("username").value;
		var userlen=checkStrLen(uservalue);
		var nostr="51cto|51ct0|root|妈的|傻逼|王八|admin|管理|bbs|blog|group";
		//var ustr="51cto云特卖";
		var pattern = new RegExp(nostr,"gi");
		var userformat=/^(\w|[\u4E00-\u9FA5])+$/;
		var mess="";
		if(uservalue==""){
			showMess(obj,"请输入用户名");
			/*f.username.focus();*/
			return false;
		}else if(userlen<4){
			showMess(obj,"用户名不能小于4个字符。");
			return false;
		}else if(userlen>15){
			showMess(obj,"用户名不能大于15个字符或5个汉字。");
			return false;
		}else if(!userformat.test(uservalue)){
			showMess(obj,"用户名不能使用特殊字符。");
			return false;
		}else if(pattern.test(uservalue) /*&& ustr!=uservalue*/ ){
			showMess(obj,"用户名包含敏感字符或被系统屏蔽。");
			return false;
		}else{
			$.get('/user/check-user?username='+uservalue+"&is_ie="+is_ie,function(data){
				mess = data.split("||")[0];
				data = data.split("||")[1];
				if(data != 2){
					showMess(obj,mess);
					return false;
				}
				showMess(obj,mess);
				$("#re_"+obj).val(1);
			});
		}
	}

	//验证password
	function pwdcheck(obj){
		var mess="";
		var pwdvalue=document.getElementById("userpwd").value;
		if (pwdvalue.indexOf(" ") != -1) {
			showMess(obj,"不支持空格，请输入6-20个字符，包含数字、大小写字母和符号（空格除外）");
			return false;
		}
		if(/.*[\u4e00-\u9fa5]+.*$/.test(pwdvalue)) { 
			showMess(obj,"不支持汉字，请输入6-20个字符，包含数字、大小写字母和符号（空格除外）");
			return false; 
		} 
		if(pwdvalue==""){
			showMess(obj,"请输入密码。");
			return false;
		}else if(pwdvalue.length<6){
			showMess(obj,"密码长度不能小于6个字符。");
			return false;
		}else if(pwdvalue.length>20){
			showMess(obj,"密码长度不能大于20个字符。");
			return false;
		}else{
			mess = "<span class='font_green12'>输入正确</span>";
			showMess(obj,mess);
			$("#re_"+obj).val(1);
		}
	}


	var wait=90;
	var clearTime;
	function time(o) {
		if (wait == 0) {
			o.removeAttribute("disabled");
			o.value="获取验证码";
			wait = 90;
		} else {
			o.setAttribute("disabled", true);
			o.value="重新发送" + wait + "s";
			wait--;
			clearTime =  setTimeout(function() {
			time(o)
			}, 1000)
		}
	}
	//密码强度
	//判断输入密码的类型
	function CharMode(iN) {
		
		if (iN >= 48 && iN <= 57) //数字
			return 1;
		if (iN >= 65 && iN <= 90) //大写
			return 2;
		if (iN >= 97 && iN <= 122) //小写
			return 4;
		else return 8;
	} //bitTotal函数
	//计算密码模式
	function bitTotal(num) {
		modes = 0;
		for (i = 0; i < 4; i++) {
			if (num & 1) modes++;
			num >>>= 1;
		}
		return modes;
	} //返回强度级别
	function checkStrong(sPW) {		
		if (sPW.length <= 4) return 0; //密码太短
		Modes = 0;		
		for (i = 0; i < sPW.length; i++) { //密码模式
			Modes |= CharMode(sPW.charCodeAt(i));			
		}
		
		return bitTotal(Modes);
	} //显示颜色
	function pwStrength(pwd) {
		pwdcheck("password");
		var pwdvalue=document.getElementById("userpwd").value;
		if (pwdvalue.indexOf(" ") != -1) {
			 poiely(1);
		}else if(/.*[\u4e00-\u9fa5]+.*$/.test(pwdvalue)){
			poiely(2); 
		}else{
			if (pwd == null || pwd == '' || pwd.length < 6 || pwd.length >20) {
				document.getElementById("strength_L").style.display = "none";
				document.getElementById("strength_M").style.display = "none";
				document.getElementById("strength_H").style.display = "none";
			} else {
				hideMess("password");
				document.getElementById("strength_L").style.display = "none";
				document.getElementById("strength_M").style.display = "none";
				document.getElementById("strength_H").style.display = "none";
				S_level = checkStrong(pwd);

				switch (S_level) {
					case 0:
						document.getElementById("strength_L").style.display = "block";
						break;
					case 1:
						document.getElementById("strength_L").style.display = "block";
						break;
					case 2:
						 document.getElementById("strength_M").style.display = "block";
						 break;
					case 3:
						document.getElementById("strength_H").style.display = "block";
						break;
					default:;
				}
			}
			return;
		}
	}

   function poiely(kid){
	   document.getElementById("strength_L").style.display = "none";
	   document.getElementById("strength_M").style.display = "none";
	   document.getElementById("strength_H").style.display = "none";
	   if(kid=='1'){
		   showMess(obj,"不支持空格，请输入6-20个字符，包含数字、大小写字母和符号（空格除外）");
	   }else if(kid=='2'){
		   showMess(obj,"不支持汉字，请输入6-20个字符，包含数字、大小写字母和符号（空格除外）");
	   }
	   return false;
   }
	function sendCode(obj,name){
		if($("#re_registerName").val() != 1){
			return false;
		}
		if($("#re_codev").val() != 1){
			return false;
		}
		var regValue = $("#"+name).val();
		//刷新token

		$.ajax({
			type : "post",
			url :"/user/flush-token",
			data : "",
			dataType: "json",
			async : false,
			success : function(data){
				//赋值给全局变量;
				 window.token = data.token;
			}
		});
		var token = $("#token").val();
		var verify = $("#codev").val();
		if(!window.token){
			return false;
		}
		$.post("/user/check-mobile-code",{'mobile':regValue,'type':'regcode','token':window.token,'verify':verify},function (data){
			if(data.msg == "err"){
				showMess("verify_code","非法请求");
				return false;
			}
			$("#token").val(data.msg);
			time(obj);
		})

	}
function check_provision(){
	checkbox = $("[name='checkbox']").attr("checked");
	
}
	function check_reg(){
        var islowIe8 = false;
		var ref_url = $("#reback").val();
        if(navigator.userAgent.indexOf("MSIE")>0){
            if(navigator.userAgent.indexOf("MSIE 6.0")>0 || navigator.userAgent.indexOf("MSIE 7.0")>0 ||(navigator.userAgent.indexOf("MSIE 9.0")>0 && !window.innerWidth)){
                islowIe8 = true;
            }
        }
        if (islowIe8 == false && typeof(Countly.add_event) != "undefined") {
			Countly.add_event({'key': 'RegisterButtonClick'})
		}
		var checkbox="";
		checkbox = $("[name='checkbox']").attr("checked");

		checkReisterType("registerName");
		if($("#re_registerName").val() !=1){
			return false;
		}
		var codename="";
		var name = "",url="";
		if($("#regType").val() == "email" ){
			checkVerify("codev","");
			name = "codev";
			url = "/user/email-success?reback="+ref_url;
		}else{
			checkVerify("codev","");
			checkCode("verify_code","registerName");
			codename = "codev";
			name = "verify_code";
			url = "/user/mobile-success?reback="+ref_url;
		}
		if(codename && $("#re_"+codename).val() !=1){
			return false;
		}
		if($("#re_"+name).val() !=1){
			return false;
		}
		checkIsUser("checkUser");
		if($("#re_checkUser").val() !=1){
			return false;
		}
		pwdcheck('password');
		if($("#re_password").val() !=1){
				return false;
		}
		return true;
		var registerName = $("[name='registerName']").val();
		var checkUser = $("[name='checkUser']").val();
		var password = $("[name='password']").val();
		var codev = $("[name='codev']").val();
		var verify_code = $("[name='verify_code']").val();
		var mess = "";
		$.post('/user/do-register',{'registerName':registerName,'checkUser':checkUser,'password':password,'codev':codev,'verify_code':verify_code,'locationType':true},function (data){
			if(data == '-33'){
				mess = '对不起，手机注册未成功，请重新点击注册';
			}else if(data == "-8"){
				mess = "用户名已存在";
			}else if(data == "-11"){
				mess = "值为空";
			}else if(data == "-4"){
				mess = "邮箱不正确";
			}else if(data == "-5"){
				mess = "邮箱存在";
			}else if(data == "1001"){
				clearTimeout(clearTime);
			     window.location = url;
			     return false;
			}else if(data == "1008"){
				poiely(1);
			}else if(data == "1009"){
				poiely(2);
			}else if(data == "2000"){
				alert("注册太频繁，请稍后再试");
			}
			showMess(name,mess);
			return false;
		})
		return true;
	}

	function isIE() { //ie?
		if (!!window.ActiveXObject || "ActiveXObject" in window)
			return true;
		else
			return false;
	}