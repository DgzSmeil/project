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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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

  <form name="form1" method="post" action="<%=basePath %>managerservlet?order=managerupdate" onsubmit="return check();">
  <h1 align='center'>管理员信息的修改</h1>
  	<table border="0" align="center" width="600">
  		<input type="hidden" name="manager_id" value="${managerbean.manager_id}">
  		<tr height="40">
	  		<th>管理员账号</th>
	  		<td><input type="text" name="manager_account" style="width:150px;height=35px" value="${managerbean.manager_account}"></td>
	  		<td><font color="red" size="5">*必填内容</font></td>
  		</tr>
  		<tr height="40">
	  		<th>管理员名称</th>
	  		<td><input type="text" name="manager_name" style="width:150px;height=35px" value="${managerbean.manager_name}"></td>
	  		<td><font color="red" size="5">*必填内容</font></td>
  		</tr>
  		<tr height="40">
	  		<th>管理员性别</th>
	  		<td>
	  			<c:if test="${managerbean.manager_sex==0}">
	  				<input type="radio" name="manager_sex" value="0" checked="checked">男&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="radio" name="manager_sex" value="1">女
	  			</c:if>
	  			<c:if test="${ managerbean.manager_sex != 0}">
	  				<input type="radio" name="manager_sex" value="0">男&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="radio" name="manager_sex" value="1" checked="checked">女
	  			</c:if>
	  		</td>
	  		<td>&nbsp;</td>
  		</tr>
  		<tr height="40">
	  		<th>管理员Tel</th>
	  		<td><input type="text" name="manager_contact" style="width:150px;height=35px" value="${managerbean.manager_contact}"></td>
	  		<td><font color="red" size="5">*输入11位的联系方式</font></td>
  		</tr>
    	<tr height="40"><td colspan="3" align="center"><input type="submit" name="sub" value="  修  改  " style="width:150px;height=35px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="re" value="  重  置  " style="width:150px;height=35px"></td></tr>
    </table>
  </form>
  </body>
</html>
