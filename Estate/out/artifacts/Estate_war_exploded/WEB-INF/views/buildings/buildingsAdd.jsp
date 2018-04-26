<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	Agency agency = (Agency)session.getAttribute("agency");
%>
<%@page import="com.gs.pojo.Agency"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="images/favicon.png" type="image/png">

        <title>房天下后台管理</title>
  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
  <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
  <script language="javascript" src="http://webapi.amap.com/maps?v=1.2&key=e58bae199679e49544969133bc20896e"></script>
    </head>

<body style="background-color: white" onLoad="mapInit()">


<div class="pageheader">
	<h2><i class="glyphicon glyphicon-user"></i> 楼盘管理<span>添加楼盘</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/builds/add" id="form1"  enctype="multipart/form-data">
				<input type="hidden" name="builds.company" value="${agency.name }">
				<input type="hidden" name="builds.agency_id" value="${agency.id }">
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">楼盘名称：</label>
				  <div class="col-sm-4">
					<input type="text" id="name" name="builds.name" placeholder="请输入楼盘名称" data-placement="right" title="与实际名称相同保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">楼盘封面：</label>
				  <div class="col-sm-2">
					  <input type="file" id="upload" style="display:none" name="upload" onclick="addElementImg('addp')">
					  <span  class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
					  		选择图片
					  </span>
				  </div>
				  <p id="addp"></p>
				  <div class="col-sm-4 tips"></div>
				</div>
				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">所属区域：</label>
				  <div class="col-sm-4">
				  	<div id="distpicker5">
			          <select class="form-control" id="province"></select><br/>
			          <select class="form-control" id="city"></select><br/>
			          <select class="form-control" id="district"></select>
      				</div>
					<input type="hidden" id="area" name="builds.area" placeholder="输入楼盘所属区域" data-placement="right" title="与实际区域保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				
				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">楼盘地址：</label>
				  <div class="col-sm-4">
					<input type="text" id="address" name="builds.address" placeholder="选择楼盘地址" onclick="mapshow();" data-placement="right" title="与实际地址保持一致" class="form-control tooltips">
					<input type="hidden" id="longitude" name="builds.longitude">
					<input type="hidden" id=latitude name="builds.latitude">
					<p id="iAddress"></p>
				  </div>
				  <div class="col-sm-4 tips"></div>
				  <div id="iMap" style="width:700px;height:550px;border:#ccc solid 1px;font-size:12px;display:none"></div>
				</div>
			   

				 <div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">占地面积：</label>
				  <div class="col-sm-4">
					<input type="number" id="floor_area" name="builds.floor_area" placeholder="输入楼盘占地面积" data-placement="right" title="与实际占地面积保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">建筑面积：</label>
				  <div class="col-sm-4">
					<input type="number" id="building_area" name="builds.building_area" placeholder="输入楼盘建筑面积" data-placement="right" title="与实际建筑面积保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div7">
				  <label class="col-sm-3 control-label">房源类型：</label>
				  <div class="col-sm-4">
				  	 <select class="select2" id="house_type" name="builds.house_type" data-placeholder="请选择房塬类型...">
		                 <option value=""></option>
		                 <option value="住宅">住宅</option>
		                 <option value="经济适用房">经济适用房</option>
		                 <option value="别墅">别墅</option>
		                 <option value="写字楼">写字楼</option>
		                 <option value="公寓">公寓</option>
		                 <option value="花园洋房">花园洋房</option>
				  	</select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div8">
				  <label class="col-sm-3 control-label">建筑类型：</label>
				  <div class="col-sm-4">
					  	 <div class="rdio rdio-primary">
	                      <input type="radio" id="male" value="塔楼" checked="checked" name="builds.building_type"/>
	                      <label for="male">塔楼</label>
	                    </div><!-- rdio -->
	                    <div class="rdio rdio-primary">
	                      <input type="radio" value="板楼" id="sale" name="builds.building_type">
	                      <label for="sale">板楼</label>
	                    </div><!-- rdio -->
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group" id="div9">
				  <label class="col-sm-3 control-label">楼盘均价：</label>
				  <div class="col-sm-4">
					<input type="number" name="builds.avg_price" placeholder="输入楼盘均价" id="avg_price"  data-placement="right" title="与实际楼盘均价保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div10">
				  <label class="col-sm-3 control-label">开盘时间：</label>
				  <div class="col-sm-4">
		                <input type="date" class="form-control tooltips" id="open_date" name="builds.open_date" placeholder="选择开盘时间">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div11">
				  <label class="col-sm-3 control-label">楼盘总套数：</label>
				  <div class="col-sm-4">
					<input type="number" name="builds.total_rooms" placeholder="输入楼盘总套数" id="total_rooms"  data-placement="right" title="与实际楼盘总套数保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div12">
				  <label class="col-sm-3 control-label">接待地址：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.reception_address" placeholder="输入接待地址" id="reception_address"  data-placement="right" title="与实际接待地址保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div13">
				  <label class="col-sm-3 control-label">楼盘售楼电话：</label>
				  <div class="col-sm-4">
					<input type="number" name="builds.tel" placeholder="输入楼盘售楼电话" id="tel"  data-placement="right" title="与实际楼盘售楼电话保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div14">
				  <label class="col-sm-3 control-label">绿化率：</label>
				  <div class="col-sm-4">
					<input type="number" name="builds.green_ratio" placeholder="输入楼盘绿化率" id="green_ratio"  data-placement="right" title="与实际楼盘绿化率保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div15">
				  <label class="col-sm-3 control-label">容积率：</label>
				  <div class="col-sm-4">
					<input type="number" name="builds.plot_ratio" placeholder="输入楼盘容积率" id="plot_ratio"  data-placement="right" title="与实际楼盘容积率保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div16">
				  <label class="col-sm-3 control-label">物业公司：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.property_company" placeholder="输入物业公司" id="property_company"  data-placement="right" title="与实际物业公司保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div17">
				  <label class="col-sm-3 control-label">物业费：</label>
				  <div class="col-sm-4">
					<input type="number" name="builds.property_fee" placeholder="输入物业费" id="property_fee"  data-placement="right" title="与实际物业费保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div18">
				  <label class="col-sm-3 control-label">车位数：</label>
				  <div class="col-sm-4">
					<input type="number" name="builds.car_station" placeholder="输入车位数" id="car_station"  data-placement="right" title="与实际车位数保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group" id="div19">
				  <label class="col-sm-3 control-label">交通状况：</label>
				  <div class="col-sm-7">
					<textarea  id="traffic" name="builds.traffic" class="form-control" rows="5">
						
					</textarea>
				  </div>
				</div>
				
			
				<div class="form-group" id="div20">
				  <label class="col-sm-3 control-label">周边配置：</label>
				  <div class="col-sm-7">
					<textarea  id="equipments" name="builds.equipments" class="form-control" rows="5">
						
					</textarea>
				  </div>
				  
				</div>


				<div class="form-group" id="div21">
				  <label class="col-sm-3 control-label">楼盘简介：</label>
				  <div class="col-sm-7">
					<textarea  id="intro" name="builds.intro" class="form-control" rows="5">
						
					</textarea>
				  </div>
				  
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button type="button" class="btn btn-primary btn-lg" id="btn_agency"> 添加 </button>&nbsp;
						<button type="reset" class="btn btn-default btn-lg"> 重置 </button>
				  </div>
				</div>
				<br/>
			   
			  </form>
			  
			</div><!-- panel-body -->
			
		</div>
		
