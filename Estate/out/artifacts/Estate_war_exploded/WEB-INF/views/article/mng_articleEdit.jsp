<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<title>房天下后台管理</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <link rel="shortcut icon" href="images/favicon.png" type="image/png">
	    <link href="<%=path %>/css/style.default.css" rel="stylesheet">
	    <link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
	    <script src="<%=path %>/js/sweetalert-dev.js"></script>
	    <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
	    <link rel="stylesheet" href="<%=path %>/css/main.css" />
	    <link rel="stylesheet" href="<%=path %>/css/bootstrap-select.css" />
	    <script src="<%=path %>/js/bootstrap-select.css"></script>
        <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
	    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
    </head>
	<body style="background-color: white">
	<div class="pageheader">
		<h2><i class="fa fa-th-list"></i>文章管理 <span>所有文章</span><span>修改</span></h2>
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
				  <img id="img" src="<%=path%>/upload/${article.logo }" class="img-rounded"  onclick="F_Open_dialog()" style="width:360px;height:150px">
				  <input type="hidden" id="headicon2" value="${article.logo }" name="article.logo">
				  <input type="file" id="headicon" style="display:none" name="upload" value="${article.logo }">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">文章标题：</label>
				  <div class="col-sm-4">
					<input type="text" id="title" name="article.title" onblur="valide2();" value="${article.title}" placeholder="请输入类别名称" data-placement="right" class="form-control tooltips">
				  	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">文章类别：</label>
				  <div class="col-sm-4">
				  	 <select id="article_type" name="article.article_type">
					 	<s:iterator value="atcTypeList" id="d">
					 			<option value="${d.name }" selected>${d.name }</option>
		                </s:iterator>
				  	</select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">文章摘要：</label>
				  <div class="col-sm-4">
					<input type="text" id="abstracts" name="article.abstracts" onblur="valide2();" value="${article.abstracts}" placeholder="请输入类别名称" data-placement="right" title="与实际类别标题保持一致" class="form-control tooltips">
				  	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">文章内容：</label>
				  <div class="col-sm-4">
				  	<textarea  id="content" name="article.content" class="form-control" onblur="valide3();" style="width:800px;height:500px;">${article.content}</textarea>
				  	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button  class="btn btn-primary btn-lg" id="btn_article" onclick="return valide();"> 确定 </button>&nbsp;
				  </div>
				</div>
				<br/>
			  </form>
			</div><!-- panel-body -->
		</div>
</div><!-- contentpanel -->
	

 <script src="<%=path %>/js/bootstrap-select.js"></script>
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
<script type="text/javascript">
    var ue = UE.getEditor('content');
</script>
<script>
jQuery(document).ready(function(){
    "use strict";
  // Tags Input
  jQuery('#tags').tagsInput({width:'auto'});
  jQuery('#open_date').datepicker();
  
  $("#article_type option[value='${article.article_type}']").attr("selected","selected"); 
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

	  function valide(){
			if($("input[name='article.title']").val().length==0){				
				$("input[name='article.title']").focus();
				$("input[name='article.title']").next("div").text("此处不能为空");
				$("input[name='article.title']").next("div").css("color",'red');
				return false;
			}else if($("input[name='article.abstracts']").val().length==0){				
					$("input[name='article.abstracts']").focus();
					$("input[name='article.abstracts']").next("div").text("此处不能为空");
					$("input[name='article.abstracts']").next("div").css("color",'red');
					return false;
			}else if($("textarea[name='article.content']").val().length==0){				
					$("textarea[name='article.content']").focus();
					$("textarea[name='article.content']").next("div").text("此处不能为空");
					$("textarea[name='article.content']").next("div").css("color",'red');
					return false;
			}
	}
		function valide2(){
				$("input[name='article.title']").next("div").text("");
				$("input[name='article.title']").next("div").css("color",'#ccc');
				$("input[name='article.abstracts']").next("div").text("");
				$("input[name='article.abstracts']").next("div").css("color",'#ccc');
		}
		function valide3(){
			$("textarea[name='article.content']").next("div").text("");
			$("textarea[name='article.content']").next("div").css("color",'#ccc');
	}
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
