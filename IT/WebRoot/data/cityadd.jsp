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
    
    <title>My JSP 'privaceadd.jsp' starting page</title>
    
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

  <form name="form1" method="post" action="<%=basePath %>cityservlet?order=privaceadd" onsubmit="return check();">
  <h1 align='center'>城市信息的新增</h1>
  	<table border="0" align="center" >
    	<tr height="40">
    		<th>省份名称</th>
	    	<td>
	    		<select name="provinceid" style="width:150px;height:40px">
	    			<c:forEach items="${provincelist}" var="p">
	    				<option value="${p.provinceid}" style="width:150px;height:40px">${p.provinceName}</option>
	    			</c:forEach>
	    		</select>
	    	</td>
    		<td></td>
    	</tr>
  		<tr>
  		<th>城市名称</th>
  		<td><input type="text" name="cityname" style="width:150px;height:40px"></td>
  		<td><font color="red" size="5">*必填内容</font></td>
  		</tr>
    	<tr><td colspan="3" align="center"><input type="submit" name="sub" value="  新  增  " style="height:43px;cursor:pointer;width:200px;color:blue;font-size:24px;background-color: #6699ff;font-style: inherit;font-weight: bolder;"></td></tr>
    </table>
  </form>
  </body>
</html>
