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
	<h2> 活动管理<span>修改活动</span></h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path%>/activity/updateSave" id="form1" enctype="multipart/form-data">
			  	<input type="hidden" name="activity.id" value="${activity.id }"/>
			  	<input type="hidden" name="activity.status" value="${activity.status }"/>
			  	<input type="hidden" name="activity.agency_id" value="${activity.agency_id }"/>
			  	<input type="hidden" name="activity.buildings_id" value="${activity.buildings_id }"/>
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">活动标题：</label>
				  <div class="col-sm-4">
					<input type="text" id="name" name="activity.title" value="${activity.title }" placeholder="请输入活动标题" data-placement="right" title="与实际活动标题保持一致" class="form-control tooltips" required>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">开始时间：</label>
				  <div class="col-sm-4">
					<input type="date" id="start_time" name="activity.start_time" value="${activity.start_time}" placeholder="选择活动开始时间" data-placement="right" title="与实际开始时间保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">结束时间：</label>
				  <div class="col-sm-4">
					<input type="date" id="end_time" name="activity.end_time" value="${activity.end_time }" placeholder="选择活动结束时间" data-placement="right" title="与实际活动结束时间保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">活动图片：</label>
				  <div class="col-sm-4">
				  <img id="img" src="<%=path%>/upload/${activity.logo }" class="img-rounded"  onclick="F_Open_dialog()" style="width:100px;height:80px">
				  <input type="hidden" id="headicon2" value="${activity.logo }" name="activity.logo">
				  <input type="file" id="headicon" style="display:none" name="upload" value="${activity.logo }">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">活动地址：</label>
				  <div class="col-sm-4">
					<input type="text" id="address" name="activity.address" value="${activity.address }" placeholder="输入活动地址" data-placement="right" title="与实际活动地址保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   
			   <div class="form-group" id="div7">
				  <label class="col-sm-3 control-label">活动内容：</label>
				  <div class="col-sm-7">
					<textarea  id="content" name="activity.content" class="form-control" rows="5">${activity.content }</textarea>
				  </div>
				</div>
			   

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button  class="btn btn-primary btn-lg" id="btn_activity"> 修改 </button>&nbsp;
						<a href="<%=path%>/activity/list1?agency_id=${agency_id }" class="btn btn-default btn-lg" > 取消 </a>
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
<script src="<%=path %>/js/activity_update.js"></script>
<script src="<%=path %>/js/custom.js"></script>
<script>
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
		
		//返回
		$("#back").click(function(){
			window.history.back(-1);
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
