<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>学生列表查询</title>
	</head>
  <body>
  <c:if test="${msg!=null}">
   		<script type="text/javascript">
   			alert("${msg}");
   		</script>
  </c:if>
	<h1 align="center">用户信息览表</h1>
	<div style="text-align:center"><a href="<%=basePath%>studentservlet?order=add" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;"> 新 增</a>&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<table align='center' width='1100' border="1">
		<tr height='40' style="border-style:double;">
			<th align='center'>用户编号</th>
			<th align='center'>用户名称</th>
			<th align='center'>用户性别</th>
			<th align='center'>用户Tel</th>
			<th align='center'>用户邮箱</th>
			<th align='center'>用户省份</th>
			<th align='center'>用户城市</th>
			<th align='center'>用户地址</th>
			<th align='center'>注册时间</th>
			<th align='center'>用户类别</th>
			<th align='center' >操作</th>
		</tr>
		<c:forEach items="${studentlist}" var="y">
			<tr height='40'>
				<td align='center'>${y.studentid}</td>
				<td align='center'>${y.studentname}</td>
				<td align='center'>
					<c:if test="${y.studentsex ==0 }">
						男
					</c:if>
					<c:if test="${y.studentsex !=0 }">
						女
					</c:if>
				</td>
				<td align='center'>${y.studentmobile}</td>
				<td align='center'>${y.studentemail}</td>
				<td align='center'>${y.provincename}</td>
				<td align='center'>${y.cityname}</td>
				<td align='center'>${y.studenthomeaddress}</td>
				<td align='center'>${y.studentregisterdate}</td>
				<td align='center'>
					<c:if test="${y.leibie ==1 }">
						学生
					</c:if>
					<c:if test="${y.leibie ==0 }">
						教师
					</c:if>
				</td>
				<td align="center">
					<a href="<%=basePath %>studentservlet?studentid=${y.studentid}&order=update"> 修 改 </a>&nbsp;&nbsp;
					<a href="<%=basePath %>studentservlet?studentid=${y.studentid}&order=delete" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}"> 删 除 </a>
					<a href="<%=basePath %>data/updatestudentpwd.jsp?studentid=${y.studentid}"> 修改密码 </a>&nbsp;&nbsp;
				</td>
			</tr>
		</c:forEach>
	</table>
    <br>
    <div align="center" style="font-size:18px">
	    <b style="border: 1px solid #0090ff; color: #164a84; height:30px; line-height: 30px; margin-right: 5px; padding: 5px 10px; text-align: center;font-size: 16px;">总记录数&nbsp;&nbsp;${pager.pagebarsum }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <b style="border: 1px solid #0090ff; color: #164a84; height:30px; line-height: 30px; margin-right: 5px; padding: 5px 10px; text-align: center;font-size: 16px;">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=basePath %>studentservlet?order=list&currenpage=1&handle=firstpage" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=basePath %>studentservlet?order=list&currenpage=${pager.currentpage }&handle=uppage" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=basePath %>studentservlet?order=list&currenpage=${pager.currentpage }&handle=downpage" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=basePath %>studentservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage" style="border: 1px solid #0090ff;width:80px; color: #164a84;height:30px; line-height: 30px;margin-right: 5px;padding: 5px 10px;text-align: center;font-size: 16px;">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
  </body>
</html>
