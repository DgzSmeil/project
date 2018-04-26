$(function(){
	//聚焦失焦input
	　　var myemail=$('#email').val();
	var emailPat=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
	$('#name').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("输入员工的姓名");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#phone').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入手机号码");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#email').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("输入正确有效的邮箱地址");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#basic_salary').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("输入员工薪资");
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
			$('#name').parent().next("div").text("员工名不能为纯数字");
			document.getElementById( "div1" ).className = "form-group has-error"; 
			$('#name').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div1" ).className = "form-group has-success"; 
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
			document.getElementById( "div2" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div2" ).className = "form-group has-succes";
			$('#phone').parent().next("div").text("");
		}		
	})
	//邮箱地址
	$('#email').blur(function(){
		if($('#email').val().length==0){
			$('#email').parent().next("div").text("");
			$('#email').parent().next("div").css("color",'#ccc');
			return;
		}else if($('#email').val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
			$('#email').parent().next("div").text("邮箱格式不正确");
			$('#email').parent().next("div").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error"; 
			return;
		}else{
			document.getElementById( "div3" ).className = "form-group has-success"; 
			$('#email').parent().next("div").text("");
		}		
	})
	//公司商标图片
	$('#basic_salary').blur(function(){
		if($('#basic_salary').val().length==0){
			$('#basic_salary').parent().next("div").text("");
			$('#basic_salary').parent().next("div").css("color",'#ccc');
			return;
		}else if($('#basic_salary').val()<=0){
			$('#basic_salary').focus();
			$('#basic_salary').parent().next("div").text("员工薪资不能小于0");
			$('#basic_salary').parent().next("div").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div4" ).className = "form-group has-success";
			$('#basic_salary').parent().next("div").text("");
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
	$("#btn_employee").click(function(e){	
		//公司名
		if($("#name").val().length==0){
			$('#name').focus();
			$('#name').parent().next(".tips").text("员工名称不能为空");
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
			$('#name').parent().next("div").text("员工名不能为纯数字");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else{
			$('#name').parent().next("div").text("");
			document.getElementById( "div1" ).className = "form-group has-success";
		}
		
		//手机号码
		if($("#phone").val().length==0){
			$('#phone').focus();
			$('#phone').parent().next(".tips").text("手机号码不能为空");
			$('#phone').parent().next(".tips").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error";
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
				document.getElementById( "div2" ).className = "form-group has-error";
				$('#phone').focus();
				e.preventDefault();
				return;
			}else{
				$('#phone').parent().next("div").text("");
				document.getElementById( "div2" ).className = "form-group has-success";
			}
	
		
		//邮箱地址
		if($("#email").val().length==0){
			$('#email').focus();
			$('#email').parent().next(".tips").text("邮箱地址不能为空");
			$('#email').parent().next(".tips").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($('#email').val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
			$('#email').focus();
			$('#email').parent().next(".tips").text("邮箱地址不能为空");
			$('#email').parent().next(".tips").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error"; 
			e.preventDefault();
			return;
		}else{
			$('#email').parent().next("div").text("");
			document.getElementById( "div3" ).className = "form-group has-success";
		}
		
		//商标图片
		if($("#basic_salary").val().length==0){
			$('#basic_salary').focus();
			$('#basic_salary').parent().next(".tips").text("员工薪资不能为空");
			$('#basic_salary').parent().next(".tips").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($('#basic_salary').val()<=0){
			$('#basic_salary').focus();
			$('#basic_salary').parent().next(".tips").text("薪资不能小于0");
			$('#basic_salary').parent().next(".tips").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#basic_salary').parent().next("div").text("");
			document.getElementById( "div4" ).className = "form-group has-success";
		}
		
		//楼盘地址
		if($("#building_id").val().length==0){
			$('#building_id').focus();
			$('#building_id').parent().next(".tips").text("楼盘不能为空");
			$('#building_id').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#building_id').parent().next("div").text("");
			document.getElementById( "div5" ).className = "form-group has-success";
		}
		
		
		$("#form1").submit();
		
		//商标图片
	})
	

})
