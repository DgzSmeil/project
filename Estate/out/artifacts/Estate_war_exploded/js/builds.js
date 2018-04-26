$(function(){		
	
	//聚焦失焦input
	$('#name').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入楼盘名称");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#upload').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请选择楼盘封面");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#district').focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("请选择楼盘区域");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	$('#address').focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请选择楼盘地址");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#floor_area').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的占地面积");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#building_area').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼的建筑面积");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#house_type').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请选择该楼盘的房源类型");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#male').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请选择该楼盘的建筑类型");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#avg_price').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的均价");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#open_date').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请选择该楼盘的开盘时间");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#total_rooms').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的总套数");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#reception_address').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的接待地址");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#tel').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的售楼电话");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#green_ratio').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的绿化率");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#property_company').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘物业公司");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#reception_address').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的接待地址");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#property_fee').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的物业费");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#car_station').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的车位数");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#traffic').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的交通状况");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#equipments').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的周边设置");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	$('#intro').focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next("div").text("请输入该楼盘的介绍");
			$(this).parent().next("div").css("color",'#1CAF9A');
		}
	})
	
	
	
	//input各种判断
	//楼盘名称：
	$('#name').blur(function(){
		if($('#name').val().length==0){
			$('#name').parent().next("div").text("楼盘名称不能为空");
			$('#name').parent().next("div").css("color",'red');
		}else if($('#name').val().length>0 && $('#name').val().length<2){
			$('#name').parent().next("div").text("长度只能在2-20个字符之间");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error"; 
			return;
		}else if($('#name').val().length>=2&& !isNaN($('#name').val())){
			$('#name').parent().next("div").text("楼盘名称不能为纯数字");
			document.getElementById( "div1" ).className = "form-group has-error"; 
			$('#name').parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div1" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//楼盘图片
	$('#upload').blur(function(){
		if($('#upload').val()==0){
			$('#upload').parent().next("div").text("楼盘图片不能为空");
			$('#upload').parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div2" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//楼盘区域
	$('#district').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘区域不能为空");
			$(this).parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div3" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
//	楼盘地址
	$('#address').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘地址不能为空");
			$(this).parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div4" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
//	占地面积
	$('#floor_area').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘占地面积不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#floor_area').val()<=0){
			$('#floor_area').focus();
			$('#floor_area').parent().next(".tips").text("占地面积不能小于0");
			$('#floor_area').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div5" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//建筑面积
	$('#building_area').blur(function(){
		var	floor_area =$("#floor_area").val();
		var	building_area =$("#building_area").val();
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘建筑面积不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if(building_area>floor_area){
			$(this).focus();
			$(this).parent().next(".tips").text("建筑面积不能比占地面积大");
			$(this).parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			return;
		}else if($('#building_area').val()<=0){
			$(this).focus();
			$(this).parent().next(".tips").text("建筑面积不能小于0");
			$(this).parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div6" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//户型类型
	$('#house_type').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘房屋类型不能为空");
			$(this).parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div7" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	
	$('#male').blur(function(){
		if($('#male').val().length==0){
			$('#male').parent().next("div").text("楼盘建筑类型不能为空");
			$('#male').parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div8" ).className = "form-group has-success"; 
			$('#male').parent().next("div").text("");
		}		
	})
	
	$('#avg_price').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘均价不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#avg_price').val()<=0){
			$('#avg_price').focus();
			$('#avg_price').parent().next(".tips").text("楼盘均价不能小于0");
			$('#avg_price').parent().next(".tips").css("color",'red');
			document.getElementById( "div9" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			document.getElementById( "div9" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	
	$('#open_date').blur(function(){
		var oDate1 = new Date($('#open_date').val());
	    var oDate2 = new Date();
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘开盘时间不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if(oDate2.getTime() > oDate1.getTime()){
			$(this).parent().next("div").text("开盘时间不能在当前时间之前");
			$(this).parent().next("div").css("color",'red');
			document.getElementById( "div10" ).className = "form-group has-error"; 
			return;
		}else{
			document.getElementById( "div10" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	
	$('#total_rooms').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘总套数不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#total_rooms').val()<=0){
			$('#total_rooms').focus();
			$('#total_rooms').parent().next(".tips").text("楼盘总套数不能小于0");
			$('#total_rooms').parent().next(".tips").css("color",'red');
			document.getElementById( "div11" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div11" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	
	$('#reception_address').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘接待地址不能为空");
			$(this).parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div12" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
		//售楼电话
	$('#tel').blur(function(){
		if($('#tel').val().length==0){
			$(this).parent().next("div").text("楼盘售楼电话不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if(isNaN($('#tel').val())){
			document.getElementById( "div13" ).className = "form-group has-error";
			$(this).parent().next("div").text("电话号码只能为为纯数字");
			$(this).parent().next("div").css("color",'red');
			return;
		}else if($('#tel').val().length!=7){
			document.getElementById( "div13" ).className = "form-group has-error";	
			$(this).parent().next("div").text("电话号码只能为7位");
			$(this).parent().next("div").css("color",'red');
			return;
		}else{
			document.getElementById( "div13" ).className = "form-group has-success";
			$('#tel').parent().next("div").text("");
		}		
	})
		//绿化率
	$('#green_ratio').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘绿化率不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#green_ratio').val()<=0){
			$('#green_ratio').focus();
			$('#green_ratio').parent().next(".tips").text("绿化率不能小于0");
			$('#green_ratio').parent().next(".tips").css("color",'red');
			document.getElementById( "div14" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div14" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
		//容积率
	$('#plot_ratio').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘容积率不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#plot_ratio').val()<=0){
			$('#plot_ratio').focus();
			$('#plot_ratio').parent().next(".tips").text("楼盘容积率不能小于0");
			$('#plot_ratio').parent().next(".tips").css("color",'red');
			document.getElementById( "div15" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div15" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
		//物业公司
	$('#property_company').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘物业公司不能为空");
			$(this).parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div16" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	//物业费
	$('#property_fee').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘物业费不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#property_fee').val()<=0){
			$('#property_fee').focus();
			$('#property_fee').parent().next(".tips").text("楼盘物业费不能小于0");
			$('#property_fee').parent().next(".tips").css("color",'red');
			document.getElementById( "div17" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div17" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	
	$('#car_station').blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("楼盘车位数不能为空");
			$(this).parent().next("div").css("color",'red');
		}else if($('#car_station').val()<0){
			$('#car_station').focus();
			$('#car_station').parent().next(".tips").text("楼盘车位数不能小于0");
			$('#car_station').parent().next(".tips").css("color",'red');
			document.getElementById( "div18" ).className = "form-group has-error";
			return;
		}else{
			document.getElementById( "div18" ).className = "form-group has-success"; 
			$(this).parent().next("div").text("");
		}		
	})
	
	$('#traffic').blur(function(){
		if($("#traffic").val()==0){
			$('#traffic').parent().next("div").text("楼盘交通状况不能为空");
			$('#traffic').parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div19" ).className = "form-group has-success"; 
			$('#traffic').parent().next("div").text("");
		}		
	})
	
	$('#equipments').blur(function(){
		if($('#equipments').val().length==0){
			$('#equipments').parent().next("div").text("楼盘周边设施不能为空");
			$('#equipments').parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div20" ).className = "form-group has-success"; 
			$('#equipments').parent().next("div").text("");
		}		
	})
	
	$('#intro').blur(function(){
		if($('#intro').val().length==0){
			$('#intro').parent().next("div").text("楼盘介绍不能为空");
			$('#intro').parent().next("div").css("color",'red');
		}else{
			document.getElementById( "div21" ).className = "form-group has-success"; 
			$('#intro').parent().next("div").text("");
		}		
	})
	
	
	
	
	
	
	
	
	
	
	
	
//	提交按钮
	$("#btn_agency").click(function(e){	
		//楼盘名
		var	floor_area =$("#floor_area").val();
		var	building_area =$("#building_area").val();
		var oDate1 = new Date($('#open_date').val());
	    var oDate2 = new Date();
		if($("#name").val().length==0){
			$('#name').focus();
			$('#name').parent().next(".tips").text("楼盘名称不能为空");
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
			$('#name').parent().next("div").text("楼盘名称不能为纯数字");
			$('#name').parent().next("div").css("color",'red');
			document.getElementById( "div1" ).className = "form-group has-error";
			$('#name').focus();
			e.preventDefault();
			return;
		}else{
			$('#name').parent().next("div").text("");
			document.getElementById( "div1" ).className = "form-group has-success";
		}
		//楼盘封面
		if($("#upload").val().length==0){
			 swal("楼盘封面为空", "无效的输入", "error");
			$('#upload').focus();
			$('#upload').parent().next("div").text("楼盘封面不能为空");
			$('#upload').parent().next("div").css("color",'red');
			document.getElementById( "div2" ).className = "form-group has-error";
			e.preventDefault();
			
			return;
		}else{
			$('#upload').parent().next("div").text("");
			document.getElementById( "div2" ).className = "form-group has-success";
		}
		//楼盘区域
		if($("#district").val().length==0){
			$('#district').focus();
			$('#district').parent().next(".tips").text("楼盘区域不能为空");
			$('#district').parent().next(".tips").css("color",'red');
			document.getElementById( "div3" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#district').parent().next("div").text("");
			document.getElementById( "div3" ).className = "form-group has-success";
		}
		//楼盘地址
		if($("#address").val().length==0){
			$('#address').focus();
			$('#address').parent().next(".tips").text("楼盘地址不能为空");
			$('#address').parent().next(".tips").css("color",'red');
			document.getElementById( "div4" ).className = "form-group has-error";
			e.preventDefault();
			return;
			
		}else{
			$('#address').parent().next("div").text("");
			document.getElementById( "div4" ).className = "form-group has-success";
		}
		//占地面积
		if($("#floor_area").val().length==0){
			$('#floor_area').focus();
			$('#floor_area').parent().next(".tips").text("楼盘占地面积不能为空");
			$('#floor_area').parent().next(".tips").css("color",'red');
			document.getElementById( "div5" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#floor_area').parent().next("div").text("");
			document.getElementById( "div5" ).className = "form-group has-success";
		}
		
		//建筑面积
		if($("#building_area").val().length==0){
			$('#building_area').focus();
			$('#building_area').parent().next(".tips").text("楼盘建筑面积不能为空");
			$('#building_area').parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if(building_area>floor_area){
			$('#building_area').focus();
			$('#building_area').parent().next(".tips").text("建筑面积不能比占地面积大");
			$('#building_area').parent().next(".tips").css("color",'red');
			document.getElementById( "div6" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#building_area').parent().next("div").text("");
			document.getElementById( "div6" ).className = "form-group has-success";
		}
		
		//楼盘房源类型
		if($("#house_type").val().length==0){
			$('#house_type').focus();
			$('#house_type').parent().next(".tips").text("楼盘房源类型不能为空");
			$('#house_type').parent().next(".tips").css("color",'red');
			document.getElementById( "div7" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#house_type').parent().next("div").text("");
			document.getElementById( "div7" ).className = "form-group has-success";
		}
		
		//楼盘均价
		if($("#avg_price").val().length==0){
			$('#avg_price').focus();
			$('#avg_price').parent().next(".tips").text("楼盘均价不能为空");
			$('#avg_price').parent().next(".tips").css("color",'red');
			document.getElementById( "div9" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#avg_price').parent().next("div").text("");
			document.getElementById( "div9" ).className = "form-group has-success";
		}
		//开盘时间
		
		if($("#open_date").val().length==0){
			$('#open_date').focus();
			$('#open_date').parent().next(".tips").text("楼盘开盘时间不能为空");
			$('#open_date').parent().next(".tips").css("color",'red');
			document.getElementById( "div10" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else if(oDate2.getTime() > oDate1.getTime()){
			$(this).parent().next("div").text("开盘时间不能在当前时间之前");
			$(this).parent().next("div").css("color",'red');
			document.getElementById( "div10" ).className = "form-group has-error"; 
			return;
		}else{
			$('#open_date').parent().next("div").text("");
			document.getElementById( "div10" ).className = "form-group has-success";
		}
		//房屋总套数
		if($("#total_rooms").val().length==0){
			$('#total_rooms').focus();
			$('#total_rooms').parent().next(".tips").text("楼盘房屋总套数不能为空");
			$('#total_rooms').parent().next(".tips").css("color",'red');
			document.getElementById( "div11" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#total_rooms').parent().next("div").text("");
			document.getElementById( "div11" ).className = "form-group has-success";
		}
		//接待地址
		if($("#reception_address").val().length==0){
			$('#reception_address').focus();
			$('#reception_address').parent().next(".tips").text("楼盘接待地址不能为空");
			$('#reception_address').parent().next(".tips").css("color",'red');
			document.getElementById( "div12" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#reception_address').parent().next("div").text("");
			document.getElementById( "div12" ).className = "form-group has-success";
		}
		//售楼电话
			if($('#tel').val().length==0){
				$('#tel').focus();
				$('#tel').parent().next("div").css("color",'#red');
				$('#tel').parent().next("div").text("电话号码不能为空");
				document.getElementById( "div13" ).className = "form-group has-error";
				e.preventDefault();
				return;
			}else if(isNaN($('#tel').val())){
				$('#tel').focus();
				$('#tel').parent().next("div").css("color",'#red');
				$('#tel').parent().next("div").text("电话号码只能为纯数字");
				document.getElementById( "div13" ).className = "form-group has-error";
				e.preventDefault();
				return;
			}else if($('#tel').val().length!=7){
				$('#tel').focus();
				$('#tel').parent().next("div").css("color",'#red');
				$('#tel').parent().next("div").text("电话号码只能为7位数字");
				document.getElementById( "div13" ).className = "form-group has-error";
				e.preventDefault();
				return;
			}else{
				document.getElementById( "div13" ).className = "form-group has-success";
				$('#tel').parent().next("div").text("");
			}		
		//绿化率
		if($("#green_ratio").val().length==0){
			$('#green_ratio').focus();
			$('#green_ratio').parent().next(".tips").text("楼盘绿化率不能为空");
			$('#green_ratio').parent().next(".tips").css("color",'red');
			document.getElementById( "div14" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#green_ratio').parent().next("div").text("");
			document.getElementById( "div14" ).className = "form-group has-success";
		}
		//容积率
		if($("#plot_ratio").val().length==0){
			$('#plot_ratio').focus();
			$('#plot_ratio').parent().next(".tips").text("楼盘容积率不能为空");
			$('#plot_ratio').parent().next(".tips").css("color",'red');
			document.getElementById( "div15" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#plot_ratio').parent().next("div").text("");
			document.getElementById( "div15" ).className = "form-group has-success";
		}
		//物业公司
		if($("#property_company").val().length==0){
			$('#property_company').focus();
			$('#property_company').parent().next(".tips").text("楼盘物业公司不能为空");
			$('#property_company').parent().next(".tips").css("color",'red');
			document.getElementById( "div16" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#property_company').parent().next("div").text("");
			document.getElementById( "div16" ).className = "form-group has-success";
		}
		//每平物业费
		if($("#property_fee").val().length==0){
			$('#property_fee').focus();
			$('#property_fee').parent().next(".tips").text("楼盘每平物业费不能为空");
			$('#property_fee').parent().next(".tips").css("color",'red');
			document.getElementById( "div17" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#property_fee').parent().next("div").text("");
			document.getElementById( "div17" ).className = "form-group has-success";
		}
		//车位数不
		if($("#car_station").val().length==0){
			$('#car_station').focus();
			$('#car_station').parent().next(".tips").text("楼盘车位数不能为空");
			$('#car_station').parent().next(".tips").css("color",'red');
			document.getElementById( "div18" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#car_station').parent().next("div").text("");
			document.getElementById( "div18" ).className = "form-group has-success";
		}
		
		//附近交通状况
		if($("#traffic").val()==0){
			$('#traffic').focus();
			$('#traffic').parent().next(".tips").text("楼盘附近交通状况不能为空");
			$('#traffic').parent().next(".tips").css("color",'red');
			document.getElementById( "div19" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#traffic').parent().next("div").text("");
			document.getElementById( "div19" ).className = "form-group has-success";
		}
		
		//周边配施不
		if($("#equipments").val().length==0){
			$('#equipments').focus();
			$('#equipments').parent().next(".tips").text("楼盘周边配施不能为空");
			$('#equipments').parent().next(".tips").css("color",'red');
			document.getElementById( "div20" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#equipments').parent().next("div").text("");
			document.getElementById( "div20" ).className = "form-group has-success";
		}
		
		//总户数
		if($("#intro").val().length==0){
			$('#intro').focus();
			$('#intro').parent().next(".tips").text("楼盘简介不能为空");
			$('#intro').parent().next(".tips").css("color",'red');
			document.getElementById( "div21" ).className = "form-group has-error";
			e.preventDefault();
			return;
		}else{
			$('#intro').parent().next("div").text("");
			document.getElementById( "div21" ).className = "form-group has-success";
		}
		$("#area").val($("#province").val()+$("#city").val()+$("#district").val());
		
		$("#form1").submit();
		
		
	})
	

})
