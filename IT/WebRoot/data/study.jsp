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
<link rel="stylesheet" href="data/css/style1.css" type="text/css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<form method="post" action="" id="listform">
<c:if test="${msg!=null}">
	<script type="text/javascript">
		alert("${msg}");
	</script>
  </c:if>
  <div class="panel admin-panel">
    <div class="panel-head">
     <a href="<%=basePath %>courselistservlet?order=list" style="float:left;"><strong class="icon-reorder"> 所有课程</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="study.jsp" style="float:left;color:blue"><strong class="icon-reorder"> 如何开始学习</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="money.jsp" style="float:left;"><strong class="icon-reorder"> 支付与退款</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="fenqi.jsp" style="float:left;"><strong class="icon-reorder"> 课程分期支付</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="youhui.jsp" style="float:left;"><strong class="icon-reorder"> 优惠券</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="cennuo.jsp" style="float:left;"><strong class="icon-reorder"> 承诺与保障</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="plan.jsp" style="float:left;"><strong class="icon-reorder"> 名师计划</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
     </div>
   <div class="box">
  <div class="faq-cont" data-url="0/0">
            <p>1.在开始学习之前，花点时间了解几个基本的概念，可以帮助您更快熟悉腾讯课堂。</p>
            <p style="font-size:14px;color:grey">&nbsp;&nbsp;&nbsp;&nbsp;在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的<strong>章</strong>和<strong>节</strong>，每个章或节之下会有若干个<strong>学习任务</strong>，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。</p>
            <p style="font-size:14px;color:grey"><strong>当您完成所有的学习任务后，就完成了该门课程的学习。</strong></p>
            <p style="font-size:14px;color:grey">各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。</p>

            <p>2.在腾讯课堂可以做什么？</p>
            <p style="font-size:14px;color:grey"><strong>学习！学习！学习！</strong></p>
            <p style="font-size:14px;color:grey">好学的您可以通过<strong>在线直播</strong>来与老师实时互动，通过<strong>录播视频</strong>随时随地学习，通过<strong>习题任务</strong>进一步地巩固所学的知识，同时可以在任务详情页<strong>下载学习资料</strong>。</p>
            <p style="font-size:14px;color:grey"><strong>当然，效率也很重要！ </strong></p>
            <p style="font-size:14px;color:grey">课程表帮您更好地管理自己的学习。您可以在<strong>个人中心-课程表</strong>页面中查看报名课程以及即将开始的课程。</p>
            <p style="font-size:14px;color:grey"><strong>与志同道合的同学们共同进步！</strong></p>
            <p style="font-size:14px;color:grey">您可以加入<strong>课程交流群</strong>与同学聊天讨论，也可以在<strong>学习论坛</strong>中发帖参与各种话题的讨论，提高姿势水平。</p>

            <p>3.如何开始学习？</p>
            <p style="font-size:14px;color:grey">首先，您需要报名该课程，点击课程详情页中的<strong>立即报名</strong>即可报名该课程。</p>
            <p style="font-size:14px;color:grey">报名成功后，点击<strong>立即学习</strong>按钮，即可开始进入课程的<strong>任务详情页</strong>进行学习。</p>

            <p>4.报名后课程如何学习？</p>
            <p style="font-size:14px;color:grey"><strong>使用电脑学习：</strong></p>
            <p style="font-size:14px;color:grey">a）每当直播任务上课前，我们会通过QQ PC版向您推送<strong>上课提醒</strong>，点击上课提醒即可进入正上课的课堂，上课提醒如下图所示：</p>
            <p style="font-size:14px;color:grey">b）通过QQ PC版的主面板的<strong>腾讯课堂 tab</strong>可进入课程的任务列表。</p>
            <p style="font-size:14px;color:grey">注：<strong>点击更改外观按钮</strong>->界面管理，勾选腾讯课堂显示在主面板即可让主面板出现腾讯课堂 tab</p>
            <p style="font-size:14px;color:grey">c）在<a href="//ke.qq.com">ke.qq.com</a>顶部导航栏的 “<strong>个人中心</strong>”-“<strong>课程表</strong>”中，可以看到您所有的待学习的课程，点击每个课程的“<strong>查看全部任务</strong>“按钮可进入对应课程的任务列表中。</p>
            <p style="font-size:14px;color:grey">使用手机学习：</p>
            <p style="font-size:14px;color:grey">(扫描该二维码可下载手机App)</p>
            <p style="font-size:14px;color:grey">a）下载腾讯课堂APP，进入腾讯课堂APP中的“我”tab，点击列表中的课程即可进入课程详情页进行学习。</p>
            <p style="font-size:14px;color:grey">b）在微信中搜索并关注<strong>腾讯课堂公众号</strong>，点击个人中心即可查看自己所报名的课程，并进入相应的课程中学习。</p>
            <p style="font-size:14px;color:grey">c）在手机QQ中搜索并关注<strong>腾讯课堂的公众号</strong>，点击课程管理-我的课表即可查看自己所报名的课程，并进入相应的课程中学习。</p>
            <p style="font-size:14px;color:grey">c）在手机浏览器中访问<a href="//ke.qq.com">腾讯课堂官方网站</a>（Ke.qq.com），点击右上角的个人中心图标，登录后即可查看报名的课程。</p>
            <p>5.报名课程可以退款吗？</p>
            <p style="font-size:14px;color:grey">a）理论上课程开课之前都可以无条件退款。但系统拒绝恶意的付款退款行为 。</p>
            <p style="font-size:14px;color:grey">b）课程开始后，或者您已经学习了课程中的内容（包括观看直播任务、录播任务、下载课程的资料、作答课程的习题），便不允许退款。可与机构协商退款事项。</p>
            <p>6.课程报名后可以取消报名吗？</p>
            <p style="font-size:14px;-color:grey">a）所有课程都可以在任何时候取消报名。进入“<strong>个人中心</strong>”-“<strong>课程管理</strong>”，找到想要取消的课程，点击取消报名。</p>
            <p style="font-size:14px;color:grey">b）取消报名不会对您有任何影响。</p>
            <p>7.在哪里查看自己的报名记录？</p>
            <p style="font-size:14px;color:grey">您可以在“<strong>个人中心</strong>”-“<strong>课程管理</strong>”查看您的报名记录，并对已报名的课程进行取消报名、删除记录、付款等操作。</p>
        </div>
</body>
</html>