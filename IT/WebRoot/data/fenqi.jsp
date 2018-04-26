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
     <a href="fenqi.jsp" style="float:left;color:blue"><strong class="icon-reorder"> 课程分期支付</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="youhui.jsp" style="float:left;"><strong class="icon-reorder"> 优惠券</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="cennuo.jsp" style="float:left;"><strong class="icon-reorder"> 承诺与保障</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="plan.jsp" style="float:left;"><strong class="icon-reorder"> 名师计划</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
     </div>
   <div class="box">
   <div class="faq-cont" data-url="0/6">
            <p style="font-size:14px;color:grey">1.在开始学习之前，花点时间了解几个基本的概念，可以帮助您更快熟悉腾讯课堂。</p>
          <p class="faq-cont-qus">1.如何通过分期支付购买课程</p>
           <p style="font-size:14px;color:grey">分期支付目前采用邀请制，仅支持机构主动向某QQ号开放针对某课程的分期支付，如果用户希望通过分期支付的方式购买课程，可在课程详情页右侧通过【联系机构】索取。</p>

            <p class="faq-cont-qus">2.分期支付的规则</p>
           <p style="font-size:14px;color:grey">目前平台支持两种分期支付的方式：</p>
            <ul class="faq-cont-list">
                <li>
                    <span class="faq-cont-hl">“<strong><span class="blue">按时间分期</span></strong>”</span><br>
                   <p style="font-size:14px;color:grey">用户支付当前分期款后，可在下一分期最晚还款日前<strong>拥有全部课程学习权限</strong>，若用户在下一分期支付最晚还款日前仍未及时支付，则将收回该课程的全部学习权限。</p>
                   <p style="font-size:14px;color:grey"><b>特点：</b>限制学习时间，不限制上课内容，在支付完全部分期前，每支付一期，可在该期有效期内学习全部内容，但未到开课时间的课程除外。</p>
                    <img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-6-1.png">
                </li>
                <li>
                    <span class="faq-cont-hl">“<strong><span class="blue">按章节分期</span></strong>”</span><br>
                   <p style="font-size:14px;color:grey">将课程按章节划分，每一期可学习部分由机构设定，当用户支付此部分课程费用，将获得该部分学习权利。</p>
                   <p style="font-size:14px;color:grey"><b>特点：</b>限制学习内容，不限制上课时间，在支付完全部分期前，每支付一期，可解锁并学习该期限定的课程内容，但已过期的课程内容除外。</p>
                    <img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-6-2.png">
                </li>
            </ul>

            <p class="faq-cont-qus">3.课程分期的期数与金额</p>
           <p style="font-size:14px;color:grey">目前平台支持的分期期数为2-6期，由学员与机构商定；</p>
           <p style="font-size:14px;color:grey">分期金额：</p>
            <p class="faq-cont-ans2 blue">课程总额=首付定金+每期金额X期数</p>
            <p class="faq-cont-ans2 blue">其中：</p>
            <ul class="faq-cont-list">
                <li>
                    <span class="faq-cont-hl">“<strong><span class="blue">课程总额</span></strong>”</span><br>
                   <p style="font-size:14px;color:grey">是学员需要支付的最终金额</p>
                </li>
                <li>
                    <span class="faq-cont-hl">“<strong><span class="blue">首付定金</span></strong>”</span><br>
                   <p style="font-size:14px;color:grey">双方确认分期细节后，用户通过支付定金确定进行分期，定金金额由机构与学生商定，最低1元；</p>
                </li>
                <li>
                    <span class="faq-cont-hl">“<strong><span class="blue">每期金额</span></strong>”</span><br>
                   <p style="font-size:14px;color:grey">学员每期进行还款时，所需要支付的金额；</p>
                </li>
            </ul>


            <p class="faq-cont-qus">4.分期还款</p>
             <ul class="faq-cont-list">
                <li>
                    <span class="faq-cont-hl">“<strong><span class="blue">正常还款</span></strong>”</span><br>
                   <p style="font-size:14px;color:grey">在支付首付定金后，学员需按时还款以获取相应的上课权限，学员可以通过【课程表】-【分期还款】页面进行还款，或通过课程详情页进行还款。</p>
                </li>
                <li>
                    <span class="faq-cont-hl">“<strong><span class="blue">逾期未还款</span></strong>”</span><br>
                   <p style="font-size:14px;color:grey">若超过约定时间未进行按时还款，用户将失去继续上课的权限，当前课程无法继续学习，且无法重新购买该课程的该班级。</p>
                </li>
                <li>
                    <span class="faq-cont-hl">“<strong><span class="blue">提前还款</span></strong>”</span><br>
                   <p style="font-size:14px;color:grey">用户可依次支付剩余期数，提前还款，以获取完整的上课权限，但不可以跳过某期而支付之后的期数，比如支付第一期后，跳过第二期，直接支付第三期；</p>
                </li>
            </ul>
        </div>
</body>
</html>