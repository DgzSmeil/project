<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manageradd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function check(){
			if(form1.oldpassword.value==""){
				alert("旧密码不能为空！");
				form1.oldpassword.focus();
				return false;
			}
			if(form1.newpassword.value==""){
				alert("新密码不能为空！");
				form1.newpassword.focus();
				return false;
			}
			if(form1.newpassword1.value==""){
				alert("确认密码不能为空！");
				form1.newpassword1.focus();
				return false;
			}
			if(form1.oldpassword.value!=form1.newpassword1.value){
				alert("新密码和确认密码不一致！");
				form1.newpassword.focus();
				return false;
			}
			return true;
		}
	</script>
	<style type="text/css">
			a{
				border: 1px solid #0090ff;
				width:80px; 
				color: #164a84;
				height:30px; 
				line-height: 30px;
				margin-right: 5px;
				padding: 5px 10px;
				text-align: center;
				font-size: 16px;
			}
			div{
				color: #164a84;
				height:30px; 
				margin-right: 5px;
				padding: 5px 10px;
				text-align: center;
				font-size: 26px;
			}
		</style>
  </head>
  
  <body>

  <form name="form1" method="post" action="<%=basePath %>managerservlet?order=updatepassword" onsubmit="return check();">
  <h1 align='center'>管理员密码的修改</h1>
  		<div><font color="red" size="3">${msg}</font></div>
  		<input type="hidden" name="managerid" value="${param.managerid}">
  		<div >
  		旧密码:<input type="password" name="oldpassword" style="width:260px;height=35px">
  		</div>
  		<br/>
  		<div>
  		新密码:<input type="password" name="newpassword" style="width:260px;height=35px">
  		</div>
  		<br/>
  		<div>
  		确认密码:<input type="password" name="newpassword1" style="width:260px;height=35px">
  		</div>
  		<br/>
    	<div><input type="submit" name="sub" value="  修  改  " style="width:150px;height=35px;background-color: #00ffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="re" value="  重  置  " style="height=35px;background-color: bluepurple;width:150px;height=35px;background-color: #00ffff;"></div>
  </form>
  </body>
</html>
