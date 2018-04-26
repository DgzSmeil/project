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
	<s:if test="#session.checked=='Y'.toString()">
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>已审核</span> <span>详细资料</span></h2>
	</s:if>
	<s:if test="#session.checked=='N'.toString()">
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>未审核</span><span>详细资料</span></h2>
	</s:if>
	<s:if test="#session.checked=='F'.toString()">
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>未通过</span><span>详细资料</span></h2>
	</s:if>
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
				  <label class="col-sm-3 control-label">商标：</label>
				  <div class="col-sm-4">
				  		<img id="img" src="<%=path%>/upload/${agency.logo }" class="img-rounded" style="width:360px;height:150px">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">名称：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-20 ht">${agency.name}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">邮箱：</label>
				  <div class="col-sm-4">
				 	<label class="col-sm-20 ht">${agency.email}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   

				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">领导人：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-20 ht">${agency.leader}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">手机：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-20 ht">${agency.phone}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">固定电话：</label>
				  <div class="col-sm-4">
				 	<label class="col-sm-20 ht">${agency.tel}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
			<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">地址：</label>
				  <div class="col-sm-4">
				 	<label class="col-sm-55 ht">${agency.address}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">简介：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${agency.intro}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">创建时间：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${agency.created_time}</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">审核意见：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-55 ht">${agency.checked_reason}</label>
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
  $("#back").click(function(){
		window.history.back(-1);
	});

</script>
</body>
</html>
