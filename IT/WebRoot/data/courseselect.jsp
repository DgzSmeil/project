<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>课程列表查询</title>
		 <link rel="stylesheet" type="text/css" href="css/style.css" />
	<!-- 引用js -->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	</head>
  <body  class='box box-3'>
	<h1 align="center">课程信息览表</h1>
	<div style="text-align:center"><a href="<%=basePath%>courseservlet?order=add" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;"> 新 增</a>&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<table align='center' width='1100' border="1">
		<tr height='40' style="border-style:double;">
			<th align='center'>课程编号</th>
			<th align='center'>课程名称</th>
			<th align='center'>图片网址</th>
			<th align='center'>课程寄语</th>
			<th align='center'>课程介绍</th>
			<th align='center'>讲师编号</th>
			<th align='center'>课程数量</th>
			<th align='center'>课程价格</th>
			<th align='center'>课程优惠</th>
			<th align='center'>是否有效</th>
			<th align='center'>发布时间</th>
			<th align='center'>发布人名</th>
			<th align='center'>课程排名</th>
			<th align='center' >操作</th>
		</tr>
		<c:forEach items="${courselist}" var="y">
			<tr height='40'>
				<td align='center'>${y.course_id}</td>
				<td align='center'>${y.course_name}</td>
				<td align='center'>${y.picture_url}</td>
				<td align='center'>${y.one_word}</td>
				<td align='center'>${y.introduce}</td>
				<td align='center'>${y.teacher_id}</td>
				<td align='center'>${y.course_count}</td>
				<td align='center'>${y.price}</td>
				<td align='center'>${y.discount}</td>
				<td align='center'>
					<c:if test="${y.effective==1}">
						有效
					</c:if>
					<c:if test="${y.effective!=1}">
						无效
					</c:if>
				</td>
				<td align='center'>${y.replay_date}</td>
				<td align='center'>${y.replay_username}</td>
				<td align='center'>${y.seq}</td>
				<td align="center">
					<a href="<%=basePath %>courseservlet?courseid=${y.course_id}&order=update"> 修 改 </a>&nbsp;&nbsp;
					<a href="<%=basePath %>courseservlet?courseid=${y.course_id}&order=delete" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}"> 删 除 </a>
					<a href="<%=basePath %>courseservlet?courseid=${y.course_id}&order=shenhe"> 提交审核 </a>
				</td>
			</tr>
		</c:forEach>
	</table>
    <br>
    <div align="center" style="font-size:18px">
	    <b style="border: 1px solid #0090ff; color: #164a84; height:30px; line-height: 30px; margin-right: 5px; padding: 5px 10px; text-align: center;font-size: 16px;">总记录数&nbsp;&nbsp;${pager.pagebarsum }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <b style="border: 1px solid #0090ff; color: #164a84; height:30px; line-height: 30px; margin-right: 5px; padding: 5px 10px; text-align: center;font-size: 16px;">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=basePath %>courseservlet?order=list&currenpage=1&handle=firstpage" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=basePath %>courseservlet?order=list&currenpage=${pager.currentpage }&handle=uppage" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=basePath %>courseservlet?order=list&currenpage=${pager.currentpage }&handle=downpage" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=basePath %>courseservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
  </body>
</html>
