<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.StudentBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:wb="http://open.weibo.com/wb">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport"
			content="width=1200, initial-scale=device-width/1200, user-scalable=no, minimal-ui">
		<title>帮助中心_IT课堂</title>
		<meta name="keywords" content="IT在线教育,IT在线培训视频,课程在线,培训视频,在线视频,51cto" />
		<meta name="description"
			content="51CTO学院是专业的IT在线教育平台，聘请云计算、大数据、HTML5、网络安全、服务器、Android、iOS、开发技术、SQL Server、Oracle、数据库等技术领域的专家，更有思科认证、软考、Linux认证、微软认证、H3C认证系列精品IT在线视频培训课程，汇集最顶尖的IT技术课程，最优秀的IT培训讲师授课视频，大量技术培训视频教程，学员付费后可在线观看，此外还可以获得专家讲师亲自答疑，并参加课程的在线评测。" />
		<meta http-equiv="Expires" CONTENT="0">
		<meta http-equiv="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="Pragma" CONTENT="no-cache">
		<LINK href="/favicon.ico" type="image/x-icon" rel=icon>
		<link href="https://static1.51cto.com/edu/css/reset.css?v=2.4.4"
			rel="stylesheet" type="text/css" />
		<link href="https://static1.51cto.com/edu/css/style.css?v=2.4.4"
			rel="stylesheet" type="text/css" />

		<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.4.4"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/msgbox.js?v=2.4.4"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/nav.js?v=2.4.4"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/mbox.js?v=2.4.4"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.4"></script>
		<!-- 通用顶部简导航 -->
		<link rel="stylesheet" type="text/css"
			href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.82">
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.82"></script>
		<!-- New Header -->
		<link rel="stylesheet" type="text/css"
			href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4">
		<link type="text/css"
			href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.4"
			rel="Stylesheet" />
		<script type="text/javascript">
