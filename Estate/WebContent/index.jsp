<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>

<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page import="com.gs.pojo.User"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<title>房产营销平台</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Mobile Specific Meta  -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=path %>/css1/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=path %>/css1/font-awesome.min.css" />
	<!-- Custom CSS -->
	<link href="<%=path %>/style.css" rel="stylesheet">
	<!-- 提示框 -->
	<script src="<%=path %>/js/sweetalert-dev.js"></script>
	<link rel="stylesheet" href="<%=path %>/css/sweetalert.css">

</head>

<body onload="body();">
<header>
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-12 hidden-xs">
					<div class="header-top-left">
						<div class="welcome-msg">
							<span class="default-msg hidden-xs">欢迎光临!</span>
							<span class="phone">免费电话: <span class="number">01234-567890</span></span>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-xs-12 col-sm-12">
					<div class="header-top-right">
						<div class="currency language">
							<s:if test="#request.user!=null">
								<div class="current">
                                        <span>
                                        	<img alt="头像" src="<%=path %>/upload/${user.headicon}" style="width:40px;height:30px;border-radius:300px;">
                                        	${user.nickname}
                                        </span>
								</div>
								<ul class="lang">
									<li><a href="<%=path %>/user/information">个人资料</a></li>
									<li><a href="<%=path %>/user/changePwd">修改密码</a></li>
									<li><a href="<%=path %>/user/exited">退出</a></li>
								</ul>
							</s:if>
							<s:else>
								<div class="">
									<a class="login" href="<%=path %>/user/loginPage" style="color:white">登录</a>
								</div>
							</s:else>
						</div>
						<s:if test="#request.user==null">
							<div class="language">
								<div class="">
									<a class="checkout" href="<%=path %>/user/registeredpage" style="color:white">注册</a>
								</div>

							</div>
						</s:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-middle">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-12 col-xs-8">
					<div class="logo">
						<s:if test="#request.user!=null">
							<a href="<%=path%>/user/homepage"><img src="<%=path %>/img/logo2.jpg" alt="房天下" /></a>
						</s:if>
						<s:else>
							<a href="<%=path%>/user/home"><img src="<%=path %>/img/logo2.jpg" alt="房天下" /></a>
						</s:else>
					</div>
				</div>
				<div class="col-md-5 col-sm-6 hidden-xs">
					<div class="search-box">
						<form action="">
							<input class="form-control search-form" type="text" id="search-buildings" placeholder="点击这里搜索楼盘" />
							<input type="hidden" id="user_id" name="user.id" value="${user.id }">
							<button class="search-button" value="Search" type="button" onclick="btn_search();"><i class="fa fa-search"></i></button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="main-menu-area hidden-xs hidden-sm">
		<div class="container">
			<div class="row">
				<div class="colo-md-12">
					<div class="main-menu">
						<nav>
							<ul class="ul1">
								<li class="active"><a href="<%=path%>/user/home">首页</a></li>
								<li><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
								<li><a href="<%=path%>/activity/all">楼盘活动</a></li>
								<li><a href="<%=path%>/agency/all">知名房企</a></li>
								<li><a href="<%=path%>/article/all">新闻中心</a></li>
								<li><a href="<%=path%>/agency/registered" target="_blank">房地产入驻</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- mobile-menu-area-start -->
	<div class="mobile-menu-area visible-xs visible-sm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="mobile_menu">
						<nav id="mobile_menu_active">
							<ul class="ul1">
								<li class="active"><a href="<%=path%>/user/home">首页</a></li>
								<li><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
								<li><a href="<%=path%>/activity/all">楼盘活动</a></li>
								<li><a href="<%=path%>/agency/all">知名房企</a></li>
								<li><a href="<%=path%>/article/all">新闻中心</a></li>
								<li><a href="<%=path%>/agency/registered" target="_blank">房地产入驻</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- mobile-menu-area-end -->
