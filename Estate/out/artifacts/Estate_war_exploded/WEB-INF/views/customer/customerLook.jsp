<%@page import="com.gs.pojo.Agency"%>
<%@page import="com.gs.pojo.Employee"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
 <link rel="shortcut icon" href="<%=path %>images/favicon.png" type="image/png">

 <title>房天下后台管理</title>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
</head>

<body style="background-color:white">

<div class="pageheader">
	<h2 align="center">客户全部信息</h2>
</div>

<div class="contentpanel">
    	<div class="panel panel-default">
		<div class="panel-body">
			<table class="table table-hover">
				<tr>
					
					<td>姓名:${customer.name}</td>
					<td>性别:${customer.gender}</td>
					<td>生日:${customer.birthday}</td>
				</tr>
				<tr>
					<td>身份证号:${customer.identity_id}</td>
					<td>邮箱:${customer.email}</td>
					<td>手机号:${employee.phone}</td>
				</tr>
				<tr>
					<td>地址:${customer.address}</td>
					<td>用户类型:${customer.customer_type}</td>
					<td>购房人姓名:${customer.together}</td>
				</tr>
				<tr>
					<td>购房合同文档:${customer.contract}</td>
					<td>电子档案路径:${customer.archives}</td>
					<td>所属员工:${employee.name}</td>
				</tr>
				<tr>
					<td>创建时间:${customer.created_time}</td>
					<td rowspan="2">状态:
					<s:if test='customer.status=="Y"'>
						激活
					</s:if>
					<s:if test='customer.status=="N"'>
						冻结
					</s:if>
					</td>
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

</body>
</html>
