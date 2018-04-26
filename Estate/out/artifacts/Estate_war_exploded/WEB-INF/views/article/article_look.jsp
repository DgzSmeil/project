<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8">
        <title>房产营销平台</title>
        <meta name="description" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Mobile Specific Meta  -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=path %>/css1/bootstrap.min.css" />
        <link rel="stylesheet" href="<%=path %>/css1/font-awesome.min.css" />
        <!-- Custom CSS -->
        <link href="<%=path %>/style.css" rel="stylesheet">
        <!-- 提示框 -->
	  	<script src="<%=path %>/js/sweetalert-dev.js"></script>
	  	<link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
	  	
      	<link rel="stylesheet" href="<%=path %>/css1/buildings_look.css">
      	
    </head>

    <body>

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
											<li><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
											<li><a href="<%=path%>/activity/all">楼盘活动</a></li>
	                                        <li><a href="<%=path%>/agency/all">知名房企</a></li>
											<li class="active"><a href="<%=path%>/article/all">新闻中心</a></li>
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
											<li><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
											<li><a href="<%=path%>/activity/all">楼盘活动</a></li>
	                                        <li><a href="<%=path%>/agency/all">知名房企</a></li>
											<li class="active"><a href="<%=path%>/article/all">新闻中心</a></li>
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
                                	新闻中心
                                <span class="navigation-pipe">></span>
                                	查看新闻
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- heading-banner-end -->
       <!-- about-us-area-start -->
        <div class="about-us">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                         <div class="about-img wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                            <img src="<%=path %>/upload/${article.logo}" alt="" />
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                       
						<div class="about-text wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                            <h2>${article.title }</h2>
                            <h5>发表于:${article.created_time}</h5>
                            <p>${article.content }</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- about-us-area-end --> 
        
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
                        	<s:iterator value="#request.buildinglist" var="d">
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
                                            <li><a title="特刊" href="#">特刊</a></li>
                                            <li><a title="新品上架" href="#">新品上架</a></li>
                                            <li><a title="热销楼盘" href="#">热销楼盘</a></li>
                                            <li><a title="我们的商店" href="#">我们的商店</a></li>
                                            <li><a title="联系我们" href="#">联系我们</a></li>
                                            <li><a title="网站地图" href="#">网站地图</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <h4>我的帐号</h4>
                                        <ul class="toggle-footer">
                                            <li><a title="我的订单" href="#">我的订单</a></li>
                                            <li><a title="我的信用卡" href="#"> 我的信用卡</a></li>
                                            <li><a title="我的地址" href="#">我的地址</a></li>
                                            <li><a title="我的个人信息" href="#">我的个人信息</a></li>
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
        <script type="text/javascript">
        function btn_search(){
        	if($("#search-buildings").val()==""){
        		window.open(basePath+"/builds/allbuilds"); 
        	}else{
        		window.open(basePath+"/builds/findbuildings?builds.name="+$("#search-buildings").val()); 
        	}
        	
        }
        </script>
    </body>

</html>

