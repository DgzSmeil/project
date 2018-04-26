$(function(){
	　var myemail=$('#email').val();
	var emailPat=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
	
	//聚焦失焦input
	$('#name').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("支持中文，字母，数字，'-'，'_'的多种组合");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#pwd').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("建议使用字母、数字和符号两种以上的组合，6-20个字符");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#pwd2').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请再次输入密码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#phone').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("验证完后，可用于登录或找回密码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#email').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请确认您的邮箱地址，方便我们联系");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	//input各种判断
	//用户名：
	$('#name').blur(function(){
		if($('#name').val().length==0){
			$('#name').parent().next("div").text("");
			$('#name').parent().next("div").css("color",'#ccc');
		}else if($('#name').val().length>0 && $('#name').val().length<2){
			$('#name').parent().next("div").text("长度只能在2-20个字符之间");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error"; 
			return;
		}else if($('#name').val().length>=2&& !isNaN($('#name').val())){
			$('#name').parent().next("div").text("用户不能为纯数字");
			document.getElementById( "div1" ).className = "form-group has-error"; 
			$('#name').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div1" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//密码
	$('#pwd').blur(function(){
		if($('#pwd').val().length==0){
			$('#pwd').parent().next("div").text("");
			$('#pwd').parent().next("div").css("color",'#ccc');
		}else if($('#pwd').val().length>0 && $('#pwd').val().length<6){
			$('#pwd').parent().next("div").text("长度只能在6-20个字符之间");
			$('#pwd').parent().next("div").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error"; 
			return;
		}else{
			document.getElementById( "div2" ).className = "form-group has-success"; 
			$('#pwd').parent().next("div").text("");
		}		
	})
//	确认密码
	$('#pwd2').blur(function(){
		if($('#pwd2').val().length==0){
			$('#pwd2').parent().next("div").text("");
			$('#pwd2').parent().next("div").css("color",'#ccc');
		}else if($('#pwd2').val()!=$('#pwd').val()){
			document.getElementById( "div3" ).className = "form-group has-error";
			$('#pwd2').parent().next("div").text("两次密码不匹配");
			$('#pwd2').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div3" ).className = "form-group has-success";
			$('#pwd2').parent().next("div").text("");
		}		
	})
	//邮箱地址
	$('#email').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("");
			$(this).parent().next("div5").css("color",'#ccc');
		}else if($('#email').val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
			$('#email').parent().next("div").text("邮箱格式不正确");
			$('#email').parent().next("div").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error"; 
			return;
		}else{
			$(this).parent().next("div").text("");
		}		
	})
//	手机号
	$('#phone').blur(function(){
		if($('#phone').val().length==0){
			$('#phone').parent().next("div").text("");
			$('#phone').parent().next("div").css("color",'#ccc');
		}else if($('#phone').val().substr(0,3)!=138&&$('#phone').val().substr(0,3)!=130&&$('#phone').val().substr(0,3)!=131
			&&$('#phone').val().substr(0,3)!=132&&$('#phone').val().substr(0,3)!=155
			&&$('#phone').val().substr(0,3)!=156&&$('#phone').val().substr(0,3)!=185&&$('#phone').val().substr(0,3)!=186
			&&$('#phone').val().substr(0,3)!=134&&$('#phone').val().substr(0,3)!=135&&$('#phone').val().substr(0,3)!=136
			&&$('#phone').val().substr(0,3)!=137&&$('#phone').val().substr(0,3)!=139
			&&$('#phone').val().substr(0,3)!=147&&$('#phone').val().substr(0,3)!=150&&$('#phone').val().substr(0,3)!=151
			&&$('#phone').val().substr(0,3)!=152&&$('#phone').val().substr(0,3)!=157
			&&$('#phone').val().substr(0,3)!=159&&$('#phone').val().substr(0,3)!=182
			&&$('#phone').val().substr(0,3)!=187&&$('#phone').val().substr(0,3)!=133
			&&$('#phone').val().substr(0,3)!=153&&$('#phone').val().substr(0,3)!=180&&$('#phone').val().substr(0,3)!=181
			&&$('#phone').val().substr(0,3)!=189&&$('#phone').val().substr(0,3)!=158
			&&$('#phone').val().substr(0,3)!=188||$('#phone').val().length!=11){
			$('#phone').parent().next("div").text("手机号格式不正确");
			$('#phone').parent().next("div").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div4" ).className = "form-group has-succes";
			$('#phone').parent().next("div").text("");
		}		
	})
//// 	验证码
////	 验证码刷新
//	$('code').blur(function(){
//		if($(this).val().length==0){
//			$(this).parent().next().next("div").text("");
//			$(this).parent().next().next("div6").css("color",'#ccc');
//		}else if($(this).val().toUpperCase()!=$("#code").text().toUpperCase()){
//			$(this).parent().next().next("div").text("验证码不正确");
//			$(this).parent().next("div").css("color",'red');
//			document.getElementById( "div6" ).className = "form-group has-error";
//			return;
//		}else{
//			document.getElementById( "div6" ).className = "form-group has-succes";
//			$(this).parent().next().next("div").text("");
//		}		
//	})
//	提交按钮
	$("#submit_btn").click(function(e){	
		
		//用户
		if($("#name").val().length==0){
			$('#name').focus();
			$('#name').parent().next(".tips").text("用户不能为空");
			$('#name').parent().next(".tips").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			e.preventDefault();
			return;
			
		}else if($('#name').val().length>0 && $('#name').val().length<2){
			$('#name').parent().next("div").text("长度只能在2-20个字符之间");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else if($('#name').val().length>=4&& !isNaN($('#name').val())){
			$('#name').parent().next("div").text("用户名不能为纯数字");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else{
			$('#name').parent().next("div").text("");
			document.getElementById( "div1" ).className = "form-group has-success";
		}
		//密码
			if($('#pwd').val().length==0){
				$('#pwd').focus();
				$('#pwd').parent().next(".tips").text("用户不能为空");
				$('#pwd').parent().next(".tips").css("color",'red');
				document.getElementById( "div2" ).className = "form-group has-error";
				e.preventDefault();
			}else if($('#pwd').val().length>0 && $('#pwd').val().length<6){
				$('#pwd').parent().next("div").text("长度只能在6-20个字符之间");
				$('#pwd').parent().next("div").css("color",'red');
				document.getElementById( "div2" ).className = "form-group has-error"; 
				$('#pwd').focus();
				e.preventDefault();
				return;
			}else{
				document.getElementById( "div2" ).className = "form-group has-success"; 
				$('#pwd').parent().next("div").text("");
			}		
//		确认密码
			if($('#pwd2').val().length==0){
				$('#pwd2').focus();
				$('#pwd2').parent().next(".tips").text("确认密码不能为空");
				$('#pwd2').parent().next(".tips").css("color",'red');
				document.getElementById( "div3" ).className = "form-group has-error";
				e.preventDefault();
				return;
			}else if($('#pwd2').val()!=$('#pwd').val()){
				document.getElementById( "div3" ).className = "form-group has-error";
				$('#pwd2').parent().next("div").text("两次密码不匹配");
				$('#pwd2').parent().next("div").css("color",'red');
				$('#pwd2').focus();
				e.preventDefault();
				return;
			}else{
				document.getElementById( "div3" ).className = "form-group has-success";
				$('#pwd2').parent().next("div").text("");
			}		
		
		//手机号码
		if($("#phone").val().length==0){
			$('#phone').focus();
			$('#phone').parent().next(".tips").text("电话号码不能为空");
			$('#phone').parent().next(".tips").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($('#phone').val().substr(0,3)!=138&&$('#phone').val().substr(0,3)!=130&&$('#phone').val().substr(0,3)!=131
				&&$('#phone').val().substr(0,3)!=132&&$('#phone').val().substr(0,3)!=155
				&&$('#phone').val().substr(0,3)!=156&&$('#phone').val().substr(0,3)!=185&&$('#phone').val().substr(0,3)!=186
				&&$('#phone').val().substr(0,3)!=134&&$('#phone').val().substr(0,3)!=135&&$('#phone').val().substr(0,3)!=136
				&&$('#phone').val().substr(0,3)!=137&&$('#phone').val().substr(0,3)!=139
				&&$('#phone').val().substr(0,3)!=147&&$('#phone').val().substr(0,3)!=150&&$('#phone').val().substr(0,3)!=151
				&&$('#phone').val().substr(0,3)!=152&&$('#phone').val().substr(0,3)!=157
				&&$('#phone').val().substr(0,3)!=159&&$('#phone').val().substr(0,3)!=182
				&&$('#phone').val().substr(0,3)!=187&&$('#phone').val().substr(0,3)!=133
				&&$('#phone').val().substr(0,3)!=153&&$('#phone').val().substr(0,3)!=180&&$('#phone').val().substr(0,3)!=181
				&&$('#phone').val().substr(0,3)!=189&&$('#phone').val().substr(0,3)!=158
				&&$('#phone').val().substr(0,3)!=188||$('#phone').val().length!=11){
				$('#phone').parent().next("div").text("手机号格式不正确");
				$('#phone').parent().next("div").css("color",'red');
				document.getElementById( "div4" ).className = "form-group has-error";
				$('#phone').focus();
				e.preventDefault();
				return;
			}else{
				$('#phone').parent().next("div").text("");
				document.getElementById( "div4" ).className = "form-group has-success";
			}
		//邮箱地址
		if($("#email").val().length==0){
			$('#email').focus();
			$('#email').parent().next(".tips").text("邮箱地址不能为空");
			$('#email').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($('#email').val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
			$('#email').parent().next("div").text("邮箱格式不正确");
			$('#email').parent().next("div").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error"; 
			$('#email').focus();
			e.preventDefault();
			return;
		}else{
			$('#email').parent().next("div").text("");
			document.getElementById( "div5" ).className = "form-group has-success";
		}
		
		//yzm
		if($("#code").val().length==0){
			$('#code').focus();
			$('#code').parent().next(".tips").text("验证码不能为空");
			$('#code').parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#code').parent().next("div").text("");
			document.getElementById( "div6" ).className = "form-group has-success";
		}
		
		//协议
		if($("#xieyi")[0].checked){
			$("form1").submit();
			//window.open("userlist.html","_blank");
		}else{					
			
			$("#xieyi").parent().next(".tips").text("请勾选协议");
			$("#xieyi").parent().next(".tips").css("color",'red');
			document.getElementById( "div7" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}
		
		$("form1").submit();
		
	})
		

})
