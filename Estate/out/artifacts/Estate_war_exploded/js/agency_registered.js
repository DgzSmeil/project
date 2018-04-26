$(function(){
	//聚焦失焦input
	　　var myemail=$('#email').val();
	var emailPat=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
	$('#name').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("公司名称与营业执照名称保持一致");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#email').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("输入正确有效的邮箱地址");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#password').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("建议使用字母、数字和符号两种以上的组合，6-20个字符");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#password2').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请再次输入密码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#leader').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("输入申请人的真实姓名");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#tel').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("输入申请人公司的电话号码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}else if($(this).val().length!=7){
			$(this).parent().next("div").text("请输入正确的电话格式");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#address').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入申请公司地址");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#upload').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请选择公司商标图片");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#phone').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入手机号码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#code').focus(function(){	
		if($(this).val().length==0){
			document.getElementById("codes").style.display="block";
			$("#codes").css("color",'#1CAF9A');
			$("#codes").html("请输入验证码");
		}
	})
	$('#intro').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入公司简介");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	//input各种判断
	//公司名称名：
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
			$('#name').parent().next("div").text("公司名名不能为纯数字");
			document.getElementById( "div1" ).className = "form-group has-error"; 
			$('#name').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div1" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//邮箱地址
	$('#email').blur(function(){
		if($('#email').val().length==0){
			$('#email').parent().next("div").text("");
			$('#email').parent().next("div").css("color",'#ccc');
		}else if($('#email').val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
			$('#email').parent().next("div").text("邮箱格式不正确");
			$('#email').parent().next("div").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error"; 
			return;
		}else{
			document.getElementById( "div2" ).className = "form-group has-success"; 
			$('#email').parent().next("div").text("");
		}		
	})
	//密码
	$('#password').blur(function(){
		if($('#password').val().length==0){
			$('#password').parent().next("div").text("");
			$('#password').parent().next("div").css("color",'#ccc');
		}else if($('#password').val().length>0 && $('#password').val().length<6){
			$('#password').parent().next("div").text("长度只能在6-20个字符之间");
			$('#password').parent().next("div").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error"; 
			return;
		}else{
			document.getElementById( "div3" ).className = "form-group has-success"; 
			$('#password').parent().next("div").text("");
		}		
	})
	
