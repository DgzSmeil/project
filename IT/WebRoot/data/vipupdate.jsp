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
		if(form1.name.value==""){
			alert("城市名称不能为空！");
			form1.name.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>VIP的修改</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>vipservlet?order=updatesave" onsubmit="return check();">
		<input type="hidden" name="VIPid" value="${viBean.VIPid}">
		<div class="form-group">
			<div class="label">
	          <label>VIP类型:</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="VIPleibie" data-validate="required:请填写VIP类型" value="${viBean.VIPleibie}">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
     		<div class="label">
	          <label>VIP购买金额:</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="VIPmoney" data-validate="required:请填写VIP购买金额" value="${viBean.VIPmoney}">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
     		<div class="label">
	          <label>VIP原金额:</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="VIPsrcmoney" data-validate="required:请填写VIP原金额" value="${viBean.VIPsrcmoney}">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
     		<div class="label">
	          <label>VIP折扣:</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="VIPsell" data-validate="required:请填写VIP折扣" value="${viBean.VIPsell}">
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