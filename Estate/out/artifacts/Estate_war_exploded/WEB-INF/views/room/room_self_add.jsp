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

  <title>房号新增</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body style="background-color: white">
	<div class="pageheader">
	<h2><i class="glyphicon glyphicon-user"></i> 房号管理<span>生成房号</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
</div>
    <div class="contentpanel">
      <!-- content goes here... -->
		<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/room/selfaddSave" id="form1"  enctype="multipart/form-data">
 				<input type="hidden" name="agency_id" value="${agency_id }">
			
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">选择楼栋：</label>
				  <div class="col-sm-4">
				   <select name="room.building_id" class="form-control" >  
				   			<option value="" ></option> 
				        <s:iterator var="s" value="#request.builds" >
				  	   		<option value="${s.id}" >${s.name }</option>   
				  		</s:iterator>
				   </select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">选择户型：</label>
				  <div class="col-sm-4">
				   <select name="room.house_id" class="form-control"> 
				   			<option value="" ></option>    
				        <s:iterator var="s" value="#request.houses" >
				  	   		<option value="${s.id}" >${s.name }</option>   
				  		</s:iterator>
				   </select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_house"> 生成 </button>&nbsp;
						<button type="reset" class="btn btn-default btn-lg" id="back"> 重置</button>
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

<script type="text/javascript">

	
	function F_Open_dialog(){ 
		document.getElementById("upload").click(); 
	} 
</script>
</body>
</html>
