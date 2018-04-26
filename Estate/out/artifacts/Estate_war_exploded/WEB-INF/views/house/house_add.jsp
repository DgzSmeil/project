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
	<h2><i class="glyphicon glyphicon-user"></i> 户型管理<span>添加户型</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	
</div>
    <div class="contentpanel">
      <!-- content goes here... -->
		<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/house/addsave" id="form1"  enctype="multipart/form-data">
 				<input type="hidden" name="agency_id" value="${agency_id }">
			
				<div class="form-group" id="div1">
					  <label class="col-sm-3 control-label">户型名称：</label>
					 	 <div class="col-sm-4">
							<input type="text" id="name" name="house.name" placeholder="户型名称" data-placement="right" title="请输入楼栋名称" class="form-control tooltips">
					  	</div>
					  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">选择楼盘：</label>
				  <div class="col-sm-4">
				   <select name="house.buildings_id" class="form-control">  
				        <s:iterator var="s" value="#request.list" >
				  	   		<option value="${s.id}" >${s.name }</option>   
				  		</s:iterator>
				   </select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
			    <div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">户型封面：</label>
				  <div class="col-sm-4">
					<p id="addp"></p>
					  <input type="file" id="upload" style="display:none" name="upload" onclick="addElementImg('addp')">
					  <span  class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
					  		选择图片
					  </span>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">简介：</label>
				  <div class="col-sm-4">
					<input type="text" id="intro" name="house.intro" placeholder="简介" data-placement="right" title="请输入介绍" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">面积：</label>
				  <div class="col-sm-4">
					<input type="number" id="area" name="house.area" placeholder="输入面积" data-placement="right" title="请输入面积" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">参考单价：</label>
				  <div class="col-sm-4">
					<input type="number" id="unit_price" name="house.unit_price" placeholder="输入您的单价" data-placement="right" title="输入您的单价" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_house"> 提 交 </button>&nbsp;
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
<script src="<%=path %>/js/house.js"></script>

<script type="text/javascript">


var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:113px;height:50px");
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
	
	//返回
	$("#back").click(function(){
		window.history.back(-1);
	})
	
</script>
</body>
</html>
