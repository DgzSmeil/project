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
      	
      	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=I2wwtf8HH3IzKG79YIVX2mBFo6X4CBHR"></script>
    </head>

    <body onload="body('${builds.created_time}');">

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
                                    <input class="form-control search-form" id="search-buildings" type="text" placeholder="点击这里搜索楼盘" />
                                    <input type="hidden" id="user_id" name="user.id" value="${user.id }">
                                    <input type="hidden" id="avg_price1" value="${builds.avg_price}">
                                    <input type="hidden" id="longitude1" value="${builds.longitude}">
                                    <input type="hidden" id="latitude1" value="${builds.latitude}">
                                    <input type="hidden" id="buildingsname" value="${builds.name}">
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
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- heading-banner-end -->
        
        <!-- about-us-area-start -->
        <div class="about-us" style="padding-bottom:0px;">
            <div class="container">
                <div class="row">
                	<div class="col-md-12">
                		<h1>${builds.name }</h1>
                		
                	</div>
                	<div class="col-md-6 col-sm-12 col-xs-12 div_border" >
                        <div class="picture-tab">
                            <ul class="pic-tabs">
                                <s:iterator value="#request.buildingsImgs" var="d">
                                	<li>
                                    	<a data-toggle="tab" href="#${d.id }"><img src="<%=path %>/upload/${d.img_path}" alt="" /></a>
                                	</li>
                                </s:iterator>
                                
                            </ul>
                            <div class="tab-content">
                            	<div class="tab-pane fade in active">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="#"><img src="<%=path %>/upload/${builds.logo}" alt="" /></a>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
	                             </div>
                                 <s:iterator value="#request.buildingsImgs" var="d">
	                                <div id="${d.id }" class="tab-pane fade">
	                                    <!-- single-product-start -->
	                                    <div class="single-product">
	                                        <div class="single-product-img">
	                                            <a href="#"><img src="<%=path %>/upload/${d.img_path}" alt="" /></a>
	                                        </div>
	                                    </div>
	                                    <!-- single-product-end -->
	                                </div>
                                </s:iterator>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12 div_border">
                        <div class="about-text wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                            <div class="single-product-content">
                                <div class="avg_price">
                                    <label>平均价格：</label>
                                    <span class="price">￥${builds.avg_price}/平方米</span>
                                    <span class="riqi"></span>
                                </div>
                                <div class="avg_price">
                                    <label>用户评价：</label>
                                    <span class="small"><a href="#miaodian6" title="查看评价" class="ditu">(${page }条评价)</a></span>
                                </div>
                              	<div class="avg_price">
                                    <label>开盘时间：</label>
                                    <span class="small">${builds.open_date}</span>
                                </div>
                                <div class="avg_price">
                                    <label>楼盘地址：</label>
                                    <span class="small">${builds.address}</span>
                                    <span><a href="#miaodian4" title="查看地图" class="ditu">查看地图</a></span>
                                </div>
                                <div class="avg_price">
                                    <label>所属区域：</label>
                                    <span class="small">${builds.area}</span>
                                </div>
                                
                                <div class="avg_price">
                                    <label>主力户型：</label>
                                    <s:if test='#request.houselist.size==""'>
                                    	<span class="small">暂无户型</span>
                                    </s:if>
                                    <s:else>
                                    	<s:iterator value="#request.houselist" var="d">
                                    		<span><a href="<%=path%>/house/look?house.id=${d.id}" class="huxing">${d.name}</a></span>
                                    	</s:iterator>
                                    	<span><a href="<%=path%>/house/all?buildings_id=${builds.id}" title="查看所有户型" class="ditu" target="_blank">所有户型</a></span>
                                    </s:else>
                                </div>
                                <div class="avg_price">
                                    <label>咨询电话：</label>
                                    <span class="price">${builds.tel}</span>
                                </div>
                                <div class="avg_price">
                                    <a class="ziliao" href="#miaodian0">更多详细信息>></a>
                                    <a class="shoucang" href="javascript:void(0);" id="lkjkl" title="加入收藏" onclick="setClass('${builds.id }');"><i class="fa fa-heart"></i> 收藏</a>
                                    <span class="active" id="lkjk" style="display:none" title="加入收藏"><i class="fa fa-heart"></i> 已收藏</span>
                                </div><br/>
                                <div class="avg_price">
                                    <div class="nocss">
			            				<a href="<%=path%>/builds/jisuan" target="_black" class="dianping">贷款计算</a>
			            			</div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- about-us-area-end -->
        <div class="about-us" style="padding-top: 20px;">
            <div class="container">
		        <div class="row">
		        	<div class="col-md-12 div_border">
			            <div class="col-md-8">
			            	<span class="avg_price miaoshu"><a href="#miaodian1">房源描述</a></span>
			            	<span class="avg_price miaoshu"><a href="#miaodian2">周边配置</a></span>
			            	<span class="avg_price miaoshu"><a href="#miaodian5">交通状况</a></span>
			            	<span class="avg_price miaoshu"><a href="#miaodian4">楼盘地图</a></span>
			            	<span class="avg_price miaoshu"><a href="#miaodian6">楼盘点评</a></span>
			            	<hr/>
			            	<div>
			            		<h3 id="miaodian0">基本信息</h3>
			            		<div>
			            			<div class="avg_price1">
			            				<div class="avg_price">
				            				<span>价格：</span>
				            				<span class="piea">约￥${builds.avg_price}/平方米</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>所属区域：</span>
				            				<span class="small">${builds.area}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>占地面积：</span>
				            				<span class="small">${builds.floor_area}平方米</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>房源类型：</span>
				            				<span class="small">${builds.house_type}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>开发公司：</span>
				            				<span class="small">${builds.company}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>接待地址：</span>
				            				<span class="small">${builds.reception_address}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>绿化率：</span>
				            				<span class="small">${builds.green_ratio}%</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>物业公司：</span>
				            				<span class="small">${builds.property_company}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>车位数：</span>
				            				<span class="small">${builds.car_station}个</span>
			            				</div>
			            			</div>
			            			
			            			<div class="avg_price2">
			            				<div class="avg_price">
				            				<span>开盘时间：</span>
				            				<span class="small">${builds.open_date}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>楼盘地址：</span>
				            				<span class="small">${builds.address}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>建筑面积：</span>
				            				<span class="small">${builds.building_area}平方米</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>建筑类型：</span>
				            				<span class="small">${builds.building_type}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>总套数：</span>
				            				<span class="small">${builds.total_rooms}套</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>楼盘售楼电话：</span>
				            				<span class="small">${builds.tel}</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>容积率：</span>
				            				<span class="small">${builds.plot_ratio}%</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>物业费：</span>
				            				<span class="piea">￥${builds.property_fee}/月</span>
			            				</div>
			            				<div class="avg_price">
				            				<span>容积率：</span>
				            				<span class="small">${builds.plot_ratio}</span>
			            				</div>
			            			</div>
			            		</div>
			            		<p style="clear:both"></p>
			            		<hr/>
			            		<h3 id="miaodian1">房源描述</h3>
			            		<p class="fangyuanmiaoshu">&nbsp;&nbsp;&nbsp;&nbsp;${builds.intro }</p>
			            		<hr/>
			            		<h3 id="miaodian2">周边配置</h3>
			            		<p class="fangyuanmiaoshu">&nbsp;&nbsp;&nbsp;&nbsp;${builds.equipments }</p>
			            		<hr/>
			            		<h3 id="miaodian5">交通状况</h3>
			            		<p class="fangyuanmiaoshu">&nbsp;&nbsp;&nbsp;&nbsp;${builds.traffic }</p>
			            		<hr/>
			            		<h3 id="miaodian4">楼盘地图</h3>
			            		<div style="width:700px;height:550px;border:#ccc solid 1px;font-size:12px" id="map"></div>
			            		<hr/>
			            		<h3 id="miaodian6">楼盘点评<span class="more"><a href="<%=path%>/comment/all?buildings_id=${builds.id }" target="_black">更多>></a></span></h3>
			            		<p style="clear:both"></p>
			            		<p>（共${page }条评价）</p>
			            		<hr/>
			            		<div>
			            			<s:if test="#request.commentlist.size==''">
			            				<div class="avg_price">
			            					<span>还没有人点评呢</span>
			            				</div>
			            				<br/>
			            			</s:if>
			            			<s:else>
			            				<s:iterator value="#request.commentlist" var="d">
				            				<div>
					            				<div class="pingjia_left">
					            					<img alt="头像" src="<%=path %>/upload/${d.user.headicon}" style="width:70px;height:60px;border-radius:300px;">
					            					<span>${d.user.nickname}</span>
					            				</div>
					            				<div class="pingjia_right">
					            					<span>${d.content }</span><br/>
					            					<span class="small">${d.comment_time }</span>
					            				</div>
					            			</div>
					            			<hr/>
			            				</s:iterator>
			            			</s:else>
			            			<p style="clear:both"></p>
			            			<div class="nocss">
			            				<a href="<%=path%>/comment/all?buildings_id=${builds.id }" target="_black" class="dianping">我也来点评</a>
			            			</div>
			            		</div>
			            		<hr/>
			            		<h3 align="center">在线留言</h3>
			            		<form action="" method="post">
			            			<input type="hidden" value="${builds.id }" id="buildings_id" name="message.buildings_id">
			            			<input type="hidden" value="${builds.agency_id }" id="agency_id" name="message.agency_id">
			            			<div class="form_div">
				            			<div class="form_left">
				            				<input type="text" name="user.name" id="name1" placeholder="输入姓名"/><br/>
				            				<input type="text" name="user.tel" id="tel1" placeholder="输入手机号码"/><br/>
				            				<input type="text" name="user.email" id="email1" placeholder="输入邮箱地址"/><br/>
				            			</div>
				            			<div class="form_right">
				            				<textarea rows="" id="content1" cols="">我对名称为《${builds.name}》的房源感兴趣，想获得更详细的信息</textarea>
				            			</div>
				            			<span style="clear: both;"></span>
				            			<div class="btn_tijiao">
				            				<button class="btn btn-default add-cart" type="button" title="提交" id="btn_submit"> 提 交 </button>
				            			</div>
			            			</div>
			            		</form>
			            	</div>
			            	
			            </div>
			            
			            
			            <div class="col-md-4" style="border-left: 1px solid #ebebeb;">
			            	<div class="div_tuijian">
			            		<h4 style="margin: 10px;">相关推荐</h4>
			            		<hr/>
			            		<s:iterator value="#request.buildslist" var="d">
			            			<div>
				            			<label class="miaoshu1"><a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a></label>
				            			<div>
					            			<div class="img1">
					            				<a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo}" alt="" /></a>
					            			</div>
					            			<div class="img2">
					            				<span>${d.address}</span><br/>
					            				<span class="moneys1">￥${d.avg_price}/平方米</span><br/>
					            				<span>${d.open_date}</span>
					            			</div>
				            			</div>
				            		</div>
			            			<hr/>
			            		</s:iterator>
			            	</div>
			            	
			            	<div class="div_tuijian">
			            		<h4 style="margin: 10px;">最新资讯</h4>
			            		<hr/>
			            		<div class="img3">
			            			<s:iterator value="#request.articlelist" var="d">
			            				<span class="miaoshu2"><a href="<%=path%>/article/look?article.id=${d.id}" target="_blank">${d.title }</a></span><br/>
			            			</s:iterator>
			            		</div>
			            		
			            	</div>
			            	<hr/>
			            </div>
			            
			        </div>
		        </div>
		    </div>
		</div>
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
                        	<s:iterator value="#request.buildinglist2" var="d">
                        		<div class="col-md-12">
	                                <div class="single-blog">
	                                    <div class="blog-img">
	                                        <a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');"><img src="<%=path %>/upload/${d.logo}" alt="${d.name }" style="width:360px;height:240px;"/></a>
	                                    </div>
	                                    <div class="blog-content">
	                                        <h3><a href="<%=path%>/builds/lookbuildings?builds.id=${d.id}" target="_blank" onclick="addhistory('${d.id}');">${d.name }</a></h3>
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
        <script src="<%=path %>/js/myJS/addhistory.js"></script>
        <script src="<%=path %>/js/myJS/buildings_look.js"></script>
    </body>

</html>

