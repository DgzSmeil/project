<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0044)https://www.pujinziben.com/account.html#fund -->
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
		<a href="javascript:void(0);" class="active">资金记录</a>
	</div>
	<em></em>
</div>
<div class="account-content">
	<div class="fund-param-list">
		<p>交易类型：</p>
		<ul class="cl">
			<li class="active"><a href="javascript:;">全部</a></li>
			<li><a href="javascript:;">投资</a></li>
			<li><a href="javascript:;">充值</a></li>
			<li><a href="javascript:;">提现</a></li>
			<li><a href="javascript:;">还款</a></li>
			<li><a href="javascript:;">奖励</a></li>
			<li><a href="javascript:;">冻结</a></li>
		</ul>
	</div>
	<div class="account-form cl">
		<p class="text long">交易时间：</p>
		<input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
		<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
		<button type="button" class="search" id="fundSearch">搜索</button>
	</div>
	<div class="account-list">
			<ul class="fund-list-box list-box">
				<li class="title">
					<div class="children0">交易时间</div>
					<div class="children1">交易类型</div>
					<div class="children2">交易金额</div>
					<div class="children3">可用余额</div>
					<div class="children4">操作</div>
				</li>
			</ul>
			<ul class="fund-list-box listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
			<ul class="paging"></ul>
		</div>
</div></div>
		<!-- end -->
	</div>
</body></html>