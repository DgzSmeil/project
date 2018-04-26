$(function(){
	//聚焦失焦input
	 	
	$('#name').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("输入活动标题");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#start_time').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入开始时间");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#end_time').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入结束时间");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#upload').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("请选择活动图片");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#address').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("输入活动地址");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#buildings_id').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("选择活动楼盘");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#content').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("输入活动内容");
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
			$('#name').parent().next("div").text("活动名不能为纯数字");
			document.getElementById( "div1" ).className = "form-group has-error"; 
			$('#name').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div1" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//	开始时间
	$('#start_time').blur(function(){
		if($('#start_time').val().length==0){
			$('#start_time').parent().next("div").text("");
			$('#start_time').parent().next("div").css("color",'#ccc');
		}else{
			$('#start_time').parent().next("div").text("");
			document.getElementById( "div2" ).className = "form-group has-success";
		}		
	})
	//	结束时间
	$('#end_time').blur(function(){
		var oDate1 = new Date($('#start_time').val());
	    var oDate2 = new Date($('#end_time').val());
	    
		if($('#end_time').val().length==0){
			$('#end_time').parent().next("div").text("");
			$('#end_time').parent().next("div").css("color",'#ccc');
			return;
		}else if(oDate2.getTime() < oDate1.getTime()){
			$('#end_time').parent().next("div").text("结束时间不能在开始时间之前");
			$('#end_time').parent().next("div").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error"; 
			return;
		}else{
			document.getElementById( "div3" ).className = "form-group has-success"; 
			$('#end_time').parent().next("div").text("");
		}		
	})
	
	$('#upload').blur(function(){
		if($('#upload').val().length==0){
			$('#upload').parent().next("div").text("");
			$('#upload').parent().next("div").css("color",'#ccc');
			return;
		}else{
			document.getElementById( "div4" ).className = "form-group has-success"; 
			$('#upload').parent().next("div").text("");
		}		
	})
	
	$('#address').blur(function(){
		if($('#address').val().length==0){
			$('#address').parent().next("div").text("");
			$('#address').parent().next("div").css("color",'#ccc');
			return;
		}else{
			document.getElementById( "div5" ).className = "form-group has-success"; 
			$('#address').parent().next("div").text("");
		}		
	})
	
	$('#buildings_id').blur(function(){
		if($('#buildings_id').val().length==0){
			$('#buildings_id').parent().next("div").text("");
			$('#buildings_id').parent().next("div").css("color",'#ccc');
			return;
		}else{
			document.getElementById( "div6" ).className = "form-group has-success"; 
			$('#buildings_id').parent().next("div").text("");
		}		
	})
	
	$('#content').blur(function(){
		if($('#content').val().length==0){
			$('#content').parent().next("div").text("");
			$('#content').parent().next("div").css("color",'#ccc');
			return;
		}else{
			document.getElementById( "div7" ).className = "form-group has-success"; 
			$('#content').parent().next("div").text("");
		}		
	})
	
	
//	提交按钮
	$("#btn_activity").click(function(e){	
		var oDate1 = new Date($('#start_time').val());
	    var oDate2 = new Date($('#end_time').val());
		//活动标题
		if($("#name").val().length==0){
			$('#name').focus();
			$('#name').parent().next(".tips").text("活动标题不能为空");
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
			$('#name').parent().next("div").text("活动标题不能为纯数字");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else{
			$('#name').parent().next("div").text("");
			document.getElementById( "div1" ).className = "form-group has-success";
		}
		
		//活动开始时间
		if($("#start_time").val().length==0){
			$('#start_time').focus();
			$('#start_time').parent().next(".tips").text("活动开始时间不能为空");
			$('#start_time').parent().next(".tips").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
				$('#start_time').parent().next("div").text("");
				document.getElementById( "div2" ).className = "form-group has-success";
		}
		//活动结束时间
		if($("#end_time").val().length==0){
			$('#end_time').focus();
			$('#end_time').parent().next(".tips").text("活动结束时间不能为空");
			$('#end_time').parent().next(".tips").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if(oDate2.getTime() < oDate1.getTime()){
			$('#end_time').focus();
			$('#end_time').parent().next("div").text("结束时间不能在开始时间之前");
			$('#end_time').parent().next("div").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error"; 
			e.preventDefault();
			return;
		}else{
				$('#end_time').parent().next("div").text("");
				document.getElementById( "div3" ).className = "form-group has-success";
		}
		
		//活动图片
		if($("#upload").val().length==0){
			$('#upload').focus();
			$('#upload').parent().next(".tips").text("活动图片不能为空");
			$('#upload').parent().next(".tips").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
				$('#upload').parent().next("div").text("");
				document.getElementById( "div4" ).className = "form-group has-success";
		}
		
		//活动地址
		if($("#address").val().length==0){
			$('#address').focus();
			$('#address').parent().next(".tips").text("活动地址不能为空");
			$('#address').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
				$('#address').parent().next("div").text("");
				document.getElementById( "div5" ).className = "form-group has-success";
		}
		
		//活动楼盘
		if($("#buildings_id").val().length==0){
			$('#buildings_id').focus();
			$('#buildings_id').parent().next(".tips").text("活动楼盘不能为空");
			$('#buildings_id').parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
				$('#buildings_id').parent().next("div").text("");
				document.getElementById( "div6" ).className = "form-group has-success";
		}
		
		
		//活动地址
		if($("#content").val().length==0){
			$('#content').focus();
			$('#content').parent().next(".tips").text("活动内容不能为空");
			$('#content').parent().next(".tips").css("color",'red');
			document.getElementById( "div7" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
				$('#content').parent().next("div").text("");
				document.getElementById( "div7" ).className = "form-group has-success";
		}
		
		$("#form1").submit();
		
	})
	

})
