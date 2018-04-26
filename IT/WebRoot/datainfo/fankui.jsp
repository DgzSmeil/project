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
		<title>用户反馈</title>
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
			href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.82"/>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.82"></script>
		<!-- New Header -->
		<link rel="stylesheet" type="text/css"
			href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4"/>
		<link type="text/css"
			href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.4"
			rel="Stylesheet" />
		<script type="text/javascript">
var gen_logo = '';
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
					<a href="http://edu.51cto.com/sitemap.html" target="_blank"
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
					<a href="<%=basePath%>datainfo/fankui.jsp" target="_blank">意见反馈</a>
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
				<a href="http://edu.51cto.com/px/train/115?banner" target="_blank">
					<img
						src="https://s1.51cto.com/images/201702/4988085302c43cf1dec526f92c04f3faa8ac9f.jpg" />
				</a>
			</div>
		</div>
		<div class="Header">
			<div class="Page">
				<div class="Logo fl">
					<a href="<%=basePath %>courselistsevlet?order=list" title="IT课堂"><img
							src="<%=basePath%>image/itlogo.png" class="fl"/>
					</a>
				</div>
				<ul class="Navigate fl">
					<li>
						<a href="<%=basePath%>datainfo/shouye.jsp">首页</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank">微职位培训</a>
					</li>
					<li>
						<a href="javascript:void(0);"
							target="_blank">视频课程</a>
					</li>
					<li>
						<a href="javascript:void(0);"
							target="_blank">套餐</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank">职业路线图</a>
					</li>
					<li>
						<a href="javascript:void(0);"
							target="_blank">企业学习</a>
					</li>
					<li>
						<a href="javascript:void(0);"
							target="_blank">免费试听</a>
					</li>
					<li>
						<p class="min_more">
							线下学习
						</p>
						<div class="min_more">
							<a target="_blank"
								href="javascript:void(0);">CTO训练营</a>
							<a target="_blank" href="javascript:void(0);">WOT峰会</a>
							<a target="_blank"
								href="javascript:void(0);">百城沙龙</a>
						</div>
					</li>
				</ul>
				<div class="Search fr">
					<form class="form-search" id="q-form" method="get"
						action="javascript:void(0);">
						<button class="fr">
							搜索
						</button>
						<input type="text" class="fr" placeholder="找课程、找讲师" name="q"
							id="q" autocomplete="off" />
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="javascript:void(0);"></script>
		<p class="clear hr15"></p>
		<div class="title01 w960" style="position: relative;">
			<h3>
				IT课堂帮助文档
			</h3>
		</div>
		<style type="text/css">
			.w960 {
				width: 1190px;
			}
			
			table {
				text-align: left;
			}
