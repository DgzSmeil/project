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

  <title>户型新增</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body style="background-color: white">
	<div class="pageheader">
	<h2><i class="glyphicon glyphicon-user"></i> 户型管理<span>户型修改</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	
</div>
    <div class="contentpanel">
      <!-- content goes here... -->
		<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/house/updatesave" id="form1"  enctype="multipart/form-data">
 				<input type="hidden" name="agency_id" value="${agency_id }">
				<input type="hidden" name="house.buildings_id" value="${house.buildings_id }">
				<input type="hidden" name="house.id" value="${house.id}">
				<input type="hidden" name="house.created_time" value="${house.created_time}">
				<input type="hidden" name="house.status" value="${house.status }">
				<div class="form-group" id="div1">
					  <label class="col-sm-3 control-label">户型名称：</label>
					 	 <div class="col-sm-4">
							<input type="text" value="${house.name }" id="name" name="house.name" placeholder="户型名称" data-placement="right" title="请输入楼栋名称" class="form-control tooltips">
					  	</div>
					  <div class="col-sm-4 tips"></div>
				</div>
				
			    <div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">活动图片：</label>
				  <div class="col-sm-4">
				  <img id="img" src="<%=path%>/upload/${house.logo }" class="img-rounded"  onclick="F_Open_dialog()" style="width:100px;height:80px">
				  <input type="hidden" id="headicon2" value="${house.logo }" name="house.logo" >
				  <input type="file" id="headicon" style="display:none" name="upload" value="${house.logo }" id="upload">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">简介：</label>
				  <div class="col-sm-4">
					<input type="text" value="${house.intro }" id="intro" name="house.intro" placeholder="简介" data-placement="right" title="请输入介绍" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">面积：</label>
				  <div class="col-sm-4">
					<input type="number" value="${house.area }" id="area" name="house.area" placeholder="输入面积" data-placement="right" title="请输入面积" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">参考单价：</label>
				  <div class="col-sm-4">
					<input type="number" value="${house.unit_price }" id="unit_price" name="house.unit_price" placeholder="输入您的单价" data-placement="right" title="输入您的单价" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_house"> 提 交 </button>&nbsp;
						<a href="<%=path%>/house/strap?agency_id=${agency_id }" class="btn btn-default btn-lg" > 取消 </a>
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
<script src="<%=path %>/js/house_update.js"></script>

<script type="text/javascript">

var input = document.getElementById("headicon");
var $img = $('#img');
//文件域选择文件时, 执行readFile函数
input.addEventListener('change',readFile,false);
function readFile(){
var file=this.files[0];
    //alert(file.name);
var $file = $(this);
var fileObj = $file[0];
var windowURL = window.URL || window.webkitURL;
var dataURL;
dataURL = windowURL.createObjectURL(fileObj.files[0]);
 //alert(dataURL);
$img.attr('src',dataURL);
}	
	function F_Open_dialog(){ 
		document.getElementById("headicon").click(); 
	} 
</script>
</body>
</html>
