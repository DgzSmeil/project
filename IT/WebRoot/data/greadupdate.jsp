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
		if(form1.greadname.value==""){
			alert("教师名称不能为空！");
			form1.greadname.focus();
			return false;
		}
		if(form1.greadpercent.value==""){
			alert("教师比重不能为空！");
			form1.greadpercent.focus();
			return false;
		}
		if(isNaN(form1.greadpercent.value)){
			alert("教师比重含有非法字符");
			form1.greadpercent.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>教师信息的更改</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>greadservlet?order=greadupdate" onsubmit="return check();">
		 <input type="hidden" name="greadid" value="${greadbean.greadid}">
		 
		 <input type="hidden" name="greadid" value="${greadbean.greadid}">
		<div class="form-group">
        <div class="label">
          <label>教师名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="greadname" data-validate="required:请填写教师名称" value="${greadbean.greadname}">
          <div class="tips"></div>
        </div>
      </div>
     	<div class="form-group">
        <div class="label">
          <label>教师比重：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="greadpercent" data-validate="required:请填写教师比重" value="${greadbean.greadpercent}">
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