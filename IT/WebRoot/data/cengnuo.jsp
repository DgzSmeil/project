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
     <a href="study.jsp" style="float:left;color:red"><strong class="icon-reorder"> 承诺与保障</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="plan.jsp" style="float:left;"><strong class="icon-reorder"> 名师计划</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
     </div>
   <div class="box">
   <div class="faq-cont" data-url="0/5">
               <h2>承诺与保障</h2>
               <p class="faq-cont-qus">1.认证机构的课程保障</p>
               <p style="font-size:14px;color:grey">带有认证标记的机构经过腾讯课堂官方认证，其课程是该类目下的优质课程。</p>
               <p style="font-size:14px;color:grey">认证机构的课程将提供更标准和优质的服务，如试学、课件可下载、配套习题练习、作业批改等，学生可在该机构获得完整学习计划和优秀老师指导。</p>

               <p class="faq-cont-qus">2.支付保障</p>
               <p style="font-size:14px;color:grey">拥有“支付保障”标识的课程可以放心购买！</p>
               <p style="font-size:14px;color:grey">支付保障是腾讯课堂为保障学员付费安全的官方服务，学员通过平台所支付的款项由腾讯课堂保管，只有在课程结束后，款项才会划至机构账户，因此，学员可以通过腾讯课堂放心购买课程。</p>
               <p class="faq-cont-qus">3.课程退款服务保障说明：</p>
			   <p class="faq-cont-ans2">依据课程对应的退款方式进行退款，每种退款方式说明如下：</p>
		<ul class="faq-cont-list">
			<li>
				<span class="faq-cont-hl">“<strong><span class="blue">课前随时退</span></strong>”</span><img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-refund-type1.png" alt="课前随时退图标"><br>
				<p><b>退款条件：</b>用户未进行过任务且未到课程开始时间。随到随学课程选择“课前随时退”不支持退款，试听课已开始课程不支持退款，用户申请退款金额为<strong>全额退款；</strong></p>
				<p><b>退款流程</b></p>
				<p>a、通过PC打开浏览器，登录上课账号，右上角点击【个人中心】-【课程管理】，在【我的报名记录】中能看到用户所有的订单，对于能退款的订单，在操作一栏能看到“申请退款”；</p>
				<img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-24.png">
				<p>b、点击申请退款后，需要用户填写退款原因，再次确认后，系统将进入退款流程。对于“课前随时退”的用户，在申请退款后，无需机构确认，将自动进入退款中状态，系统默认在两周内退款到账。</p>
			</li>
			<li>
				<span class="faq-cont-hl">“<strong><span class="blue">七天包退</span></strong>”</span><img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-refund-type2.png" alt="七天包退图标"><br>
				<p>
					<b>退款条件：</b><br>
					a、用户满足“课前随时退”条件时，按照“课前随时退”条件退款；<br>
					b、对于有开课时间的课程，距离开课时间七天内；<br>
					c、对于无开课时间的课程，距离用户购买时间七天内；用户申请退款金额为按照未学习任务占比等比退款；
				</p>
				<p><b>退款流程：</b></p>
				<p>a、退款入口同“课前随时退”，若用户满足退款条件，对于能退款的订单，在操作一栏能看到“申请退款”，“申请退款”后，用户仍可以继续学习，或在此处点击“取消退款”；</p>
				<img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-25.png">
				<p>b、用户申请退款后，将进入机构确认流程，机构可在【管理后台】-【订单流水】-【退款确认】中对已申请的订单进行确认退款操作或联系用户进行挽留，让用户取消退款；</p>
				<img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-26.png">
				<p>c、若机构点击确认或逾期未确认，退款流程将进入“退款中”，用户将不可继续观看课程，并计算用户未进行任务的比例，等比向用户退款，同时，已学习部分的金额，将进入结算环节，在下一个结算日向机构进行结算。</p>
				<img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-27.png">
			</li>
			<li>
				<span class="faq-cont-hl">“<strong><span class="blue">课中包退</span></strong>”</span><img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-refund-type3.png" alt="课中包退图标"><br>
				<p>
					<b>退款条件：</b><br>
					a、用户满足“课前随时退”条件时，按照“课前随时退”条件退款；<br>
					b、在课程有效期到期前，用户均可以申请退款；用户申请退款金额为按照未学习任务占比等比退款；
				</p>
				<p><b>退款流程：</b>（与“七天包退”流程相同）</p>
				<p>a、退款入口同“课前随时退”，若用户满足退款条件，对于能退款的订单，在操作一栏能看到“申请退款”，“申请退款”后，用户仍可以继续学习，或在此处点击“取消退款”；</p>
				<p>b、用户申请退款后，将进入机构确认流程，机构可在【管理后台】-【订单流水】-【退款确认】中对已申请的订单进行确认退款操作或联系用户进行挽留，让用户取消退款；</p>
				<p>c、若机构点击确认或逾期未确认，退款流程将进入“退款中”，用户将不可继续观看课程，并计算用户未进行任务的比例，等比向用户退款，同时，已学习部分的金额，将进入结算环节，在下一个结算日向机构进行结算。</p>
				<img lazy-src="//9.url.cn/edu/modules/nohash/faq/faq-27.png">
			</li>
		</ul>
              <p class="faq-cont-qus">4.什么是“课后有回放”？</p>
              <p style="font-size:14px;color:grey">带有“课后会有回放”标签的班级，在直播任务结束后的24h内，将会自动上传直播任务的回放，让您不再错过任何一次直播任务。</p>
      </div>
</body>
</html>