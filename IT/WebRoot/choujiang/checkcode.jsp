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
<link rel="stylesheet" href="<%=basePath %>data/css/pintuer.css">
<link rel="stylesheet" href="<%=basePath %>datacss/admin.css">
<script src="<%=basePath %>data/js/jquery.js"></script>
<script src="<%=basePath %>data/js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>密码的修改</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>studentservlet?order=checkbirthday" onsubmit="return check();">
     	<div class="form-group">
	        <div class="label">
	          <label>请输入抽奖编码:</label>
	        </div>
	        <div class="field">
	  			<input type="text" style="width:200px" class="input w50" placeholder="请输入抽奖编码"  name="newpassword"  data-validate="required:请输入抽奖编码">
	        <div class="tips"></div>
	        </div>
     	</div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">确认验证</button> <button class="button bg-main icon-check-square-o" type="reset">重置</button>
        </div>
<script type="text/javascript">
function del(id,mid){
	if(confirm("您确定要删除吗?")){			
		
	}
}
</script>
</body>
</html>