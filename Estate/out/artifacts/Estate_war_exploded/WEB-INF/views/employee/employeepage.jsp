<%@page import="com.gs.pojo.Agency"%>
<%@page import="com.gs.pojo.Employee"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
<script src="<%=path %>/js/sweetalert-dev.js"></script>
<link href="<%=path %>/css/sweetalert.css" rel="stylesheet">
</head>

<body style="background-color:white">

<div class="pageheader">
	<h2>账户设置<span>个人信息</span></h2>
</div>

<div class="contentpanel">
    	<div class="panel panel-default">
		<div class="panel-body">
		
			<table class="table table-hover">
				<tr>
					<td rowSpan="2">头像:<img src="<%=path %>/upload/${employee.headicon}" class="img-rounded"  style="width:80px;height:80px"/></td>
					<td>姓名:${employee.name}</td>
					<td>性别:${employee.gender}</td>
				</tr>
			
				<tr>
					<td>邮箱:${employee.email}</td>
					<td>手机号:${employee.phone}</td>
				</tr>
				<tr>
					<td>QQ:${employee.qq}</td>
					<td>微信:${employee.wechat}</td>
					<td>地址:${employee.address}</td>
				</tr>
				<tr>
					<td>基本工资:${employee.basic_salary}</td>
					<td>入职时间:${employee.created_time}</td>
					<td>状态:
					<s:if test='employee.status=="Y"'>
						在职
					</s:if>
					<s:if test='employee.status=="N"'>
						离职
					</s:if>
					</td>
				</tr>
				<tr>
					<td>工作经验描述:${employee.exp}</td>
					<td>个人说明:${employee.des}</td>
					<td>简介:${employee.intro}</td>
				</tr>
				
				<tr>
					<td>所属经销商:${agency.name}</td>
					<td>负责的楼盘:${buildings.name}</td>
				</tr>
			</table>
			 
		</div>
		<!-- 
		<ul class="list-group">
		 	<li class="list-group-item"></li>
		    <li class="list-group-item">工作经验描述:${employee.exp}</li>
		    <li class="list-group-item">个人说明:${employee.des}</li>
		    <li class="list-group-item">简介:${employee.intro}</li>
		    <li class="list-group-item">所属经销商:${employee.angency_id}</li>
		    <li class="list-group-item">负责的楼盘:${employee.building_id}</li>
		 </ul>
		 -->
	</div>
	
</div>

	
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
<s:if test="#request.success!=null">
<script type="text/javascript">
	swal("提示","${success}","success");
</script>
</s:if>

</body>
</html>
