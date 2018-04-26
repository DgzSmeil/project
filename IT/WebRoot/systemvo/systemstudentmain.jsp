<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/1.JPG" class="radius-circle rotate-hover" height="50" alt="" />${studentbean.studentname}</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="<%=basePath %>mainservlet?order=main"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="<%=basePath %>qiandao/qiandao.jsp" class="button button-little bg-blue"  target="right"><span class="icon-wrench"></span> 签到</a> &nbsp;&nbsp;<input class="button button-little bg-red icon-power-off" type="button" onclick="window.close()" value=" 退出登录 "></div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>课程管理</h2>
  <ul style="display:block">
    <li><a href="<%=basePath %>courselistservlet?order=list" target="right"><span class="icon-caret-right"></span>查找课程</a></li>
    <li><a href="<%=basePath %>courselistservlet?order=mycar" target="right"><span class="icon-caret-right"></span>我的购物车</a></li>   
    <li><a href="<%=basePath %>payrecodeservlet?order=list&studentid=${studentbean.studentid}" target="right"><span class="icon-caret-right"></span>已买的宝贝</a></li>     
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>我的账户</h2>
  <ul>
    <li><a href="<%=basePath %>studentservlet?order=update&studentname=${studentbean.studentname}" target="right"><span class="icon-caret-right"></span>个人资料</a></li>
    <li><a href="<%=basePath %>data/oldstudentpwd.jsp?studentname=${studentbean.studentname}" target="right"><span class="icon-caret-right"></span>更改密码</a></li>
    <li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right"><span class="icon-caret-right"></span>申请讲师资格</a></li>
  </ul>
  <h2><span class="icon-pencil-square-o"></span>个人金融</h2>
  <ul>
    <li><a href="<%=basePath %>moneyservlet?order=list&username=${studentbean.studentname}" target="right"><span class="icon-caret-right"></span>充值明细</a></li>
    <li><a href="<%=basePath %>studentservlet?order=summoney&username=${studentbean.studentname}" target="right"><span class="icon-caret-right"></span>查看余额</a></li>
    <li><a href="<%=basePath %>data/checkpwd.jsp?username=${studentbean.studentname}" target="right"><span class="icon-caret-right"></span>设置支付密码</a></li>
    <li><a href="<%=basePath %>data/checkpassword.jsp?username=${studentbean.studentname}" target="right"><span class="icon-caret-right"></span>修改支付密码</a></li>
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>活动公告</h2>
  <ul>
    <li><a href="<%=basePath %>newmsgservlet?order=studentlist" target="right"><span class="icon-caret-right"></span>查看通知公告</a></li>
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>学习空间</h2>
  <ul>
    <li><a href="list.jsp" target="right"><span class="icon-caret-right"></span>观看视频</a></li>
    <li><a href="<%=basePath %>info/liuyan.jsp" target="right"><span class="icon-caret-right"></span>在线提问</a></li>
  </ul> 
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
  <iframe scrolling="auto" rameborder="0" src="systemvo/demo.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>