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
 <s:if test="#session.actvt=='mgn'.toString()">
		<h2><i class="fa fa-th-list"></i>活动管理 <span>管理员活动</span><span>修改</span></h2>
	</s:if>
	 <s:if test="#session.actvt=='agc'.toString()">
		<h2><i class="fa fa-th-list"></i>活动管理 <span>经销商活动</span><span>修改</span></h2>
	</s:if>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path%>/activity/mgnActvtEdit" id="form1" enctype="multipart/form-data">
			  	<input type="hidden" name="activity.id" value="${activity.id }"/>
			  	<input type="hidden" name="activity.status" value="${activity.status }"/>
			  	<input type="hidden" name="activity.agency_id" value="${activity.agency_id }"/>
			  	<input type="hidden" name="activity.buildings_id" value="${activity.buildings_id }"/>
			  			<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">活动图片：</label>
				  <div class="col-sm-4">
				  <img id="img" src="<%=path%>/upload/${activity.logo }" class="img-rounded"  onclick="F_Open_dialog()" style="width:360px;height:150px">
				  <input type="hidden" id="headicon2" value="${activity.logo }" name="activity.logo">
				  <input type="file" id="headicon" style="display:none" name="upload" value="${activity.logo }">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			  	
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">活动标题：</label>
				  <div class="col-sm-4">
					<input type="text" id="title" name="activity.title" onblur="valide2();" value="${activity.title }" placeholder="请输入活动标题" data-placement="right" title="与实际活动标题保持一致" class="form-control tooltips" required>
				  	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">开始时间：</label>
				  <div class="col-sm-4">
					<input type="date" id="start_time" name="activity.start_time" onblur="valide2();" value="${activity.start_time}" placeholder="选择活动开始时间" data-placement="right" title="与实际开始时间保持一致" class="form-control tooltips">
				 	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">结束时间：</label>
				  <div class="col-sm-4">
					<input type="date" id="end_time" name="activity.end_time" onblur="valide2();" value="${activity.end_time }" placeholder="选择活动结束时间" data-placement="right" title="与实际活动结束时间保持一致" class="form-control tooltips">
				  	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">活动地址：</label>
				  <div class="col-sm-4">
					<input type="text" id="address" name="activity.address" onblur="valide2();" value="${activity.address }" placeholder="输入活动地址" data-placement="right" title="与实际活动地址保持一致" class="form-control tooltips">
				  	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   
			   <div class="form-group" id="div11">
				  <label class="col-sm-3 control-label">活动内容：</label>
				  <div class="col-sm-7">
					<textarea  id="content" name="activity.content" onblur="valide3();" class="form-control" rows="5">${activity.content }</textarea>
				  	<div class="col-sm-20 tips"></div>
				  </div>
				</div>
			   

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button  class="btn btn-primary btn-lg" id="btn_agency" onclick="return valide();"> 修改 </button>&nbsp;
				  </div>
				   <label class="col-sm-2 control-label"></label>
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
function valide(){
	var beginDate=$("#start_time").val();  
	 var endDate=$("#end_time").val();  
	 var d1 = new Date(beginDate.replace(/\-/g, "\/"));  
	 var d2 = new Date(endDate.replace(/\-/g, "\/"));  
	if($("input[name='activity.title']").val().length==0){				
		$("input[name='activity.title']").focus();
		$("input[name='activity.title']").next("div").text("此处不能为空");
		$("input[name='activity.title']").next("div").css("color",'red');
		return false;
	}else if($("input[name='activity.start_time']").val().length==0){
		$("input[name='activity.start_time']").focus();
		$("input[name='activity.start_time']").next("div").text("此处年月日都不能为空");
		$("input[name='activity.start_time']").next("div").css("color",'red');
		return false;
	}else if($("input[name='activity.end_time']").val().length==0){
		$("input[name='activity.end_time']").focus();
		$("input[name='activity.end_time']").next("div").text("此处年月日都不能为空");
		$("input[name='activity.end_time']").next("div").css("color",'red');
		return false;
	}else if(beginDate!=""&&endDate!=""&&d1 >=d2){
		$("input[name='activity.end_time']").next("div").text("结束时间小于开始时间！");
		$("input[name='activity.end_time']").next("div").css("color",'red');
		return false;  
	}else if($("input[name='activity.address']").val().length==0){				
			$("input[name='activity.address']").focus();
			$("input[name='activity.address']").next("div").text("此处不能为空");
			$("input[name='activity.address']").next("div").css("color",'red');
			return false;
	}else if($("textarea[name='activity.content']").val().length==0){
			$("textarea[name='activity.content']").focus();
			$("textarea[name='activity.content']").next("div").text("此处不能为空");
			$("textarea[name='activity.content']").next("div").css("color",'red');
			return false;
	}else{
			$(this).next("div").text("");
			$(this).next("div").css("color",'#ccc');
			return true;
		}
}
function valide2(){
		$("input[name='activity.title']").next("div").text("");
		$("input[name='activity.title']").next("div").css("color",'#ccc');
		$("input[name='activity.address']").next("div").text("");
		$("input[name='activity.address']").next("div").css("color",'#ccc');
		$("input[name='activity.start_time']").next("div").text("");
		$("input[name='activity.start_time']").next("div").css("color",'#ccc');
		$("input[name='activity.end_time']").next("div").text("");
		$("input[name='activity.end_time']").next("div").css("color",'#ccc');
		
		
		var beginDate=$("#start_time").val();  
		 var endDate=$("#end_time").val();  
		 var d1 = new Date(beginDate.replace(/\-/g, "\/"));  
		 var d2 = new Date(endDate.replace(/\-/g, "\/"));  

		  if(beginDate!=""&&endDate!=""&&d1 >=d2)  
		 {  
			  $("input[name='activity.end_time']").next("div").text("结束时间小于开始时间！");
				$("input[name='activity.end_time']").next("div").css("color",'red');
		  return false;
		 }
}
function valide3(){
	$("textarea[name='activity.content']").next("div").text("");
	$("textarea[name='activity.content']").next("div").css("color",'#ccc');
}
</script>

</body>
</html>
