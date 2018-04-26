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
			if(form1.studentname.value==""){
				alert("学生名称不能为空！");
				form1.studentname.focus();
				return false;
			}
			if(form1.studentpassword.value==""){
				alert("学生密码不能为空！");
				form1.studentpassword.focus();
				return false;
			}
			if(form1.studentpassword1.value==""){
				alert("确认密码不能为空！");
				form1.studentpassword1.focus();
				return false;
			}
			if(form1.studentpassword.value!=form1.studentpassword1.value){
				alert("学生密码和确认密码不一致！");
				return false;
			}
			if(form1.studentmobile.value==""){
				alert("学生Tel不能为空！");
				form1.studentmobile.focus();
				return false;
			}
			if(isNaN(form1.studentmobile.value) || form1.studentmobile.value.length>11 || form1.studentmobile.value.length<0){
				alert("学生Tel只能为11位的数字！");
				form1.studentname.focus();
				return false;
			}
			if(form1.studentemail.value==""){
				alert("学生邮箱不能为空！");
				form1.studentemail.focus();
				return false;
			}
			return true;
		}
		function checkcity(provinceid){
			var studentname = form1.studentname.value;
			var studentpassword = form1.studentpassword.value;
			var studentpassword1 = form1.studentpassword1.value;
			var studentmobile = form1.studentmobile.value;
			var studenthomeaddress = form1.studenthomeaddress.value;
			var studentemail = form1.studentemail.value;
			var studentsex = document.getElementsByName("studentsex");
			var sex="";
			for(var i=0;i<studentsex.length;i++ ){
				if(studentsex[i].checked == true ){
					sex = studentsex[i].value;
				}
			}
    		location.href="<%=basePath%>studentservlet?order=add&provinceid="+provinceid+"&studentname="+studentname+"&studentpassword="+studentpassword+"&studentpassword1="+studentpassword1+"&studentmobile="+studentmobile+"&studentemail="+studentemail+"&studentsex="+sex+"&studenthomeaddress="+studenthomeaddress;
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
  
  <body>
  <form name="form1" method="post" action="<%=basePath %>studentservlet?order=addsave" onsubmit="return check();">
  <h1 align='center'>学生信息的新增</h1>
  <table align="center" border="1">
  		<tr>
  			<c:if test="${requestScope.studentname==null}">
  				<td width="120">学生昵称:</td><td><input type="text" name="studentname" style="width:260px;height=35px" value="${requestScope.studentname}"></td>
  			</c:if>
  			<c:if test="${requestScope.studentname!=null}">
  				<td width="120">学生昵称:</td><td><input type="text" name="studentname" style="width:260px;height=35px" value="<%=new String(request.getAttribute("studentname").toString().getBytes("iso-8859-1"),"utf-8") %>"></td>
  			</c:if>
  		</tr>
  		<tr>
  			<td>学生密码:</td><td><input type="password" name="studentpassword" style="width:260px;height=35px" value="${requestScope.studentpassword}"></td>
  		</tr>
  		<tr>
  			<td>确认密码:</td><td><input type="password" name="studentpassword1" style="width:260px;height=35px" value="${requestScope.studentpassword1}"></td>
  		</tr>
  		<tr>
  			<td>学生Tel:</td><td><input type="text" name="studentmobile" style="width:260px;height=35px" value="${requestScope.studentmobile}"></td>
  		</tr>
  		<tr>
  			<td>学生性别:</td>
  			<td>
	  			<c:if test="${requestScope.studentsex == 0}">
	  				<input type="radio" name="studentsex" value="0" checked="checked" style="height=35px">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="studentsex" value="1" style="width:30px;height=30px">女
	  			</c:if>
	  			<c:if test="${requestScope.studentsex == 1}">
	  				<input type="radio" name="studentsex" value="0" style="height=35px">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="studentsex" value="1" style="width:30px;height=30px" checked="checked">女
	  			</c:if>
	  			<c:if test="${requestScope.studentsex != 0}">
	  				<input type="radio" name="studentsex" value="0" style="height=35px" checked="checked">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="studentsex" value="1" style="width:30px;height=30px" >女
	  			</c:if>
	  		</td>
  		</tr>
  		<tr>
  			<td>学生邮箱:</td><td><input type="text" name="studentemail" style="width:260px;height=35px;border-bottom-style: solid;" value="${requestScope.studentemail}"></td>
  		</tr>
  		<tr>
			<td>所在省市:</td>
			<td>
				<select class="select" name="provinceid" id="s1" style="width:60px;height=35px;border-bottom-style: solid;" onchange="checkcity(this.value);">
					<c:forEach items="${provincelist}" var="p">
						<c:if test="${p.provinceid==provinceid}">
							<option style="width:60px;height=35px;border-bottom-style: solid;" value="${p.provinceid}" selected="selected">${p.provinceName}</option>
						</c:if>
						<c:if test="${p.provinceid!=provinceid}">
							<option style="width:60px;height=35px;border-bottom-style: solid;" value="${p.provinceid}">${p.provinceName}</option>
						</c:if>
					</c:forEach>
				</select>
				<select class="select" name="cityid" id="s2">
					<c:forEach items="${citylist}" var="c">
						<option style="width:60px;height=35px;border-bottom-style: solid;" value="${c.cityid}">${c.cityname}</option>
					</c:forEach>
				</select>
			</td>
  		</tr>
  		<tr>
  			<td>学生地址:</td><td><input type="text" name="studenthomeaddress" style="width:260px;height=35px;border-bottom-style: solid;" value="${requestScope.restudenthomeaddress}"></td>
  		</tr>
    	<tr><td colspan="2" align="center"><input type="submit" name="sub" value="  新  增  " style="width:150px;height=35px;background-color: #00ffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="re" value="  重  置  " style="height=35px;background-color: bluepurple;width:150px;height=35px;background-color: #00ffff;"></td></tr>
  </table>
  </form>
  </body>
</html>
