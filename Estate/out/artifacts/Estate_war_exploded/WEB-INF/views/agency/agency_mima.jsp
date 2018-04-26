<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	Agency agency = (Agency)session.getAttribute("agency");
%>
<%@page import="com.gs.pojo.Agency"%>
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

<body style="background-color:white">

<div class="pageheader">
	<h2> 账号设置</h2>
	
</div>

<div class="contentpanel">
	<!-- content goes here... -->
     
    	<div class="panel panel-default">
		<div class="panel-body panel-body-nopadding">
		  
		  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/agency/updatemima" id="form1"  enctype="multipart/form-data">
			
			  <input type="hidden" id="id" name="agency.id" value="${agency.id }" />
			  <input type="hidden" id="oldpwd2" value="${agency.pwd }" />
		   
			
			<div class="form-group" id="div1">
			  <label class="col-sm-3 control-label">旧密码：</label>
			  <div class="col-sm-4">
				<input type="password" id="oldpwd" placeholder="输入旧密码">
			  </div>
			  <div class="col-sm-4 tips"></div>
			</div>

			<div class="form-group" id="div2">
			  <label class="col-sm-3 control-label">新密码：</label>
			  <div class="col-sm-4">
				<input type="password" id="pwd" name="agency.pwd" placeholder="输入新密码">
			  </div>
			  <div class="col-sm-4 tips"></div>
			</div>

			
			<div class="form-group" id="div5">
			  <label class="col-sm-3 control-label">确认密码：</label>
			  <div class="col-sm-4">
				<input type="password" id="pwd2" placeholder="输入确认密码">
			  </div>
			  <div class="col-sm-4 tips"></div>
			</div>
		   
			<div class="form-group">
			  <label class="col-sm-3 control-label"></label>
			  <div class="col-sm-7">
					<button class="btn btn-primary btn-lg" id="btn_agency"> 修改 </button>&nbsp;
					<button type="button" class="btn btn-default btn-lg" id="btn_back"> 取 消 </button>
			  </div>
			</div>
			<br/>
		   
		  </form>
		</div><!-- panel-body -->
		
	</div>
	
</div><!-- contentpanel -->

	


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>

<script src="<%=path %>/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=path %>/js/fullcalendar.min.js"></script>
<script src="<%=path %>/js/jquery.ui.touch-punch.min.js"></script>

<script src="<%=path %>/js/custom.js"></script>
<script>
	$(function(){
		
		
		$("#btn_agency").bind("click",function(){
			if($("#oldpwd").val()==""){
				swal("注意", "请输入旧密码!", "warning");
				$("#oldpwd").focus();
				return false;
			}else if($("#pwd").val()==""){
				swal("注意", "请输入新密码!", "warning");
				$("#pwd").focus();
				return false;
			}else if($("#pwd2").val()==""){
				swal("注意", "请输入确认密码!", "warning");
				$("#pwd2").focus();
				return false;
			}else if($("#pwd").val()!=$("#pwd2").val()){
				swal("注意", "新密码与确认密码不一致!", "warning");
				$("#pwd").focus();
				return false;
			}else if($("#oldpwd").val()!=$("#oldpwd2").val()){
				swal("注意", "旧密码错误!", "warning");
				$("#oldpwd").focus();
				return false;
			}else{
				$("#form1").submit();
			}
		});
		//返回
		$("#btn_back").click(function(){
			window.history.back(-1);
		})
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
