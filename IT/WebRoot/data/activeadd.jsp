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
		if(form1.activityname.value==""){
			alert("活动名称不能为空！");
			form1.activityname.focus();
			return false;
		}
		if(form1.activitydesc.value==""){
			alert("活动记录不能为空！");
			form1.activitydesc.focus();
			return false;
		}
		if(form1.activityusername.value==""){
			alert("活动主管不能为空！");
			form1.activityusername.focus();
			return false;
		}
		if(form1.activitydate.value==""){
			alert("活动时间不能为空！");
			form1.activitydate.focus();
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
		<form method="post" name="form1" class="form-x" action="<%=basePath %>activeservlet?order=activeadd" onsubmit="return check();">
		<div class="form-group">
			<div class="label">
	          <label>活动名称：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="activityname">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>活动记录：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="activitydesc" >
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>活动主管：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="activityusername" >
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>活动时间：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="activitydate" >
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