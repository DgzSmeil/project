<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0044)https://www.pujinziben.com/account.html#cash -->
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>我的账户—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
	<meta name="keywords" content="普金资本，P2P汽车、房产融资，借贷，理财计划，投资理财">
	<meta name="description" content="普金资本是目前中国P2P投资融资行业中最快速、最安全的网上理财平台，为借贷和民间投资用户提供安全、高效的理财服务。">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/public.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/account.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/datepicker.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/login.css">
<link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon"></head>

<body rlt="1" style="">
<div class="account-right" style="width: 100%;height: 951px;">
		<!-- begin -->
		<div class="account-right">
<div class="account-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="show-cash active">提现</a>
		<a href="javascript:void(0);" class="show-cash-list ">提现记录</a>
	</div>
	<em class="em-line" style="left: 0px;"></em>
</div>
<div class="account-content" style="display: block;">
	<!-- 提现 -->
	<div class="cash-pay" style="display: block;">
		<p class="tips-title">
			<b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%的提现服务费，15天以后提现免服务费。禁止信用卡套现！<br>
			a）提现手续费由汇付收取，固定费用2元。<br>
			b）请输入您要提现的金额，我们将在1至3个工作日(国家节假日除外)之内将钱转入您网站上填写的银行账号。<br>
			c）每笔提现金额至少为100元以上。
		</p>
		<div class="pay-from">
			<input id="autoflag" type="hidden" value="${inItPage}">
			<div class="label cl">
				<label class="long">持卡人：</label><p class="text" id="cash-realName">${inItPage.uname}</p>
			</div>
			<div class="label cl">
				<label class="long">可提现金额：</label><p class="text color" id="cash-usableSum">${inItPage.kymoney}元</p>
			</div>
			<div class="label cl label-msg">
				<label class="long">提现至银行：</label><input type="text" class="select" id="select-bank" readonly="">
				<ul class="select-box">
					
				</ul>
			</div>
			<div class="label cl">
				<label class="long">提现金额：</label><input type="text" maxlength="15" id="cashInput" placeholder="请输入提现金额">
			</div>
			<div class="label cl">
				<label class="long">提现手续费：</label><p class="text" id="refreew"></p>
			</div>
			<%--<div class="label cl">
				<label class="long">提现服务费：</label><p class="text" id="refreew">0.00</p>
			</div>--%>
			 <div class="label cl">
				<label class="long">交易密码：</label><input type="password" maxlength="16" id="cash-password" autocomplete="new-password" placeholder="请输入交易密码"/>
				<p class="text ml10"><a href="recoverpwd.html#deal">忘记密码</a></p>
			</div>
			<div class="label cl">
				<label class="long">手机号码：</label><p class="text " aria-valuetext="" id="withdrawPhone">${inItPage.phone}</p>
			</div>
		<%--	<div class="label cl label-msg">
				<label class="long">验证码：</label><input type="text" maxlength="6" id="cash-smsCode" placeholder="请输入短信验证码">
				<div class="msg-btn">
					<button type="button" id="getMsgCode">获取验证码</button>
				</div>
			</div>--%>
			<button type="button" class="btn long disabled" id="cash-submit">立即提现</button>
		</div>
		<div id="returnHtml"></div>
	</div>
	<!-- 提现记录 -->
	<div class="cash-list" style="display: none;">
		<div class="account-form cl">
			<input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
			<p class="text">至</p>
			<input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
			<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
			<button type="button" class="search" id="cashSearch">搜索</button>
		</div>
		<div class="account-list">
			<ul class="cash-list-box list-box">
				<li class="title">
					<div class="children0">账户名</div>
					<div class="children1">提现金额</div>
					<div class="children2">提现银行卡号</div>
					<div class="children3">提现手续费</div>
					<div class="children4">提现时间</div>
					<div class="children5">状态</div>
					<div class="children6">操作</div>
				</li>
			</ul>
			<ul class="cash-list listData" style="display: none;">
			</ul>
			<ul class="paging"></ul>
		</div>
	</div>
</div>
		</div>
		<!-- end -->
	</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>


<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/account.js"></script>
<script>
    $(function(){
        hashChange();
        $(".show-cash").bind("click",function(){
            window.location.href=contextPath + "/logtx/page";
            $(".show-cash-list").removeClass("active");
            $(this).addClass("active");
            $(".em-line").css("left",'0px');
            $(".cash-list").hide();
            $(".cash-pay").show();
        });

        $(".show-cash-list").bind("click",function(){
            $(".show-cash").removeClass("active");
            $(this).addClass("active");
            $(".em-line").css("left",'120px');
            $(".cash-pay").hide();
            $(".cash-list").show();


        });

        $(".luckyLink").mouseover(function (){
            $(".luckyDetails").show();
        }).mouseout(function (){
            $(".luckyDetails").hide();
        });
    })
</script>
</html>


