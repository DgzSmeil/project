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
     <a href="youhui.jsp" style="float:left;"><strong class="icon-reorder"> 优惠券</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="cengnuo.jsp" style="float:left;"><strong class="icon-reorder"> 承诺与保障</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="plan.jsp" style="float:left;color:blue"><strong class="icon-reorder"> 名师计划</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
     </div>
   <div class="box">
   <div class="faq-cont" data-url="1/1">
         <h2>名师计划</h2>
         <p style="font-size:14px;color:grey">腾讯课堂一直致力于提高教学质量和服务水平，入驻机构已超过2万家，为了筛选出更优质的内容，今年10月平台决定推出“名师计划”。对于“名师计划”详细说明如下：</p>
         <p style="font-size:14px;color:grey">“名师计划”是对课程质量高、服务好、口碑好的老师的鼓励政策。名师计划与积分体系不同，更加注重课程质量和服务质量，而非更多课程数据的累积。</p>
         <p class="faq-cont-qus">一、名师计划</p>
         <p style="font-size:14px;color:grey">即利用自有资源，引入优秀老师，共同建立完善的知识体系，为学生提供好的内容与服务，为老师提供知识变现的路径与资源扶持，培育粉丝群体，使自身内容优势最大化。</p>
         <p class="faq-cont-qus">二、名师计划特权</p>
         <p style="font-size:14px;color:grey">名师对于老师是一种荣誉和认可，同时也降低了学生选课成本，可以放心学习。经过认可的名师可以获得：</p>
         <ul class="faq-cont-list" style="font-size:14px;color:grey">
             <li>平台背书：名师拥有特殊标识，在课程页卡、课程详情页、机构主页等外显</li>
             <li>结算周期享有T+7权益</li>
             <li>流量扶持：更精准的用户和更多元的推广渠道</li>
             <li>优先使用平台未来增值工具</li>
             <li>产品经理一对一服务</li>
         </ul>

         <p class="faq-cont-qus">三、名师计划义务</p>
         <ul class="faq-cont-list" style="font-size:14px;color:grey">
             <li>需要在平台内有完整的课程体系，开设付费课程并持续招生</li>
             <li>提供完整的课程服务，包括直播、录播（含回放）、老师答疑，应试类目还需提供作业和批改服务</li>
             <li>付费课程需提供试听服务（含付费试听课或公开课）</li>
             <li>配合产品经理对老师自身的课程设置和营销工具使用进行优化调整</li>
             <li>履行对学员的其他服务承诺</li>
             <li>遵守平台各项规章制度</li>
         </ul>

         <p class="faq-cont-qus">四、成为名师需要达到什么标准</p>
         <p style="font-size:14px;color:grey">满足一定条件即可申请认证，但最终是否通过认证还要经过腾讯课堂专家评估。申请认证条件:</p>
         <ul class="faq-cont-list" style="font-size:14px;color:grey">
             <li>在平台内开设有付费课程并持续招生</li>
             <li>三个月内无违规记录</li>
             <li>课程体系完整，课程内容优质，且具有较好的口碑</li>
         </ul>
         <p style="font-size:14px;color:grey">以上标准仅为成为名师的必备条件，同时专家会对老师的课程体系、课程内容进行评估，最终确认是否给予认证。</p>

         <p class="faq-cont-qus">五、如何申请认证</p>
         <p style="font-size:14px;color:grey">如果您满足申请条件，可发送申请邮件至邮箱：2763741273@qq.com</p>
         <ul class="faq-cont-list" style="font-size:14px;color:grey">
             <li>邮件主题统一为：【名师计划申请】XXX老师申请</li>
             <li>正文中务必写明老师名称、腾讯课堂老师主页地址</li>
             <li>如有自建平台，请提供网站链接。可以举证教学内容相关信息作为附件（如课程体系规划、名师资料、行业荣誉等）</li>
         </ul>

         <p class="faq-cont-qus">六、成为名师后是否会被取消名师资格</p>
         <p style="font-size:14px;color:grey">在平台内出现以下情况，将被取消认证：</p>
         <ul class="faq-cont-list" style="font-size:14px;color:grey">
             <li>违规扣分超过5分</li>
             <li>遭到学员投诉并经过平台核实</li>
             <li>内容质量无法保障的其他行为</li>
         </ul>
         <p style="font-size:14px;color:grey">如有问题请于工作时间联系在线 QQ：2763741273</p>
     </div>
</body>
</html>