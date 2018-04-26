<%@page import="com.gs.pojo.Employee"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
    <% 
    	Employee employee = (Employee)session.getAttribute("employee");
    %>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
 <head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
 <meta name="description" content="">
 <meta name="author" content="">
 <link rel="shortcut icon" href="<%=path %>images/favicon.png" type="image/png">

 <title>房天下后台管理</title>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">

<link href="<%=path %>/css/sweetalert.css" rel="stylesheet">
</head>

<body style="background-color: white">
<div class="pageheader">
	<h2>账户设置<span>修改密码</span></h2>
	
</div>
	<div class="contentpanel">
     
    	<div class="panel panel-default">
		<div class="panel-body panel-body-nopadding">
		  
		  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/emp/changepwd" id="form1"  enctype="multipart/form-data" style="width:400px;">
			  <input type="hidden" id="id" name="employee.id" value="${employee.id}" />
			  <input type="hidden" id="oldpwd1" value="${employee.pwd}"/>			
			<div class="form-group" id="div1">
			  <label class="col-sm-4 control-label">旧密码：</label>
			  <div class="col-sm-8">
				<input type="password" class="form-control" id="oldpwd" placeholder="输入旧密码">
			  </div>
			</div>

			<div class="form-group" id="div2">
			  <label class="col-sm-4 control-label">新密码：</label>
			  <div class="col-sm-8">
				<input type="password"  class="form-control" id="pwd" name="employee.pwd" placeholder="输入新密码">
			  </div>
			</div>

			
			<div class="form-group" id="div5">
			  <label class="col-sm-4 control-label">确认密码：</label>
			  <div class="col-sm-8">
				<input type="password"  class="form-control" id="pwd1" placeholder="输入确认密码">
			  </div>
			</div>
		   
			<div class="form-group">
			  <label class="col-sm-4 control-label"></label>
			  <div class="col-sm-8">
					<button class="btn btn-primary btn-lg" id="btn_employee">修改</button>
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
<script src="<%=path %>/js/sweetalert-dev.js"></script>
<script>
	$(function(){
		$("#btn_employee").bind("click",function(){
			if($("#oldpwd").val()==""){
				swal("提示","请输入旧密码","info");
				$("#oldpwd").focus();
				return false;
			}else if($("#pwd").val()==""){
				swal("提示","请输入新密码","info");
				$("#pwd").focus();
				return false;
			}else if($("#pwd1").val()==""){
				swal("提示","请输入确认密码","info");
				$("#pwd1").focus();
				return false;
			}else if($("#oldpwd").val()!=$("#oldpwd1").val()){
				swal("警告","旧密码输入错误，请重新输入","error");
				$("#oldpwd").focus();
				return false;
			}else if($("#pwd").val()!=$("#pwd1").val()){
				swal("警告","新密码与确认密码不一致","warning");
				$("#pwd").focus();
				return false;
			}else{
				$("#form1").submit();
			}
			
		});
	})
</script>
<s:if test="#request.msg!=null">
	<script type="text/javascript">
		swal("提示","${msg}","success");
	</script>
</s:if>
</body>
</html>
