<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0044)https://www.pujinziben.com/account.html#ipay -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
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
		<a href="javascript:void(0);" class="show-ipay active">充值</a>
		<a href="javascript:void(0);" class="show-ipay-list">充值记录</a>
	</div>
	<em class="em-line" style="left: 0px;"></em>
</div>
<div class="account-content">
	<!-- 充值 -->
	<div class="ipay-pay" style="display: block;">
		<p class="tips-title"><b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费 普金资本禁止信用卡套现、虚假交易
等行为,一经发现将予以处罚,包括但不限于：限制收款、冻结账户、永久停止服务,并有可能影响相关信用记录。</p>
		<div class="pay-from">
			<div class="label cl">
				<label class="long">充值金额：</label><input type="text" id="ipay-amt" maxlength="18" placeholder="请输入充值金额"><p class="roll">元</p>
			</div>
			<div class="label cl label-msg">
				<label class="long">我的银行卡：</label>
				<input type="text" class="select" id="select-bank" readonly="">
				<ul class="select-box">
		<%--<li data-name="建设银行" data-bankno="6212842120000014418">
			<a href="javascript:;">建设银行&nbsp;&nbsp;|&nbsp;&nbsp;6212 ******** 4418</a>
		</li>--%></ul>
			</div>
			<div class="label cl">
				<label class="long">充值类型：</label><img src="<%=path %>/static/images/huifu.png">
			</div>
			<button type="button" class="btn" id="ipay-submit">立即充值</button>
		</div>
		<div id="alipay"></div>
	</div>
	<!-- 充值记录 -->
	<div class="ipay-list" style="display: none;">
		<div class="account-form cl">
			<input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
			<p class="text">至</p>
			<input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
			<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
			<button type="button" class="search" id="ipaySearch">搜索</button>
		</div>
		<div class="account-list">
			<ul class="ipay-list-box list-box">
				<li class="title">
					<div class="children0">账户名</div>
					<div class="children1">充值金额</div>
					<div class="children2">充值类型</div>
					<div class="children3">充值时间</div>
					<div class="children4">充值状态</div>
				</li>
			</ul>
			<ul class="ipay-list-box listData">
				<%--<li class="none" style="line-height: 60px;">没有符合条件的内容！</li>--%>
			</ul>
			<ul class="paging"></ul>
		</div>
	</div>
</div>
		</div>
		<!-- end -->
	</div>
	<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>


	<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="<%=path%>/static/js/account.js"></script>


	<script>
        $(function(){
            hashChange();
            $(".show-ipay").bind("click",function(){
                $(".show-ipay-list").removeClass("active");
                $(this).addClass("active");
                $(".em-line").css("left",'0px');
                $(".ipay-list").hide();
                $(".ipay-pay").show();
            });

            $(".show-ipay-list").bind("click",function(){
                $(".show-ipay").removeClass("active");
                $(this).addClass("active");
                $(".em-line").css("left",'120px');
                $(".ipay-pay").hide();
                $(".ipay-list").show();


            });


        })
	</script>
</body></html>