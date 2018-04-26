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

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
<style>
    .ht {
      padding-top: 10px;
    }
  </style>
<body style="background-color: white" onload="body();">


<div class="pageheader">
		<h2><i class="fa fa-th-list"></i>用户管理 <span>所有用户</span><span>详细资料</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/builds/updateSave" id="form1"  enctype="multipart/form-data">
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">头像：</label>
				  <div class="col-sm-4">
				  		<img id="img" src="<%=path%>/upload/${user.headicon }" class="img-rounded" style="width:200px;height:150px">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
					
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">昵称：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-20 ht">${user.nickname}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">名字：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-20 ht">${user.name}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">性别：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-20 ht">${user.gender}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
			<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">生日：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-20 ht">${user.birthday}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">邮箱：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${user.email}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">手机：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${user.phone}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   

				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">QQ：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${user.qq}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">微信：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${user.wechat}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			
				
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


<script type="text/javascript">
$(document).ready(function(){
  $("#i_down").dblclick(function(){
	  document.getElementById( "iframe1" ).className="dsa";
  });
  $("#back").click(function(){
		window.history.back(-1);
	})
});

</script>

</body>
</html>
