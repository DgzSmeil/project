<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.StudentBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%
			StudentBean studentBean = (StudentBean)session.getAttribute("bean");
			int num = Integer.parseInt(session.getAttribute("num").toString());
	   %>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon"
			href="https://static1.51cto.com/home/web/images/members/favicon.ico"
			type="image/x-icon" />
		<title>开通IT课堂会员--一个会员 全站特权</title>
		<link
			href="<%=basePath %>css/idangerous.swiper.css"
			rel="stylesheet" />
		<link href="https://static3.51cto.com/home/web/css/member.css"
			rel="stylesheet" />
		<style>
			.order-hidden {
				display: none;
			}
			
			.order-more {
				display: inline-block;
				float: right;
				color: #0a0c14;
				margin-top: 5px;
			}
		</style>
		<style>
			.swiper-pagination-switch {
					display: none !important;
			}
		</style>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#money1").bind("click",function(){
					var num=$("#qian1").text();
					var index=$("#qian1").text().indexOf("/");
					var index1=$("#qian1").text().indexOf("￥")+1;
					$("#forminput").val(num.substring(index1,index));
				});
				$("#money2").bind("click",function(){
					var num=$("#qian2").text();
					var index=$("#qian2").text().indexOf("/");
					var index1=$("#qian2").text().indexOf("￥")+1;
					$("#forminput").val(num.substring(index1,index));
				});
			});
			function check(){
				if($("#VIP").val()!=0){
					alert("你已经是会员了！");
					return false;
				}
			}
		</script>
	</head>
	<body>
		<div class="memberhead">
			<div class="center clearfix">
				<div class="left clearfix nav">
					<a href="/members/in-fo" class="left mt25"><img
							src="<%=basePath%>image/itlogo.png"
							height="26" width="126" alt="" />
					</a>
					<span class="left jiange"></span>
					<span class="left mt25"><img
							src="https://static1.51cto.com/home/web/images/members/slogn.png"
							height="34" width="145" alt="" />
					</span>
					<ul class="left clearfix">
						<li class="cur">
							<a href="/members/in-fo">首页</a>
						</li>
						<li>
							<a href="<%=basePath %>datainfo/huiyuan.jsp">会员特权</a>
						</li>
						<li>
							<a class="save-visit" target="_blank"
								href="http://edu.51cto.com/?vip">看课程</a>
						</li>
						<li>
							<a class="save-visit" target="_blank"
								href="http://down.51cto.com/?vip">下资料</a>
						</li>
						<li>
							<a class="save-visit" target="_blank"
								href="http://wot.51cto.com?vip">抢门票</a>
						</li>
					</ul>
				</div>
				<div class="right">
					<div class="login_before t14">
						<c:if test="<%=studentBean.getStudentname()==null %>">
							<a href="<%=studentBean.getStudentname() %>" class="loadbtn mt30">登录</a>
						</c:if>
						<c:if test="<%=studentBean.getStudentname()!=null %>">
							<a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" class="loadbtn mt30"><%=studentBean.getStudentname() %></a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="banner">
			<div class="bannerin">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide swiper-slide1">
							<img
								src="https://static1.51cto.com/home/web/images/members/banner.jpg"
								height="338" width="1920" alt="" />
						</div>
					</div>
					<div class="pagination"></div>
				</div>
			</div>
			<div class="center">
				<div class="bcodebox">
					<div class="bcodeboxin">
						<span class="arro logined"></span>
						<div class="code_before">
							<div class="tit">
								<span>超优惠，享特权</span><b></b>
							</div>
							<c:forEach items="${list}" var="l">
								<div class="line1">
									${l.VIPleibie}
									<strong>￥${l.VIPmoney}</strong>
									<span>原价：<b>￥${l.VIPsrcmoney}</b></span>
								</div>
							</c:forEach>
							<!-- <div class="line1">
								年度会员
								<strong>￥39</strong>
								<span>原价： <b>￥69</b> </span>
							</div> --> 
							<div class="joinbtn mt20 mb10">
								<a href="/members/in-fo#buybox">加入IT课堂会员</a>
							</div>
							<div class="line2">
								现在购买会员低至5.8/5.7折。欲购从速
							</div>
						</div>
						<div class="code_after" style="display: none">
							<div class="btns t14 tc">
								<c:forEach items="${list}" var="l">
								<span class="cur first-goods-switch">￥${l.VIPmoney}/季度</span>
								</c:forEach>
							</div>
							<div class="tc mt15 mb15">
								<div class="code">
									<div class="codemin">
										<img
											src="https://static1.51cto.com/home/web/images/members/member_mobile.png"
											height="139" width="146" alt="" />
									</div>
									<c:if test="<%=studentBean.getStudentname()==null %>">
										<div class="codefbg"></div>
										<a href="<%=basePath %>datainfo/login.jsp">登录</a>
									</c:if>
								</div>
							</div>
							<div class="tc cl_5">
								使用
								<span class="red">微信/支付宝钱包</span>扫描二维码支付
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="quanyi">
			<div class="center">
				<div class="alltit mb20">
					<span>会员权益</span>
				</div>
				<ul class="quanyibox clearfix">
					<li>
						<div>
							<a class="save-visit" href="/members/privilege"><img
									src="https://static1.51cto.com/home/web/images/members/quanyi1.png"
									alt="" />
							</a>
						</div>
						<span>2000门课程免费学</span>
					</li>
					<li>
						<div>
							<a class="save-visit" href="/members/privilege#tab1"><img
									src="https://static1.51cto.com/home/web/images/members/quanyi2.png"
									alt="" />
							</a>
						</div>
						<span>买课程享9.5折优惠</span>
					</li>
					<li>
						<div>
							<a class="save-visit" href="/members/privilege#tab2"><img
									src="https://static1.51cto.com/home/web/images/members/quanyi3.png"
									alt="" />
							</a>
						</div>
						<span class="first-goods">免费下载资料120次</span>
						<span class="second-goods" style="display: none;">免费下载资料500次</span>
					</li>
					<li>
						<div>
							<a class="save-visit" href="/members/privilege#tab3"><img
									src="https://static1.51cto.com/home/web/images/members/quanyi4.png"
									alt="" />
							</a>
						</div>
						<span>尊享会员标识</span>
					</li>
					<li>
						<div>
							<a class="save-visit" target="_blank"
								href="http://wot.51cto.com/act/2017/architecture"><img
									src="https://static1.51cto.com/home/web/images/members/quanyi5.png"
									alt="" />
							</a>
						</div>
						<span>WOTI巅峰票直降500</span>
						<em>优惠码：46AD0B5856BD7DE9</em>
					</li>
					<li>
						<div>
							<a href="/members/privilege"><img
									src="https://static1.51cto.com/home/web/images/members/quanyi6.png"
									alt="" />
							</a>
						</div>
						<span>更多权益敬请期待</span>
					</li>
				</ul>
				<div class="tit">
					<a target="_blank" href="/members/privilege" class="cl_5">查看更多会员权益说明</a><b></b>
				</div>
			</div>
		</div>
		<div class="buybox" id="buybox">
			<div class="center">
				<div class="alltit mb20">
					<span>购买会员</span>
				</div>
				<div class="clearfix mt60">
					<div class="taocantab left">
						<div class="taocan taocan_sel mb20 first-goods-switch goods-id-1" id="money1">
							<span class="selt"></span>
							<dl class="clearfix">
								<dt>
									<span>5.8</span>折
								</dt>
								<dd id="money">
									<c:forEach items="${list1}" var="l">
										<div class="line1">
											IT课堂${l.VIPleibie}
										</div>
										<div class="line2" id="qian1">
											￥${l.VIPmoney}/3个月
										</div>
										<div class="line3">
											原价：
											<span>￥${l.VIPsrcmoney}</span>
										</div>
									</c:forEach>
								</dd>
							</dl>
						</div>
						<div class="taocan second-goods-switch goods-id-2" id="money2" >
							<span class="selt"></span>
							<span class="jian"></span>
							<dl class="clearfix">
								<dt>
									<span>5.7</span>折
								</dt>
								<dd>
									<c:forEach items="${list2}" var="l">
										<div class="line1">
											IT课堂${l.VIPleibie}
										</div>
										<div class="line2"  id="qian2">
											￥${l.VIPmoney}/12个月
										</div>
										<div class="line3">
											原价：
											<span>￥${l.VIPsrcmoney}</span>
										</div>
									</c:forEach>
								</dd>
							</dl>
						</div>
					</div>
					<div class="buyways right">
						<div class="waytab clearfix">
							<span class="cur">微信/支付宝</span>
							<span><a target="_blank"
								href="http://home.51cto.com/index?reback=http://home.51cto.com/members/in-fo?home">其他支付方式</a>
							</span>
						</div>
						<div class="buywaymin">
							<dl class="clearfix">
								<dt class="left pt20">
									<div class="buy_before">
										<div class="line1 mb15 first-goods">
											应付金额：
											<c:forEach items="${list1}" var="l">
												<span id="qian">￥${l.VIPmoney}</span>
											</c:forEach>
										</div>
										<div class="line1 mb15 second-goods" style="display: none;">
											应付金额：
											<c:forEach items="${list2}" var="l">
												<span id="qian3">￥${l.VIPmoney}</span>
											</c:forEach>
										</div>
										<div class="line2">
											收款方：陈飞龙
										</div>
										<div class="joinbtn mt20 mb10">
											<form action="<%=basePath %>huiyuanservlet?order=fukuan" onsubmit="return check();" method="post">
												<input type="hidden" id="VIP" value="${requestScope.VIP}"/>
												<input type="hidden" id="forminput" name="VIPmoney" value="11"/>
												<input type="submit" style="width:160px;display:block; height:56px; background:#df4d4b; text-align: center; color:#fff;font-size: 20px; border-radius: 3px;" value="加入IT课堂会员"/>
											</form>
										</div>
									</div>
									<div class="buy_after" style="display: none">
										<div class="line1 congratulation">
											恭喜您获赠IT课堂会员使用权
										</div>
										<div class="line2">
											<a class="save-visit" target="_blank"
												href="http://edu.51cto.com" class="mr10"><span
												class="span1">看课程</span>
											</a>
											<a class="save-visit" target="_blank"
												href="http://down.51cto.com" class="mr10"><span
												class="span2">下资料</span>
											</a>
											<a class="save-visit" target="_blank"
												href="http://wot.51cto.com"><span class="span3">抢门票</span>
											</a>
										</div>
									</div>
								</dt>
								<dd class="left clearfix">
									<div class="code left">
										<div class="codemin">
											<img
												src="https://static1.51cto.com/home/web/images/members/member_mobile.png"
												height="138" width="138" alt="" />
										</div>
										<c:if test="<%=studentBean.getStudentname()==null %>">
											<div class="codefbg"></div>
											<a href="<%=basePath %>datainfo/login.jsp">登录</a>
										</c:if>
									</div>
									<div class="zfway left pt30">
										<div class="line1 pb20">
											扫码快速支付
										</div>
										<div class="line2 pb20">
											<img
												src="https://static1.51cto.com/home/web/images/members/weixin.png"
												height="22" width="22" alt="" />
											<span>+</span>
											<img
												src="https://static1.51cto.com/home/web/images/members/zfb.png"
												height="22" width="23" alt="" />
										</div>
										<div class="line3">
											请使用微信/支付宝钱包支付
										</div>
									</div>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mfooter">
			<div class="center">
				<ul class="clearfix">
					<li class="li_left left">
						<div class="tel">
							176-0797-5702
						</div>
						<div class="tel">
							156-7976-0329
						</div>
						<div class="qq mt10">
							<a target="_blank" href="/members/contactqq"><em>|</em>在线客服</a>
						</div>
					</li>
					<li class="li_center left pt10">
						<dl class="clearfix t16 mb20">
							<dt class="left">
								会员
								<br />
								支持
							</dt>
							<dd class="left clearfix">
								<a class="save-visit" target="_blank"
									href="http://edu.51cto.com/?vip">IT课堂</a>
								<a class="save-visit" target="_blank"
									href="http://down.51cto.com/?vip">IT课堂下载</a>
								<a class="save-visit" target="_blank"
									href="http://wot.51cto.com/?vip">WOT峰会</a>
								<a class="save-visit" target="_blank"
									href="http://bbs.51cto.com/?vip">IT课堂论坛</a>
								<a class="save-visit" target="_blank"
									href="http://blog.51cto.com/?vip">IT课堂博客</a>
							</dd>
						</dl>
						<div class="t14">
							<span class="t12">Copyright © 20175-2027 IT课堂.COM</span>
							赣ICP证060544
						</div>
						<div class="t12">
							研发总部：江西省赣州市章贡区宏图软件学院一班
						</div>
					</li>
					<li class="li_right left">
						<ul class="clearfix">
							<li>
								<img
									src="https://static1.51cto.com/home/web/images/members/code_cto.jpg"
									height="97" width="98" alt="" />
								<div class="mt5">
									IT课堂官方大本营
								</div>
							</li>
							<li>
								<img
									src="https://static1.51cto.com/home/web/images/members/code_xy.jpg"
									height="97" width="98" alt="" />
								<div class="mt5">
									IT课堂学院客户端
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div style="display: none">
			<script src="https://logs.51cto.com/rizhi/count/count.js"></script>
			<script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?844390da7774b6a92b34d40f8e16f5ac";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
        document.write(decodeURI("%3Cscript src='https://tongji.51cto.com/cto.js/3d7ca8d8c01f7e7b50250ff1c15bdae3' type='text/javascript'%3E%3C/script%3E"));
    </script>
		</div>
		<script src="https://static1.51cto.com/home/web/js/jquery.min.js"></script>
		<script
			src="https://static3.51cto.com/home/web/js/idangerous.swiper.min.js"></script>
		<script src="https://static2.51cto.com/home/web/js/member.js"></script>
	</body>
</html>

