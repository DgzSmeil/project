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
    <body>

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
                                <span class="navigation-pipe">></span>
                                	查看楼盘
                                <span class="navigation-pipe">></span>
                                	全部户型
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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="shop-right-col wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                            <div class="category-products">
                                <div class="topbar-category">
                                	<div class="pager-area">
                                        <div>
                                        </div>
                                    </div>
                                    <div class="sort-by hidden-xs">
                                    </div>
                                    <div class="shop-breadcrumb">
                                    	<span>&nbsp;&nbsp;&nbsp;&nbsp;共有${total }个户型</span>
                                    </div>
                                    
                                </div>
                                <div class="shop-category-product">
                                    <div class="row">
                                        <div class="category-product">
                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane active fade in" id="gried_view">
                                                    <s:iterator value="#request.rows" var="d" >
                                                    <div class="col-md-4 col-sm-6 col-xs-12 mar-bot">
                                                        <!-- single-product-start -->
                                                        <div class="single-product">
                                                            <div class="single-product-img" id="trs1">
                                                                <a href="<%=path%>/house/look?house.id=${d.id}" target="_blank"><img src="<%=path %>/upload/${d.logo }"style="width:280px;height:300px;"/></a>
                                                            </div>
                                                            <div class="single-product-content" >
                                                                <div class="product-title">
                                                                    <h5 id="h5">
                                                                        <a href="<%=path%>/house/look?house.id=${d.id}" target="_blank">${d.name }</a>
                                                                    </h5>
                                                                </div><br/>
                                                                <div class="price-box">
                                                                    <label id="price1">面积：</label><span>${d.area }㎡(建面)</span>
                                                                </div>
                                                                 <div class="price-box">
                                                                    <label id="price1">参考：</label><span>${d.unit_price }/平方米</span>
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
                </div>
            </div>
        </div>
        <!-- shop-area-end -->
        <!-- about-area-start -->
        <div class="about-team-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h3>热销楼盘</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="blogs wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                        <div class="blog-carousel">
                        	<s:iterator value="#request.buildings" var="d">
                        		<div class="col-md-12">
	                                <div class="single-blog">
	                                    <div class="blog-img">
	                                        <a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank"><img src="<%=path %>/upload/${d.logo}" alt="${d.name }" style="width:360px;height:240px;"/></a>
	                                    </div>
	                                    <div class="blog-content">
	                                        <h3><a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank">${d.name }</a></h3>
	                                        <div class="meta">
	                                            <span class="post-category">开盘时间</span>
	                                            <span class="meta-border">:</span>
	                                            <span class="time"><i class="fa fa-clock-o"></i>${d.open_date }</span>
	                                        </div>
	                                        <p>楼盘均价：<span class="moneys1">${d.avg_price }/平方米</span></p>
	                                    </div>
	                                </div>
	                            </div>
                        	</s:iterator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- about-area-end -->
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
    </body>
    <script type="text/javascript">
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
    
    $(function(){
    	$(".asda li").bind("click",function(){
    		$(".asda li").removeClass("active");
    		$(this).addClass("active");
    		
    	});
    	
    })
    function btn_search(){
		if($("#search-buildings").val()==""){
			window.open(basePath+"/builds/allbuilds"); 
		}else{
			window.open(basePath+"/builds/findbuildings?builds.name="+$("#search-buildings").val()); 
		}
		
	}
    </script>
</html>

