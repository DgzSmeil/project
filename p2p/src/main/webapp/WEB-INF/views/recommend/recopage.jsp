<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0047)https://www.pujinziben.com/account.html#tuijian -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>我的账户—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
	<meta name="keywords" content="普金资本，P2P汽车、房产融资，借贷，理财计划，投资理财">
	<meta name="description" co ntent="普金资本是目前中国P2P投资融资行业中最快速、最安全的网上理财平台，为借贷和民间投资用户提供安全、高效的理财服务。">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/public.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/account.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/datepicker.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/login.css">
	<link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon"></head>

<body rlt="1" style="">

		<div class="account-right" style="width: 100%;height: 951px;">
<div class="account-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="tuijian active">推荐好友</a>
		<a href="javascript:void(0);" class="show-tuijian-list">推荐列表</a>
		<a href="javascript:void(0);" class="fanhui" style="display: none;">返回</a>
	</div>
	<em class="em-line" style="left: 0px;"></em>
</div>
<div class="account-content">
	<div class="tuiJianShow" style="display: block;">
		<img src="<%=path %>/static/images/banner_t.png" width="896" height="260">
		<p class="tj-tips">尊敬的用户,您的推荐号为：<span id="uid">${tzm}</span></p>
		<p class="tj-text">活动时间：<span>2017年12月15日—2018年1月15日；</span></p>
		<p class="tj-text">活动对象：活动期间新注册用户的推荐人；</p>
		<p class="tj-text">活动说明：1.活动期间邀请好友注册并累计投资满10000元，得50元现金券奖励；</p>
		<p class="tj-text" style="padding-left: 70px;">2.	活动期间内成功邀请5位以上好友注册投资成功合计满100000，可额外获得500元现金券奖励，可在<span>【我的账户-我的赠券】</span>中查看。</p>
		<p class="tj-text" style="padding-left: 70px;">(满足活动条件的用户在活动结束后3个工作日内奖励将以现金券的形式发放至用户账户)</p>
		<p class="tj-text"><span>注：</span>需将自己的邀请链接地址或推荐号发给您的好友，这样您才能成为他的邀请者。</p>
		<div class="tj-clip" id="tj-clip">
			<p class="tj-clip-text" id="tj-clip-text">http://localhost:8080/user/regist_page?tzm=${tzm}</p>
			<button type="button" class="tj-clip-btn" id="tj-clip-btn">复制链接</button>
		</div>
		<div class="tj-icon">
			<ul>
				<li>
					<a href="javascript:;" onmouseover="weixin1();" onmouseleave="weixin2();">
						<p id="weixin" class="icon icon-weichart"></p>
					</a>
					<p>分享到微信</p>
				</li>
				<li>
					<a target="_blank" href="http://connect.qq.com/widget/shareqq/index.html?url=http://www.pujinziben.com&amp;desc=%E6%99%AE%E9%87%91%E8%B5%84%E6%9C%AC%E8%BF%90%E8%90%A5(%E8%B5%A3%E5%B7%9E)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&amp;title=%E6%99%AE%E9%87%91%E8%B5%84%E6%9C%AC%E8%BF%90%E8%90%A5(%E8%B5%A3%E5%B7%9E)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&amp;pics=http://www.pujinziben.com/resources/front/v01/src/images/logo.png&amp;summary=%E8%BF%98%E4%B8%8D%E9%94%99%E5%93%A6&amp;site=QQ%E5%88%86%E4%BA%AB&amp;style=201&amp;width=32&amp;height=32" class="about_qq">
						<p class="icon icon-QQ"></p>
					</a>
					<p>分享到QQ</p>
				</li>
				<li>
				  	<a href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http://www.pujinziben.com/&amp;title=%E6%99%AE%E9%87%91%E8%B5%84%E6%9C%AC%E8%BF%90%E8%90%A5(%E8%B5%A3%E5%B7%9E)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8">
						<p class="icon icon-qzone"></p>
					</a>
					<p>分享到QQ空间</p>
				</li>
				<li>
					<a target="_blank" href="http://service.weibo.com/share/share.php?url=http://www.pujinziben.com&amp;title=%E6%99%AE%E9%87%91%E8%B5%84%E6%9C%AC%E8%BF%90%E8%90%A5(%E8%B5%A3%E5%B7%9E)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&amp;appkey=1343713053&amp;searchPic=true" class="about_sina">
						<p class="icon icon-Sina"></p>
					</a>
					<p>分享到新浪微博</p>
				</li>
			</ul>
		</div>
	</div>

	<div class="tuijian-list" style="display: none;">
		<div class="account-form cl">
			<input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
			<p class="text">至</p>
			<input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
			 <button type="button" class="search" id="cashSearch">搜索</button>
		</div>

<!-- 		 -->


		<div class="account-list">
			<ul class="cash-list-box list-box">
				<li class="title">
					<div class="children01">用户名</div>
					<div class="children02">用户创建时间</div>
					<div class="children03">被推荐用户</div>
					<%--<div class="children04">操作</div>--%>
				</li>
			</ul>
			<ul class="tuijian-list listData" style="display: none;">
				</ul>
			<ul class="paging"></ul>
		</div>
	</div>

	<div class="investList" style="display: none;">
		<div class="account-form cl">
			<p class="text" style="width: 120px;">借款发布时间:</p>
			<input type="text" class="date icon icon-date" autocomplete="off" id="invest-startDate">
			<p class="text">至</p>
			<input type="text" class="date icon icon-date" autocomplete="off" id="invest-endDate">
			<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
			<button type="button" class="search" id="investSearch">搜索</button>
		</div>
		<div class="invest-listData invest-listData1">
			<ul class="investData list-box">
				<li class="title">
					<div class="children0">标题</div>
					<div class="children1">类型</div>
					<div class="children2">年利率</div>
					<div class="children3">期限</div>
					<div class="children4">还款方式</div>
					<div class="children5">投资金额</div>
					<div class="children6">投资时间</div>
				</li>
			</ul>
			<ul class="investData listData">
			</ul>
			<ul class="paging">
			</ul>
		</div>
	</div>
</div>
</div>
		<!-- end -->
	</div>
		<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>
		<script src="<%=path %>/static/js/ZeroClipboard.js"></script>
		<script type="text/javascript" src="<%=path%>/static/js/account.js"></script>
		<script>
            $(function (){
                hashChange();
            })
		</script>
</body>
</html>