</header>
<!-- header-end -->
<!-- slider-start -->
<div class="slider-container">
	<div class="slider">
		<!-- 滑块图片 -->
		<div id="mainslider" class="nivoSlider slider-image">
			<img src="<%=path %>/img/slider/42.jpg" alt="main slider" title="#htmlcaption1"/>
			<img src="<%=path %>/img/slider/41.jpg" alt="main slider" title="#htmlcaption2" style="height:428px;"/>
			<img src="<%=path %>/img/slider/45.jpg" alt="main slider" title="#htmlcaption3" style="height:428px;"/>
		</div>
		<!-- Slider Caption 1 -->
		<div id="htmlcaption1" class="nivo-html-caption slider-caption-1">
			<div class="slider-progress"></div>
			<div class="slide1-text slide-1 hidden-xs">
				<div class="middle-text">
					<div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
						<h1>买最划算的房</h1>
					</div>
					<div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
						<h3>节省你的时间和金钱</h3>
					</div>
					<div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
						<a href="<%=path%>/builds/lookbuildings?builds.id=402880055e26374e015e267a2d440005" target="_blank">立即查看</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Slider Caption 2 -->
		<div id="htmlcaption2" class="nivo-html-caption slider-caption-2">
			<div class="slider-progress"></div>
			<div class="slide1-text slide-2 hidden-xs">
				<div class="middle-text">
					<div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
						<h1>住最好的房子</h1>
					</div>
					<div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
						<h3>体现你的高贵地位</h3>
					</div>
					<div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
						<a href="<%=path %>/builds/lookbuildings?builds.id=402880055de58f1e015de5b2749a0002" target="_blank">立即查看</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Slider Caption 3 -->
		<div id="htmlcaption3" class="nivo-html-caption slider-caption-3">
			<div class="slider-progress"></div>
			<div class="slide1-text slide-3 hidden-xs">
				<div class="middle-text">
					<div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
						<h1>住最高的房子</h1>
					</div>
					<div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
						<h3>俯瞰脚下的风景</h3>
					</div>
					<div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
						<a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5a1c5e30000" target="_blank">立即查看</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- slider-end -->
<!-- banner-area-start -->
<div class="banner-area hidden-sm hidden-xs">
	<div class="container">
		<div class="row">
			<s:iterator value="#request.adslist" var="d">
				<div class="col-md-4 col-xs-12">
					<div class="single-banner wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
						<a href="${d.ad_url }" target="_blank">
							<img src="<%=path %>/upload/${d.logo}" alt="" style="width:360px;height:233px;"/>
						</a>
					</div>
				</div>
			</s:iterator>
		</div>
	</div>
</div>
<!-- banner-area-end -->
<!-- feature-area-start -->
<div class="feature-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h3>好房推荐</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="feature-tab wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
					<ul class="my-tab">
						<li class="active"><a data-toggle="tab" href="#new">热卖</a></li>
						<li><a data-toggle="tab" href="#men">新房</a></li>
						<li><a data-toggle="tab" href="#women">好评</a></li>
						<li><a data-toggle="tab" href="#kids">特价</a></li>
					</ul>
					<div class="tab-content">
						<div id="new" class="tab-pane fade in active">
							<div class="tab-carousel">
								<s:iterator value="#request.list5" var="d">
									<div class="col-md-12">
										<!-- single-product-start -->
										<div class="single-product">
											<div class="single-product-img">
												<a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo }" alt="" style="width:280px;height:355px;"/></a>
												<span class="new-box">
				                                                <span class="sale">热售</span>
				                                        </span>
											</div>
											<div class="single-product-content">
												<div class="product-title">
													<h5><a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a></h5>
												</div>
												<div class="rating">
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star star-on"></div>
												</div>
												<div class="price-box">
													<span class="price">${d.avg_price }/平方米</span>
												</div>
												<div class="product-action">
													<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('${d.id }');">立即查看</button>
													<a href="javascript:void(0);" id="${d.id }" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
													<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('${d.id }');"><i class="fa fa-search"></i></a>
												</div>
											</div>
										</div>
										<!-- single-product-end -->
									</div>
								</s:iterator>

							</div>
						</div>
						<div id="men" class="tab-pane fade">
							<div class="tab-carousel">
								<s:iterator value="#request.List2" var="d">
									<div class="col-md-12">
										<!-- single-product-start -->
										<div class="single-product">
											<div class="single-product-img">
												<a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo }" alt="" style="width:280px;height:355px;"/></a>
												<span class="new-box">
				                                                <span class="new">新房</span>
				                                        </span>
											</div>
											<div class="single-product-content">
												<div class="product-title">
													<h5><a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a></h5>
												</div>
												<div class="rating">
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star"></div>
													<div class="star"></div>
												</div>
												<div class="price-box">
													<span class="price">${d.avg_price }/平方米</span>
												</div>
												<div class="product-action">
													<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('${d.id }');">立即查看</button>
													<a href="javascript:void(0);" id="${d.id }" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
													<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('${d.id }');"><i class="fa fa-search"></i></a>
												</div>
											</div>
										</div>
										<!-- single-product-end -->
									</div>
								</s:iterator>

							</div>
						</div>
						<div id="women" class="tab-pane fade">
							<div class="tab-carousel">
								<s:iterator value="#request.list3" var="d">
									<div class="col-md-12">
										<!-- single-product-start -->
										<div class="single-product">
											<div class="single-product-img">
												<a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo }" alt="" style="width:280px;height:355px;"/></a>
												<span class="new-box">
				                                                <span class="sale">热售</span>
				                                        </span>
											</div>
											<div class="single-product-content">
												<div class="product-title">
													<h5><a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a></h5>
												</div>
												<div class="rating">
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star"></div>
												</div>
												<div class="price-box">
													<span class="price">${d.avg_price }/平方米</span>
												</div>
												<div class="product-action">
													<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('${d.id }');">立即查看</button>
													<a href="javascript:void(0);" id="${d.id }" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
													<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('${d.id }');"><i class="fa fa-search"></i></a>
												</div>
											</div>
										</div>
										<!-- single-product-end -->
									</div>
								</s:iterator>
							</div>
						</div>
						<div id="kids" class="tab-pane fade">
							<div class="tab-carousel">
								<s:iterator value="#request.list4" var="d">
									<div class="col-md-12">
										<!-- single-product-start -->
										<div class="single-product">
											<div class="single-product-img">
												<a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo }" alt="" style="width:280px;height:355px;"/></a>
												<span class="new-box">
				                                                <span class="sale">热售</span>
				                                        </span>
											</div>
											<div class="single-product-content">
												<div class="product-title">
													<h5><a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a></h5>
												</div>
												<div class="rating">
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star star-on"></div>
													<div class="star"></div>
													<div class="star"></div>
												</div>
												<div class="price-box">
													<span class="price">${d.avg_price }/平方米</span>
												</div>
												<div class="product-action">
													<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('${d.id }');">立即查看</button>
													<a href="javascript:void(0);" id="${d.id }" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
													<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('${d.id }');"><i class="fa fa-search"></i></a>
												</div>
											</div>
										</div>
										<!-- single-product-end -->
									</div>
								</s:iterator>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- feature-area-end -->
