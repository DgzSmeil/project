<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.ManagerBean"%>
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
    <title>网络直播</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
	<script  type="text/javascript">
		function exitmanager(){
			location.href="${pageContext.request.contextPath}/loginservlet?order=managerexit";
		}
	</script>
</head>
<body style="background-color:#f2f9fd;">
<%
	ManagerBean managerbean = (ManagerBean)session.getAttribute("managerbean");
%>
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
		<h1><img id="face" src="<%=basePath %><%=managerbean.getManagerurl() %>" class="radius-circle rotate-hover" height="50" alt="" /><%=managerbean.getManager_account() %></h1>
		</div>
		<div class="head-l">
		<a href="<%=basePath %>managerservlet?order=update" target="right" class="button button-little bg-blue"><span class="icon-user"></span> 个人资料</a> &nbsp;&nbsp;
		<a class="button button-little bg-green" href="<%=basePath %>managerfaceup.jsp"  target="right" ><span class="icon-home"></span> 更改头像</a> &nbsp;&nbsp;
		<a href="<%=basePath %>data/updatemanagerpwd1.jsp?managerid=<%=managerbean.getManager_id() %>"  target="right" class="button button-little bg-blue"><span class="icon-wrench"></span> 修改密码</a> &nbsp;&nbsp;
		<input class="button button-little bg-red" type="button" onclick="exitmanager();" value=" 退出登录 "></div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
	    <h2><span class="icon-wrench"></span>审核平台</h2>
	    <ul style="display:block">
	    	<li><a href="<%=basePath %>courseservlet?order=list" target="right"><span class="icon-caret-right"></span>在线课程审核</a></li>
		    <li><a href="<%=basePath %>sectionservlet?order=checklist" target="right"><span class="icon-caret-right"></span>视频审核</a></li>
		    <li><a href="<%=basePath %>payrecodeservlet?order=tixianpass" target="right"><span class="icon-caret-right"></span>讲师提现审核</a></li>
		    <li><a href="<%=basePath %>studentservlet?order=checklist" target="right"><span class="icon-caret-right"></span>讲师资料审核</a></li>
	    </ul>   
	 	<h2><span class="icon-pencil-square-o"></span>管理中心</h2>
	  	<ul>
		    <li><a href="<%=basePath %>managerservlet?order=list" target="right"><span class="icon-caret-right"></span>管理员管理</a></li>
		    <li><a href="<%=basePath %>provinceservlet?order=list" target="right"><span class="icon-caret-right"></span>省份管理</a></li>
		    <li><a href="<%=basePath %>cityservlet?order=list" target="right"><span class="icon-caret-right"></span>城市管理</a></li>  
		    <li><a href="<%=basePath %>greadservlet?order=list" target="right"><span class="icon-caret-right"></span>讲师等级设置</a></li>
		    <li><a href="<%=basePath %>vipservlet?order=list" target="right"><span class="icon-caret-right"></span>VIP管理</a></li>
		    <li><a href="<%=basePath %>refundservlet?order=managerrefundlist" target="right"><span class="icon-caret-right"></span>售后退款</a></li>
	  		<li><a href="<%=basePath %>studentservlet?order=managerstudentlist" target="right"><span class="icon-caret-right"></span>学生管理</a></li>
	  		<li><a href="<%=basePath %>studentservlet?order=birthdaylist" target="right"><span class="icon-caret-right"></span>福利管理</a></li>
	  	</ul>
	  	<h2><span class="icon-pencil-square-o"></span>平台公告</h2>
	  	<ul>
	    	<li><a href="<%=basePath %>newmsgservlet?order=list" target="right"><span class="icon-caret-right"></span>发布公告通知</a></li>
	  	</ul> 
	 	<h2><span class="icon-pencil-square-o"></span>金额管理</h2>
	  	<ul>
	    	<li><a href="<%=basePath %>managerservlet?order=money" target="right"><span class="icon-caret-right"></span>平台收入</a></li>
	  	</ul> 
	  	<c:if test="<%=managerbean.getManager_status()==1 %>">
	  		<h2><span class="icon-pencil-square-o"></span>事务日志</h2>
		  	<ul>
		    	<li><a href="<%=basePath %>managerservlet?order=loglist" target="right"><span class="icon-caret-right"></span>操作日志</a></li>
		    	<li><a href="<%=basePath %>datainfo/factory.jsp" target="right"><span class="icon-caret-right"></span>公司报表</a></li>
		  	</ul> 
	  	</c:if>
	</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <li><b>当前语言：</b><span style="color:red;">中文</php></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="<%=basePath %>managerservlet?order=update" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
<script type="text/javascript">
	$("#face").bind("mouseover",function(){
		$.post(
			"${pageContext.request.contextPath}/img",
			{
				"order":"refushmanager",
			},
			function(data){
				document.getElementById("face").src=data;
			},
			"text"
		);
	});
</script>
</body>
</html>