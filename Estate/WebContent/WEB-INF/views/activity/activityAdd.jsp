<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
<!-- 提示框 -->
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
    </head>

<body style="background-color: white">


<div class="pageheader">
	<h2> 活动<span>发布活动</span></h2>
	<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path%>/activity/add" id="form1" enctype="multipart/form-data">
			  <input type="hidden" name="activity.agency_id" value="${agency.id }">
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">活动标题：</label>
				  <div class="col-sm-4">
					<input type="text" id="name" name="activity.title" placeholder="请输入活动标题" data-placement="right" title="与实际活动标题保持一致" class="form-control tooltips" required>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">开始时间：</label>
				  <div class="col-sm-4">
					<input type="date" id="start_time" name="activity.start_time" placeholder="选择活动开始时间" data-placement="right" title="与实际开始时间保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">结束时间：</label>
				  <div class="col-sm-4">
					<input type="date" id="end_time" name="activity.end_time" placeholder="选择活动结束时间" data-placement="right" title="与实际活动结束时间保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">活动图片：</label>
				  <div class="col-sm-4">
				  <p id="addp"></p>
				  <input type="file" id="upload" style="display:none" name="upload" onclick="addElementImg('addp')">
				  <span  class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
				  		选择图片
				  </span>
					
					
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">活动地址：</label>
				  <div class="col-sm-4">
					<input type="text" id="address" name="activity.address" placeholder="输入活动地址" data-placement="right" title="与实际活动地址保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">负责楼盘：</label>
				  <div class="col-sm-4">
					 <select class="select2" id="buildings_id" name="activity.buildings_id" data-placeholder="请选择房塬类型...">
					 	<option value=""></option>
					 	<s:iterator value="#request.buildingsList" var="d">
		                 <option value="${d.id }">${d.name }</option>
		                </s:iterator>
				  	</select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   
			   <div class="form-group" id="div7">
				  <label class="col-sm-3 control-label">活动内容：</label>
				  <div class="col-sm-7">
					<textarea  id="content" name="activity.content" class="form-control" rows="5">
						
					</textarea>
				  </div>
				</div>
			   

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button  class="btn btn-primary btn-lg" id="btn_activity"> 添加 </button>&nbsp;
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
<script src="<%=path %>/js/activity_add.js"></script>
<script>


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
	$(function(){
		$("#btn_agency").bind("click",function(){
			if($("#name").val()==""){
				alert("请输入员工姓名");
				$("#name").focus();
				return false;
			}else if($("#phone").val()==""){
				alert("请输入手机号码");
				$("#phone").focus();
				return false;
			}else if($("#email").val==""){
				alert("请输入邮箱地址");
				$("#email").focus();
				return false;
			}else if($("#basic_salary").val==""){
				alert("请输入基础工资");
				$("#basic_salary").focus();
				return false;
			}else if($("#building_id").val()==""){
				alert("请选择负责楼盘");
				$("#building_id").focus();
				return false;
			}else{
				$("#form1").submit();
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

//返回
$("#back").click(function(){
	window.history.back(-1);
})
</script>

<s:if test="#request.msg!=null">
	<script type="text/javascript">
	swal("注册错误", "${error}", "error");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>
</body>
</html>