var gen_logo = '1';
</script>
	</head>
	<body>
		<%
			StudentBean studentBean = (StudentBean) session
					.getAttribute("bean");
		%>
		<div class="GenTopHeader" style="margin-top: 0px;">
			<ul class="Page" id="GenTopBar">
				<li class="fl f14" id="Til">
					<a href="http://edu.51cto.com/">中国最大的IT技能学习平台</a>
				</li>
				<li class="fr navi">
					<a href="javascript:void(0);" target="_blank"
						style="background-color: none;">网站导航</a>
					<ul class="navigates">
						<li>
							<a href="<%=basePath%>courselistservlet?order=list"
								target="_blank">首页</a>
						</li>
						<li>
							<a href="<%=basePath%>datainfo/login.jsp" target="_blank">登录界面</a>
						</li>
						<li style="border-bottom: 1px solid #FFF;">
							<a href="<%=basePath%>datainfo/zhuce.jsp" target="_blank">注册界面</a>
						</li>
						<li>
							<a
								href="<%=basePath%>studentservlet?order=teacher&studentname=${studentbean.studentname}"
								target="right">申请开课</a>
						</li>
						<li>
							<a href="<%=basePath%>mainservlet?order=face" target="_blank">IT课堂主站</a>
						</li>
					</ul>
				</li>
				<c:if test="<%=studentBean != null%>">
					<li class="fr">
						<a target="_blank"
							href="<%=basePath%>loginservlet?order=loginin&name=${studentBean.studentmobile}">学习中心</a>
					</li>
				</c:if>
				<li class="fr apps">
					<a href="<%=basePath%>datainfo/app.jsp" target="_blank"
						style="background: none;">课堂APP</a>
					<ul>
						<li>
							<a href="javascript:void(0);" target="_blank">Android</a>
						</li>
						<li>
							<a href="javascript:void(0);" target="_blank">iPhone</a>
						</li>
						<li>
							<a href="javascript:void(0);" target="_blank">iPad</a>
						</li>
					</ul>
				</li>
				<li class="fr" id="TopCart">
					<a href="<%=basePath%>courselistservlet?order=mycar1"
						target="_blank" class="red">购物车<span>${requestScope.num}</span>
					</a>
				</li>
				<li class="fr reg">
					<a href="<%=basePath%>datainfo/zhuce.jsp" target="_blank">注册</a>
				</li>
				<c:if test="<%=studentBean == null%>">
					<li class="fr">
						<a href="<%=basePath%>datainfo/login.jsp">登录</a>
					</li>
				</c:if>
				<c:if test="<%=studentBean != null%>">
					<li class="fr">
						<a href="<%=basePath%>loginservlet?order=exit">安全退出</a>
					</li>
					<c:if test="<%=studentBean.getVIP() != 1%>">
						<li class="fr reg">
							<a
								href="<%=basePath%>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile()%>"
								target="_blank"><%=studentBean.getStudentname()%>&nbsp;<img
									src="<%=basePath%>images/vip_grey2.png"
									style="float: right; margin-top: 13px; height: 20px; width: 20px; border-radius: 50%" />
							</a>
						</li>
					</c:if>
					<c:if test="<%=studentBean.getVIP() == 1%>">
						<li class="fr reg">
							<a
								href="<%=basePath%>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile()%>"
								target="_blank"><%=studentBean.getStudentname()%>&nbsp;<img
									src="<%=basePath%>images/vipred.png"
									style="float: right; margin-top: 13px; height: 20px; width: 20px; border-radius: 50%" ;/>
							</a>
						</li>
					</c:if>
				</c:if>
			</ul>
		</div>
		<ul class="FixedSideBar">
			<li class="FixedSideBar_iPad">
				<ul class="reddot"></ul>
				<p>
					APP下载
				</p>
				<div class="FixedSideBar_SSS"></div>
				<div class="FixedSideBar_iPad_QrCode">
					<img
						src="https://static1.51cto.com/edu/images/whitestyle/download_qr2.png"
						style="width: 90px;" />
					<div class="tc">
						下载学院APP
						<br />
						缓存视频离线看
					</div>
				</div>
			</li>
			<li class="FixedSideBar_FeedBack">
				<p>
					<a href="javascript:void(0);" target="_blank">意见反馈</a>
				</p>
			</li>
			<li class="FixedSideBar_GoTop">
				<p>
					返回顶部
				</p>
			</li>
		</ul>

		<div class="pagebg" style="width: 100%; background: #fff;">
			<div class="Page" style="height: 90px;">
				<a href="javascript:void(0);" target="_blank"> <img
						src="<%=basePath%>image/bg1.jpg" /> </a>
			</div>
		</div>
		<div class="Header">
			<div class="Page">
				<div class="Logo fl">
					<a href="<%=basePath%>courselistservlet?order=list" title="IT课堂"><img
							src="<%=basePath%>image/itlogo.png" class="fl" /> </a>
				</div>
				<ul class="Navigate fl">
					<li>
						<a href="<%=basePath%>courselistservlet?order=list">首页</a>
					</li>
					<li>
						<a href="<%=basePath%>courselistservlet?order=study"
							target="_blank">微职位培训</a>
					</li>
					<li>
						<a target="_blank">视频课程</a>
					</li>
					<li>
						<a target="_blank">套餐</a>
					</li>
					<li>
						<a target="_blank">职业路线图</a>
					</li>
					<li>
						<a target="_blank">企业学习</a>
					</li>
					<li>
						<a target="_blank">免费试听</a>
					</li>
					<li>
						<p class="min_more">
							线下学习
						</p>
						<div class="min_more">
							<a target="_blank">IT训练营</a>
							<a target="_blank">IT峰会</a>
							<a target="_blank">IT集训</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<style type="text/css">
.w960 {
	width: 1190px;
}

