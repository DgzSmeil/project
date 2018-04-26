<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
    <head>
	    	<script>
	    	window.UEDITOR_HOME_URL = "/Estate/ueditor/";
	    	</script>
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
  <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
   <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
   <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
    </head>

<body style="background-color: white">


<div class="pageheader">
		<h2><i class="fa fa-th-list"></i>广告管理 <span>所有广告</span><span>新增</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/ads/adsAdd" id="form1" enctype="multipart/form-data">
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">广告图片：</label>
				  <div class="col-sm-4">
				  <p id="addp"></p>
				  <input type="file" id="upload" style="display:none" name="upload" onclick="addElementImg('addp')">
				  <span  class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
				  		选择图片
				  </span>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">广告标题：</label>
				  <div class="col-sm-4">
					<input type="text" id="title" name="ads.title" onblur="valide2();" placeholder="请输入广告标题"  data-placement="right" title="与实际标题保持一致" class="form-control tooltips">
				  	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">显示顺序：</label>
				  <div class="col-sm-4">
				  	 <select class="select2" name="ads.show_status" data-placement="right"  title="与实际类别标题保持一致" class="form-control tooltips">
		                 <option value="Y">从左到右</option>
		                 <option value="N">从上到下</option>
				  	</select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">是否显示：</label>
				  <div class="col-sm-4">
				  	<select class="select2" name="ads.show_order" data-placement="right" title="与实际类别标题保持一致" class="form-control tooltips" >
		                 <option value="0">显示</option>
		                 <option value="1">不显示</option>
				  	</select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">广告内容：</label>
				  <div class="col-sm-4">
					<textarea id="content" name="ads.content" onblur="valide3();" style="width:800px;height:600px;" placeholder="请输入广告内容" data-placement="right" title="与实际内容保持一致" class="form-control tooltips"></textarea>
				 	<div class="col-sm-20 tips"></div>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button  class="btn btn-primary btn-lg" id="btn_ads" onclick="return valide();"> 添加 </button>&nbsp;
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
<script type="text/javascript">
    var ue = UE.getEditor('content');
</script>
<script>
var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:360px;height:150px");
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
	
	  function valide(){
			if($("input[name='ads.title']").val().length==0){				
				$("input[name='ads.title']").focus();
				$("input[name='ads.title']").next("div").text("此处不能为空");
				$("input[name='ads.title']").next("div").css("color",'red');
				return false;
			}else if($("input[name='ads.ad_url']").val().length==0){				
					$("input[name='ads.ad_url']").focus();
					$("input[name='ads.ad_url']").next("div").text("此处不能为空");
					$("input[name='ads.ad_url']").next("div").css("color",'red');
					return false;
			}else if($("textarea[name='ads.content']").val().length==0){
					$("textarea[name='ads.content']").focus();
					$("textarea[name='ads.content']").next("div").text("此处不能为空");
					$("textarea[name='ads.content']").next("div").css("color",'red');
					return false;
			}
	}
		function valide2(){
				$("input[name='ads.title']").next("div").text("");
				$("input[name='ads.title']").next("div").css("color",'#ccc');
				$("input[name='ads.ad_url']").next("div").text("");
				$("input[name='ads.ad_url']").next("div").css("color",'#ccc');
		}
		function valide3(){
			$("textarea[name='ads.content']").next("div").text("");
			$("textarea[name='ads.content']").next("div").css("color",'#ccc');
	}
</script>
<script type="text/javascript">
  $("#back").click(function(){
		window.history.back(-1);
	})
</script>

</body>
</html>
