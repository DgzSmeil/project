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
    <h1><img src="images/1.JPG" class="radius-circle rotate-hover" height="50" alt="" /><%=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8") %></h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="<%=basePath %>coming/firstpaging.jsp"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<input class="button button-little bg-red" type="button" onclick="window.close()" value=" 退出登录 "></div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>账户管理</h2>
  <ul style="display:block">
    <li><a href="<%=basePath %>cityservlet?order=list" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
    <li><a href="<%=basePath %>jsp/demo.jsp" target="right"><span class="icon-caret-right"></span>在线编辑</a></li>
    <li><a href="page.jsp" target="right"><span class="icon-caret-right"></span>图片上传</a></li>  
    <li><a href="adv.jsp" target="right"><span class="icon-caret-right"></span>我的订单</a></li>   
    <li><a href="<%=basePath %>fankui/fankui.jsp?name=<%=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8") %>" target="right"><span class="icon-caret-right"></span>意见反馈</a></li>     
    <li><a href="column.jsp" target="right"><span class="icon-caret-right"></span>项目管理</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>基本数据</h2>
  <ul>
    <li><a href="<%=basePath %>studentservlet?order=list" target="right"><span class="icon-caret-right"></span>学生列表</a></li>
    <li><a href="<%=basePath %>managerservlet?order=list" target="right"><span class="icon-caret-right"></span>管理员列表</a></li>
    <li><a href="<%=basePath %>activeservlet?order=list" target="right"><span class="icon-caret-right"></span>活动列表</a></li>
    <li><a href="<%=basePath %>teacherservlet?order=list" target="right"><span class="icon-caret-right"></span>教师列表</a></li>
    <li><a href="<%=basePath %>greadservlet?order=list" target="right"><span class="icon-caret-right"></span>教师类别</a></li>
  </ul>
  <h2><span class="icon-pencil-square-o"></span>上   传</h2>
  <ul>
    <li><a href="<%=basePath %>up/fileup.jsp" target="right"><span class="icon-caret-right"></span>文件上传</a></li>
    <li><a href="<%=basePath %>up/videoup.jsp" target="right"><span class="icon-caret-right"></span>音频上传</a></li>
    <li><a href="<%=basePath %>up/bofang.jsp" target="right"><span class="icon-caret-right"></span>播放课程</a></li>        
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>用户管理</h2>
  <ul>
    <li><a href="list.jsp" target="right"><span class="icon-caret-right"></span>内容管理</a></li>
    <li><a href="add.jsp" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
    <li><a href="cate.jsp" target="right"><span class="icon-caret-right"></span>分类管理</a></li>        
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>活动公告</h2>
  <ul>
    <li><a href="list.jsp" target="right"><span class="icon-caret-right"></span>活动公告</a></li>
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>兑换码活动</h2>
  <ul>
    <li><a href="list.jsp" target="right"><span class="icon-caret-right"></span>内容管理</a></li>
    <li><a href="add.jsp" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
    <li><a href="cate.jsp" target="right"><span class="icon-caret-right"></span>分类管理</a></li>        
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
  <iframe scrolling="auto" rameborder="0" src="demo.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>