<!-- new-product-area-start -->
<div class="new-product-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h3>最新楼盘</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="new-product wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
				<div class="new-carousel">
					<s:iterator value="#request.buildingsList" var="d">
						<div class="col-md-12">
							<!-- single-product-start -->
							<div class="single-product">
								<div class="single-product-img">
									<a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo }" alt="" style="width:280px;height:355px;"/></a>
									<span class="new-box">
	                                                <span class="new">新房</span>
	                                        </span>
								</div>
								<div class="single-product-content">
									<div class="product-title">
										<h5><a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a></h5>
									</div>
									<div class="rating">
										<div class="star star-on"></div>
										<div class="star star-on"></div>
										<div class="star star-on"></div>
										<div class="star star-on"></div>
										<div class="star"></div>
									</div>
									<div class="price-box">
										<span class="price">${d.avg_price }/平方米</span>
									</div>
									<div class="product-action">
										<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('${d.id }');">立即查看</button>
										<a href="javascript:void(0);" id="${d.id }" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
										<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('${d.id }');"><i class="fa fa-search"></i></a>
									</div>
								</div>
							</div>
							<!-- single-product-end -->
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- new-product-area-end -->

<!-- banner-2-area-start -->
<div class="banner-2-area">
	<div class="container">
		<div class="row">
			<s:iterator value="#request.adslist2" var="d">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="single-banner wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
						<a href="${d.ad_url }" target="_black"><img src="<%=path %>/upload/${d.logo}" alt="" style="width:555px;height:297px;"/></a>
					</div>
				</div>
			</s:iterator>
		</div>
	</div>
