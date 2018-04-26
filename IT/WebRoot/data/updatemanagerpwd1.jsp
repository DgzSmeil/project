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
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
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
			if(form1.newpassword.value!=form1.newpassword1.value){
				alert("新密码和确认密码不一致！");
				form1.newpassword.focus();
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
  <div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>密码的修改</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>managerservlet?order=updatepassword" onsubmit="return check();">
  		<input type="hidden" name="managerid" value="${param.managerid}">
		<c:if test="${msg!=null}">
			<script type="text/javascript">
				alert("${msg}");
			</script>
		</c:if>
     	<div class="form-group">
	        <div class="label">
	          <label>请输入旧密码:</label>
	        </div>
	        <div class="field">
	  			<input type="password" class="input w50" placeholder="请输入旧密码"  name="oldpassword"  data-validate="required:请填写旧密码">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
	        <div class="label">
	          <label>请输入新密码:</label>
	        </div>
	        <div class="field">
	  			<input type="password" class="input w50"  placeholder="请输入新密码"  name="newpassword"  data-validate="required:请输入新密码">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
	        <div class="label">
	          <label>请在次输入新密码:</label>
	        </div>
	        <div class="field">
	  			<input type="password" class="input w50"  placeholder="请在次输入新密码"  name="newpassword1"  data-validate="required:请在次输入新密码">
	        <div class="tips"></div>
	        </div>
     	</div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">修改密码</button> <button class="button bg-main icon-check-square-o" type="reset">重置</button>
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