//	确认密码
	$('#password2').blur(function(){
		if($('#password2').val().length==0){
			$('#password2').parent().next("div").text("");
			$('#password2').parent().next("div").css("color",'#ccc');
		}else if($('#password2').val()!=$('#password').val()){
			document.getElementById( "div4" ).className = "form-group has-error";
			$('#password2').parent().next("div").text("两次密码不匹配");
			$('#password2').parent().next("div").css("color",'red');
			return;
		}else if($('#password2').val().length>0 && $('#password2').val().length<6){
			$('#password2').parent().next("div").text("长度只能在6-20个字符之间");
			$('#password2').parent().next("div").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error"; 
			return;
		}else{
			document.getElementById( "div4" ).className = "form-group has-success";
			$('#password2').parent().next("div").text("");
		}		
	})
	//申请人姓名
	$('#leader').blur(function(){
		if($('#leader').val().length==0){
			$('#leader').parent().next("div").text("");
			$('#leader').parent().next("div").css("color",'#ccc');
		}else if($('#leader').val().length>0 && $('#leader').val().length<2){
			document.getElementById( "div5" ).className = "form-group has-error";
			$('#leader').parent().next("div").text("名字的长度不能小于2个");
			$('#leader').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div5" ).className = "form-group has-success";
			$('#leader').parent().next("div").text("");
		}		
	})
	//固定电话
	$('#tel').blur(function(){
		if($('#tel').val().length==0){
			$('#tel').parent().next("div").text("");
			$('#tel').parent().next("div").css("color",'#ccc');
		}else if(isNaN($('#tel').val())){
			document.getElementById( "div6" ).className = "form-group has-error";
			$('#tel').parent().next("div").text("电话号码只能为为纯数字");
			$('#tel').parent().next("div").css("color",'red');
			return;
		}else if($('#tel').val().length!=7){
			document.getElementById( "div6" ).className = "form-group has-error";	
			$('#tel').parent().next("div").text("电话号码只能为7位");
			$('#tel').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div6" ).className = "form-group has-success";
			$('#tel').parent().next("div").text("");
		}		
	})
	//公司地址
	$('#address').blur(function(){
		if($('#address').val().length==0){
			$('#address').parent().next("div").text("");
			$('#address').parent().next("div").css("color",'#ccc');
		}else{
			document.getElementById( "div7" ).className = "form-group has-success";
			$('#address').parent().next("div").text("");
		}		
	})
	//公司商标图片
	$('#upload').blur(function(){
		if($('#upload').val().length==0){
			$('#upload').parent().next("div").text("");
			$('#upload').parent().next("div").css("color",'#ccc');
			return;
		}else{
			document.getElementById( "div8" ).className = "form-group has-success";
			$('#upload').parent().next("p").next("div").text("");
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
			document.getElementById( "div9" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div9" ).className = "form-group has-succes";
			$('#phone').parent().next("div").text("");
		}		
	})
//	验证码验证
//	$('#code').blur(function(){
//		if($('#code').val().length==0){
////			$('#vcode').parent().next().next("div").text("");
////			$('#vcode').parent().next().next("div").css("color",'#ccc');
//			document.getElementById("codes").style.display="none";
//			$("#codes").html("");
//			return;
//		}else{
//			$("#codes").html("");
//		}		
//	})
//	提交按钮
	$("#btn_agency").click(function(e){	
		 checkyzm();
		//公司名
		if($("#name").val().length==0){
			$('#name').focus();
			$('#name').parent().next(".tips").text("公司名称不能为空");
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
		}else if($('#name').val().length>=1&& !isNaN($('#name').val())){
			$('#name').parent().next("div").text("公司名不能为纯数字");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else{
			$('#name').parent().next("div").text("");
			document.getElementById( "div1" ).className = "form-group has-success";
		}
		//邮箱地址
		if($("#email").val().length==0){
			$('#email').focus();
			$('#email').parent().next(".tips").text("邮箱地址不能为空");
			$('#email').parent().next(".tips").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($('#email').val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
			$('#email').focus();
			$('#email').parent().next(".tips").text("邮箱格式不正确");
			$('#email').parent().next(".tips").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error"; 
			e.preventDefault();
			return;
		}else{
			$('#email').parent().next("div").text("");
			document.getElementById( "div2" ).className = "form-group has-success";
		}
		//密码
		if($("#password").val().length==0){
			$('#password').focus();
			$('#password').parent().next(".tips").text("密码不能为空");
			$('#password').parent().next(".tips").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($('#password').val().length>0 && $('#password').val().length<6){
			$('#password').parent().next("div").text("长度只能在6-20个字符之间");
			$('#password').parent().next("div").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error";
			$('#password').focus();
			e.preventDefault();
			return;
		}else{
			$('#password').parent().next("div").text("");
			document.getElementById( "div3" ).className = "form-group has-success";
		}
		//确认密码
		if($("#password2").val().length==0){
			$('#password2').focus();
			$('#password2').parent().next(".tips").text("确认密码不能为空");
			$('#password2').parent().next(".tips").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			e.preventDefault();
			return;
			
		}else if($('#password2').val()!=$('#password').val()){
			$('#password2').parent().next("div").text("两次密码不匹配");
			$('#password2').parent().next("div").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			$('#password2').focus();
			e.preventDefault();
			return;
		}else{
			$('#password2').parent().next("div").text("");
			document.getElementById( "div4" ).className = "form-group has-success";
		}
		//申请人姓名
		if($("#leader").val().length==0){
			$('#leader').focus();
			$('#leader').parent().next(".tips").text("申请人不能为空");
			$('#leader').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($("#leader").val().length>0 && $("#leader").val().length<2){
			$('#leader').focus();
			$("#leader").parent().next("div").text("名字的长度不能小于2个");
			$("#leader").parent().next("div").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#leader').parent().next("div").text("");
			document.getElementById( "div5" ).className = "form-group has-success";
		}
		//电话
		if($("#tel").val().length==0){
			$('#tel').focus();
			$('#tel').parent().next(".tips").text("固定电话不能为空");
			$('#tel').parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($("#tel").val().length!=7){
			$('#tel').focus();
			$('#tel').parent().next(".tips").text("固定电话必须为7位");
			$('#tel').parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if(isNaN($("#tel").val())){
			$('#tel').focus();
			$("#tel").parent().next("div").text("电话号码只能为为纯数字");
			$("#tel").parent().next("div").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#tel').parent().next("div").text("");
			document.getElementById( "div6" ).className = "form-group has-success";
		}
		//公司地址
		if($("#address").val().length==0){
			$('#address').focus();
			$('#address').parent().next(".tips").text("公司地址不能为空");
			$('#address').parent().next(".tips").css("color",'red');
			document.getElementById( "div7" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($("#address").val().length>0 && $("#address").val().length<2){
			$('#address').focus();
			$("#address").parent().next("div").text("名字的长度不能小于2个");
			$("#address").parent().next("div").css("color",'red');
			document.getElementById( "div7" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#address').parent().next("div").text("");
			document.getElementById( "div7" ).className = "form-group has-success";
		}
		
		//商标图片
		if($("#upload").val().length==0){
			$('#upload').focus();
			$('#upload').parent().next(".tips").text("请选择商标图片");
			$('#upload').parent().next(".tips").css("color",'red');
			document.getElementById( "div8" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#upload').parent().next("div").text("");
			document.getElementById( "div8" ).className = "form-group has-success";
		}
		
		
		//手机号码
		if($("#phone").val().length==0){
			$('#phone').focus();
			$('#phone').parent().next(".tips").text("手机号码不能为空");
			$('#phone').parent().next(".tips").css("color",'red');
			document.getElementById( "div9" ).className = "form-group has-error";
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
				document.getElementById( "div9" ).className = "form-group has-error";
				$('#phone').focus();
				e.preventDefault();
				return;
			}else{
				$('#phone').parent().next("div").text("");
				document.getElementById( "div9" ).className = "form-group has-success";
			}
		$("form1").submit();
		
		//商标图片
		if($('#code').val().length==0){
			$('#code').focus();
			$('#code').parent().next(".tips").text("请选择商标图片");
			$('#code').parent().next(".tips").css("color",'red');
			document.getElementById( "div8" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#code').parent().next("div").text("");
			document.getElementById( "div10" ).className = "form-group has-success";
		}
	})
	
	

})
