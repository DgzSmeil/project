<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.StudentBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>余额充值IT课堂支付中心</title>
<meta name="keywords" content="充值余额、余额充值、网银充值、银行卡充值" />
<meta name="description" content="余额充值" />
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
			<a target="_blank" href="<%=basePath %>studentservlet?order=zhifucenter">我的支付中心</a>| <a target="_blank" href="<%=basePath %>datainfo/help.jsp">帮助中心</a>
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
<% StudentBean studentbean = (StudentBean)session.getAttribute("bean"); %>
	<div class="header clearfix">
		<div class="logo"><a href="/"><img src="<%=basePath %>image/zhifulogo.png" alt="支付中心" /></a></div>
		<div class="hNav">
			<a href="<%=basePath %>studentservlet?order=zhifucenter">我的支付中心</a>
			<a href="<%=basePath %>studentservlet?order=list">交易记录</a>
			<a href="<%=basePath %>datainfo/chongzhimoney.jsp?studentname=<%=studentbean.getStudentname() %>" class="cur">充值中心</a>
			<a href="<%=basePath %>datainfo/help.jsp">帮助中心</a>
		</div>
	</div>
	<p class="clear"></p><script src="http://pay.51cto.com/static/js/jquery.autocomplete.js" ></script>
<script>
function isInt(intValue){
	var intPattern=/^0$|^[1-9]\d*$/; //整数的正则表达式
	result=intPattern.test(intValue);
	return result;
}

function check_form(obj){
	var v = $('.rmbnum', obj).val();
	if(!isInt(v) || v<=0){
		alert('请输入金额');
		return false;
	}
	return true;
}
$(function(){

	$(".d-chTab .mytab").each(function(){
		$(this).click(function(){
			$(".d-chTab .mytab").each(function(){
				$("#" + $(this).attr("atab")).hide();
				$("#" + $(this).attr("atab")+'2').hide();
				$(this).removeClass("cur");
			});
			$(this).addClass("cur");
			$("#" + $(this).attr("atab")).show();
			$("#" + $(this).attr("atab")+'2').show();
		});

	});

	$('.rmbnum').bind('keyup foucs blur', function(){
		var v = $(this).val();
		//$(this).val(gold.replace(/[^0-9]/g,''));
		if(isNaN(v) || !isInt(v)){
			$(this).val('');
		} else {
			if(v>100000){
				$(this).val('100000');
				alert('请输入小于10万的数字');
			}

		}

	});

	$('#userList').autocomplete('/index.php?do=index&m=getUserList',{
		scroll: true,
		scrollHeight: 123,
		minLength : 3,
		delay : 0,
		minChars : 0,
		matchContains: true,
		formatItem:function(row){
		return $.trim(row[0]);
		},
		formatResult:function(row){
		return $.trim(row[0]);
		}
	});
	$(".send_f").click(function(){
		$('#userList').focus();
		setTimeout(function(){
		$('#userList').dblclick();
		},500)
	});

});

</script>
<input type="hidden" name="studentname" value="<%=request.getParameter("studentname") %>"/>
<div class="cNav1">
	<a href="<%=basePath %>studentservlet?order=zhifucenter"><span>充值首页</span></a>
	<a href="<%=basePath %>datainfo/chongzhimoney.jsp?studentname=${param.studentname}" class="cur"><span>余额充值</span></a>
	<a href="<%=basePath %>moneyservlet?order=list"><span>充值记录</span></a>
</div>
<p class="clear"></p><style>
.ac_results {
  padding: 0px;
  border: 1px solid black;
  background-color: white;
  overflow: hidden;
  z-index: 99999;
}

.ac_results ul {
  width: 100%;
  list-style-position: outside;
  list-style: none;
  padding: 0;
  margin: 0;
}

.ac_results li {
  margin: 0px;
  padding: 2px 5px;
  cursor: default;
  display: block;
  /*
  if width will be 100% horizontal scrollbar will apear
  when scroll mode will be used
  */
  /*width: 100%;*/
  font: menu;
  font-size: 12px;
  /*
  it is very important, if line-height not setted or setted
  in relative units scroll will be broken in firefox
  */
  line-height: 16px;
  overflow: hidden;
}

.ac_loading {
  background: white url('http://pay.51cto.com/static/images/indicator.gif') right center no-repeat;
}

.ac_odd {
  background-color: #eee;
}

.ac_over {
  background-color: #0A246A;
  color: white;
}
.thr{text-decoration:line-through; vertical-align: middle;}
</style>
<div class="chbox">
<div class="ch-filter" style="position:relative;">
<div class="fl"><strong>余额充值</strong>
<div class="d-chTab">
	<span class="cur mytab" atab="taba" style="cursor:pointer;">给自己充值</span>
