$(function(){
	
	//聚焦失焦input
	$('#name').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入楼栋名称");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#total_floor').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼栋的总层数");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#total_lift').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("请输入该楼栋的电梯数");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#floor_rooms').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼栋的每层用户数");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#total_room').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼栋的总用户数");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	
	
	//input各种判断
	//楼栋名称：
	$('#name').blur(function(){
		if($('#name').val().length==0){
			$('#name').parent().next("div").text("楼栋名称不能为空");
			$('#name').parent().next("div").css("color",'red');
		}else if($('#name').val().length>0 && $('#name').val().length<2){
			$('#name').parent().next("div").text("长度只能在2-20个字符之间");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error"; 
			return;
		}else if($('#name').val().length>=2&& !isNaN($('#name').val())){
			$('#name').parent().next("div").text("楼栋名称不能为纯数字");
			document.getElementById( "div1" ).className = "form-group has-error"; 
			$('#name').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div1" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//总层数
	$('#total_floor').blur(function(){
		if($('#total_floor').val()==0){
			$('#total_floor').parent().next("div").text("总层数不能为空");
			$('#total_floor').parent().next("div").css("color",'red');
		}else if($('#total_floor').val()<=0){
			$('#total_floor').focus();
			$('#total_floor').parent().next("div").text("总层数不能小于0");
			$('#total_floor').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div2" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//电梯数
	$('#total_lift').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("电梯数不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#total_lift').val()<=0){
			$(this).focus();
			$(this).parent().next("div").text("电梯数不能小于0");
			$(this).parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div3" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
//	每层用户数
	$('#floor_rooms').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("每层用户数不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#floor_rooms').val()<=0){
			$(this).focus();
			$(this).parent().next("div").text("每层用户数不能小于0");
			$(this).parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div4" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
//	总用户数
	$('#total_room').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("总用户数不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#total_room').val()<=0){
			$(this).focus();
			$(this).parent().next("div").text("总用户数不能小于0");
			$(this).parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div5" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	
	
	
	
	
//	提交按钮
	$("#btn_build").click(function(e){	
		//公司名
		if($("#name").val().length==0){
			$('#name').focus();
			$('#name').parent().next(".tips").text("楼栋名称不能为空");
			$('#name').parent().next(".tips").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			e.preventDefault();
			return;
			
		}else if($('#name').val().length>0 && $('#name').val().length<=2){
			$('#name').parent().next("div").text("长度只能在2-20个字符之间");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else if($('#name').val().length>=2&& !isNaN($('#name').val())){
			$('#name').parent().next("div").text("楼栋名称不能为纯数字");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else{
			$('#name').parent().next("div").text("");
			document.getElementById( "div1" ).className = "form-group has-success";
		}
		//总层数
		if($("#total_floor").val().length==0){
			$('#total_floor').focus();
			$('#total_floor').parent().next(".tips").text("总层数不能为空");
			$('#total_floor').parent().next(".tips").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if($('#total_floor').val()<=0){
			$('#total_floor').focus();
			$('#total_floor').parent().next(".tips").text("总层数不能小于0");
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
		}else if($('#total_lift').val()<=0){
			$('#total_lift').focus();
			$('#total_lift').parent().next(".tips").text("电梯数不能小于0");
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
			
		}else if($('#floor_rooms').val()<=0){
			$('#floor_rooms').focus();
			$('#floor_rooms').parent().next(".tips").text("每层用户数不能小于0");
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
		}else if($('#total_room').val()<=0){
			$('#total_room').focus();
			$('#total_room').parent().next(".tips").text("总户数不能小于0");
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