</div><!-- contentpanel -->
	


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>

<script src="<%=path %>/js/jquery.autogrow-textarea.js"></script>
<script src="<%=path %>/js/bootstrap-timepicker.min.js"></script>
<script src="<%=path %>/js/jquery.maskedinput.min.js"></script>
<script src="<%=path %>/js/jquery.tagsinput.min.js"></script>
<script src="<%=path %>/js/jquery.mousewheel.js"></script>
<script src="<%=path %>/js/select2.min.js"></script>
<script src="<%=path %>/js/dropzone.min.js"></script>
<script src="<%=path %>/js/distpicker.data.js"></script>
<script src="<%=path %>/js/distpicker.js"></script>
<script src="<%=path %>/js/main3.js"></script>
<script src="<%=path %>/js/custom.js"></script>
<script src="<%=path %>/js/builds.js"></script>
<script>
jQuery(document).ready(function(){
    
    "use strict";
  
  // Tags Input
  jQuery('#tags').tagsInput({width:'auto'});
  
  // Select2
  jQuery(".select2").select2({
    width: '100%'
  });
  jQuery('#open_date').datepicker();
  
 
});
</script>
<script type="text/javascript">


var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:200px;height:150px");
			img.src = "";
			ul.appendChild(img);
			i=false;
			var input = document.getElementById("upload");
			var $img = $('#newImg');
			input.addEventListener('change',readFile,false);
			function readFile(){
				var file=this.files[0];
				var $file = $(this);
				var fileObj = $file[0];
				var windowURL = window.URL || window.webkitURL;
				var dataURL;
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				$img.attr('src',dataURL);
			}
		}
	}
	
	function F_Open_dialog(){ 
		document.getElementById("upload").click(); 
	} 
</script>
<script language="javascript">
var mapObj;
var lnglatXY;
//初始化地图
function mapInit(){
    var opt = {  
        level: 10, //设置地图缩放级别    
        center: new AMap.LngLat(116.397428, 39.90923) //设置地图中心点   
    }  
    mapObj = new AMap.Map("iMap", opt);  
	
	AMap.event.addListener(mapObj,'click',getLnglat); //点击事件
}
function geocoder() {
    var MGeocoder;
    //加载地理编码插件
    mapObj.plugin(["AMap.Geocoder"], function() {        
        MGeocoder = new AMap.Geocoder({ 
            radius: 1000,
            extensions: "all"
        });
        //返回地理编码结果 
        AMap.event.addListener(MGeocoder, "complete", geocoder_CallBack); 
        //逆地理编码
        MGeocoder.getAddress(lnglatXY); 
    });
    //加点
    var marker = new AMap.Marker({
        map:mapObj,
        icon: new AMap.Icon({
            image: "http://api.amap.com/Public/images/js/mark.png",
            size:new AMap.Size(58,30),
            imageOffset: new AMap.Pixel(-32, -0)
        }),
        position: lnglatXY,
        offset: new AMap.Pixel(-5,-30)
    });
   // mapObj.setFitView();
}
//回调函数
function geocoder_CallBack(data) {
    var address;
    //返回地址描述
    address = data.regeocode.formattedAddress;
    //返回结果拼接输出
    document.getElementById("iMap").style.display='none';
    $("#address").val(address);
}  
//鼠标点击，获取经纬度坐标  
function getLnglat(e){
	
	mapObj.clearMap();
	var x = e.lnglat.getLng();
	var y = e.lnglat.getLat(); 
	$("#longitude").val(x);
	$("#latitude").val(y);
	
	lnglatXY = new AMap.LngLat(x,y);
	geocoder();
}
function mapshow(){
	document.getElementById("iMap").style.display='block';
}
</script>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Faeff88f19045b513af7681b011cea3bd' type='text/javascript'%3E%3C/script%3E"));
</script>
<s:if test="#request.error!=null">
	<script type="text/javascript">
		swal("登录错误", "${error}", "error");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>
</body>
</html>