.sliderbox {
	width: 930px;
}
</style>
		<p class="clear hr15"></p>
		<div class="title01 w960" style="position: relative;">
			<h3>
				IT课堂
			</h3>
		</div>
		<div class="w960 bgfff">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="210" valign="top" class="help_menu">
						<ul>
							<li class="a01 cur">
								<a href="<%=basePath%>courselistservlet?order=help">用户帮助</a>
							</li>
							<li class="a05">
								<a href="<%=basePath%>courselistservlet?order=fankui">用户反馈</a>
							</li>
							<li class="a03">
								<a href="<%=basePath%>courselistservlet?order=help">机构帮助</a>
							</li>
						</ul>
						<h2>
							学员交流群
						</h2>
						<div class="Group">
							<div class="Item">
								<div class="Main">
									<h5>
										云计算学习群
									</h5>
									<p class="red">
										275300091
									</p>
								</div>
								<a target="_blank"></a>
							</div>
							<div class="Item">
								<div class="Main">
									<h5>
										大数据交流群
									</h5>
									<p class="red">
										275300091
									</p>
								</div>
								<a target="_blank"></a>
							</div>
							<div class="Item">
								<div class="Main">
									<h5>
										微信H5交流群
									</h5>
									<p class="red">
										275300091
									</p>
								</div>
								<a target="_blank"></a>
							</div>
						</div>
						<a target="_blank" class="btn">更多QQ交流群&gt;&gt;</a>
					</td>
					<td align="left" valign="top">
						<div id="col">
							<dl class="sliderbox" id="toggle-view">
								<dt>
									如何购买课程？
								</dt>
								<dd>
									<div>
										1、在页面上搜索框中直接搜索相关关键词、或者进入“视频课程”列表页查找即可，除了看课程目录外，类似课程选择学员评分较高、学习人数较多；
										2、在课程页直接点击“立即购买”按钮，进入购买流程；也可以点击“加入购物车”，在购物车里点击“去结算”，进入购买流程（购物车功能尤其适合购买多个课程，实现多个课程一次性购买；在网站上加入购物车后，也可以在学院手机APP中“购物车”进入购买流程）；
										<br />
										/3、确认所购买的课程情况，进入IT课堂支付中心，可使用人民币现金支付，如果账户里有金币，可以配合使用“余额支付”（1金币可抵1元），如下：
										<img
											src="<%=basePath %>/images/itbeijing.png" />
										<br />
									</div>
								</dd>
								<dt>
									<font color="red">视频课程能否下载？手机上购买课程电脑上能否观看？是否支持多人观看？</font>
								</dt>
								<dd>
									<div>
										视频课程可以下载下来，在无网络环境下离线学习，目前支持下载到手机、平板电脑，不支持下载到pc电脑。手机上购买视频课程，可以在电脑和其他移动APP上观看学习。所有视频课程不支持多人观看。
									</div>
								</dd>
								<dt>
									如何付款？（支付宝/微信支付/网银/信用卡/美元外币均支持）
								</dt>
								<dd>
									<div>
										1.支付宝：淘宝旗下支付渠道，适用于有支付宝账号的同学，手机扫码即可完成支付，安全便捷，官方推荐；
										<br />
										2.微信支付：微信旗下支付渠道，适用于有微信支付账号的同学，手机扫码即可完成支付，安全便捷，官方推荐；
										<br />
										3.中国银联：中国官方的银行卡联合组织，适用于没有支付宝、微信支付但有国内银行储蓄卡和信用卡的同学，不特别推荐
										<br />
										4.Paypal：美国eBay旗下知名支付工具，中文名“贝宝支付”，适用于没有支付宝、微信支付的国外同学Paypal账号及外币信用卡支付；
										<br />
										5.支付如遇到问题，可拨打电话15679760329，或者点击网站右侧“点我咨询”图标使用QQ咨询客服人员如何操作。
										<br />
									</div>
								</dd>
								<dt>
									<font color="red">优惠券有何使用规则？能否和折扣/学分/学习码（卡）同时使用？</font>
								</dt>
								<dd>
									<div>
										1.优惠券不能和折扣/学分/学习码等同时使用；
										<br />
										2.优惠券不能用于套餐和培训班的购买中；
										<br />
										3.无门槛优惠券用于购买定价大于等于优惠券额度的课程，有门槛的优惠券只能用于购买定价在优惠券额度3倍以上的课程中；
										<br />
										4.优惠券一经使用，不再返还；
										<br />
										5.优惠券不能进行兑、出售或转让等操作，一经发现，作废处理。
										<br />
									</div>
								</dd>
								<dt>
									如何使用优惠券？
								</dt>
								<dd>
									<div>
										进入“我的学院”->“我的优惠券”，可查看优惠券情况，包括未使用优惠券、已使用优惠券、已过期优惠券。使用优惠券的操作流程：
										<br />
										<font color="red">一、购买单个课程使用优惠券：</font>
										<br />
										第一步：在课程页，点击"立即购买课程"；
										<img
											src="<%=basePath %>/images/buy.png" />
										<br />
										<br />
										第二步："确认课程清单"页面，点击“使用优惠”
										<br />

										<img
											src="<%=basePath %>/images/querenbuy.png" />
										<br />
										<br />

										第三步：“领取优惠方式”弹窗里，选择“领取优惠券”
										<br />
										<img
											src="<%=basePath %>/images/youhuiquan.png" />
										<br />
										<br />

										第四步：使用优惠券后，即抵消相应金额，实现优惠
										<br />
										<img
											src="<%=basePath %>/images/youhuiquan.png" />
										<br />
										<br />

										备注：如果要取消优惠，请参照第二步，点击“修改优惠”-弹窗中点选“取消优惠”-确定-实现对该优惠券的取消使用。
										<br />
										<br />

										<b><font color="red">二、购买多个课程（在购物车中）使用优惠券：</font> </b>
										<br />
										<br />

										第一步：页面右上角点击“我的购物车”
										<br />
										<img
												src="<%=basePath %>/images/buy.png" />										<br />
										<br />

										第二步：进入“我的购物车”页面，点击右下角“结算”
										<br />
										<img
											src="<%=basePath %>/images/car.png" />
										<br />
										<br />


										接下来，使用优惠券的方法，参见前面第一种情况的第三步。
										<br />
									</div>
								</dd>
								<dt>
									<font color="red">什么是学习码？如何使用学习码？</font>
								</dt>
								<dt>
									购买课程能否开发票？如何开发票？
								</dt>
								<dd>
									<div>
										在学院充值或购买课程可开具增值税普通发票，发票内容：服务费，满500元包邮发票，500元以下需支付10元快递费，开发票请提供发票抬头及快递信息，在网站右侧“点我咨询”图标找到在线客服或者拨打电话15679760329开具发票。请务必在3个月内联系客服开具发票，3个月之后将不能开具哦~
									</div>
								</dd>
								<dt>
									购买课程后能退款吗？
								</dt>
								<dd>
									<div>
										由于每个课程都有免费试看，所以原则上购买后是不能退款的，学员可以与讲师协商沟通，如果达成一致可退还金币（金币可用于购买其他课程）。
									</div>
								</dd>
								<dt>
									购买的课程如何退款？
								</dt>
								<dd>
									<div>
										<img
											src="<%=basePath %>/images/tuikuan.png" />
										<br />
										1、填写退款详情资料
										<br />
										2、填写退款详情资料填写后讲师会处理。
										<br />
									</div>
								</dd>

								<dt>
									<font color="red">什么是学分？学分有什么用？</font>
								</dt>
								<dd>
									<div>
										学分是IT课堂的虚拟积分，可以用来折抵部分现金购买付费课程（100学分=1元），也可以参加官方各类学分兑换礼品活动（学分兑换在学院APP-我-学分兑换页面中进行，学院APP下载地址:http://edu.IT课堂.com/activity/lists/id-10.html）。
									</div>
								</dd>
								<dt>
									什么是可用学分？
								</dt>
								<dd>
									<div>
										可用学分是指在单个付费课程购买中，可以用来折抵现金的学分，可用学分折抵现金的数量取决于讲师课程的设置，另外可用

										学分必须是整百数，所以一般小于自己的学分总数量。
									</div>
								</dd>
								<dt>
									如何获得学分？
								</dt>
								<dd>
									<div>
										1、购买课程后或学习完某免费课程后，给课程发表真实评价，发表一条四分以上评价奖励20学分；每个课程的前五个评价，每条奖励5分

										；课程评价被管理员加精，奖励10学分；
										<br />
										2、登录后每天可在学院网站首页免费领取5学分，连续5天以上可领10学分，30天以上可领15学分 ；
										<br />
										3、在课程和课时页面分享链接到微博等社会化媒体，他人访问即获得2学分，每天最多可获取1000学分；
										<br />
										4、每天发表一篇笔 记，总奖励20学分；每天提问一个问题，总奖励10学分；每天回复一个问题，总奖励10学分；
										<br />
										5、为IT课堂提建议被采纳，管理员 送学分；
										<br />
										6、参与学院活动奖励学分；
										<br />
										7、更多学分获得途径，将后续推出。以上得分，当所做操作被管理员认定非法及 恶意而删除，相应学分奖励将扣除。
									</div>
								</dd>
								<dt>
									发表课程评价如何奖励学分？
								</dt>
								<dd>
									<div>
										1) 发表好评评价（综合评分在4分以上），每条奖励20学分；
										<br />
										2) 课程前5条评价，每条奖励5学分；
										<br />
										3) 评价被管理 员加精，每条奖励10学分。以上得分，当所做操作被管理员认定非法及恶意而删除，相应学分奖励将扣除。
									</div>
								</dd>
								<dt id="appraise">
									如何进行课程评价？综合评价如何计算？
								</dt>
								<dd>
									<div>
										学员可以对课程在“课程与描述相符”、“老师的讲解表达”、“老师的答疑服务”三个方面进行评分 。
										<br />
										综合评分为“（课程与描述相符评分+老师的讲解表达评分+老师的答疑服务评分）/3”。

									</div>
								</dd>
								<dt>
									<font color="red">什么是金币？</font>
								</dt>
								<dd>
									<div>
										金币是IT课堂虚拟货币，可以使用金币1:1直接抵扣现金购买课程而没有任何限制，1金币相当于1元人民币
										<br />
									</div>
								</dd>
								<dt>
									如何学习课程？
								</dt>
								<dd>
									<div>
										通过搜索和浏览可发现你想要的课程，进入课程页面点击课时标题，可进入课时页面在线观看视频。我们提供大量课程在线免
										费观看，部分精品原创课程需支付一定现金才能学习。
									</div>
								</dd>
								<dt>
									讲师有何权益？
								</dt>
								<dd>
									<div>
										1.精湛加密：业界最靠谱的视频加密技术，100%保护你的知识版权；
										<br />
										2.人群精准：用户群精准，聚集1000万IT人在线交流的平台；
										<br />
										3.
										技术变现：让技术与知识变现，固化已有技术知识，收益可持续，留更多时间去研究新技术，实现脑力赚钱，不再依靠重复的体力劳动获得回报；
										<br />
										4.其他机会：企业内训、项目外包，我们提供更多额外收益机会；
										<br />
										5.出书服务：图书出版一条龙服务，推荐出版社、社区总编写推荐语、课程配合图书推广、读书频道推广、为图书配套学习卡、优惠券等额外增值项；
										<br />
										6.人脉拓展：加入学院专家圈，和同行大牛技术交流，拓展人脉；
										<br />
										7.粉丝集聚：聚集学员群，建立个人品牌，提升个人名气；
										<br />
										8.在线品牌：高规格的讲师荣誉体系，帮你打造在线教育领域个人品牌；
										<br />
										9.移动学习：完善的产品支持，移动端用户随时随地学习，老师随时随地指导答疑；
										<br />
										10.免费门票：免费获得IT课堂主办的各种技术峰会门票；
										<br />
										11.免费礼品：优先获得IT课堂定制的各种贴心礼品，荣誉证书等；
										<br />
										12.贴心服务：学院美女管家们专业贴心的一系列服务。
									</div>
								</dd>
								<dt>
									<font color="red">成为学院讲师需要什么条件？</font>
								</dt>
								<dd>
									<div>
										IT课堂诚邀各技术领域的技术专家，录制实战课程供学员学习，提升职业技能，申请讲师需具备以下任一条件：

										<br />
										1. IT行业内3年及以上从业经验，自身有丰富的技术知识及经验可以分享
										<br />
										2. 曾经拥有过讲师、培训经历
										<br />
										3. 平时喜欢在互联网等分享技术（写技术博客、逛技术论坛等）
									</div>
								</dd>

								<dt>
									如何申请成为讲师？
								</dt>
								<dd>
									<div>
										我们欢迎广大技术专家来担任讲师，发布优质课程，分享技术的同时也获得收益，申请地址：IT课堂：在线提交资料申请后，我们将联系您沟通更多细节事项。
									</div>
								</dd>
								<dt>
									<a name="honor" id="honor" style="color: #666;">什么是讲师荣誉体系？</a>
								</dt>
								<dd>
									<div>
										讲师荣誉体系，是IT课堂从课程质量、答疑效果、学员评价、销售情况等方面衡量讲师价值综合评分的结果。
										<br />
										讲师荣 誉称号由低到高依次为：认证讲师、中级讲师、高级讲师、特级讲师、金牌讲师。
										<br />
										讲师荣誉有助于帮助学员找到质量高的课程以及服 务好的讲师。
									</div>
								</dd>


							</dl>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<script type="text/javascript">