</div>
<!-- banner-2-area-end -->
<!-- exclusive-area-start -->
<div class="exclusive-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h3>特价楼盘</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="exclusive-product">
				<div class="exclusive-carousel">
					<div class="col-md-12">
						<!-- single-product-start -->
						<div class="single-product">
							<div class="single-product-img">
								<a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5dddf74000b" target="_blank" onclick="addhistory('402880055de58f1e015de5dddf74000b');"><img src="<%=path %>/upload/20170815202829.jpg" style="width:370px;height:400px;" alt=""/></a>
								<span class="discount-box">-16%</span>
							</div>
							<div class="upcoming">
								<span class="is-countdown"> </span>
								<div data-countdown="2017-09-10"></div>
							</div>
							<div class="single-product-content">
								<div class="product-title">
									<h5><a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5dddf74000b" target="_blank" onclick="addhistory('402880055de58f1e015de5dddf74000b');">锦绣华城</a></h5>
								</div>
								<div class="rating">
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star"></div>
									<div class="star"></div>
								</div>
								<div class="price-box">
									<span class="price">￥9990/平方米</span>
									<span class="old-price">￥11588/平方米</span>
								</div>
								<div class="product-action">
									<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('402880055de58f1e015de5dddf74000b');">立即查看</button>
									<a href="javascript:void(0);" id="402880055de58f1e015de5dddf74000b" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
									<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('402880055de58f1e015de5dddf74000b');"><i class="fa fa-search"></i></a>
								</div>
							</div>
						</div>
						<!-- single-product-end -->
					</div>
					<div class="col-md-12">
						<!-- single-product-start -->
						<div class="single-product">
							<div class="single-product-img">
								<a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5e77e90000c" target="_blank" onclick="addhistory('402880055de58f1e015de5e77e90000c');"><img src="<%=path %>/upload/20170815203859.jpg" style="width:370px;height:400px;" alt="" /></a>
								<span class="discount-box">-12%</span>
							</div>
							<div class="upcoming">
								<span class="is-countdown"> </span>
								<div data-countdown="2017/09/12"></div>
							</div>
							<div class="single-product-content">
								<div class="product-title">
									<h5><a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5e77e90000c" target="_blank" onclick="addhistory('402880055de58f1e015de5e77e90000c');">金地艺境</a></h5>
								</div>
								<div class="rating">
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star"></div>
									<div class="star"></div>
									<div class="star"></div>
								</div>
								<div class="price-box">
									<span class="price">￥18000/平方米</span>
									<span class="old-price">￥20160/平方米</span>
								</div>
								<div class="product-action">
									<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('402880055de58f1e015de5e77e90000c');">立即查看</button>
									<a href="javascript:void(0);" id="402880055de58f1e015de5e77e90000c" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
									<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('402880055de58f1e015de5e77e90000c');"><i class="fa fa-search"></i></a>
								</div>
							</div>
						</div>
						<!-- single-product-end -->
					</div>
					<div class="col-md-12">
						<!-- single-product-start -->
						<div class="single-product">
							<div class="single-product-img">
								<a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5eb1fdb000d" target="_blank" onclick="addhistory('402880055de58f1e015de5eb1fdb000d');"><img src="<%=path %>/upload/20170815204257.jpg" style="width:370px;height:400px;" alt="" /></a>
								<span class="discount-box">-8%</span>
							</div>
							<div class="upcoming">
								<span class="is-countdown"> </span>
								<div data-countdown="2017/09/15"></div>
							</div>
							<div class="single-product-content">
								<div class="product-title">
									<h5><a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5eb1fdb000d" target="_blank" onclick="addhistory('402880055de58f1e015de5eb1fdb000d');">御珑湾</a></h5>
								</div>
								<div class="rating">
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star star-on"></div>
								</div>
								<div class="price-box">
									<span class="price">￥18000/平方米</span>
									<span class="old-price">￥19440/平方米</span>
								</div>
								<div class="product-action">
									<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('402880055de58f1e015de5eb1fdb000d');">立即查看</button>
									<a href="javascript:void(0);" id="402880055de58f1e015de5eb1fdb000d" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
									<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('402880055de58f1e015de5eb1fdb000d');"><i class="fa fa-search"></i></a>
								</div>
							</div>
						</div>
						<!-- single-product-end -->
					</div>
					<div class="col-md-12">
						<!-- single-product-start -->
						<div class="single-product">
							<div class="single-product-img">
								<a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5f577f9000e" target="_blank" onclick="addhistory('402880055de58f1e015de5f577f9000e');"><img src="<%=path %>/upload/20170815205415.jpg" style="width:370px;height:400px;" alt="" /></a>
								<span class="discount-box">-5%</span>
							</div>
							<div class="upcoming">
								<span class="is-countdown"> </span>
								<div data-countdown="2017/09/7"></div>
							</div>
							<div class="single-product-content">
								<div class="product-title">
									<h5><a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5f577f9000e" target="_blank" onclick="addhistory('402880055de58f1e015de5f577f9000e');">中粮锦云 </a></h5>
								</div>
								<div class="rating">
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star star-on"></div>
									<div class="star"></div>
								</div>
								<div class="price-box">
									<span class="price">￥20000/平方米</span>
									<span class="old-price">￥21000/平方米</span>
								</div>
								<div class="product-action">
									<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('402880055de58f1e015de5f577f9000e');">立即查看</button>
									<a href="javascript:void(0);" id="402880055de58f1e015de5f577f9000e" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
									<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('402880055de58f1e015de5f577f9000e');"><i class="fa fa-search"></i></a>
								</div>
							</div>
						</div>
						<!-- single-product-end -->
					</div>
					<div class="col-md-12">
						<!-- single-product-start -->
						<div class="single-product">
							<div class="single-product-img">
								<a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5f9406a000f" target="_blank" onclick="addhistory('402880055de58f1e015de5f9406a000f');"><img src="<%=path %>/upload/20170815205823.jpg" style="width:370px;height:400px;" alt="" /></a>
								<span class="discount-box">-12%</span>
							</div>
							<div class="upcoming">
								<span class="is-countdown"> </span>
								<div data-countdown="2017/09/11"></div>
							</div>
							<div class="single-product-content">
								<div class="product-title">
									<h5><a href="<%=path%>/builds/lookbuildings?builds.id=402880055de58f1e015de5f577f9000e" target="_blank" onclick="addhistory('402880055de58f1e015de5f577f9000e');">中洲中央公园</a></h5>
								</div>
								<div class="rating">
									<div class="star"></div>
									<div class="star"></div>
									<div class="star"></div>
									<div class="star"></div>
									<div class="star"></div>
								</div>
								<div class="price-box">
									<span class="price">￥25000/平方米</span>
									<span class="old-price">￥28000/平方米</span>
								</div>
								<div class="product-action">
									<button class="btn btn-default add-cart" title="立即查看" onclick="openpage('402880055de58f1e015de5f577f9000e');">立即查看</button>
									<a href="javascript:void(0);" id="402880055de58f1e015de5f577f9000e" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
									<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('402880055de58f1e015de5f577f9000e');"><i class="fa fa-search"></i></a>
								</div>
							</div>
						</div>
						<!-- single-product-end -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- exclusive-area-end -->

