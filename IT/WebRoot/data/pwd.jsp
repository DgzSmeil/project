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
</head>
<body>
<c:if test="${msg!=null}">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</c:if>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>订单确认</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>courselistservlet?order=qrbuy" onsubmit="return check();">
		<input type="hidden" name="mymoney" value="<%=request.getParameter("mymoney") %>">
		<input type="hidden" name="fangshi" value="<%=request.getParameter("fangshi") %>">
		<input type="hidden" name="code" value="<%=request.getParameter("code") %>">
		<input type="hidden" name="youhuimoney" value="<%=request.getParameter("money") %>">
		<h1>支付金额：<font color="red">￥<%=request.getParameter("mymoney") %></font></h1>
		<h1>优惠金额：<font color="red">￥<%=request.getParameter("money") %></font></h1>
		<div class="form-group">
	        <div class="field">
	  			<input type="password" class="input w50"  name="password" placeholder="填写支付密码" data-validate="required:请填写支付密码">
	        <div class="tips"></div>
	    </div>
     	</div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">确认订单</button> <button class="button bg-main icon-check-square-o" type="reset">忘记密码</button>
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