var fordefault = "";
$(document).ready(function () {

	$('#toggle-view dt').click(function () {
		var text = $(this).next('dd');
		if (text.is(':hidden')) {
			text.slideDown('200');
			$(this).addClass("open");		
		} else {
			text.slideUp('200');
			$(this).removeClass("open");	
		}
		
	});
	if(fordefault == ''){
		$('#toggle-view dt').eq(1).click();
	}else{
		$('#'+fordefault).click();
	}

    var name_tag = $.trim(location.href.split("#").pop());
    if(name_tag && $("#"+name_tag)){
        $("#"+name_tag).parent("dt").next("dd").show();
    }

});
</script>

		<div class="Footer">
			<div class="Page">
				<table class="QRcode tc">
					<caption>
						<a href="<%=basePath%>courselistservlet?order=list" title="IT课堂"><img
								src="<%=basePath%>image/itlogo.png" alt="IT课堂" width="194"
								height="40" />
					</caption>
					<tr>
						<td>
							<img
								src="<%=basePath %>images/it.bmp"
								alt="学院APP" width="110" height="110" />
							<p>
								学院APP
							</p>
						</td>
						<td>
							<img
								src="<%=basePath %>images/it.bmp"
								alt="官方微信" width="110" height="110" />
							<p>
								官方微信
							</p>
						</td>
					</tr>
				</table>
				<div class="Info fl">
					<div class="Map">
						<a href="<%=basePath%>courselistservlet?order=guanyu" title="关于我们"
							target="_blank">关于我们</a>
						<span></span>
						<a href="<%=basePath%>courselistservlet?order=help"
							target="_blank" title="帮助中心">帮助中心</a>
						<span></span>
						<a href="<%=basePath%>courselistservlet?order=fankui" title="意见反馈"
							target="_blank">意见反馈</a>
						<span></span>
						<a href="<%=basePath%>courselistservlet?order=lianxi"
							target="_blank" title="联系我们">联系我们</a>
						<span></span>
						<a target="_blank" title="课程登记">课程登记</a>
						<span></span>
						<a target="_blank" title="学员故事">学员故事</a>
						<span></span>
						<a target="_blank" title="学员交流">学员交流</a>
					</div>
					<p class="Call fl red">
						176-0797-5702
					</p>
					<p class="fl callTime">
						09:00 - 19:00
					</p>
					<div class="clear"></div>
					<p class="copy">
						Copyright &copy; 2005-2017
						<a target="_blank">IT.com</a>
					</p>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="mask disp-n" id="AdviceMask"></div>
		<div class="Advice disp-n" id="Advice">
			<div class="Main">
				<button class="close"
					onclick="$('#AdviceMask').hide();$('#Advice').hide();">
					&nbsp;
				</button>
				<button id="bizQQ_WPA">
					&nbsp;
				</button>
				<h3>
					可以开发票么？
				</h3>
				<p>
					可以的，购买课程或者充值余额后都是可以开具发票的，具体详情点击：
					<a href="javascript:void(0);"
						target="_blank">我要开发票</a>
				</p>
				<h3>
					购买的课程可以下载么？
				</h3>
				<p>
					目前PC端暂不支持下载课程视频，请手机或者平板电脑下载“IT课堂”APP后再下载视频哦！
				</p>
				<h3>
					优惠券如何使用？
				</h3>
				<p>
					非折扣课程（不包含1元课程/套餐）可使用，一个订单（可包含多个课程）只可使用一张；优惠券一经使用，不再返还；若被冻结请在PC端删除订单即可返还。
				</p>
				<p class="mt20">
					更多问题查询点击
					<a href="javascript:void(0);" target="_blank">帮助中心</a>
				</p>
				<p class="mt10">
					欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，
					<a href="javascript:void(0);" target="_blank">我要反馈意见</a>
				</p>
			</div>
		</div>
		<script type="text/javascript">