</style>
		<div class="w960 bgfff">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="210" valign="top" class="help_menu">
						<ul>
							<li class="a01">
								<a href="javascript:void(0);">用户帮助</a>
							</li>
							<li class="a05 cur">
								<a href="javascript:void(0);">用户反馈</a>
							</li>
							<li class="a03">
								<a href="javascript:void(0);">机构帮助</a>
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
								<a
									href="javascript:void(0);"
									target="_blank"></a>
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
								<a
									href="javascript:void(0);"
									target="_blank"></a>
							</div>
							<div class="Item">
								<div class="Main">
									<h5>
										微信H5交流群
									</h5>
									<p class="red">
										xljx_888888
									</p>
								</div>
								<a
									href="javascript:void(0);"
									target="_blank"></a>
							</div>
						</div>
						<a href="javascript:void(0);"
							target="_blank" class="btn">更多QQ交流群&gt;&gt;</a>
					</td>
					<td align="left" valign="top">
						<form id="feedBackForm" method="post"
							action="javascript:void(0);">
							<div>
								<div class="fbLi">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr>
											<td width="60" valign="middle">
												<p class="fb-ico">
													?
												</p>
											</td>
											<td valign="middle">
												<p class="font18 lh30">
													欢迎大家在此反馈IT课堂视频播放异常、购买课程等问题~
												</p>
												<p class="font14 c90">
													您遇到的问题也许在这里已经有解答了，
													<a href="javascript:void(0);" target="_blank" class="c_green">找找看</a>
												</p>
												<p>
													您可以加入IT课堂产品体验群 275300091，随时反馈~
												</p>
											</td>
										</tr>
									</table>
								</div>
								<div class="fbLi">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr>
											<td width="60" align="left" valign="middle">
												<p class="fb-icob">
													1
												</p>
											</td>
											<td align="left" valign="middle">
												<p class="font13 lh30">
													问题类型：
												</p>
												<p class="font12">
													<input name="proType" type="radio" checked="checked"
														value="1" />
													<label>
														视频播放
													</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input name="proType" type="radio" value="2" />
													<label>
														内容需求
													</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input name="proType" type="radio" value="3" />
													<label>
														购买课程
													</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input name="proType" type="radio" value="0" />
													<label>
														发票咨询
													</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input name="proType" type="radio" value="4" />
													<label>
														其他
													</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input name="proType" type="radio" value="10" />
													<label>
														题库
													</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</p>
												<input type="hidden" name="feedback_code"
													value="35b8d8d3f6ddf85" />
											</td>
										</tr>
									</table>
								</div>
								<div class="fbLi" id="proTypeDiv_0" style="display: none;">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr>
											<td width="60" valign="top">
												<p class="fb-icob">
													2
												</p>
											</td>
											<td valign="top">
												<p class="font1 lh30">
													请详细描述您的建议、意见、问题等：
												</p>
												<p class="font14">
													<label for="textarea"></label>
													<textarea name="describe_0" id="describe_0" cols="32"
														rows="5" class="area410 c_ae"></textarea>
												</p>
											</td>
										</tr>
										<tr>
											<td></td>
											<td>
												<span class="c_red" id="describe_0_tip"></span>
											</td>
										</tr>
									</table>
								</div>
								<div class="fbLi" id="proTypeDiv_1">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr>
											<td width="60" valign="top">
												<p class="fb-icob">
													2
												</p>
											</td>
											<td valign="top">
												<p class="font13 lh30">
													问题判定：
												</p>
												<p class="font14">
													<label for="textarea"></label>
												</p>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="3%" align="left">
															<img
																src="https://static1.51cto.com/edu/images/arr-ico.png"
																width="11" height="9" />
														</td>
														<td width="97%" align="left" class="font12">
															所有视频都无法观看
														</td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
														<td class="c90">
															1. 请检查flash插件是否安装（如果没安装则看不到播放器）
															<br />
															2. Flash插件下载地址：
															<a href="http://get.adobe.com/cn/flashplayer/"
																target="_blank">http://get.adobe.com/cn/flashplayer/</a>
														</td>
													</tr>
													<tr>
														<td height="30" colspan="2" align="left">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td width="3%" align="left">
															<img
																src="https://static1.51cto.com/edu/images/arr-ico.png"
																width="11" height="9" />
														</td>
														<td width="97%" align="left" class="font12">
															部分视频播放不了
														</td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
														<td class="c90">
															1. 刷新几次后可播放正常，并且无卡顿，此为正常现象，有可能是网络波动引起的；
															<br />
															2. 怎么刷新都无法播放。
														</td>
													</tr>
													<tr>
														<td height="30" colspan="2" align="left">
															&nbsp;
														</td>
													</tr>
												</table>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tbdoy>
													<tr>
														<td colspan="2" class="font13 c_red">
															为了帮助我们尽快解决你的问题，请务必提供以下信息：
														</td>
													</tr>
													<tr>
														<td width="14%" height="115" valign="top">
															<label>
																<span class="c_red">*</span> 问题简要描述
															</label>
														</td>
														<td width="86%" valign="top">
															<textarea name="describe_1" id="describe_1" cols="32"
																rows="5" class="area410 c_c8">描述中必须包括播放视频问题出现时间，使用的浏览器、浏览器版本。</textarea>
														</td>
													</tr>
													<tr>
														<td></td>
														<td>
															<span class="c_red" id="describe_1_tip"></span>
														</td>
													</tr>
													<tr>
														<td height="40" valign="middle">
															<label>
																<span class="c_red">*</span> 问题视频地址
															</label>
														</td>
														<td height="40" valign="middle">
															<input name="videoUrl" type="text" class="inp148 c_ae"
																id="videoUrl" value="" style="width: 410px;" />
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<span class="c_red" id="videoUrl_tip"></span>
														</td>
													</tr>
													<tr>
														<td height="35" colspan="2" valign="top" class="c90">
															示例：http://ITketang.com/index.php?do=lession&id=28888
														</td>
													</tr>
													<tbody id="isHide">
														<tr>
															<td height="50" colspan="2" valign="middle">
																<div id="videoImg_c">
																	<span class="c_red">*</span> 问题视频截图
																	<span href="javascript:void(0);"><img
																			id="videoImg_p"
																			src="https://static1.51cto.com/edu/images/up-btn.png"
																			align="absmiddle" />
																	</span>
																	<input type="hidden" class="imgUpload" name="videoImg"
																		id="videoImg" value="" />
																	<span class="input_tip c_red" id="videoImg_tip"></span>
																</div>
															</td>
														</tr>
														<tr>
															<td height="50" colspan="2">
																<div id="pingImg_c">
																	<span class="c_red">*</span> ping
																	<span class="videoorv1">v1</span>.51cto.com截图
																	<span href="javascript:void(0);"><img
																			id="pingImg_p"
																			src="https://static1.51cto.com/edu/images/up-btn.png"
																			align="absmiddle" />
																	</span>
																	<input type="hidden" class="imgUpload" name="pingImg"
																		id="pingImg" value="" />
																	<span class="c_red" id="pingImg_tip"></span>
																</div>
															</td>
														</tr>
														<tr>
															<td height="35" colspan="2" valign="top" class="c90">
																方法：电脑屏幕左下角开始-&gt;运行-&gt;输入cmd-&gt;输入ping
																<span class="videoorv1">v1</span>.51cto.com-&gt;截图
																<a
																	href="javascript:void(0);"
																	target="_blank" class="c_green">例如&gt;&gt;</a>
															</td>
														</tr>
														<tr>
															<td colspan="2" valign="bottom">
																<div id="tracertImg_c">
																	<span class="c_red">*</span> tracert
																	<span class="videoorv1">v1</span>.51cto.com截图
																	<span href="javascript:void(0);"><img
																			id="tracertImg_p"
																			src="https://static1.51cto.com/edu/images/up-btn.png"
																			align="absmiddle" />
																	</span>
																	<input type="hidden" class="imgUpload"
																		name="tracertImg" id="tracertImg" value="" />
																	<span class="c_red" id="tracertImg_tip"></span>
																</div>
															</td>
														</tr>
														<tr>
															<td height="35" colspan="2" valign="top" class="c90">
																方法：电脑屏幕左下角开始-&gt;运行-&gt;输入cmd-&gt;输入tracert
																<span class="videoorv1">v1</span>.51cto.com-&gt;截图
																<a
																	href="javascript:void(0);"
																	target="_blank" class="c_green">例如&gt;&gt;</a>
															</td>
														</tr>
														<tr>
															<td height="40" colspan="2" valign="bottom">
																<div id="IpImg_c">
																	<span class="c_red">*</span> IP截图
																	<span href="javascript:void(0);"><img
																			id="IpImg_p"
																			src="https://static1.51cto.com/edu/images/up-btn.png"
																			align="absmiddle" />
																	</span>
																	<input type="hidden" class="imgUpload" name="IpImg"
																		id="IpImg" value="" />
																	<span class="c_red" id="IpImg_tip"></span>
																</div>
															</td>
														</tr>
														<tr>
															<td height="30" colspan="2" valign="top">
																<span class="c90"> 请大家不要提供内网IP，可在百度上输入IP,将截图给我们。<a
																	href="javascript:void(0);"
																	target="_balnk" class="c_green">例如&gt;&gt;</a>
																</span>
															</td>
														</tr>
														<tr>
															<td height="50" colspan="2">
																<label>
																	<span class="c_red">*</span> 运营商
																</label>
																<input name="operators" type="text" class="inp148 c_c8"
																	id="operators" value="电信、联通等等" />
																<span class="c_red" id="operators_tip"></span>
															</td>
														</tr>

													</tbody>
												</table>
											</td>
										</tr>
									</table>
								</div>
								<div class="fbLi" id="proTypeDiv_5">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr>
											<td width="60" valign="top">
												<p class="fb-icob">
													3
												</p>
											</td>
											<td valign="top">
												<p class="font14">
													联系信息:
												</p>
												<table width="100%" border="0" cellspacing="5"
													cellpadding="0">
													<tr>
														<td width="12%" height="45" align="right" valign="middle">
															邮箱 &nbsp;
														</td>
														<td>
															<label for="textfield"></label>
															<input type="text" name="email" id="email" class="inp148"
																value="" />
															<span class="c_red" id="email_tip"></span>
														</td>
													</tr>
													<tr>
														<td height="45" align="right" valign="middle">
															<span class="c_red">*</span> 手机号 &nbsp;
														</td>
														<td>
															<input type="text" name="phone" id="phone" class="inp148" />
															<span class="c_red" id="phone_tip"></span>
														</td>
													</tr>
													<tr>
														<td height="45" align="right" valign="middle">
															<span class="c_red">*</span> QQ &nbsp;
														</td>
														<td>
															<input type="text" name="qq" id="qq" class="inp148" />
															<span class="c_red" id="qq_tip"></span>
														</td>
													</tr>
													<tr>
														<td height="45" align="right" valign="middle">
															<span class="c_red">*</span> 地区 &nbsp;
														</td>
														<td>
															<input type="text" name="area" id="area" class="inp148" />
															<span class="c_red" id="area_tip"></span>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</div>
								<a class="btn_red"
									style="width: 75px; display: block; margin: 15px auto;"
									onclick="submitFeedbackForm()">提交</a>
							</div>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<script>
