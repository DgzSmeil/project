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
	<h2>销售管理<span>销售详情</span></h2>
</div>	
   <div class="contentpanel">
    	<div class="panel panel-default">
		<div class="panel-body">
	   		<ul class="list-group">
		 	<li class="list-group-item"><div>客户姓名:${customer.name}</div></li>
		    <li class="list-group-item"><div>销售时间:${sale.sale_time}</div></li>
		    <li class="list-group-item"><div>房间名称:${sale.room.name}</div></li>
		    <li class="list-group-item"><div>房间单价:${sale.unit_price}</div></li>
		    <li class="list-group-item"><div>折扣:${sale.discount}</div></li>
		    <li class="list-group-item"><div>总价格:${sale.total_cost}</div></li>
		    <li class="list-group-item"><div><div>员工姓名:${employee.name}</div></div></li>
		    <li class="list-group-item"><div>创建时间:${sale.created_time}</div></li>
		    <li class="list-group-item"><div>状态:
	   			<s:if test='sale.status=="Y"'>
					激活
				</s:if>
				<s:if test='sale.status=="N"'>
					冻结
				</s:if>
	   		</div></li>
		 </ul>
      </div>
      <div class="panel-footer"></div>
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
