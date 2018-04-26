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
			if(form1.manager_account.value==""){
				alert("管理员账号不能为空！");
				form1.manager_account.focus();
				return false;
			}
			if(isNaN(form1.manager_account.value)){
				alert("管理员账号含有非法字符！");
				form1.manager_account.focus();
				form1.manager_account.value="";
				return false;
			}
			if(form1.manager_password.value==""){
				alert("管理员密码不能为空！");
				form1.manager_password.focus();
				return false;
			}
			if(form1.manager_password1.value==""){
				alert("确认密码不能为空！");
				form1.manager_password1.focus();
				return false;
			}
			if(form1.manager_password1.value!=form1.manager_password.value){
				alert("管理员密码和确认密码不一致！");
			}
			if(form1.manager_name.value==""){
				alert("管理员名称不能为空！");
				form1.manager_name.focus();
				return false;
			}
			if(form1.manager_contact.value==""){
				alert("管理员Tel不能为空！");
				form1.manager_contact.focus();
				return false;
			}
			if(isNaN(form1.manager_contact.value) || form1.manager_contact.value.length>11 || form1.manager_contact.value.length<0){
				alert("管理员Tel只能为11位的数字！");
				form1.manager_contact.focus();
				form1.manager_contact.value="";
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

  <form name="form1" method="post" action="<%=basePath %>managerservlet?order=manageradd" onsubmit="return check();">
  <h1 align='center'>管理员信息的新增</h1>
  		<div >
  		管理员账号:<input type="text" name="manager_account" style="width:260px;height=35px">
  		</div>
  		<br/>
  		<div>
  			管理员密码:<input type="password" name="manager_password" style="width:260px;height=35px">
  		</div>
  		<br/>
  		<div>
  			确认该密码:<input type="password" name="manager_password1" style="width:260px;height=35px">
  		</div>
  		<br/>
  		<div>
  			管理员名称:<input type="text" name="manager_name" style="width:260px;height=35px;border-bottom-style: solid;" >
  		</div>
  		<br/>
  		<div>
  			管理员性别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="manager_sex" value="0" checked="checked" style="height=35px">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="manager_sex" value="1" style="width:30px;height=30px">女
  		</div>
  		<br/>
  		<div>
  			管理员 Tel:<input type="text" name="manager_contact" style="width:260px;height=35px">
  		</div>
  		<br/>
    	<div><input type="submit" name="sub" value="  新  增  " style="width:150px;height=35px;background-color: #00ffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="re" value="  重  置  " style="height=35px;background-color: bluepurple;width:150px;height=35px;background-color: #00ffff;"></div>
  </form>
  </body>
</html>