<!-- blog-area-start -->
<div class="blog-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h3>新闻资讯</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="blogs wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
				<div class="blog-carousel">
					<s:iterator value="#request.articlelist" var="d">
						<div class="col-md-12">
							<div class="single-blog">
								<div class="blog-img">
									<a href="<%=path %>/article/look?article.id=${d.id}" target="_blank"><img src="<%=path %>/upload/${d.logo}" alt="${d.title }" style="width:360px;height:240px;"/></a>
								</div>
								<div class="blog-content">
									<h3><a href="<%=path %>/article/look?article.id=${d.id}" target="_blank">${d.title }</a></h3>
									<div class="meta">
										<span class="post-category">发表时间</span>
										<span class="meta-border">:</span>
										<span class="time"><i class="fa fa-clock-o"></i>${d.created_time }</span>
									</div>
									<p>${d.abstracts }</p>
								</div>
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- blog-area-end -->
<!-- brand-area-start -->
<div class="brand-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h3>知名房产</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="brands wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
				<div class="brand-carousel">
					<s:iterator value="#request.agencielist" var="d">
						<div class="col-md-12">
							<div class="single-brand">
								<a href="<%=path%>/builds/lookagency?agency.id=${d.id}" target="_blank"><img src="<%=path %>/upload/${d.logo}" alt="${d.name }" /></a>
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- brand-area-end -->
<!-- footer-start -->
<footer>
	<div class="footer-area wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
		<div class="footer-middle">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="row">
							<div class="col-md-3 col-sm-3 col-xs-12">
								<h4> 网站信息</h4>
								<ul class="toggle-footer">
									<li><a title="特刊" href="javascript:void(0);">特刊</a></li>
									<li><a title="新品上架" href="javascript:void(0);">新品上架</a></li>
									<li><a title="热销楼盘" href="javascript:void(0);">热销楼盘</a></li>
									<li><a title="我们的商店" href="javascript:void(0);">我们的商店</a></li>
									<li><a title="联系我们" href="javascript:void(0);">联系我们</a></li>
									<li><a title="网站地图" href="javascript:void(0);">网站地图</a></li>
								</ul>
							</div>
							<div class="col-md-3 col-sm-3 col-xs-12">
								<h4>我的帐号</h4>
								<ul class="toggle-footer">
									<li><a title="我的订单" href="javascript:void(0);">我的订单</a></li>
									<li><a title="我的信用卡" href="javascript:void(0);"> 我的信用卡</a></li>
									<li><a title="我的地址" href="javascript:void(0);">我的地址</a></li>
									<li><a title="我的个人信息" href="javascript:void(0);">我的个人信息</a></li>
								</ul>
							</div>
							<div class="col-md-3 col-sm-3 col-xs-12">
								<h4>友情链接</h4>
								<ul class="toggle-footer">
									<li><a href="http://www.jiajumi.com/" target="_blank">家具迷</a></li>
									<li><a href="http://nn.zxdyw.com/" target="_blank">南宁装修</a></li>
									<li><a href="http://8.fang.com/" target="_blank">北京贷款</a></li>
									<li><a href="http://pinpai.jieju.cn/" target="_blank">卫浴十大品牌榜</a></li>
									<li><a href="https://www.hjsk100.com/" target="_blank">娱乐新闻</a></li>
								</ul>
							</div>
							<div class="col-md-3  col-sm-3 col-xs-12">
								<h4>房天下营销平台</h4>
								<div class="footer-contact">
									<p class="description">近几年购房人群逐渐年轻化，80、90后已经成为购房的主力军，每个人都对手机非常熟悉，在购房之前都会自己先查阅相关的资料辅助自己选择合适的房子，此平台正好符合年轻购房人群的需求，此平台拥有丰富的房屋信息，并还能为购房用户提供最方便的贷款计算。
									</p>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12 footer-link"><font color="white">
						免责声明：本站旨在为用户提供更多楼盘信息，所载内容仅供参考，最终信息以售楼处为准。如该楼盘信息有误，您可以投诉或拨打举报电话： 0791-86751253</font>
					</div>

				</div>
			</div>
		</div>
	</div>
