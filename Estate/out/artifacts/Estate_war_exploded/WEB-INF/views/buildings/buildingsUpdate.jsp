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
</head>

<body style="background-color: white">


<div class="pageheader">
	<h2> 楼盘管理<span>楼盘修改</span></h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/builds/updateSave" id="form1"  enctype="multipart/form-data">
				<input type="hidden" name="builds.company" value="${builds.company }">
				<input type="hidden" name="builds.agency_id" value="${builds.agency_id }">
				<input type="hidden" name="builds.logo" value="${builds.logo }">
				<input type="hidden" name="builds.id" value="${builds.id }">
				<input type="hidden" name="builds.created_time" value="${builds.created_time }">
				<input type="hidden" name="builds.status" value="${builds.status }">
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">楼盘名称：</label>
				  <div class="col-sm-4">
					<input type="text" id="name" name="builds.name" value="${builds.name }" placeholder="请输入楼盘名称" data-placement="right" title="与实际名称相同保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">所属区域：</label>
				  <div class="col-sm-4">
					<input type="text" id="area" name="builds.area" value="${builds.area }" placeholder="输入楼盘所属区域" data-placement="right" title="与实际区域保持一致" class="form-control tooltips">
				  </div>
				  <button type="button" id="btn_update" class="btn btn-default btn-xs">修改</button>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div3" style="display:none">
				  <label class="col-sm-3 control-label">所属区域：</label>
				  <div class="col-sm-4">
				  	<div id="distpicker5">
			          <select class="form-control" id="province"></select><br/>
			          <select class="form-control" id="city"></select><br/>
			          <select class="form-control" id="district"></select>
      				</div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">楼盘地址：</label>
				  <div class="col-sm-4">
					<input type="text" id="address" name="builds.address" value="${builds.address }" placeholder="选择楼盘地址"  data-placement="right" title="与实际地址保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   

				 <div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">占地面积：</label>
				  <div class="col-sm-4">
					<input type="text" id="floor_area" name="builds.floor_area" value="${builds.floor_area }" placeholder="输入楼盘占地面积" data-placement="right" title="与实际占地面积保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">建筑面积：</label>
				  <div class="col-sm-4">
					<input type="text" id="building_area" name="builds.building_area" value="${builds.building_area }" placeholder="输入楼盘建筑面积" data-placement="right" title="与实际建筑面积保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div7">
				  <label class="col-sm-3 control-label">房源类型：</label>
				  <div class="col-sm-4">
				  	 <select class="select2" name="builds.house_type" id="house_type"  data-placeholder="请选择房塬类型...">
		                 <option value="${builds.house_type }">${builds.house_type }</option>
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
				  	<s:if test="builds.building_type=='塔楼' ">
					  	 <div class="rdio rdio-primary">
	                      <input type="radio" id="male" value="塔楼" name="builds.building_type" checked="checked"/>
	                      <label for="male">塔楼</label>
	                    </div><!-- rdio -->
	                    <div class="rdio rdio-primary">
	                      <input type="radio" value="板楼" id="female" name="builds.building_type">
	                      <label for="female">板楼</label>
	                    </div><!-- rdio -->
	                 </s:if>
	                 <s:else>
	                 	<div class="rdio rdio-primary">
	                      <input type="radio" id="male" value="塔楼" name="builds.building_type"/>
	                      <label for="male">塔楼</label>
	                    </div><!-- rdio -->
	                    <div class="rdio rdio-primary">
	                      <input type="radio" value="板楼" id="female" name="builds.building_type" checked="checked">
	                      <label for="female">板楼</label>
	                    </div><!-- rdio -->
	                 </s:else>
				  </div>
				  
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div9">
				  <label class="col-sm-3 control-label">楼盘经度：</label>
				  <div class="col-sm-4">
					<input type="text" id="longitude" name="builds.longitude" value="${builds.longitude }" placeholder="输入楼盘经度" data-placement="right" title="与实际经度保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				 <div class="form-group" id="div10">
				  <label class="col-sm-3 control-label">楼盘纬度：</label>
				  <div class="col-sm-4">
					<input type="text" id="latitude" name="builds.latitude" value="${builds.latitude }" placeholder="输入楼盘纬度" data-placement="right" title="与实际纬度保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div11">
				  <label class="col-sm-3 control-label">楼盘均价：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.avg_price" value="${builds.avg_price }" placeholder="输入楼盘均价" id="avg_price"  data-placement="right" title="与实际楼盘均价保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div12">
				  <label class="col-sm-3 control-label">开盘时间：</label>
				  <div class="col-sm-4">
					<div class="input-group">
		                <input type="date" class="form-control" name="builds.open_date" value="${builds.open_date }" placeholder="选择开盘时间">
		                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		             </div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div13">
				  <label class="col-sm-3 control-label">楼盘总套数：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.total_rooms" value="${builds.total_rooms }" placeholder="输入楼盘总套数" id="total_rooms"  data-placement="right" title="与实际楼盘总套数保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div14">
				  <label class="col-sm-3 control-label">接待地址：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.reception_address" value="${builds.reception_address }" placeholder="输入接待地址" id="reception_address"  data-placement="right" title="与实际接待地址保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div15">
				  <label class="col-sm-3 control-label">楼盘售楼电话：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.tel" value="${builds.tel }" placeholder="输入楼盘售楼电话" id="tel"  data-placement="right" title="与实际楼盘售楼电话保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div16">
				  <label class="col-sm-3 control-label">绿化率：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.green_ratio" value="${builds.green_ratio }" placeholder="输入楼盘绿化率" id="green_ratio"  data-placement="right" title="与实际楼盘绿化率保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div17">
				  <label class="col-sm-3 control-label">容积率：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.plot_ratio" value="${builds.plot_ratio }" placeholder="输入楼盘容积率" id="plot_ratio"  data-placement="right" title="与实际楼盘容积率保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div18">
				  <label class="col-sm-3 control-label">物业公司：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.property_company" value="${builds.property_company }" placeholder="输入物业公司" id="property_company"  data-placement="right" title="与实际物业公司保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div19">
				  <label class="col-sm-3 control-label">物业费：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.property_fee" value="${builds.property_fee }" placeholder="输入物业费" id="property_fee"  data-placement="right" title="与实际物业费保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div20">
				  <label class="col-sm-3 control-label">车位数：</label>
				  <div class="col-sm-4">
					<input type="text" name="builds.car_station" value="${builds.car_station }" placeholder="输入车位数" id="car_station"  data-placement="right" title="与实际车位数保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group" id="div21">
				  <label class="col-sm-3 control-label">交通状况：</label>
				  <div class="col-sm-7">
					<textarea  id="traffic" name="builds.traffic" class="form-control" rows="5">${builds.traffic }</textarea>
				  </div>
				  
				</div>
				
			
				<div class="form-group" id="div22">
				  <label class="col-sm-3 control-label">周边配置：</label>
				  <div class="col-sm-7">
					<textarea id="equipments" name="builds.equipments" wrap="soft" cols="65" rows="5">${builds.equipments }</textarea>
				  </div>
				  
				</div>


				<div class="form-group" id="div23">
				  <label class="col-sm-3 control-label">楼盘简介：</label>
				  <div class="col-sm-7">
					<textarea  id="intro" name="builds.intro" class="form-control" rows="5">${builds.intro }</textarea>
				  </div>
				  
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_agency"> 修改 </button>&nbsp;
						<a href="<%=path%>/builds/look?builds.id=${builds.id }" class="btn btn-default btn-lg" > 取消 </a>
				  </div>
				</div>
				<br/>
			   
			  </form>
			  
			</div><!-- panel-body -->
			
		</div>
		
</div><!-- contentpanel -->
	


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
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
<script src="<%=path %>/js/colorpicker.js"></script>
<script src="<%=path %>/js/custom.js"></script>
<script src="<%=path %>/js/distpicker.data.js"></script>
<script src="<%=path %>/js/distpicker.js"></script>
<script src="<%=path %>/js/main3.js"></script>
<script src="<%=path %>/js/builds_update.js"></script>
<script>
	$(function(){
		$("#btn_update").bind("click",function(){
			document.getElementById("div2").style.display='none';
			document.getElementById("div3").style.display='block';
		});
		$("#district").bind("change",function(){
			if($("#province").val()!=null && $("#city").val()!=null && $("#district").val()!=null){
				$("#area").val($("#province").val()+$("#city").val()+$("#district").val());
			}
		});
		
	})


</script>
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
<s:if test="#request.msg!=null">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</s:if>
</body>
</html>
