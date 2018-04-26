<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售图表</title>
<link href="<%=path %>/plugins/highcharts/highcharts.css" rel="stylesheet" />
</head>
<body>
	<input type="hidden" id="val" value="${agency_id }" />
	<div id="column" style="min-width:400px;height:400px"></div>
</body>
<script src="<%=path%>/js/jquery.min.js"></script>
<script src="<%=path%>/plugins/highcharts/highcharts.js"></script>
<script src="<%=path%>/plugins/highcharts/highcharts-zh_CN.js"></script>
<script src="<%=path%>/js/echart.js"></script>
</html>