</footer>
<!-- footer-end -->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="product-details">
					<div class="container">
						<div class="row">
							<div class="col-md-5 col-xs-12 col-sm-5">
								<div class="picture-tab">
									<ul class="pic-tabs" id="trs1">

									</ul>
									<div class="tab-content" id="tbs1">

									</div>
								</div>
							</div>
							<div class="col-md-7 col-xs-12 col-sm-7">
								<div class="product-details-info">
									<h5 class="product-title" id="h51">新力合院</h5>
									<div class="price-box">
										<span class="price" id="price1">￥50.00</span>
										<span class="old-price" id="price2">￥70.00</span>
									</div>
									<div class="rating">
										<div class="star star-on"></div>
										<div class="star star-on"></div>
										<div class="star star-on"></div>
										<div class="star star-on"></div>
										<div class="star"></div>
									</div>
									<div class="short-description">
										<p id="p1"></p>
									</div>
									<div class="add-cart">
										<p class="quantity">
											<label>总套数</label>
											<input type="text" id="total_rooms1" value="1" disabled="" />
										</p>
										<div class="shop-add-cart" id="button2">
											<button>查看详情</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- modal-end -->
<!-- all js here -->
<!-- jquery latest version -->
<script src="<%=path %>/js1/vendor/jquery-1.12.0.min.js"></script>
<!-- bootstrap js -->
<script src="<%=path %>/js1/bootstrap.min.js"></script>
<!-- owl.carousel js -->
<script src="<%=path %>/js1/owl.carousel.min.js"></script>
<!-- meanmenu js -->
<script src="<%=path %>/js1/jquery.meanmenu.js"></script>
<!-- countdown js -->
<script src="<%=path %>/js1/countdown.js"></script>
<!-- jquery.nivo.slider.pack js -->
<script src="<%=path %>/js1/jquery.nivo.slider.pack.js"></script>
<!-- jquery-ui.min.js -->
<script src="<%=path %>/js1/jquery-ui.min.js"></script>
<!-- wow js -->
<script src="<%=path %>/js1/wow.min.js"></script>
<!-- plugins js -->
<script src="<%=path %>/js1/plugins.js"></script>
<!-- main js -->
<script src="<%=path %>/js1/main.js"></script>
<script src="<%=path %>/js/myJS/user_home.js"></script>
<script src="<%=path %>/js/myJS/addhistory.js"></script>
</body>

</html>