$("#bizQQ_WPA").click(function(){
    window.open('http://edu.51cto.com/contactqq.html')
})
</script>

		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/edu-ad.js?v=20161009"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/edu_header.js?v=1.2.2"></script>
		<!----------------------数据分析  begin --------------------->
		<script type="text/javascript">
    var sessionid = "l5am3aa6p3ioqho72smvrm0af6",
            ip = "182.97.23.197",
            user_id = "0",
            source = 0;
</script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/md5.js"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/tract_public.js?v=10.21"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/pv_tract.js?v=2016092803"></script>
		<!----------------------数据分析  end -------------------->
		<span style="display: none;"> <script
				src="https://logs.51cto.com/rizhi/count/count.js"></script> </span>
		<!--qiaohaun-->
		<script type="text/javascript"> document.write(unescape("%3Cscript src='https://tongji.51cto.com/cto.js/b57176900a4805e17afc7b8e25a43abf' type='text/javascript'%3E%3C/script%3E")); </script>
		<script type="text/javascript">
//百度统计代码
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?8c8abdb71d78d33dfdb885e0bc71dae0";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
		<div style="display: none">
			<iframe frameborder="0" scrolling="no" width="0" height="0"
				src="http://log.51cto.com/pageview.php?frompos=edu_art"></iframe>
		</div>
	</body>
</html>
