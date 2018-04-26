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
		
	</script>
</head>
<body>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>我的资料</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>studentservlet?order=send" onsubmit="return check();">
	  	<input type="hidden" name="studentid" value="${studentbean.studentid}">
	  	<input type="hidden" name="studentname" value="${studentbean.studentname}">
		<c:if test="${studentbean.studentemail!=null}">
			<div class="form-group">
				<div class="label">
		          <label>用户邮箱：</label>
		        </div>
		        <div class="field">
		  			<input type="text" class="input w50"  name="email" value="${studentbean.studentemail}">
		        <div class="tips"></div>
		        </div>
     		</div>
		</c:if>
		<c:if test="${studentbean.studentemail==null}">
			<div class="form-group">
				<div class="label">
		          <label>用户Tel：</label>
		        </div>
		        <div class="field">
		  			<input type="text" class="input w50"  name="mobile" value="${studentbean.studentmobile}">
		        <div class="tips"></div>
		        </div>
     		</div>
		</c:if>
		<div class="form-group">
        <div class="label">
          <label>祝福语：</label>
        </div>
        <div class="field">
           <textarea type="text" class="input w50" name="content" style="height:150px;" placeholder="输入祝福语" data-validate="required:请输入输入祝福语"></textarea>
          <div class="tips"></div>
        </div>
      </div> 
        <div class="field">
          &nbsp;&nbsp;&nbsp;<button class="button bg-main icon-check-square-o" type="submit">发送</button> 
          <button class="button bg-main icon-check-square-o" type="reset">重置</button>&nbsp;
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