</div>
</div>
</div>
<div class="ch-cont" id="taba">
	<form class="form-horizontal" role="form" method="post" action="<%=basePath %>datainfo/qrchongzhi.jsp" onsubmit="return check_form(this)">
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<td height="30" colspan="3" align="right" valign="middle" class="font14">&nbsp;</td>
	</tr>
	<tr>
	<td width="91" height="45" align="right" valign="middle" class="font14">充值余额：</td>
	<td width="659" colspan="2"><input name="money" type="text" value="0" class="d-inp rmbnum"/></td>
	</tr>
	<tr>
	<td height="50" align="right" valign="middle" class="font14">&nbsp;</td>
	<td colspan="2">
		<input type="hidden" name="appkey" value="pay_center" />
		<input type="submit" class="btn5" value="下一步" /></td>
	</tr>

	</table>
	</form>
</div>
<div class="d-chQA" id="taba2">
<h7>  </h7>
<h4>使用遇到问题？</h4>
<dl>
<dt>1.银行转账方式：</dt>
<dd>汇款至IT课堂的官方银行账户，并联系客服，客服确认收款后为您充值余额。<br />帐户：赣州宏图软件<br />开户行：中国银行<br />银行帐号：6226820014201855446</dd>
<dt>
	<p>2.联系客服：</p>
</dt>
<dd>
	<div class="clear"></div>
	<div class="clear"></div>
	<p style="font-weight:bold;">电话：176-0797-5702  （工作日9:00-18:00）</p>
</dd>
</dl>
</div>


<div class="ch-cont" id="tabb" style="display:none;">
	<form class="form-horizontal" role="form" method="post" action="/index.php?do=gold&m=createOrder" onsubmit="return check_form(this)">
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<td width="147" height="45" align="right" valign="middle" class="font14">对方51CTO用户名：</td>
	<td width="165" align="left" valign="middle">
		<input name="ouruser" id="userList" type="text"  class="d-inp" />
	</td>
	<td width="438" align="left" valign="middle"><a class="btn3 send_f" href="javascript:void(0);" style="height:29px; line-height:29px;">赠送好友&gt;&gt;</a></td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	<td height="30" colspan="2" valign="top" class="c_red">注意：是IT课堂用户名,不是邮箱地址!</td>
	</tr>
	<tr>
	<td height="45" align="right" valign="middle" class="font14">充值余额：</td>
	<td colspan="2"><input name="rmb" type="text" value="0" class="d-inp rmbnum"/></td>
	</tr>
	<tr>
	<td height="50" align="right" valign="middle" class="font14">&nbsp;</td>
	<td colspan="2">
		<input type="hidden" name="appkey" value="pay_center" />
		<input type="submit" class="btn5" value="下一步" /></td>
	</tr>

	</table>
	</form>
</div>
<div class="d-chQA"  id="tabb2" style="display:none;">
<h4>使用遇到问题？</h4>
<dl>
<dt>1.没有支付宝，怎么用银行卡充值？</dt>
<dd>答：输入充值余额,点击下一步,选择支付宝,支付宝页面有"有卡就能支付",点击后按提示操作。</dd>
<dt>2.没有网上银行，怎么用银行卡充值？</dt>
<dd>答：储蓄卡用户，请使用储蓄卡快捷支付充值，开通后即可完成充值。</dd>
</dl>
</div>
</div>
<script>var online= new Array();</script>
<script src="http://webpresence.qq.com/getonline?Type=1&1981232509:"></script>
<script type="text/javascript">
$(function(){
	for(i=0;i<online.length;i++){
		if(online[i] == 0){
			$("#qq_online").eq(i).attr({'src':'/static/images/qq_offline.png'});
		}
	}
})
</script>
</div>
<div class="footer">
	<a href="<%=basePath %>courselistservlet?order=guanyu" target="_blank">关于我们</a>
    <span>|</span>
    <a href="<%=basePath %>courselistservlet?order=help" target="_blank">帮助中心</a>
    <span>|</span>
    <a href="<%=basePath %>courselistservlet?order=fankui1" target="_blank">意见反馈</a>
    <span>|</span>
    <a href="<%=basePath %>courselistservlet?order=lianxi" target="_blank"  title="联系我们">联系我们</a>
    <span>|</span>
    <a href="<%=basePath %>courselistservlet?order=dengji" target="_blank">课程登记</a>
    <span>|</span>
    <a href="<%=basePath %>courselistservlet?order=gushi" target="_blank">学员故事</a>
    <span>|</span>
    <a href="<%=basePath %>courselistservlet?order=jiaoliu" target="_blank"  title="学员交流">学员交流</a>
	Copyright @ 2005-2017 IT课堂.COM 版权所有
</div>
</body>
<script charset="utf-8" src="http://pay.51cto.com/index.php?do=juser&m=userStatus&reback=http%3A%2F%2Fpay.51cto.com%2Findex.php%3Fdo%3Dgold"></script>
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
