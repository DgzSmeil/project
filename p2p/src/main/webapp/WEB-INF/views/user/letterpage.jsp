<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>我的账户—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
	<meta name="keywords" content="普金资本，P2P汽车、房产融资，借贷，理财计划，投资理财">
	<meta name="description" content="普金资本是目前中国P2P投资融资行业中最快速、最安全的网上理财平台，为借贷和民间投资用户提供安全、高效的理财服务。">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/public.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/account.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/datepicker.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/login.css">
	<link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon"></head>

<body>

<div class="account-right" style="width: 100%;height: 951px;">
	<div class="account-right-nav">
		<div class="sub-a-nav">
			<a href="javascript:void(0);" class="active show-cash">消息中心</a>
		</div>
		<em class="em-line"></em>
	</div>
	<div class="account-content" style="margin-top: -40px;">
		<div class="sub-nav" style="margin-top: 15px;">
			<a href="javascript:;" onclick="deleteMsg();" id="delSys">删除</a>
			<a href="javascript:;" onclick="readedSys();" id="readedSys">标为已读</a>
			<a href="javascript:;" onclick="unReadSys();" id="unReadSys">标为未读</a>
		</div>

		<div class="msg-list">
			<div class="account-list">
				<ul class="cash-list-box listData">
					<li class="title">
						<div class="children0"><input type="checkbox" name="checkbox" id="checkbox" onclick="checkAll_Sys(this);"><span>状态</span></div>
						<div class="children1">来源</div>
						<div class="children2">标题</div>
						<div class="children3">日期</div>
					</li>
				</ul>
				<ul class="msg-list listData">
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
		<script type="text/javascript" src="<%=path%>/static/js/account.js"></script>
<script>
	$(function() {
	    hashChange();
	});
</script>
</body></html>