<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="systemvo/css/pintuer.css">
<link rel="stylesheet" href="systemvo/css/admin.css">
<script src="systemvo/js/jquery.js"></script>
<script src="systemvo/js/pintuer.js"></script>
</head>
<body>
<h1 align="center">${param.coursename}</h1>
    <embed width='1300' height='520' border='1'  align="center" src='<%=basePath %>${param.sectionurl}'>
 	<div class="field">
     <a href="<%=basePath %>data/pingjia.jsp?coursename=${param.coursename}&url=${param.sectionurl}&imgsrc=${param.imgsrc}&studentid=${param.studentid}" target="_blank"><img src="<%=basePath %>image/pingjia.png"/></a>
     <a href="<%=basePath %>data/pingjia.jsp?coursename=${param.coursename}&url=${param.sectionurl}&imgsrc=${param.imgsrc}&studentid=${param.studentid}" target="_blank"><img src="<%=basePath %>image/tiwen.png"/></a>
    </div>
  </body>
</html>
