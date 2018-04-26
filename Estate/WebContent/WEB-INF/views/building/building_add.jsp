<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
     <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">

  <title>楼栋新增</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body style="background-color: white">
	<div class="pageheader">
	<h2><i class="glyphicon glyphicon-user"></i> 楼栋管理<span>添加楼栋</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	
</div>
    <div class="contentpanel">
      <!-- content goes here... -->
		<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/build/addsave" id="form1" ">
				<input type="hidden" id="bud" name="agency_id" value="${agency_id }"></input>
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">楼栋名称：</label>
				  <div class="col-sm-4">
					<input type="text" id="name" name="building.name" placeholder="楼栋名称" data-placement="right" title="请输入楼栋名称" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">总层数：</label>
				  <div class="col-sm-4">
					<input type="number" id="total_floor" name="building.total_floor" placeholder="输入总层数" data-placement="right" title="请输入总层数" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">电梯数：</label>
				  <div class="col-sm-4">
					<input type="number" id="total_lift" name="building.total_lift" placeholder="输入电梯数" data-placement="right" title="请输入电梯数" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">每层用户数：</label>
				  <div class="col-sm-4">
					<input type="number" id="floor_rooms" name="building.floor_rooms" placeholder="输入每层用户数" data-placement="right" title="请输入每层用户数" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">总用户数：</label>
				  <div class="col-sm-4">
					<input type="number" id="total_room" name="building.total_room" placeholder="输入总用户数" data-placement="right" title="请输入总用户数" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
			  <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">选择楼盘：</label>
				  <div class="col-sm-4">
				   <select  class="select2" id="buildings_id" name="building.buildings_id" data-placeholder="请选择房塬类型...">  
				      	<option value=""></option>
				        <s:iterator var="s" value="#request.buildings" >
				  	   		<option value="${s.id}" >${s.name }</option>   
				  		</s:iterator>
				   </select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_build"> 提 交 </button>&nbsp;
						<button type="reset" class="btn btn-default btn-lg" id="back"> 重置 </button>
				  </div>
				</div>
				<br/>
			   
			  </form>
			  
			</div><!-- panel-body -->
		
			
		</div>
	</div>
    
  
  


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
<script src="<%=path %>/js/build.js"></script>
<script src="<%=path %>/js/custom.js"></script>
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
</body>
</html>
