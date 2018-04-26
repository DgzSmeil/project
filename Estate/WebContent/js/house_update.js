$(function(){
	
	//聚焦失焦input
	$('#name').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入户型名称");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#upload').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请添加图片");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#intro').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("请输入户型介绍");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#area').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入户型面积");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#unit_price').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入您的单价");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	
	
	//input各种判断
	//楼栋名称：
	$('#name').blur(function(){
		if($('#name').val().length==0){
			$('#name').parent().next("div").text("户型名称不能为空");
			$('#name').parent().next("div").css("color",'red');
		}else if($('#name').val().length>0 && $('#name').val().length<2){
			$('#name').parent().next("div").text("长度只能在2-20个字符之间");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error"; 
			return;
		}else if($('#name').val().length>=2&& !isNaN($('#name').val())){
			$('#name').parent().next("div").text("户型名称不能为纯数字");
			document.getElementById( "div1" ).className = "form-group has-error"; 
			$('#name').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div1" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//图片
	$('#upload').blur(function(){
		if($('#upload').val()==0){
			$('#upload').parent().next("div").text("图片不能为空");
			$('#upload').parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div3" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//户型介绍
	$('#intro').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("户型介绍不能为空");
			$(this).parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div4" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
//	面积
	$('#area').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("面积不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($(this).val()<=0){
			$(this).focus();
			$(this).parent().next("div").text("面积不能小于0");
			$(this).parent().next("div").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-success"; 
			return;
		}else{
			document.getElementById( "div5" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
//	总单价数
	$('#unit_price').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("单价不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($(this).val()<=0){
			$(this).focus();
			$(this).parent().next("div").text("总价不能小于0");
			$(this).parent().next("div").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-success"; 
			return;
		}else{
			document.getElementById( "div6" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	
	
//	提交按钮
	$("#btn_house").click(function(e){	
		//公司名
		if($("#name").val().length==0){
			$('#name').focus();
			$('#name').parent().next(".tips").text("户型名称不能为空");
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
			$('#name').parent().next("div").text("户型名称不能为纯数字");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else{
			$('#name').parent().next("div").text("");
			document.getElementById( "div1" ).className = "form-group has-success";
		}
		
		//电梯数
		if($("#intro").val().length==0){
			$('#intro').focus();
			$('#intro').parent().next(".tips").text("户型介绍不能为空");
			$('#intro').parent().next(".tips").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#intro').parent().next("div").text("");
			document.getElementById( "div4" ).className = "form-group has-success";
		}
		//每层用户数
		if($("#area").val().length==0){
			$('#area').focus();
			$('#area').parent().next(".tips").text("面积不能为空");
			$('#area').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			e.preventDefault();
			return;
			
		}else if($('#area').val()<=0){
			$('#area').focus();
			$('#area').parent().next(".tips").text("面积不能小于0");
			$('#area').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-success"; 
			e.preventDefault();
			return;
		}else{
			$('#area').parent().next("div").text("");
			document.getElementById( "div5" ).className = "form-group has-success";
		}
		//总户数
		if($("#unit_price").val().length==0){
			$('#unit_price').focus();
			$('#unit_price').parent().next(".tips").text("单价不能为空");
			$('#unit_price').parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($('#unit_price').val()<=0){
			$('#unit_price').focus();
			$('#unit_price').parent().next(".tips").text("面积不能小于0");
			$('#unit_price').parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-success"; 
			e.preventDefault();
			return;
		}else{
			$('#unit_price').parent().next("div").text("");
			document.getElementById( "div6" ).className = "form-group has-success";
		}
		
	})
	

})
