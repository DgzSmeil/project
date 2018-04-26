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
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>已审核</span> <span>修改</span></h2>
	</s:if>
	<s:if test="#session.checked=='N'.toString()">
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>未审核</span><span>修改</span></h2>
	</s:if>
	<s:if test="#session.checked=='F'.toString()">
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>未通过</span><span>修改</span></h2>
	</s:if>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/agency/agcedit" id="form1"  enctype="multipart/form-data">
				<input type="hidden" id="pwd" name="agency.pwd" value="${agency.pwd}">
				<input type="hidden" id="logo" name="agency.logo" value="${agency.logo}">
				<input type="hidden" id="created_time" name="agency.created_time" value="${agency.created_time}">
				<input type="hidden" id="checked_status" name="agency.checked_status" value="${agency.checked_status}">
				<input type="hidden" id="checked_reason" name="agency.checked_reason" value="${agency.checked_reason}">
				<input type="hidden" id="status" name="agency.status" value="${agency.status}">
				<input type="hidden" id="id" name="agency.id" value="${agency.id}">
				
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
					<input type="text" id="email" name="agency.email"  value="${agency.email}"  data-placement="right"  class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   

				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">领导人：</label>
				  <div class="col-sm-4">
					<input type="text" id="leader" name="agency.leader"  value="${agency.leader}"  data-placement="right"  class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">手机：</label>
				  <div class="col-sm-4">
					<input type="text" id="phone" name="agency.phone"  value="${agency.phone}"  data-placement="right"  class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">固定电话：</label>
				  <div class="col-sm-4">
					<input type="text" id="tel" name="agency.tel"  value="${agency.tel}"  data-placement="right"  class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
			<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">地址：</label>
				  <div class="col-sm-4">
					<input type="text" id="address" name="agency.address"  value="${agency.address}" data-placement="right" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">简介：</label>
				  <div class="col-sm-4">
					<textarea id="intro" name="agency.intro"   data-placement="right"  class="form-control tooltips">${agency.intro}</textarea>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_agency">确定</button>
				  </div>
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

<script src="<%=path %>/js/custom.js"></script>
<script>
	$(function(){
		$("#btn_agency").bind("click",function(){
			if($("#email").val()==""){
				alert("请输入登录邮箱");
				$("#email").focus();
				return;
			}else if($("#name").val()==""){
				alert("请输入公司名称");
				$("#name").focus();
				return;
			}else if($("#leader").val==""){
				alert("请输入申请人姓名");
				$("#leader").focus();
				return;
			}else if($("#tel").val==""){
				alert("请输入固定电话");
				$("#tel").focus();
				return;
			}else if($("#address").val==""){
				alert("请输入公司地址");
				$("#address").focus();
				return;
			}else if($("#phone").val==""){
				alert("请输入手机号码");
				$("#phone").focus();
				return;
			}else if($("#intro").val==""){
				alert("请输入公司简介");
				$("#intro").focus();
				return;
			}else{
				$("#form1").submit();
			}
			
		});
	})


</script>
<script type="text/javascript">
  $("#back").click(function(){
		window.history.back(-1);
	});

</script>

</body>
</html>
