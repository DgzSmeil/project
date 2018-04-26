<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bofang.jsp' starting page</title>

  </head>
  
  <body>
    <embed width='1300' height='520' border='1' align="center" src='<%=basePath %>${param.url}'>
 	<div><a href="data/buy.jsp">我要购买</div>
  </body>
</html>
