<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head">
     <a href="study.jsp" style="float:left;"><strong class="icon-reorder">如何开始学习></strong></a>
     <a href="money.jsp" style="float:left;"><strong class="icon-reorder">支付与退款></strong></a>
     <a href="fenqi.jsp" style="float:left;"><strong class="icon-reorder">课程分期支付></strong></a>
     <a href="youhui.jsp" style="float:left;"><strong class="icon-reorder">优惠券></strong></a>
     <a href="cennuo.jsp" style="float:left;"><strong class="icon-reorder">承诺与保障></strong></a>
     <a href="plan.jsp" style="float:left;"><strong class="icon-reorder">名师计划></strong></a>
  </div>
</body>
</html>