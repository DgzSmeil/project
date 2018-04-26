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
  <link type="text/css" rel="stylesheet" href="<%=path %>/ueditor/third-party/video-js/video-js.css"/>
<script type="text/javascript" src="<%=path %>/ueditor/third-party/video-js/video.js"></script>
    </head>
<style>
    .ht {
      padding-top: 10px;
    }
  </style>
<body style="background-color: white">


<div class="pageheader">
		<h2><i class="fa fa-th-list"></i>文章管理 <span>所有文章</span><span>详细资料</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/article/articleEdit" id="form1" enctype="multipart/form-data">

			  	<input type="hidden" name="article.id" value="${article.id}">
			  	<input type="hidden" name="article.status" value="${article.status}">
			  	<input type="hidden" name="article.created_time" value="${article.created_time}">
			  	
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">文章图片：</label>
				  <div class="col-sm-4">
				  <img id="img" src="<%=path%>/upload/${article.logo }" class="img-rounded"   style="width:360px;height:150px">
				  <input type="hidden" id="headicon2" value="${article.logo }" name="article.logo" readonly="true" >
				  <input type="file" id="headicon" style="display:none" name="upload" value="${article.logo }" readonly="true" >
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">文章标题：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${article.title}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">文章摘要：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${article.abstracts}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">文章内容：</label>
				  <div class="col-sm-9">
				  	<label class="col-sm-55 ht">${article.content}</label>
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


<script>
jQuery(document).ready(function(){
    
    "use strict";
  
  // Tags Input
  jQuery('#tags').tagsInput({width:'auto'});
  

  jQuery('#open_date').datepicker();
  
 
});
</script>

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
	$(function(){
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		});
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
