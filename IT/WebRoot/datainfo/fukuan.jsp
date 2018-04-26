<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IT课堂支付中心</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<LINK href="/favicon.ico" type="image/x-icon" rel=icon>
<script src="http://pay.51cto.com/static/js/jquery.js" ></script>
<link href="http://pay.51cto.com/static/css/reset.css" rel="stylesheet" type="text/css" />
<link href="http://pay.51cto.com/static/css/style.css?v=1.0.1" rel="stylesheet" type="text/css" />
<style type="text/css">
.footer{ margin-top:75px;}
</style>

</head>

<body>

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
</script><style type="text/css">
body {background:#ececec;}
</style>
  <script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript">
function check_form(obj){

	var jGold = 0;
	var jRmb = 0;
	if($('input[name="myyue"]').prop('checked')){
		jGold = $('#payGold').html() * 1;
	}

	if($('input[name="isPayByRmb"]').prop('checked')){
		jRmb = $('#payRmb').html() * 1;
	}

	if((jGold+jRmb)!=139){
		layer.alert('请您选择使用余额支付或现金支付');
		return false;
	}
	
	var flag = false;
		$('#rightpay').prop('disabled', true);
	return true;
}

	var jsPgold = 0;
	var jsPrmb = 139;
	var jsPrice = 139;
	var rate = 6.1;

function init(){
	$('input[name=myyue], input[name=isPayByRmb]').bind('click', function(){
		if(!$('#cBox_2')[0].checked && !$('#cBox_1')[0].checked)return false;
		if(!$(this).prop('checked')){
			if('myyue'==$(this).attr('name')){
				$('#payRmb').html(jsPrice);
				$("#payUsd").html(round(jsPrice/rate,2));

				var html = '现金支付'+jsPrmb+'元';
				$('#pay_detail').html(html);
			}
		} else {
			if('myyue'==$(this).attr('name')){
				$('#payRmb').html(jsPrice-jsPgold);
				$("#payUsd").html(round((jsPrice-jsPgold)/rate,2));
				var tmp_price = jsPrice-jsPgold;
				var html = '';
				if(tmp_price>0){
					html = '已选择余额支付'+jsPgold+'元，现金支付'+tmp_price+'元';
				}else{
					html = '余额支付'+jsPgold+'元';
				}
				$('#pay_detail').html(html);
			}
		}
		if(
				($('input[name=myyue]').first().attr('checked') != 'checked') &&
				($('input[name=isPayByRmb]').first().attr('checked') != 'checked')
		){
			$('#pay_detail_div').hide();
		}else{
			$('#pay_detail_div').show();
		}


	});

	function round(Dight,How){
        return Math.round(Dight*Math.pow(10,How))/Math.pow(10,How);
    }
};

function checkSetPayPwd(){

	var b = setInterval(function(){
		$.ajax({
			url:"/index.php?do=assem&m=checkSetPayPwd",
			dataType:"json",
			success:function(res){
				if(res[0]){   //如果成功
					clearInterval(b);
					var html = ' <p>支付密码：</p><input type="password" id="typePayPassword"  name="pay_pwd" autocomplete="off" value="请输入支付密码">';
					$(".PaymentPass").html(html);
					$('#rightpay').prop('disabled', false).removeClass("btnGrey").addClass("btn2");
					payPwdHolder();

				}
			}
		})
	},3000)
}
</script>

<div class="payPage">
	<div class="header clearfix">
	<div class="wrap">
	<div class="logo"><a href="/"><img src="<%=basePath %>image/zhifulogo.png" alt="支付中心" /></a></div>
	</div>
	</div>
	<div class="wrap">
<form class="form-horizontal" role="form" method="post" action="<%=basePath %>courselistservlet?order=qrbuy&courseid=<%=request.getAttribute("courseid") %>">
	<c:if test="${msg!=null}">
		<script type="text/javascript">
			alert("${msg}");
		</script>
	</c:if>
		<input type="hidden" name="studentid" value="<%=request.getAttribute("studentid") %>"/>
		<div>
			<div class="order-hd">
			<div class="order-tit">
			<h3>商品：${requestScope.coursename}</h3>
                        <div class="order-amount"><em>${requestScope.summoney}</em>元 <span class="c_gray"> </span></div>
			</div>
			<div class="order-seller"> 收款方：IT课堂 </div>
			</div>
			<div class="cbg">
				<label for="cBox_2">
					<div class="payType-one  payType-sel ">
						<dl>
							<dt>
								<input name="isPayByRmb" type="checkbox" id="cBox_2" value="1"  checked="checked"    onclick="return false"     />
								现金支付</dt>
						</dl>
						<p class="payNum" style="">
							<span id="payRmb">${requestScope.summoney}</span>
							元
							<span id="usd_info" style="display:none;margin:0;color:#666 !important;font-size: 12px !important;font-weight: normal !important;">
								（<span style="font-size:14px"  id="payUsd">${requestScope.summoney/6.1}</span>美元 &nbsp;1美元=6.1元）
							</span>
						</p>
					</div>
				</label>
				<div class="payType-eles">
					<!--<dl>-->
					<!--<dt>请选择支付方式：</dt>-->
					<!--</dl>-->
					<div class="payTypeList" style="overflow: visible; margin-bottom: 10px;margin-top: 0;">
							<input name="paybuytype" value="0" id="payType_0" type="radio"  />
							<label for="payType_0" class="payType_0 " title="支付宝账号及快捷支付">
								<img src="http://pay.51cto.com/static/images/change.png" />
							</label>
							<input name="paybuytype" value="1" id="payType_8" type="radio"  checked="checked" />
							<label for="payType_8" class="payType_8 change" title="微信扫码支付">
								<img src="http://pay.51cto.com/static/images/change.png" />
							</label>
							<input name="paybuytype" value="2" id="payType_2" type="radio"  />
							<label for="payType_2" class="payType_2 " title="网银、信用卡支付">
								<img src="http://pay.51cto.com/static/images/change.png" />
							</label>
							<input name="paybuytype" value="3" id="payType_3" type="radio"  />
							<label for="payType_3" class="payType_3 " title="外币支付">
								<img src="http://pay.51cto.com/static/images/change.png" />
							</label>
							<div style="clear:both;height:0px;width:0px;overflow:hidden;"></div>
					</div>
					<p class="clear"></p>
				</div>
								<label for="cBox_1">
					<div class="payType-one ">

						<dl>
							<dt>
								<input name="myyue" value="1" id="cBox_1" type="checkbox"  disabled="disabled"  />
								余额支付</dt>
							<dd>余额：<strong>${moneybean.summoney}元</strong></dd>
							<dd>可使用：<strong>${moneybean.summoney}元</strong></dd>
							<dd  id="show_freeze_help">
							<a  
							style="color:#484848; " target="_blank">已冻结：<strong>0元</strong></a>
							</dd>
						<p class="payNum" style="display:none;"><span id="payGold">0</span>元 </p>
					</div>
				</label>
			<!---->
				<style>
					.btn2, .btnGrey {
						background: url(http://s5.51cto.com/wyfs02/M00/82/38/wKioL1dOo7Lz-4PTAAAA12-HiYY751.png) no-repeat left ;
						width: 140px;
						height: 41px;;
					}
				</style>

				<div id="pay_detail_div" style="height: 50px; line-height: 50px; font-size: 16px; color: rgb(200, 1, 0); font-weight: bold; padding: 15px 0px 0px 40px;">
					<span id="pay_detail">现金支付${requestScope.summoney}元</span>
				</div>
				<div id="pay_detail_div" style="height: 50px; line-height: 50px; font-size: 16px; color: rgb(200, 1, 0); font-weight: bold; padding: 15px 0px 0px 40px;">
					<input type="password" name="password" placeholder="填写支付密码" style="height: 30px; line-height: 50px; font-size: 16px;"/>
				</div>
				<div class="pay-btnbox">
					<input type="hidden" name="did" value="1697310" />
					<input type="hidden" name="mymoney" value="${requestScope.summoney}" />
					<input type="hidden" name="fukuan" value="<%=request.getParameter("fukuan") %>" />
					<input type="hidden" name="third_type" value="edu_orders" />
					<input type="hidden" name="t" value="0" />
					<input  id="rightpay" type="submit" class="btn2" value="确认付款"  />
					<a href="<%=basePath %>datainfo/chongzhimoney.jsp?userid=<%=request.getParameter("studentid")%>"><input  id="rightpay" type="button" class="btn2" value="我要充值"  /></a>
					
				</div>
								<div class="d-chQA" id="taba2">
					<p>
					   				    </p>
					<h4>支付遇到问题？</h4>


					<div style="width: 100%;height:100px;display: block;">
																		<div style="width: 200px; float: left;display: block;">
							<script charset="utf-8" src="http://wpa.b.qq.com/cgi/wpa.php"></script>
							<div id="bizQQ_WPA">
								<!--<img src="http://s4.51cto.com/wyfs02/M01/82/38/wKioL1dOowqRDKYUAAAaJiLdKTg501.png">-->
								<img style="margin-top:27px;" src="http://s2.51cto.com/wyfs02/M00/82/39/wKiom1dOolDwW06EAAAKQwGnSus781.png"/>
							</div>
							<script type="text/javascript">
								var qq_val = '4008519651';
								if(4008519651){
									var qq_val = 4008519651;
								}
								BizQQWPA.addCustom({aty: '0',a: '1001',
									nameAccount: qq_val,
									selector: 'bizQQ_WPA'});
								BizQQWPA.visitor({nameAccount: qq_val});
							</script>
						</div>
						<div style="width:600px;float:left;display: block;font-size: 14px;line-height: 100px;">
						电话： 176-0797-5702（9:00-18:00）
						</div>
						<div style="clear: both;"></div>
					</div>
				</div>
							</div>
		</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(".payTypeList").children('label').click(function(){
	if(!$(this).prev().prop('disabled')){
		if($(this).attr('for') == 'payType_3'){
			$('#usd_info').show();
		}else{
			$('#usd_info').hide();
		}
		$(this).addClass('change').siblings().removeClass('change');
		if(
				navigator.appName == "Microsoft Internet Explorer" &&
				(
						navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE6.0" ||
						navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE7.0" ||
						navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE8.0"
				)
		){
			$("input[name='paybuytype']").removeAttr('checked')
			$(this).prev().attr('checked','checked')
		}

	}
});
$(".payType_0").click();
$("#cBox_1").change(function(){
	if($(this).prop('checked')){
		$("#payType_6").prop('disabled',true);
		$(".payType_6").css('opacity',0.5);
		$(".payType_0").click();
	}else{
				$("#payType_6").prop('disabled',false);
		$(".payType_6").css('opacity',1);
			}
});
function payPwdHolder(){
	$("#typePayPassword").focus(function(){
	if($(this).val() == '请输入支付密码'){
		$(this).val('');
		$(this).css('color','#333');
		$(this).attr('type','password');
	}
}).blur(function(){
	if($(this).val() == '请输入支付密码' || $(this).val() == ''){
		$(this).val('请输入支付密码');
		$(this).css('color','#999');
		$(this).attr('type','text');
	}
});
}
payPwdHolder();
</script>


<style>
	#show_freeze_help{
		/*display: block;*/
		height:30px;
		padding: 10px 0px;
	}
</style>

<script type="text/javascript">
init();


$(".payType-one,.payType-eles").bind('mouseover',function(){
	if($(this).hasClass('payType-sel') == false){
		$(this).addClass('payType-on');
	}
});
$(".payType-one,.payType-eles").bind('mouseout',function(){
	if($(this).hasClass('payType-sel') == false){
		$(this).removeClass('payType-on');
	}
});
$("#cBox_1").bind('click',function(e){
	if(!$('#cBox_2')[0].checked && !$('#cBox_1')[0].checked)return false;
	if($(this).prop('checked')){
		$(this).parent().parent().parent().removeClass('payType-on');
		$(this).parent().parent().parent().addClass('payType-sel');
		if('0'){
			/*if($("#typePayPassword").length<=0){
				$('#rightpay').prop('disabled','true').addClass("btnGrey").removeClass("btn2");
			}*/
			$("#payPwdDiv").show();
            $(".submitButton").hide();
            $(".paySub").show();
		}
	}else{
		$(this).parent().parent().parent().addClass('payType-on');
		$(this).parent().parent().parent().removeClass('payType-sel');
		if('0'){
			$("#payPwdDiv").hide();
			$('#rightpay').prop('disabled','').addClass("btn2").removeClass("btnGrey");
            $(".submitButton").hide();
            $("#rightpay").show();
		}
	}
});
$("#cBox_1,#cBox_2").bind('click',function(e){
	if(!$('#cBox_2')[0].checked && !$('#cBox_1')[0].checked)return false;
	if($(this).prop('checked')){
		$(this).parent().parent().parent().removeClass('payType-on');
		$(this).parent().parent().parent().addClass('payType-sel');
		if($(this).attr('id')=='cBox_1'){
			$(this).parent().parent().next().fadeIn(100);
		}
	}else{
		$(this).parent().parent().parent().addClass('payType-on');
		$(this).parent().parent().parent().removeClass('payType-sel');
		if($(this).attr('id')=='cBox_1'){
			$(this).parent().parent().next().fadeOut(100);
		}
	}
});

</script>
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
<script charset="utf-8" src="http://pay.51cto.com/index.php?do=juser&m=userStatus&reback=http%3A%2F%2Fpay.51cto.com%2Findex.php%3Fdo%3Dassem%26m%3Dnewthirselect"></script>
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