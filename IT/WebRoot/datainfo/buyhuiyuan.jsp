<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
			StudentBean studentBean = (StudentBean) session
					.getAttribute("bean");
			int num = Integer.parseInt(session.getAttribute("num").toString());
		%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon"
			href="https://static3.51cto.com/home/web/images/members/favicon.ico"
			type="image/x-icon" />
		<meta name="keywords"
			content="51CTO会员,51CTO,51CTO学院,51CTO下载中心,51CTO视频课程,资料下载,博文,视频教程,java教程,Linux命令大全,领取会员,会员账号,Python,慕课网" />
		<meta name="description"
			content="51CTO会员是51CTO为用户提供的一项综合增值特权服务，包含51CTO旗下众多网站（家园、学院、下载、博客、论坛、WOT峰会、CTO训练营）特权，会员不仅有免费学习2000门视频课程、免费下载100万+资料这些特权，还有优惠折扣、尊贵VIP标识、WOT峰会门票折扣等多种特权" />
		<meta name="csrf-param" content="_csrf" />
		<meta name="csrf-token"
			content="WVAubUJLZ0QJJWcuBj8IJghneCp0E1IQHz0fHhVyMhs2KGIeGhpQCg==" />
		<title>开通IT课堂会员--一个会员 全站特权</title>
		<link
			href="https://static3.51cto.com/home/web/css/idangerous.swiper.css"
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
	</head>
	<body>
		<div class="memberhead">
			<div class="center clearfix">
				<div class="left clearfix nav">
					<a href="/members/in-fo" class="left mt25"><img
							src="https://static3.51cto.com/home/web/images/members/mlogo.png"
							height="26" width="126" alt="" />
					</a>
					<span class="left jiange"></span>
					<span class="left mt25"><img
							src="https://static3.51cto.com/home/web/images/members/slogn.png"
							height="34" width="145" alt="" />
					</span>
					<ul class="left clearfix">
						<li class="cur">
							<a href="/members/in-fo">首页</a>
						</li>
						<li>
							<a href="/members/privilege">会员特权</a>
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
					<div class="login_after cl_5 mt20">
						<a href="<%=basePath%>loginservlet?order=exit"
							class="exit right cl_5">[退出]</a>
						<span class="right mr15"></span>
						<span class="name right mr5"> <img
								src="http://ucenter.51cto.com/avatar.php?uid=12569085&amp;size=small"
								height="31" width="31" alt="" /> 欢迎您，<%=studentBean.getStudentmobile()%>
						</span>
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
								src="https://static3.51cto.com/home/web/images/members/banner.jpg"
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
							<div class="line1 pb10 mt20">
								季度会员
								<strong>￥11</strong>
								<span>原价： <b>￥19</b> </span>
							</div>
							<div class="line1">
								年度会员
								<strong>￥39</strong>
								<span>原价： <b>￥69</b> </span>
							</div>
							<div class="joinbtn mt20 mb10">
								<a href="/members/in-fo#buybox">加入51CTO会员</a>
							</div>
							<div class="line2">
								现在购买会员低至5.8/5.7折。欲购从速
							</div>
						</div>
						<div class="code_after" style="display: none">
							<div class="btns t14 tc">
								<span class="cur first-goods-switch">￥11/季度</span>
								<span class="second-goods-switch">￥39/年</span>
							</div>
							<div class="tc mt15 mb15">
								<img class="first-goods"
									src="http://s5.51cto.com/wyfs02/M00/95/C7/wKiom1kZly-RIha6AAAGPHu8L1M131.png"
									height="139" width="146" alt="" />
								<img class="second-goods" style="display: none;"
									src="http://s5.51cto.com/wyfs02/M00/95/C7/wKioL1kZlzCw28H2AAAGLVB__pQ034.png"
									height="139" width="146" alt="" />
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
									src="https://static3.51cto.com/home/web/images/members/quanyi1.png"
									alt="" />
							</a>
						</div>
						<span>2000门课程免费学</span>
					</li>
					<li>
						<div>
							<a class="save-visit" href="/members/privilege#tab1"><img
									src="https://static3.51cto.com/home/web/images/members/quanyi2.png"
									alt="" />
							</a>
						</div>
						<span>买课程享9.5折优惠</span>
					</li>
					<li>
						<div>
							<a class="save-visit" href="/members/privilege#tab2"><img
									src="https://static3.51cto.com/home/web/images/members/quanyi3.png"
									alt="" />
							</a>
						</div>
						<span class="first-goods">免费下载资料120次</span>
						<span class="second-goods" style="display: none;">免费下载资料500次</span>
					</li>
					<li>
						<div>
							<a class="save-visit" href="/members/privilege#tab3"><img
									src="https://static3.51cto.com/home/web/images/members/quanyi4.png"
									alt="" />
							</a>
						</div>
						<span>尊享会员标识</span>
					</li>
					<li>
						<div>
							<a class="save-visit" target="_blank"
								href="http://wot.51cto.com/act/2017/architecture"><img
									src="https://static3.51cto.com/home/web/images/members/quanyi5.png"
									alt="" />
							</a>
						</div>
						<span>WOTI巅峰票直降500</span>
						<em>优惠码：46AD0B5856BD7DE9</em>
					</li>
					<li>
						<div>
							<a href="/members/privilege"><img
									src="https://static3.51cto.com/home/web/images/members/quanyi6.png"
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
						<div class="taocan taocan_sel mb20 first-goods-switch goods-id-1">
							<span class="selt"></span>
							<dl class="clearfix">
								<dt>
									<span>5.8</span>折
								</dt>
								<dd>
									<div class="line1">
										51CTO季度会员
									</div>
									<div class="line2">
										￥11/3个月
									</div>
									<div class="line3">
										原价：
										<span>￥19</span>
									</div>
								</dd>
							</dl>
						</div>
						<div class="taocan second-goods-switch goods-id-2">
							<span class="selt"></span>
							<span class="jian"></span>
							<dl class="clearfix">
								<dt>
									<span>5.7</span>折
								</dt>
								<dd>
									<div class="line1">
										51CTO年度会员
									</div>
									<div class="line2">
										￥39/12个月
									</div>
									<div class="line3">
										原价：
										<span>￥69</span>
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="buyways right">
						<div class="waytab clearfix">
							<span class="cur">微信/支付宝</span>
							<span class="first-goods"><a target="_blank"
								href="/members/sava-order?g=714948493301">其他支付方式</a>
							</span>
							<span class="second-goods" style="display: none;"><a
								target="_blank" href="/members/sava-order?g=514948493302">其他支付方式</a>
							</span>
						</div>
						<div class="buywaymin">
							<dl class="clearfix">
								<dt class="left pt20">
									<div class="buy_before">
										<div class="line1 mb15 first-goods">
											应付金额：
											<span>￥11</span>
										</div>
										<div class="line1 mb15 second-goods" style="display: none;">
											应付金额：
											<span>￥39</span>
										</div>
										<div class="line2">
											收款方：北京无忧创想信息技术有限公司
										</div>
									</div>
									<div class="buy_after" style="display: none">
										<div class="line1 congratulation">
											恭喜您获赠51CTO会员使用权
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
										<div class="codemin first-goods">
											<img
												src="http://s5.51cto.com/wyfs02/M00/95/C7/wKiom1kZly-RIha6AAAGPHu8L1M131.png"
												height="138" width="138" alt="" />
										</div>
										<div class="codemin second-goods" style="display: none;">
											<img
												src="http://s5.51cto.com/wyfs02/M00/95/C7/wKioL1kZlzCw28H2AAAGLVB__pQ034.png"
												height="138" width="138" alt="" />
										</div>
										<div class="codefbg renew" style="display: none;"></div>
										<a class="renew" style="display: none;" onclick="renew()"
											href="javascript:void(0);">续费</a>
									</div>
									<div class="zfway left pt30">
										<div class="line1 pb20">
											扫码快速支付
										</div>
										<div class="line2 pb20">
											<img
												src="https://static3.51cto.com/home/web/images/members/weixin.png"
												height="22" width="22" alt="" />
											<span>+</span>
											<img
												src="https://static3.51cto.com/home/web/images/members/zfb.png"
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
		<div class="membtbox">
			<div class="center" style="text-align: center;">
				<div style="margin: auto; font-size: 20px; color: #888888">
					暂无购买记录
				</div>
			</div>
		</div>
		<div class="mfooter">
			<div class="center">
				<ul class="clearfix">
					<li class="li_left left">
						<div class="tel">
							400-851-9651
						</div>
						<div class="tel">
							010 68476606-8957
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
									href="http://edu.51cto.com/?vip">51CTO学院</a>
								<a class="save-visit" target="_blank"
									href="http://down.51cto.com/?vip">51CTO下载</a>
								<a class="save-visit" target="_blank"
									href="http://wot.51cto.com/?vip">WOT峰会</a>
								<a class="save-visit" target="_blank"
									href="http://bbs.51cto.com/?vip">51CTO论坛</a>
								<a class="save-visit" target="_blank"
									href="http://blog.51cto.com/?vip">51CTO博客</a>
							</dd>
						</dl>
						<div class="t14">
							<span class="t12">Copyright © 2005-2017 51CTO.COM</span>
							京ICP证060544
						</div>
						<div class="t12">
							地址：北京市海淀区中关村南1条甲1号ECO中科爱克大厦6-7层
						</div>
					</li>
					<li class="li_right left">
						<ul class="clearfix">
							<li>
								<img
									src="https://static3.51cto.com/home/web/images/members/code_cto.jpg"
									height="97" width="98" alt="" />
								<div class="mt5">
									51CTO官方大本营
								</div>
							</li>
							<li>
								<img
									src="https://static3.51cto.com/home/web/images/members/code_xy.jpg"
									height="97" width="98" alt="" />
								<div class="mt5">
									51CTO学院客户端
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

