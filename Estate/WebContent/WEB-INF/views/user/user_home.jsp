<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
    
     <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>房产营销平台</title>
    <!--easyui -->
	<link rel="stylesheet" href="<%=path %>/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" href="<%=path %>/easyui/themes/icon.css" />
	<link rel="stylesheet" href="<%=path %>/css/site.css" />


    <!-- Google Fonts -->
    <link href='<%=path %>/css/1.css' rel='stylesheet' type='text/css'>
    <link href='<%=path %>/css/2.css' rel='stylesheet' type='text/css'>
    <link href='<%=path %>/css/3.css' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=path %>/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=path %>/style.css">
    <link rel="stylesheet" href="<%=path %>/css/responsive.css">

	

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>
    <div class="header-area">
        <div class="container">
            <div class="row">
               <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <li><a href="#"> 新房</a></li>
                            <li><a href="#"> 开盘</a></li>
                            <li><a href="cart.html"> 地图找房</a></li>
                            <li><a href="checkout.html"> 报价</a></li>
                            <li><a href="javascript:void(0);"> 打折</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                        	<li class="dropdown dropdown-small">
                               <img class="img-circle" style="width:60px;height:60px"  src="<%=path %>/upload/${session.user.headicon} " >
                               <div class="btn-group">
								  <button type="button" name="user.id" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    ${session.user.nickname} 
								    <span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu">
								    <li><a href="<%=path %>/user/information?user.id=${session.user.id}">个人资料查看</a></li>
								    <li><a href="<%=path %>/user/changePwd?user.id=${session.user.id}">修改密码</a></li>
								    <li><a href="<%=path %>/user/information">信息记录</a></li>
								    <li role="separator" class="divider"></li>
								    <li><a href="<%=path %>/user/exited">退出</a></li>
								  </ul>
								</div>
                            </li>
                            
                            <li class="dropdown dropdown-small">
                                <a href="<%=path %>/user/loginPage">登录</a>
                            </li>
                            <li class="dropdown dropdown-small">
                                <a href="<%=path %>/user/registeredpage"><span class="key">注册</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="index.html"><span>房,天下</span></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
					<form action="" method="post">
					   <div style="text-align: center;
									height:50;
									padding-top:20px;
									margin-botton:10px;">
							<input type="text" style="color:rgb(153,153,153);left: 0;
									width: 250px;
									border: 1px solid #1abc9c;
									line-height: 25px;
									font-size: 14px;
									color: #989898;">
							<button type="submit" class="readmore">搜索</button>
					   </div>
				   </form>
                </div>
				<br/>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.html">首页</a></li>
                        <li><a href="shop.html">所有楼盘</a></li>
                        <li><a href="single-product.html">楼盘活动</a></li>
                        <li><a href="cart.html">知名房企</a></li>
                        <li><a href="checkout.html">业主论坛</a></li>
                        <li><a href="#">新闻中心</a></li>
                        <li><a href="#">房地产入驻</a></li>
                        <li><a href="#">联系方式</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="slider-area">
        <div class="zigzag-bottom"></div>
        <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">
            
            <div class="slide-bulletz">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ol class="carousel-indicators slide-indicators">
                                <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                                <li data-target="#slide-list" data-slide-to="1"></li>
                                <li data-target="#slide-list" data-slide-to="2"></li>
                            </ol>                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="single-slide">
                        <div class="slide-bg slide-one"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>欢迎来到房天下</h2>
                                                <p>此平台适用于所有的房产经销商，不需要单独对房产经销商进行项目部署，所有房产经销商的数据存储在统一的服务器云端</p>
                                                <p>房产经销商可以提交自己的资料入驻此平台，资料信息至少包括：经销商公司名称，负责人名称，联系方式，公司地址等。房产经销商申请入驻后需要由平台的管理员进行审核，审核通过，房产经销商账号才可用</p>
                                                <a href="" class="readmore">了解更多</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-two"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>用户说明</h2>
                                                <p>近几年购房人群逐渐年轻化，80、90后已经成为购房的主力军，每个人都对手机非常熟悉，在购房之前都会自己先查阅相关的资料辅助自己选择合适的房子，此平台正好符合年轻购房人群的需求，此平台拥有丰富的房屋信息，并还能为购房用户提供最方便的贷款计算</p>
                                                <a href="" class="readmore">了解更多</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-three"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>房地产经销商</h2>
                                                <p>房产经销商用户对计算机信息化的认识已经非常到位，员工也普遍年轻，对计算机，手机等信息化设备非常熟悉，使用此类信息化平台能够为他们带来最大的便利性。</p>
                                                <a href="" class="readmore">了解更多</a>
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
    </div> <!-- End slider area -->
   
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">最新楼盘</h2>
                        <div class="product-carousel">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-1.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>

								<h2><a href="single-product.html">庞大领航</a></h2>
								<div>
									<form action="<%=path%>/user/addLike" id="form1">
										<div id="like">
											<s:if test="#request.like!=null">
												<input type="hidden" name="like.user_id" value="${session.user.id }" />
												<input type="hidden" name="like.buildings_id" value="402880105da5a937015da5aa81910000" />
												<span class="glyphicon glyphicon-heart" style="color: red; font-size: 30px" id="like" onclick="document.getElementById('form1').submit();"></span>
											</s:if>
											<s:else>
												<input type="hidden" name="like.user_id" value="${session.user.id }" />
												<input type="hidden" name="like.buildings_id" value="402880105da5a937015da5aa81910000" />
												<span class="glyphicon glyphicon-heart" style="color: #eeeeee; font-size: 30px" id="like" onclick="document.getElementById('form1').submit();"></span>
											</s:else>
										</div>
									</form>
								</div>
								<p>已售：<a href="" >154套</a></p>
                                <div class="product-carousel-price">
                                    <ins>￥ 6000元/㎡</ins>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-2.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看祥情</a>
                                    </div>
                                </div>
                                
                               <h2><a href="single-product.html">庞大领航</a></h2>
                                <p>已售：<a href="" >154套</a></p>
                                <div class="product-carousel-price">
                                    <ins>￥ 6000元/㎡</ins>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-3.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">庞大领航</a></h2>
                                <p>已售：<a href="" >154套</a></p>
                                <div class="product-carousel-price">
                                    <ins>￥ 6000元/㎡</ins>
                                </div>                               
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-4.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">庞大领航</a></h2>
                                <p>已售：<a href="" >154套</a></p>
                                <div class="product-carousel-price">
                                    <ins>￥ 6000元/㎡</ins>
                                </div>                           
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-5.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">庞大领航</a></h2>
                                <p>已售：<a href="" >154套</a></p>
                                <div class="product-carousel-price">
                                    <ins>￥ 6000元/㎡</ins>
                                </div>                                
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-6.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">庞大领航</a></h2>
                                <p>已售：<a href="" >154套</a></p>
                                <div class="product-carousel-price">
                                    <ins>￥ 6000元/㎡</ins>
                                </div>                          
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->

	<div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <h2 class="section-title">新闻资讯</h2>
						 <a href="#" class="readmore">查看全部</a>
                        <div class="brand-list">
							<div>
								<h2><a href="javascript:void(0);" style="color:white">[中国楼市现拐点?] [楼市下半年或量价齐跌]</a></h2>
							</div>
							<div>
								<h2><a href="javascript:void(0);" style="color:white">年过30岁仍买不起房?  [楼市下半年或量价齐跌]</a></h2>
							</div>
							<div>
								<h2><a href="javascript:void(0);" style="color:white">[中国楼市现拐点?] [楼市下半年或量价齐跌]</a></h2>
							</div>
							<div>
								<h2><a href="javascript:void(0);" style="color:white">[中国楼市现拐点?] [楼市下半年或量价齐跌]</a></h2>
							</div>
							<div>
								<h2><a href="javascript:void(0);" style="color:white">[中国楼市现拐点?] [楼市下半年或量价齐跌]</a></h2>
							</div>
							<div>
								<h2><a href="javascript:void(0);" style="color:white">[中国楼市现拐点?] [楼市下半年或量价齐跌]</a></h2>
							</div>
							
                            
                                                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->

	<div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">限时特卖</h2>
                        <div class="product-carousel">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-1.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">索尼Smart TV - 2015</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins>$700.00</ins> <del>$800.00</del>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-2.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看祥情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">苹果新mac 2015年3月:P</a></h2>
                                <div class="product-carousel-price">
                                    <ins>6000元/㎡</ins> <del>7000元/㎡</del>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-3.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">苹果新i手机6</a></h2>

                                <div class="product-carousel-price">
                                    <ins>6000元/㎡</ins> <del>7000元/㎡</del>
                                </div>                                 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-4.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">索尼playstation微软</a></h2>

                                <div class="product-carousel-price">
                                    <ins>6000元/㎡</ins> <del>7000元/㎡</del>
                                </div>                            
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-5.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">索尼智能空气常征</a></h2>

                                <div class="product-carousel-price">
                                    <ins>6000元/㎡</ins> <del>7000元/㎡</del>
                                </div>                                 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=path %>/img/product-6.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> 预约购房</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> 查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">三星gallaxy注4</a></h2>

                                <div class="product-carousel-price">
                                    <ins>6000元/㎡</ins><del>7000元/㎡</del>
                                </div>                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
    
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <h2 class="section-title">知名房产</h2>
                        <div class="brand-list">
							<div style="text-align:center">
								<img src="<%=path %>/img/services_logo__1.jpg" alt=""><br/>
								<h2><a href="" style="color:white;">中海国际社区</a></h2>
							</div>
							<div>
								<img src="<%=path %>/img/services_logo__2.jpg" alt=""><br/>
								<h2><a href="" style="color:white;">中海国际社区</a></h2>
							</div>
							<div>
								<img src="<%=path %>/img/services_logo__4.jpg" alt=""><br/>
								<h2><a href="" style="color:white;">中海国际社区</a></h2>
							</div>
							<div>
								<img src="<%=path %>/img/services_logo__3.jpg" alt=""><br/>
								<h2><a href="" style="color:white;">中海国际社区</a></h2>
							</div>
							<div>
								<img src="<%=path %>/img/services_logo__1.jpg" alt=""><br/>
								<h2><a href="" style="color:white;">中海国际社区</a></h2>
							</div>
							<div>
								<img src="<%=path %>/img/services_logo__2.jpg" alt=""><br/>
								<h2><a href="" style="color:white;">中海国际社区</a></h2>
							</div>
                                                 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->
    
    <div class="product-widget-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">畅销楼盘</h2>
                        <a href="" class="wid-view-more">查看全部</a>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-1.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">索尼智能电视-2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-2.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">2015年苹果新mac book</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-3.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">苹果新i手机6</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">好房推荐</h2>
                        <a href="#" class="wid-view-more">查看全部</a>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-4.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">索尼playstation微软</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-1.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">索尼智能空气状态</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-2.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">三星gallaxy注4</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">全民围观</h2>
                        <a href="#" class="wid-view-more">查看全部</a>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-3.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">苹果新i手机6</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-4.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">三星gallaxy注意4</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="<%=path %>/img/product-thumb-1.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">索尼playstation微软</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>6000元/㎡</ins><del>7000元/㎡</del>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End product widget area -->


    
    <div class="footer-top-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2><span>房天下营销平台</span></h2>
                        <p>近几年购房人群逐渐年轻化，80、90后已经成为购房的主力军，每个人都对手机非常熟悉，在购房之前都会自己先查阅相关的资料辅助自己选择合适的房子，此平台正好符合年轻购房人群的需求，此平台拥有丰富的房屋信息，并还能为购房用户提供最方便的贷款计算。</p>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">友情链接</h2>
                        <ul>
                            <li><a href="http://www.jiajumi.com/">家具迷</a></li>
                            <li><a href="http://nn.zxdyw.com/">南宁装修</a></li>
                            <li><a href="http://8.fang.com/">北京贷款</a></li>
                            <li><a href="http://pinpai.jieju.cn/">卫浴十大品牌榜</a></li>
                            <li><a href="https://www.hjsk100.com/">娱乐新闻</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">关于我们</h2>
                        <ul>
                            <li><a href="javascript:void(0);">网站合作</a></li>
                            <li><a href="javascript:void(0);">联系我们</a></li>
                            <li><a href="javascript:void(0);">招聘信息</a></li>
                            <li><a href="javascript:void(0);">网站地图</a></li>
                            <li><a href="javascript:void(0);">服务声明</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">免责声明</h2>
                        <div class="newsletter-form">
                        <p>本站旨在为用户提供更多楼盘信息，所载内容仅供参考，最终信息以售楼处为准。如该楼盘信息有误，您可以投诉或拨打举报电话： 0791-3838438</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer top area -->
   
    <!-- Latest jQuery form server -->
    <script src="<%=path%>/js/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="<%=path%>/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="<%=path%>/js/owl.carousel.min.js"></script>
    <script src="<%=path%>/js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="<%=path%>/js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="<%=path%>/js/main.js"></script>
	<script src="<%=path%>/easyui/jquery.easyui.min.js"></script>
	<script src="<%=path%>/easyui/locale/easyui-lang-zh_CN.js"></script>
	
	
  </body>
</html>