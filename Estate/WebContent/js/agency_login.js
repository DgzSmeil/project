$(function(){
	
	//聚焦失焦input
	$('#email').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入邮箱");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#pwd').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入密码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#phone').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("请输入手机号码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#vcode').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入验证码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	
	
	
	//input各种判断
	//邮箱地址：
	$('#email').blur(function(){
		if($('#email').val().length==0){
			$('#email').parent().next("div").text("邮箱地址不能为空");
			$('#email').parent().next("div").css("color",'red');
		}else{
			document.getElementById( "email" ).className = "form-group has-success"; 
			$(this).parent().next("email").text("");
		}		
	})
	//密码
	$('#pwd').blur(function(){
		if($('#pwd').val()==0){
			$('#pwd').parent().next("div").text("密码不能为空");
			$('#pwd').parent().next("div").css("color",'red');
		}else{
			document.getElementById( "pwd" ).className = "form-group has-success"; 
			$(this).parent().next("pwd").text("");
		}		
	})
	//电梯数
	$('#phone').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("手机号码不能为空");
			$(this).parent().next("div").css("color",'red');
		}else{
			document.getElementById( "phone" ).className = "form-group has-success"; 
			$(this).parent().next("phone").text("");
		}		
	})
//	每层用户数
	$('#vcode').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("验证码不能为空");
			$(this).parent().next("div").css("color",'red');
		}else{
			document.getElementById( "vcode" ).className = "form-group has-success"; 
			$(this).parent().next("vcode").text("");
		}		
	})
	
//	提交按钮
	$("#btn").click(function(e){	
		//公司名
		if($("#email").val().length==0){
			$('#email').focus();
			$('#email').parent().next(".tips").text("楼栋名称不能为空");
			$('#email').parent().next(".tips").css("color",'red');
			document.getElementById( "email" ).className = "form-group has-error";
			e.preventDefault();
			return;
			
		}else if($('#pwd').val().length>0 && $('#name').val().length<2){
			$('#pwd').parent().next("div").text("长度只能在2-20个字符之间");
			$('#pwd').parent().next("div").css("color",'red');
			document.getElementById( "pwd" ).className = "form-group has-error";
			$('#pwd').focus();
			e.preventDefault();
			return;
		}else if($('#phone').val().length>=4&& !isNaN($('#name').val())){
			$('#phone').parent().next("div").text("楼栋名称不能为纯数字");
			$('#phone').parent().next("div").css("color",'red');
			document.getElementById( "phone" ).className = "form-group has-error";
			$('#phone').focus();
			e.preventDefault();
			return;
		}else{
			$('#phone').parent().next("div").text("");
			document.getElementById( "phone" ).className = "form-group has-success";
		}
		//总层数
		if($("#total_floor").val().length==0){
			$('#total_floor').focus();
			$('#total_floor').parent().next(".tips").text("总层数不能为空");
			$('#total_floor').parent().next(".tips").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#total_floor').parent().next("div").text("");
			document.getElementById( "div2" ).className = "form-group has-success";
		}
		//电梯数
		if($("#total_lift").val().length==0){
			$('#total_lift').focus();
			$('#total_lift').parent().next(".tips").text("电梯数不能为空");
			$('#total_lift').parent().next(".tips").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#total_lift').parent().next("div").text("");
			document.getElementById( "div3" ).className = "form-group has-success";
		}
		//每层用户数
		if($("#floor_rooms").val().length==0){
			$('#floor_rooms').focus();
			$('#floor_rooms').parent().next(".tips").text("每层用户数不能为空");
			$('#floor_rooms').parent().next(".tips").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			e.preventDefault();
			return;
			
		}else{
			$('#floor_rooms').parent().next("div").text("");
			document.getElementById( "div4" ).className = "form-group has-success";
		}
		//总户数
		if($("#total_room").val().length==0){
			$('#total_room').focus();
			$('#total_room').parent().next(".tips").text("总户数不能为空");
			$('#total_room').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#total_room').parent().next("div").text("");
			document.getElementById( "div5" ).className = "form-group has-success";
		}
		
	})
	

})
