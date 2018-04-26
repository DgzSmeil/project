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
			if(form1.teachername.value==""){
				alert("教师名称不能为空！");
				form1.teachername.focus();
				return false;
			}
			if(form1.teacherpassword.value==""){
				alert("教师密码不能为空！");
				form1.teacherpassword.focus();
				return false;
			}
			if(form1.teacherpassword1.value==""){
				alert("确认密码不能为空！");
				form1.teacherpassword1.focus();
				return false;
			}
			if(form1.teacherpassword.value!=form1.teacherpassword1.value){
				alert("教师密码和确认密码不一致！");
				return false;
			}
			if(form1.teachermobile.value==""){
				alert("教师Tel不能为空！");
				form1.teachermobile.focus();
				return false;
			}
			if(isNaN(form1.teachermobile.value) || form1.teachermobile.value.length>11 || form1.teachermobile.value.length<0){
				alert("教师Tel只能为11位的数字！");
				form1.studentname.focus();
				return false;
			}
			if(form1.teacheremail.value==""){
				alert("教师邮箱不能为空！");
				form1.teacheremail.focus();
				return false;
			}
			if(form1.teacherjianjie.value==""){
				alert("教师简介不能为空！");
				form1.teacherjianjie.focus();
				return false;
			}
			if(form1.teacheredution.value==""){
				alert("教师学历不能为空！");
				form1.teacheredution.focus();
				return false;
			}
			if(form1.teacherjiaolin.value==""){
				alert("教师教龄不能为空！");
				form1.teacherjiaolin.focus();
				return false;
			}
			if(form1.teacherspecial.value==""){
				alert("教师专长不能为空！");
				form1.teacherspecial.focus();
				return false;
			}
			if(form1.teacherbanknumber.value==""){
				alert("教师银行账户不能为空！");
				form1.teacherbanknumber.focus();
				return false;
			}
			if(form1.teacherbanknumber.value==""){
				alert("教师银行户主不能为空！");
				form1.teacherbanknumber.focus();
				return false;
			}
			if(form1.teacheraddress.value==""){
				alert("教师地址不能为空！");
				form1.teacheraddress.focus();
				return false;
			}
			var filename = form1.teacherpictureurl.value;
			var port = filename.indexOf(".")+1;
			if(port>0){
				filename = filename.substring(port);
				if(filename!="jpg" && filename!="JPG" && filename!="png" && filename!="PNG"){
					alert("文件上传只支持jsp,png格式");
					return false;
				}
			}
			return true;
		}
	</script>
	<style type="text/css">
			a{
				border: 1px solid #0090ff;
				width:80px; 
				color: #164a84;
				height:30px; 
				line-height: 30px;
				margin-right: 5px;
				padding: 5px 10px;
				text-align: center;
				font-size: 16px;
			}
			td{
				color: #164a84;
				height:30px; 
				font-size: 24px;
			}
		</style>
  </head>
  
  <body onload="setup();preselect('江西省');promptinfo();">

  <form name="form1" method="post" action="<%=basePath %>teacherservlet?order=updatesave" onsubmit="return check();">
  <h1 align='center'>教师信息的新增</h1>
  <input type="hidden" name="teacherid" value="${teacherbean.teacherid}">
  <table align="center" border="1">
  		<tr >
  		
  			<td width="120">教师昵称:</td><td><input type="text" name="teachername" style="width:260px;height=35px" value="${teacherbean.teachername}"></td>
  			<td>教师Tel:</td><td><input type="text" name="teachermobile" style="width:260px;height=35px"  value="${teacherbean.teachermobile}"></td>
  		</tr>
  		
  		<tr>
  			<td>教师性别:</td>
  			<td>
  				<c:if test="${teacherbean.teachersex==0}">
  					<input type="radio" name="teachersex" value="0" checked="checked" style="height=35px">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="teachersex" value="1" style="width:30px;height=30px">女
  				</c:if>
  				<c:if test="${teacherbean.teachersex!=0}">
  					<input type="radio" name="teachersex" value="0" style="height=35px">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="teachersex" value="1" style="width:30px;height=30px" checked="checked" >女
  				</c:if>
  			</td>
  			<td>教师邮箱:</td><td><input type="text" name="teacheremail" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teacheremail}"></td>
  		</tr>
  		
  		<tr>
  			<td>教师简介:</td><td><input type="text" name="teacherjianjie" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teacherjianjie}"></td>
  			<td>教师学历:</td><td><input type="text" name="teacheredution" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teachereducation}"></td>
  		</tr>
  		
  		<tr>
  			<td>教师教龄:</td><td><input type="text" name="teacherjiaolin" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teacherjiaolin}"></td>
  			<td>教师专长:</td><td><input type="text" name="teacherspecial" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teacherspecial}"></td>
  		</tr>
  		
  		<tr>
  			<td>教师头像:</td><td><input type="file" name="teacherpictureurl" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teacherpictureurl}"></td>
  			<td>教师等级:</td>
  			<td>
  				<select name="greadid" style="width:260px;height=35px;border-bottom-style: solid;">
  					<c:forEach items="${greadlist}" var="g">
  						<c:if test="${g.greadid == teacherbean.gradeid}">
  							<option value="${g.greadid}" style="width:260px;height=35px;border-bottom-style: solid;" selected="selected">${g.greadname}</option>
  						</c:if>
  						<c:if test="${g.greadid != teacherbean.gradeid}">
  							<option value="${g.greadid}" style="width:260px;height=35px;border-bottom-style: solid;">${g.greadname}</option>
  						</c:if>
  					</c:forEach>
  				</select>
  			</td>
  		</tr>
  		<tr>
  			<td>银行名称:</td>
  			<td>
  				<select name="bankid" style="width:260px;height=35px;border-bottom-style: solid;">
  					<c:forEach items="${banklist}" var="b">
	  					<c:if test="${b.bank_id == teacherbean.bankid}">
	  						<option value="${b.bank_id}" style="width:260px;height=35px;border-bottom-style: solid;" selected="selected">${b.bank_name}</option>
	  					</c:if>
	  					<c:if test="${b.bank_id != teacherbean.bankid}">
	  						<option value="${b.bank_id}" style="width:260px;height=35px;border-bottom-style: solid;">${b.bank_name}</option>
	  					</c:if>
  					</c:forEach>
  				</select>
  			</td>
  			<td>银行账户:</td><td><input type="text" name="teacherbanknumber" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teacherbanknumber}"></td>
  		</tr>
  		<tr>
  			<td>银行户主:</td><td><input type="text" name="teacherbankname" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teacherbankname}"></td>
  			<td>教师地址:</td><td><input type="text" name="teacheraddress" style="width:260px;height=35px;border-bottom-style: solid;"  value="${teacherbean.teacheraddress}"></td>
  		</tr>
    	<tr><td colspan="4" align="center"><input type="submit" name="sub" value="  新  增  " style="width:150px;height=35px;background-color: #00ffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="re" value="  重  置  " style="height=35px;background-color: bluepurple;width:150px;height=35px;background-color: #00ffff;"></td></tr>
  </table>
  </form>
  </body>
</html>
