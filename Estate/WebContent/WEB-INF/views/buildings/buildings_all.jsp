<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
     <%
    	String path = request.getContextPath();
    %>
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

        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<%=path %>/css/font-awesome.min.css" />
        <!-- Custom CSS -->
        <link href="<%=path %>/style.css" rel="stylesheet">
        
        <!-- 提示框 -->
	  	<script src="<%=path %>/js/sweetalert-dev.js"></script>
	  	<link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
    </head>
    <body onload="body();">

        <!-- header-start -->
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
                                    		<li><a href="<%=path%>/user/home">首页</a></li>
											<li class="active"><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
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
                                    		<li><a href="<%=path%>/user/home">首页</a></li>
											<li class="active"><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
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
        <!-- heading-banner-start -->
        <div class="heading-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-xs-12">
                        <div class="breadcrumb">
                            <a title="Return to Home" href="index.html">
                                <i class="icon-home"></i>
                            </a>
                            <span class="navigation-page">
                                <span class="navigation-pipe">></span>
                                	所有楼盘
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- heading-banner-end -->
        <!-- shop-area-start -->
        <div class="shop-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="shop-left-col wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                            <div class="content-box">
                                <h2>分类</h2>
                                <ul>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="house_type" onclick="page(1,'住宅');"/>
                                        </span>
                                        <label class="check-label">
                                            <a href="javascript:void(0);">住宅 </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio"  name="house_type" onclick="page(1,'经济适用房 ');"/>
                                        </span>
                                        <label class="check-label">
                                            <a href="javascript:void(0);">经济适用房</a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="house_type" onclick="page(1,'别墅');"/>
                                        </span>
                                        <label class="check-label">
                                            <a href="javascript:void(0);">别墅 </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio"  name="house_type" onclick="page(1,'写字楼');"/>
                                        </span>
                                        <label class="check-label">
                                            <a href="javascript:void(0);">写字楼 </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio"  name="house_type" onclick="page(1,'商铺 ');"/>
                                        </span>
                                        <label class="check-label">
                                            <a href="javascript:void(0);">商铺 </a>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                            
                            <div class="content-box">
                                <h2>价格</h2>
                                <ul>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="avg_price" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">3000以下 </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="avg_price" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">3000-5000 </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="avg_price" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">5000-7000 </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="avg_price" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">7000-9000 </a>
                                        </label>
                                    </li>
									<li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="avg_price" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">9000-11000 </a>
                                        </label>
                                    </li>
									<li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="avg_price" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">11000以上 </a>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                            <div class="content-box">
                                <h2>面积</h2>
                                <ul>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="area" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">50㎡以下 </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="area" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">50-70㎡ </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="area" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">70-90㎡ </a>
                                        </label>
                                    </li>
                                    <li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="area" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">90-110㎡ </a>
                                        </label>
                                    </li>
									<li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="area" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">110-150㎡ </a>
                                        </label>
                                    </li>
									<li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="area" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">150-200㎡ </a>
                                        </label>
                                    </li>
									<li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="area" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">200-300㎡ </a>
                                        </label>
                                    </li>
									<li>
                                        <span class="checkit">
                                            <input class="radio" type="radio" name="area" />
                                        </span>
                                        <label class="check-label">
                                            <a href="#">300㎡以上 </a>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <div class="shop-right-col wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                            <div class="category-products">
                                <div class="topbar-category">
                                    <div class="pager-area">
                                        <div>
                                            <!-- Nav tabs -->
                                            <ul class="shop-tab">
                                                <li role="presentation" class="active"><a href="#gried_view" role="tab" data-toggle="tab">
                                                        <i class="fa fa-th-large"></i></a>
                                                </li>
                                                <li role="presentation"><a href="#list_view" role="tab" data-toggle="tab">
                                                        <i class="fa fa-th-list"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="sort-by hidden-xs">
                                        <label>排序方式</label>
                                        <select name="sort" id="sort" onclick="sort();" onchange="page(1,document.getElementById('sort').value);">
                                            <option value="avg_price">最低价格:第一</option>
                                            <option value="avg_price2">最高价格:第一</option>
                                            <option value="open_date">开盘时间:最早开盘</option>
                                            <option value="open_date2" >开盘时间:最晚开盘</option>
                                            <option  selected="selected" value="created_time">--</option>
                                        </select>
                                    </div>
                                    <div class="shop-breadcrumb">
                                    	<span>&nbsp;&nbsp;&nbsp;&nbsp;共有${total }条记录</span>
                                    </div>
                                    <div class="shop-breadcrumb">
                                        <ul class="asda">
                                        	<li>
                                        		<a href="javascript:void(0);" id="p0" onclick="page(1,document.getElementById('sort').value);"><</a>
                                        	</li>
                                            <li class="active">
                                                 <a href="javascript:void(0);" id="p1" onclick="page(1,document.getElementById('sort').value);">1</a>
                                            </li>
                                            <s:if test="#request.total>9">
                                            	<li id="nav_ul">
                                                	<a href="javascript:void(0);" id="p2" onclick="page(2,document.getElementById('sort').value);">2</a>
                                            	</li>
                                            </s:if>
                                            <s:if test="#request.total>18">
                                            	<li id="nav_ul">
													<a href="javascript:void(0);" id="p3" onclick="page(3,document.getElementById('sort').value);">3</a>                                 
											 	</li>
                                            </s:if>
                                            <s:if test="#request.total>27">
                                            	<li id="nav_ul">
													<a href="javascript:void(0);" id="p4" onclick="page(4,document.getElementById('sort').value);">4</a>                                 
											 	</li>
                                            </s:if>
                                            <s:if test="#request.total>36">
                                            	<li id="nav_ul">
													<a href="javascript:void(0);" id="p5" onclick="page(5,document.getElementById('sort').value);">5</a>                                 
											 	</li>
                                            </s:if>
                                            <s:if test="#request.total>45">
                                            	<li id="nav_ul">
													<a href="javascript:void(0);" id="p6" onclick="page(6,document.getElementById('sort').value);">6</a>                                 
											 	</li>
                                            </s:if>
                                            <li id="nav_ul">
                                               <a href="javascript:void(0);" id="p6" onclick="page(5,document.getElementById('sort').value);">></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="shop-category-product">
                                    <div class="row">
                                        <div class="category-product">
                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane active fade in" id="gried_view">
                                                	<s:if test="#request.buildslist.size==0">
                                                		没有找到此楼盘
                                                	</s:if>
                                                	<s:else>
                                                		<s:iterator value="#request.buildslist" var="d" >
                                                    <div class="col-md-4 col-sm-6 col-xs-12 mar-bot">
                                                        <!-- single-product-start -->
                                                        <div class="single-product">
                                                            <div class="single-product-img" id="trs1">
                                                                <a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo }"style="width:280px;height:300px;"/></a>
                                                                <span class="sale-box">
                                                                    <span class="sale">销售</span>
                                                                </span>
                                                            </div>
                                                            <div class="single-product-content" >
                                                                <div class="product-title">
                                                                    <h5 id="h5">
                                                                        <a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a>
                                                                    </h5>
                                                                </div>
                                                                <div class="rating">
                                                                    <div class="star star-on"></div>
                                                                    <div class="star star-on"></div>
                                                                    <div class="star star-on"></div>
                                                                    <div class="star star-on"></div>
                                                                    <div class="star"></div>
                                                                </div>
                                                                <div class="price-box">
                                                                    <span id="price1" class="price">￥${d.avg_price }/平方米</span>
                                                                </div>
                                                                <div class="product-action" id="tds1">
						                                            <button class="btn btn-default add-cart" title="立即查看">立即查看</button>
						                                            <a href="javascript:void(0);" class="add-wishlist" id="${d.id }" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
						                                            <a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('${d.id }');"><i class="fa fa-search"></i></a>
				                                        		</div>
                                                            </div>
                                                        </div>
                                                        <!-- single-product-end -->
                                                    </div>
                                                    </s:iterator>
                                                	</s:else>
                                                    
                                                </div>
                                                
                                                <div role="tabpanel" class="tab-pane fade" id="list_view">
                                                    <div class="list-view">
                                                        <div class="row">
                                                        	<s:iterator value="#request.buildslist" var="d">
                                                            <div class="col-md-12 col-sm-12 col-xs-12 top-mar">
                                                                <div class="col-md-4 col-sm-4 col-xs-12 top-mar">
                                                                    <!-- single-product-start -->
                                                                    <div class="single-product">
                                                                        <div class="single-product-img">
                                                                            <a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo }"style="width:280px;height:300px;"/></a>
                                                                            <span class="sale-box">
                                                                                <span class="sale">销售</span>
                                                                            </span>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                    <!-- single-product-end -->
                                                                </div>
                                                                <div class="col-md-8 col-sm-8 col-xs-12 top-mar">
                                                                    <!-- single-product-start -->
                                                                    <div class="single-product">
                                                                        <div class="single-product-content">
                                                                            <div class="product-title">
                                                                                <h5>
                                                                                    <a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a>
                                                                                </h5>
                                                                            </div>
                                                                            <div class="rating">
                                                                                <div class="star star-on"></div>
                                                                                <div class="star star-on"></div>
                                                                                <div class="star star-on"></div>
                                                                                <div class="star star-on"></div>
                                                                                <div class="star star-on"></div>
                                                                            </div>
                                                                            <div class="price-box">
                                                                                <span class="price">￥${d.avg_price }/平方米</span>
                                                                            </div>
	                                                                            <p class="product-desc">${d.intro }
	                                                                            </p>
                                                                            <div class="product-action">
                                                                                 <button class="button btn btn-default add-cart" title="立即查看">立即查看</button>
						                                           				 <a href="javascript:void(0);" class="add-wishlist" id="${d.id }" title="加入收藏" onclick="setClass(this);"><i class="fa fa-heart"></i></a>
						                                            			<a class="quick-view" href="javascript:void(0);" data-toggle="modal" data-target="#myModal" title="quick view" onclick="open_asd('${d.id }');"><i class="fa fa-search"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- single-product-end -->
                                                                </div>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- shop-area-end -->
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
	                                    <a href="javascript:void(0);"><img src="<%=path %>/upload/${d.logo}" alt="${d.name }" /></a>
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
                                            <li><a title="Specials" href="#">特刊</a></li>
                                            <li><a title="New products" href="#">新品上架</a></li>
                                            <li><a title="Best sellers" href="#">热销楼盘</a></li>
                                            <li><a title="Our stores" href="#">我们的商店</a></li>
                                            <li><a title="Contact us" href="#">联系我们</a></li>
                                            <li><a title="Sitemap" href="#">网站地图</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <h4>我的帐号</h4>
                                        <ul class="toggle-footer">
                                            <li><a title="My orders" href="#">我的订单</a></li>
                                            <li><a title="My credit slips" href="#"> 我的信用卡</a></li>
                                            <li><a title="My addresses" href="#">我的地址</a></li>
                                            <li><a title="My personal info" href="#">我的个人信息</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <h4>友情链接</h4>
                                        <ul class="toggle-footer">
                                            <li><a href="http://www.jiajumi.com/">家具迷</a></li>
											<li><a href="http://nn.zxdyw.com/">南宁装修</a></li>
											<li><a href="http://8.fang.com/">北京贷款</a></li>
											<li><a href="http://pinpai.jieju.cn/">卫浴十大品牌榜</a></li>
											<li><a href="https://www.hjsk100.com/">娱乐新闻</a></li>
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
                                            <ul class="pic-tabs" id="trs2">
                                            	
                                            </ul>
                                            <div class="tab-content" id="tbs2">
                                               
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-xs-12 col-sm-7">
                                        <div class="product-details-info">
                                            <h5 class="product-title" id="h51">新力合院</h5>
                                            <div class="price-box">
                                                <span class="price" id="price2">￥50.00</span>
                                                <span class="old-price" id="price3">￥70.00</span>
                                            </div>
                                            <div class="rating">
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star"></div>
                                            </div>
                                            <div class="short-description">
                                                <p id="p10"></p>
                                            </div>
                                            <div class="add-cart">
                                                <p class="quantity">
                                                    <label>总套数</label>
                                                    <input type="text" id="total_rooms1" value="1" disabled="" />
                                                </p>
                                                <div class="shop-add-cart">
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
        <script src="<%=path %>/js/jquery.min.js"></script>
        <!-- bootstrap js -->
        <script src="<%=path %>/js/bootstrap.min.js"></script>
        <!-- owl.carousel js -->
        <script src="<%=path %>/js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="<%=path %>/js/jquery.meanmenu.js"></script>
        <!-- countdown js -->
        <script src="<%=path %>/js/countdown.js"></script>
        <!-- jquery.nivo.slider.pack js -->
        <script src="<%=path %>/js/jquery.nivo.slider.pack.js"></script>
        <!-- jquery-ui.min.js -->
        <script src="<%=path %>/js/jquery-ui.min.js"></script>
        <!-- wow js -->
        <script src="<%=path %>/js/wow.min.js"></script>
        <!-- plugins js -->
        <script src="<%=path %>/js/plugins.js"></script>
        <!-- main js -->
        <script src="<%=path %>/js/main.js"></script>
       	<script src="<%=path %>/js/myJS/buildings_all.js"></script>
       	<script src="<%=path %>/js/myJS/addhistory.js"></script>
    </body>
</html>

