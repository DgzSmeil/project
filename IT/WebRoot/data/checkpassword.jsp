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
		if(form1.pwd.value.length!=6){
			alert("支付密码只能为六位数的数字");
			return false;
		}
		if(isNaN(form1.pwd.value)){
			alert("支付密码含有非法字符");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改支付密码</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>studentservlet?order=zhifupwd" onsubmit="return check();">
		<input type="hidden" name="username" value="<%=request.getParameter("username") %>">
		<div class="form-group">
	        <div class="label">
	          <label>支付密码:</label>
	        </div>
	        <div class="field">
	  			<input type="password" class="input w50" placeholder="请输入支付密码" name="pwd" data-validate="required:支付密码只能为6位数的数字">
	        <div class="tips"></div>
	        </div>
     	</div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">确认修改</button> <button class="button bg-main icon-check-square-o" type="reset">重置</button>
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