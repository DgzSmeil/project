<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.StudentBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>交易记录IT课堂支付中心</title>
<meta name="keywords" content="交易记录" />
<meta name="description" content="交易记录" />
<LINK href="/favicon.ico" type="image/x-icon" rel=icon>
<script src="http://pay.51cto.com/static/js/jquery.js" ></script>
<link href="http://pay.51cto.com/static/css/reset.css" rel="stylesheet" type="text/css" />
<link href="http://pay.51cto.com/static/css/style.css?v=1.0.1" rel="stylesheet" type="text/css" />
<style type="text/css">
.footer{ margin-top:75px;}
</style>

</head>

<body>
<div class="topBg">

	<div class="fr">
		<div class="fr">
			<div class="logged" id="login_status"></div>
			<a target="_blank" href="<%=basePath %>studentservlet?order=zhifucenter">我的支付中心</a>| <a target="_blank" href="/index.php?do=help">帮助中心</a>
		</div>	
	</div>
	</div>
<script>
	$(function(){
		$(".addnav").hover(function(){
			if($(this).find(".hidchannel").length>0){
				$(this).addClass("hovercur");
				$(this).find("em").addClass("showdown");
				$(this).find(".hidchannel").show();

			}
		},function(){

			$(this).removeClass("hovercur");
			$(this).find("em").removeClass("showdown");
			$(this).find(".hidchannel").hide();

		});
	})
</script><div class="wrap">
<%StudentBean studentbean = (StudentBean)session.getAttribute("bean"); %>
	<div class="header clearfix">
		<div class="logo"><a href="/"><img src="<%=basePath %>image/zhifulogo.png" alt="支付中心" /></a></div>
		<div class="hNav">
			<a href="<%=basePath %>studentservlet?order=zhifucenter">我的支付中心</a>
			<a href="<%=basePath %>studentservlet?order=list" class="cur">交易记录</a>
			<a href="<%=basePath %>datainfo/chongzhimoney.jsp?student=<%=studentbean.getStudentname() %>">充值中心</a>
			<a href="/index.php?do=account&m=phone">账户设置</a>
			<a href="/index.php?do=help">帮助中心</a>
		</div>
	</div>
	<p class="clear"></p><script type="text/javascript">

function toOption(assid, action){
//option_my
$('#assem_id').val(assid);
$('#option_my').attr('action', action).submit();
}


function closeAssem(assid, action){
	if(confirm("您确认要删除支付吗？")){
		$.ajax({
			'type':'post',
			'url':action,
			'dataType':'html',
			'data':{'assem_id':assid},
			'success':function(res){
				if('ok'==res){
					location.reload();
				} else {
					alert('删除异常');
				}
			}
		});
	}
}

</script>
<script language="javascript" type="text/javascript" src="http://pay.51cto.com/static/js/My97DatePicker/WdatePicker.js"></script>
<div class="ch-filter" style="margin-bottom:0;">
<div class="fl"><strong>最近交易记录</strong></div>
</div>
<div class="ch-recd">
<div class="rec-tab" style="width:940px;">
	<style type="text/css">
	.ch-list td, .ch-list th, .recd-list th, .recd-list td{padding:10px 3px;}
	</style>
	<table width="940" border="0" cellspacing="0" cellpadding="3" class="recd-list" align="center">
	<tr>
	<th width="76" align="center" valign="middle">交易时间</th>
	<th width="100" align="center" valign="middle">订单号</th>
	<th width="90" align="center" valign="middle">标   题</th>
	<th width="80" align="center" valign="middle">应用</th>
	<th width="58" align="center" valign="middle">价格</th>
	<th width="130" align="center" valign="middle">余额/<br />人民币</th>
	<th width="77" align="center" valign="middle">支付方式</th>
	<th width="58" align="center" valign="middle">状态</th>
	<th width="69" align="center" valign="middle">操作</th>
	</tr>
	<c:forEach items="${shoplist}" var="s">
		<tr>
			<td align="left" valign="middle"><p>${s.paydate}</p></td>
			<td align="center" valign="middle">${s.ordernumber}</td>
			<td align="left" valign="middle"><p>${s.one_word}</p></td>
			<td align="center" valign="middle">IT课堂订单</td>
			<td align="center" valign="middle">${s.price}</td>
			<td align="center" valign="middle">${moneybean.summoney}</td>
			<c:if test="${s.paytype==0}">
				<td align="center" valign="middle">支付宝</td>
			</c:if>
			<c:if test="${s.paytype==1}">
				<td align="center" valign="middle">微信支付</td>
			</c:if>
			<c:if test="${s.paystatus==0}">
				<td align="center" valign="middle">未支付</td>
			</c:if>
			<c:if test="${s.paystatus==1}">
				<td align="center" valign="middle">已支付</td>
			</c:if>
			
			<td align="center" valign="middle">
				<span class="c_gray"><a href="<%=basePath %>studentservlet?payrecodeid=${s.payrecordid}&order=deletejilu">删除</a></span>
			</td>
		</tr>
	</c:forEach>
	</table>
	<div class="pagebox"></div>
	
	</div>
</div>
<form name="option_my" id="option_my" method="post" action="">
<input type="hidden" name="assem_id" id="assem_id" />
</form></div>
<div class="footer">
	<a href="<%=basePath %>datainfo/guanyu.jsp" target="_blank">关于我们</a>&nbsp;
	<a href="<%=basePath %>datainfo/liaojie.jsp" target="_blank">了解我们</a>&nbsp;
	<a href="<%=basePath %>datainfo/fankui.jsp" target="_blank">意见反馈</a>&nbsp; 
	<a href="http://www.51cto.com/about/history2011.html" target="_blank">网站大事</a>&nbsp; 
	<a href="http://www.51cto.com/about/map.htm" target="_blank">网站地图</a><br />
	Copyright @ 2017-2027 IT课堂.COM 版权所有
</div>
</body>
<script charset="utf-8" src="http://pay.51cto.com/index.php?do=juser&m=userStatus&reback=http%3A%2F%2Fpay.51cto.com%2Findex.php%3Fdo%3Dassem"></script>
<script> 
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ 
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), 
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) 
})(window,document,'script','//www.google-analytics.com/analytics.js','ga'); 

ga('create', 'UA-56422726-1', 'auto'); 
ga('send', 'pageview'); 

</script>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F3fe9272bf48a68ad34ff7d08e600bc4b' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
	var uid = "12569085";
	var _educto = _educto || [];
	_educto.push(['_setUserId',uid]);
</script>

<script type="text/javascript">
	document.write(decodeURI("%3Cscript src='https://tongji.51cto.com/cto.js/d2e038922df3c3aad532cc5b230727b4' type='text/javascript'%3E%3C/script%3E"));
</script>
</html>