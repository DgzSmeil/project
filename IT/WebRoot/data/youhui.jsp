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
     <a href="<%=basePath %>courselistservlet?order=list" style="float:left;"><strong class="icon-reorder"> 所有课程</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="study.jsp" style="float:left;"><strong class="icon-reorder"> 如何开始学习</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="money.jsp" style="float:left;"><strong class="icon-reorder"> 支付与退款</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="fenqi.jsp" style="float:left;"><strong class="icon-reorder"> 课程分期支付</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="youhui.jsp" style="float:left;color:blue"><strong class="icon-reorder"> 优惠券</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="cengnuo.jsp" style="float:left;"><strong class="icon-reorder"> 承诺与保障</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="plan.jsp" style="float:left;"><strong class="icon-reorder"> 名师计划</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
     </div>
   <div class="box">
   <div class="faq-cont" data-url="0/4">
        <h2>优惠券</h2>
        <p class="faq-cont-qus">1.怎样获取优惠券？</p>
        <p style="font-size:14px;color:grey">腾讯课堂会不定期推出课程优惠活动，通过优惠活动可以领取优惠券；</p>
        <p style="font-size:14px;color:grey">部分机构的课程也会在特定时间会推出优惠券，可以咨询机构进行领取；</p>
        <p class="faq-cont-qus">2.怎样使用优惠券？</p>
        <p style="font-size:14px;color:grey">先领取一张优惠券，然后在对应的课程页面，点击”立即购买“，在“购买课程“的弹框中，选择需要使用的优惠券。使用优惠券后，付款“价格”会出现对应的变化。</p>
        <img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-23.png"/>
        <p class="faq-cont-qus">3.如果优惠券的面值大于课程的价格，还需要支付金额么？</p>
        <p style="font-size:14px;color:grey">当优惠券的面值大于课程的价格时，只需要支付0.1元的费用即可。</p>
        <p class="faq-cont-qus">4.每个人可以领取多少张优惠券？</p>
        <p style="font-size:14px;color:grey">每个人可以领取多张优惠券，但同一门课程的相同的优惠券，一个用户只能领取一张。</p>
    </div>
</body>
</html>