<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/new_file.css">
		<script src="<%=basePath %>js/pie.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#code").bind("click",function(){
					$("#pie_canvas").css("display","block");
				});
			
			});
		
		</script>
		<title>IT课堂销售报表</title>
	</head>
	<body>
		<h1>2017年6月基本数据及饼图比例&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
		<div id="my_container" style="width:600px; height:490px; margin-left: 500px;margin-top: -30px;">
			<canvas id="pie_canvas" style="display:none"></canvas>
		</div>
		<div class="tab_width">
			<b class="t1"></b><b class="t2"></b><b class="t3"></b><b class="t4"></b>
			<div class="tab">
				<table border="1">
					<tr>
						<td>产品名称</td>
						<td>销售数量</td>
						<td>访客量</td>
						<td>销售额</td>
					</tr>
					<tr class="bg1">
						<td>系统运维</td>
						<td>105</td>
						<td>600</td>
						<td>63000</td>
					</tr>
					<tr class="bg2">
						<td>云计算</td>
						<td>80</td>
						<td>13900</td>
						<td>11120</td>
					</tr>
					<tr class="bg1">
						<td>大数据</td>
						<td>12600</td>
						<td>55000</td>
						<td>693000</td>
					</tr>
					<tr class="bg2">
						<td>Web开发</td>
						<td>9800</td>
						<td>35000</td>
						<td>608800</td>
					</tr>
					<tr class="bg1">
						<td>编程语言</td>
						<td>45</td>
						<td>950</td>
						<td>4275</td>
					</tr>
					<tr class="bg2">
						<td>软件测试</td>
						<td>78</td>
						<td>890</td>
						<td>6942</td>
					</tr>
				</table>
			</div>
			<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</div>
		<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div><input type="button" value="生成报表" id="code"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="策划生成" onclick="alert('小T提示：\n从本月销售额，和饼图比例来看，大数据,web开发占据主导，访客量和销售额有了新的突破！应积极扩大这两种课程的影响力，不可忽略云计算的影响力');" id="getidea"/></div>
	</body>
</html>