$("#isHide").hide();
$("#videoUrl").keyup(function(e){
	if($(this).val()){
		$("#isHide").fadeIn();
	}else{
		$("#isHide").fadeOut();
	}
});
var submitFeedbackForm; //初始化外部引用函数，否则有的浏览器不兼容
(function($){
	//http://edu.51cto.com/index.php?do=lession&id=26843
	var urltest	=	/^http:\/\/edu\.51cto\.com\/index.php\?do=lession&id=([0-9]{1,7})(\s*)$/;
	var urltest1	=	/^http:\/\/edu\.51cto\.com\/lesson\/id-([0-9]{1,7})\.html(\s*)$/;
	var qqtest	=	/^[0-9]{5,15}(\s*)$/;
	//问题类型改变
	$('input[name="proType"]').change(function(){
		var val	=	$(this).val();
		checkProTypeDiv(val);
	})
	
	//问题类型改变时显示相应表单
	var checkProTypeDiv	=	function(val){
		if(val == 1){
			$('#proTypeDiv_0').css('display','none');
			$('#proTypeDiv_1').css('display','');
		}else{
			$('#proTypeDiv_1').css('display','none');
			$('#proTypeDiv_0').css('display','');
		}
		if(val == 5){
			$('#proTypeDiv_5').css('display','none');
		}else{
			$('#proTypeDiv_5').css('display','');
		}
	}
	
	//初始化问题表单
	var proTypeVal	=	$('input[name="proType"]:checked').val();
	checkProTypeDiv(proTypeVal)
	
	
	//好几个地方上传图片
	var uploader	=	{};
	$('.imgUpload').each(function(i,v){
		var obj = $(v),
		n	=	obj.attr('name');
		
		/**  上传图片 start **/
		uploader[n] = new plupload.Uploader({
			runtimes : 'flash,html5',
			browse_button : n+'_p',
			container: n+'_c',
			max_file_size : '200mb',
			//chunk_size : '200mb',
			autostart : true,
			unique_names : false,
			url : '/index.php?do=misc&m=upimg',
			//resize : {quality : 100},
			flash_swf_url : '/static/js/plupload/plupload.flash.swf',
			silverlight_xap_url : '/static/js/plupload/plupload.silverlight.xap',
			filters : [
				{title : "Image files", extensions : "jpg,gif,png,jpeg"}
			]
		});

		uploader[n].bind('Error', function(up, files) {
			if (files.code=='-601'){
				$('#'+n+'_tip').addClass("c_red");
				$('#'+n+'_tip').html("格式不合法，请选择合法的图片");
			}
		});
		uploader[n].bind('FilesAdded', function(up, files) {
			if (files.length>1){
				uploader[n].removeFile(files);
				uploader[n].refresh();
				return;
			}
			setTimeout(function () { up.start(); }, 100);
		});
		uploader[n].bind('FileUploaded', function(up, files,info) {
			if(info.response=='uploadError'){
				$('#'+n+'_tip').addClass("c_red");
				$('#'+n+'_tip').html("移动文件失败");
			}else if(info.response=='createFileError'){
				$('#'+n+'_tip').addClass("c_red");
				$('#'+n+'_tip').html("目录创建失败");
			}else if(info.response=='typeError'){
				$('#'+n+'_tip').addClass("c_red");
				$('#'+n+'_tip').html("请上传合法的图片类型");
			}if (info.response =='error'){
				$('#'+n+'_tip').addClass("c_red");
				$('#'+n+'_tip').html("参数出错，请刷新后重试");
			}else{
				//$('#'+n+'_show').attr('src','https://s1.51cto.com/'+info.response);
				//$('#'+n+'_show').show();
				$('#'+n).val(info.response);
				$('#'+n+'_tip').removeClass("c_red");
				$('#'+n+'_tip').html('上传成功');
			}
		});
		uploader[n].bind('UploadProgress', function(up, file) {});
		uploader[n].init();
		/** 上传图片 end **/
	});

	var getLength = function (strTemp) {
		var i,sum;
		sum=0;
		for(i=0;i<strTemp.length;i++) { 
		  if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255)) {
			sum=sum+1;
		  }else {
			sum=sum+2;
		  }
		}
		return sum;
	}
	
	//提交表单
	submitFeedbackForm	=	function(){
		//检查是否还有文件正在上传中
		for(var i in uploader){
			if(uploader[i].state != 1){
				new AutoBox({
					content:'您的图片还在上传中，请稍后提交',
					img:'remind',
					mask:true,
					autoClose:2
				})
				return false;
			}
		}
		var proType	=	$('input[name="proType"]:checked').val();
		if(!proType){
			new AutoBox({
				content:'请选择您要提交的问题类型',
				img:'remind',
				mask:true,
				autoClose:2
			})
			return false;
		}
		
		var istrue	=	true;
		var contents	=	'';
		if(proType == '1'){
			$('.imgUpload').each(function(i,v){
				var img = 	$(v);
				var	na	=	img.attr('name');
				if(img.val() == ''){
					$('#'+na+'_tip').addClass("c_red");
					$('#'+na+'_tip').html('请上传相关截图');
					istrue	=	false;
				}
			})
			if($('#describe_1').val() == ''){
				$('#describe_1_tip').html('请输入您的问题简要描述');
				istrue	=	false;
			}
			
			var videoUrl = $('#videoUrl').val();
			if(videoUrl == ''){
				$('#videoUrl_tip').html('请输入您的问题视频地址');
				istrue	=	false;
			}else if(!urltest.test(videoUrl)&&!urltest1.test(videoUrl)){
				$('#videoUrl_tip').html('播放视频的地址不正确');
				istrue	=	false;
			}
			if($('#operators').val() == ''){
				$('#operators_tip').html('请输入您的网络运营商名称');
				istrue	=	false;
			}
			contents	=	$('#describe_1').val();
		}else{
			if($('#describe_0').val() == ''){
				$('#describe_0_tip').html('请输入建议、意见、问题');
				istrue	=	false;
			}
			contents	=	$('#describe_0').val();
		}
		
		if(proType != '5'){
			var phoneval =	$('#phone').val();
			if(phoneval == ''){
				$('#phone_tip').html('请输入您的手机号');
				istrue	=	false;
			}	
			
			if($('#area').val() == ''){
				$('#area_tip').html('请输入您的地区');
				istrue	=	false;
			}
			var qqval =	$('#qq').val();
			if(qqval == ''){
				$('#qq_tip').html('请输入您的QQ');
				istrue	=	false;
			}else if(!qqtest.test(qqval)){
				$('#qq_tip').html('输入正确的QQ');
				istrue	=	false;
			}
			/*
			 var chickMail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			 var mail	=	$('#email').val();
			 if(mail == ''){
				$('#email_tip').html('请输入您的邮箱');
				istrue	=	false;
			 }else if(!chickMail.test(mail)){
				$('#email_tip').html('邮箱格式不正确');
				istrue	=	false;
			}
			*/
			//	else if(getLength(contents)<14){
			//		var tmp = ( proType == 1 ) ? '1' : '0';
			//		$('#describe_'+tmp+'_tip').html('内容少于14个字符！一个汉字为2个字符');
			//		istrue	=	false;
			//	}
		}
		
		if(istrue){
			$('#feedBackForm').submit();
		}else{
			//$('#feedBackForm').submit();
			return false;
		}
	}
	
	//清除错误和提示信息
	$('input,textarea').blur(function(){
		var inputname	=	$(this).attr('name');
		if($(this).val() != ''){
			$('#'+inputname+'_tip').html('');
		}
		
		if(inputname == 'describe_1'){
			if($(this).val() == '' || $(this).val() == '描述中必须包括播放视频问题出现时间，使用的浏览器、浏览器版本。' ){
				$(this).attr('class','area410 c_c8');
				$(this).val('描述中必须包括播放视频问题出现时间，使用的浏览器、浏览器版本。');
			}else{
				$(this).attr('class','area410 c_ae');
			}
		}
		if(inputname == 'operators'){
			if($(this).val() == '' || $(this).val() == '电信、联通等等' ){
				$(this).attr('class','inp148 c_c8');
				$(this).val('电信、联通等等');
			}else{
				$(this).attr('class','inp148 c_ae');
			}
		}
		
		if(inputname == 'qq'){
			var qqval = $(this).val();
			if(qqval == ''){
				$('#qq_tip').html('请输入您的QQ');
				istrue	=	false;
			}else if(!qqtest.test(qqval)){
				$('#qq_tip').html('输入正确的QQ');
				istrue	=	false;
			}			
		}
	})
	$('#operators').focus(function(){
		$(this).attr('class','inp148 c_ae');
		if($(this).val() == '电信、联通等等'){
			$(this).val('');
		}
	})
	$('#describe_1').focus(function(){
		$(this).attr('class','area410 c_ae');
		if($(this).val() == '描述中必须包括播放视频问题出现时间，使用的浏览器、浏览器版本。'){
			$(this).val('');
		}
	})
	
	//视频地址检测
	$('#videoUrl').blur(function(){
		var videoUrl = $('#videoUrl').val();
		if(videoUrl == ''){
			$('#videoUrl_tip').html('请输入您的问题视频地址');
			return false;
		}else if(!urltest.test(videoUrl)&&!urltest1.test(videoUrl)){
			$('#videoUrl_tip').html('播放视频的地址与示例不符');
			return false;
		}
		var lid	=	videoUrl.replace(urltest,'$1').length>7?videoUrl.replace(urltest1,'$1'):videoUrl.replace(urltest,'$1');
		if(lid > 0){
			$.get('/index.php?do=user&m=vorvideo&lid='+lid,function(data){
				$('.videoorv1').html(data);
			})
		}else{
			$('#videoUrl_tip').html('播放视频的地址不正确');
		}
	})

	var url = window.location.toString();
		url = url.split('#')[1];
	var Mid = typeof(url) == 'undefined' ? undefined : url.split('_')[1];
    if (typeof(Mid) != 'undefined'){
    	checkProTypeDiv(Mid);
    	$("input:radio[value="+Mid+"]").attr('checked','true');
    }
})(jQuery)
</script>
		<div class="Footer">
			<div class="Page">
				<table class="QRcode tc">
					<caption>
						<a href="<%=basePath %>courselistservlet?order=list" title="IT课堂"><img
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
						<a href="<%=basePath%>courselistservlet?order=guanyu"
							target="_blank">关于我们</a>
						<span>|</span>
						<a href="<%=basePath%>courselistservlet?order=help"
							target="_blank">帮助中心</a>
						<span>|</span>
						<a href="<%=basePath%>courselistservlet?order=fankui1"
							target="_blank">意见反馈</a>
						<span>|</span>
						<a href="<%=basePath%>courselistservlet?order=lianxi"
							target="_blank" title="联系我们">联系我们</a>
						<span>|</span>
						<a href="javascript:void(0);"
							target="_blank">课程登记</a>
						<span>|</span>
						<a href="javascript:void(0);"
							target="_blank">学员故事</a>
						<span>|</span>
						<a href="javascript:void(0);"
							target="_blank" title="学员交流">学员交流</a>
					</div>
					<p class="Call fl red">
						176-0797-5702
					</p>
					<p class="fl callTime">
						09:00 - 19:00
					</p>
					<div class="clear"></div>
					<p class="copy">
						Copyright &copy; 2017-2027
						<a href="<%=basePath %>courselistservlet?order=list" target="_blank">IT课堂.com</a>
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
					目前PC端暂不支持下载课程视频，请手机或者平板电脑下载“51CTO学院”APP后再下载视频哦！
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
		<script type="text/javascript">
    		var sessionid = "jje0hpk4aae4b5be7lpantjdd6",
            ip = "182.97.50.89",
            user_id = "0",
            source = 0;
		</script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/md5.js"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/tract_public.js?v=10.21"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/pv_tract.js?v=2016092803"></script>
		<span style="display: none;"> <script
			src="https://logs.51cto.com/rizhi/count/count.js"></script> </span>
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
