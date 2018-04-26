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
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>我的资料</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>managerservlet?order=managerupdate" onsubmit="return check();">
	  	<input type="hidden" name="manager_id" value="${managerbean.manager_id}">
		<div class="form-group">
			<div class="label">
	          <label>管理员账号：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="manager_account" value="${managerbean.manager_account}">
	        <div class="tips"></div>
	        </div>
     	</div>
     	
     	<div class="form-group">
			<div class="label">
	          <label>管理员名称：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="manager_name" value="${managerbean.manager_name}">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>管理员性别：</label>
	        </div>
	        <div class="field">
			  	<c:if test="${managerbean.manager_sex==0}">
	  				<input type="radio" name="manager_sex" value="0" checked="checked">男&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="radio" name="manager_sex" value="1">女
	  			</c:if>
	  			<c:if test="${ managerbean.manager_sex != 0}">
	  				<input type="radio" name="manager_sex" value="0">男&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="radio" name="manager_sex" value="1" checked="checked">女
	  			</c:if>	        
	  			<div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>管理员Tel：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="manager_contact" value="${managerbean.manager_contact}">
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>管理员类别：</label>
	        </div>
	        <div class="field" >
	        	<c:if test="${managerbean.manager_leibie==0}">
						<label style="font-size:20px;color:blue">普通管理员</label>
					</c:if>
					<c:if test="${managerbean.manager_leibie==1}">
						<label style="font-size:20px;color:red">超级管理员</label>
					</c:if>
					<c:if test="${managerbean.manager_leibie==2}">
						<label style="font-size:20px;color:green">超级管理员申请中。。。</label>
					</c:if>
	        	<div class="tips"></div>
	        </div>
     	</div>
        <div class="field">
          &nbsp;&nbsp;&nbsp;<button class="button bg-main icon-check-square-o" type="submit">确认修改</button> 
          <button class="button bg-main icon-check-square-o" type="reset">重置</button>&nbsp;
          <c:if test="${managerbean.manager_leibie==0}">
          	<a  href="<%=basePath %>managerservlet?order=change&managerid=${managerbean.manager_id}" class="button button-little bg-blue"><span class="icon-wrench"></span> 申请为超级管理员</a> 
          </c:if>
          <c:if test="${managerbean.manager_leibie==2}">
          	<a  href="<%=basePath %>managerservlet?order=changejindu&managerid=${managerbean.manager_id}" class="button button-little bg-blue"><span class="icon-wrench"></span> 查看审核进度</a> 
          </c:if>
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