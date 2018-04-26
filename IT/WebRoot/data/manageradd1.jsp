<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
	<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
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
</head>
<body>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>活动的添加</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>managerservlet?order=manageradd" onsubmit="return check();">
		<div class="form-group">
			<div class="label">
	          <label>管理员账号：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="manager_account">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>管理员密码：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="manager_password" >
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>确认该密码：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="manager_password1" >
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>管理员名称：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="manager_name" >
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>管理员性别：</label>
	        </div>
	        <div class="field">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="manager_sex" value="0" checked="checked" style="height=35px">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="manager_sex" value="1" style="width:30px;height=30px">女	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>管理员 Tel：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="manager_contact" >
	        <div class="tips"></div>
	        </div>
     	</div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">确认添加</button> <button class="button bg-main icon-check-square-o" type="reset">重置</button>
        </div>
      </div>
</div>
<script type="text/javascript">
function del(id,mid){
	if(confirm("您确定要删除吗?")){			
		
	}
}
</script>
</body>
</html>