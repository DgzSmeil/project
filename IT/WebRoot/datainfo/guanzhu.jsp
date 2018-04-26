<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.StudentBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!doctype html>
<html lang="en-US">
	<head>
		<%
		StudentBean studentBean = (StudentBean)session.getAttribute("bean");
		int num = Integer.parseInt(session.getAttribute("num").toString());
		float money = Float.parseFloat(session.getAttribute("mm").toString());
	%>
		<meta charset="UTF-8">
		<meta name="csrf-param" content="_csrf">
		<meta name="csrf-token"
			content="a0x3MUNHVHE7OT5yBzM7Ezp7IXZ1H2ElLSFGQhR.AS4ENDtCGxZjPw==">
		<title><%=studentBean.getStudentname() %>的个人主页-IT课堂</title>
		<%@ include file="/facefile.jsp"%>
	</head>
	<!--简导航开始-->
	<body>
		<div class="Fheader">
			<div class="center clearfix">
				<div class="Fheader_l left clearfix" style="width: 610px;">
					<ul class="clearfix">
						<li>
							<a href="<%=basePath%>courselistservlet?order=list">IT课堂</a><b
								class="line"></b>
						</li>
						<li>
							<a href="http://www.51cto.com/col/35/" target="_blank">技术频道<em
								class="pub_icon"></em> </a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a href="http://network.51cto.com" target="_blank">组网</a>
								</dd>
								<dd>
									<a href="http://netsecurity.51cto.com" target="_blank">安全</a>
								</dd>
								<dd>
									<a href="http://developer.51cto.com" target="_blank">开发</a>
								</dd>
								<dd>
									<a href="http://database.51cto.com" target="_blank">数据库</a>
								</dd>
								<dd>
									<a href="http://server.51cto.com" target="_blank">服务器</a>
								</dd>
								<dd>
									<a href="http://os.51cto.com" target="_blank">系统</a>
								</dd>
								<dd>
									<a href="http://virtual.51cto.com" target="_blank">虚拟化</a>
								</dd>
								<dd>
									<a href="http://cloud.51cto.com" target="_blank">云计算</a>
								</dd>
								<dd>
									<a href="http://developer.51cto.com/embed/" target="_blank">嵌入式</a>
								</dd>
								<dd>
									<a href="http://mobile.51cto.com/" target="_blank">移动开发</a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="http://www.51cto.com">IT课堂旗下网站<em class="pub_icon"></em>
							</a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a title="中国领先的IT技术网站" href="http://www.51cto.com"
										target="_blank">IT课堂.COM</a>
								</dd>
								<dd>
									<a title="中国首个专门服务于CIO的专业网站" href="http://www.cioage.com"
										target="_blank">CIOage.com</a>
								</dd>
								<dd>
									<a title="领先的中文存储网络媒体" href="http://www.watchstor.com/"
										target="_blank">WatchStor.com</a>
								</dd>
								<dd>
									<a title="中国首家专注于数字医疗及医疗信息化的专业网站" href="http://www.hc3i.cn/"
										target="_blank">HC3i.cn</a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="http://edu.51cto.com?jydh" style="color: red">IT课堂<em
								class="pub_icon"></em> </a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a title="视频课程"
										href="http://edu.51cto.com/course/courseList/id-all.html?jydh"
										target="_blank">视频课程</a>
								</dd>
								<dd>
									<a title="微职位培训" href="http://edu.51cto.com/px/?jydh"
										target="_blank">微职位培训</a>
								</dd>
								<dd>
									<a title="APP下载"
										href="http://edu.51cto.com/activity/lists/id-10.html?jydh"
										target="_blank">APP下载</a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="#">线下学习<em class="pub_icon"></em> </a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a title="WOT峰会" href="http://wot.51cto.com/?home"
										target="_blank">WOT峰会</a>
								</dd>
								<dd>
									<a title="CTO训练营" href="http://x.51cto.com/?home"
										target="_blank">CTO训练营</a>
								</dd>
								<dd>
									<a title="百城沙龙" href="http://wot.51cto.com/act/bcsl/info?home"
										target="_blank">百城沙龙</a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="http://www.51cto.com/about/map.htm" target="_blank">地图</a>
						</li>
					</ul>
				</div>
				<div style="width: 590px;" class="Fheader_r right clearfix"
					id="login_status">
					<ul class="clearfix">

						<li>
							<a href="/space?uid=12569085" style="padding-right: 0;"><strong
								class="usericon"><img
										src="<%=basePath %><%=studentBean.getStudentface()%>"
										alt="头像" /> </strong><%=studentBean.getStudentmobile()%> </a><a
								href="http://home.51cto.com/members/in-fo?home"
								style="position: relative;"><span class="jsVipDrop">
								<c:if test="<%=studentBean.getVIP()!=1 %>">
									<img src="<%=basePath %>images/vip_grey2.png" style="float: left; margin-top: 8px">
								</c:if>
								<c:if test="<%=studentBean.getVIP()==1 %>">
									<img src="<%=basePath %>images/vipred.png" style="float: left; margin-top: 8px;width:20px;height:20px;border-radius:50%">
								</c:if>
									<div id="vip_mes_top"
										style="display: none; position: absolute; right: -37px; top: 29px; width: 137px; z-index: 99;">
										<div
											style="background: #faf7e6 none repeat scroll 0 0; border: 1px solid #ecb7a5; color: #666; font-size: 12px; padding: 3px 5px; position: relative;">
											<span
												style="background: rgba(0, 0, 0, 0) url(https://static5.51cto.com/home/web/images/hidearro.png) no-repeat scroll center center; display: inline-block; height: 7px; position: absolute; right: 57px; top: -6px; width: 12px;"></span>
											<div style="color: #f60; text-align: center;">
												一个会员，全站特权
											</div>
										</div>
									</div> </span> </a>
							<script src="https://static5.51cto.com/home/web/js/vip_top.js"></script>
						</li>
						<li>
							<a href="javascript:void(0)">消息<strong
								class="mesdot mesdot_first"></strong><em class="pub_icon"></em>
							</a>
							<dl class="hidchannel">
								<dd>
									<a href="/msg/notify" class="position_r">通知 <strong
										class="mesdot"></strong> </a>
								</dd>
								<dd>
									<a href="/msg/inbox" class="position_r">私信 </a>
								</dd>
								<dd>
									<a href="/msg/recommend" class="position_r">活动 <strong
										class="mesdot"></strong> </a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="/index/logout">退出</a>
						</li>
						<li>

							<a>社区<em class="pub_icon"></em> </a>
							<dl class="hidchannel">
								<dd>
									<a target="_blank" href="http://home.51cto.com">家园</a>
								</dd>
								<dd>
									<a target="_blank" href="http://blog.51cto.com">博客</a>
								</dd>
								<dd>
									<a target="_blank" href="http://bbs.51cto.com">论坛</a>
								</dd>
								<dd>
									<a target="_blank" href="http://down.51cto.com">下载</a>
								</dd>
								<dd>
									<a target="_blank" href="http://edu.51cto.com">学院</a>
								</dd>
								<dd>
									<a target="_blank" href="http://gaozhao.51cto.com">招聘</a>
								</dd>
								<dd>
									<a target="_blank" href="http://t.51cto.com">题库</a>
								</dd>
								<dd>
									<a target="_blank" href="http://blog.51cto.com/newsletter">周刊</a>
								</dd>
								<dd>
									<a target="_blank" href="http://book.51cto.com">读书</a>
								</dd>
								<dd>
									<a target="_blank" href="http://doctor.51cto.com">门诊</a>
								</dd>
								<dd>
									<a target="_blank" href="http://selftest.51cto.com">自测</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--简导航结束-->
		<!--导航开始-->
		<div class="Fnav">
			<div class="center clearfix">
				<div class="Fnav_l left">
					<dl class="clearfix">
						<dt>
							<a href="/home"><img src="<%=basePath%>image/itlogo.png"
									width="119" height="37" alt="家园" /> </a>
						</dt>
						<dd class="">
							<a
								href="<%=basePath%>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile()%>">首页</a>
						</dd>
						<dd class="curr">
							<a href="/space?uid=12569085">个人主页</a>
						</dd>
						<dd class="">
							<a href="/msg/notify" class="position_r">消息中心<b
								class="dot position_a"></b> </a>
						</dd>
						<dd class="">
							<a target="_blank"
								href="<%=basePath%>studentservlet?order=zhifucenter&username=<%=studentBean.getStudentname()%>">充值中心</a>
						<dd class="">
							<a style="position: relative;" target="_blank"
								href="<%=basePath%>huiyuanservlet?order=list">会员中心<img
									width="41" height="39"
									style="position: absolute; bottom: 10px;" alt=""
									src="https://static5.51cto.com/home/web/images/vip.png">
							</a>
						</dd>
					</dl>
				</div>
				<div class="Fnav_r right">
					<ul class="clearfix">
						<li class="exit_help left">
							<a href="http://51ctohome.blog.51cto.com/all/1805422/3"
								target="_blank"><b></b>帮助</a>
						</li>
						<li class="exit_set left">
							<a href="javascript:void(0)"><b></b>设置<em class="arro_down"></em>
							</a>
							<span class="arro position_a"></span>
							<ul class="hideset position_a">
								<li>
									<a href="/info">个人资料</a>
								</li>
								<li>
									<a href="/info/set-mobile">账号设置</a>
								</li>
								<li>
									<a href="/info/basic-screen">隐私设置</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--导航结束-->
		<!--导航结束-->
		<!--主体开始-->
		<div class="main mb20">
			<div class="center clearfix">
				<div class="mainindex_l left">

					<div class="memdatabox clearfix white_box mb20" id="Editor_num">
						<div class="portbox left">
							<div class="mb10">
								<table width="100%">
									<tr>
										<td height="100">
											<img onload="proDownImage(this,200,100);"
												src="<%=basePath%><%=studentBean.getStudentface()%>"
												alt="<%=studentBean.getStudentname()%>"
												style="width: 120px; height: 120px; margin: 3px auto; border-radius: 50%" />
										</td>
									</tr>
								</table>
							</div>
							<div class="datas clearfix">
								<div class="num left tc">
									<a href="/user-follow-fans/fans?uid=12569085"><span>100</span>
										<br /> <strong>粉丝</strong> </a>
								</div>
								<div class="line left"></div>
								<div class="num right tc">
									<a href="/user-follow-fans/follow?uid=12569085"><span>100</span>
										<br /> <strong>关注</strong> </a>
								</div>
							</div>
						</div>
						<div class="port_m_box left  ml20">
							<div class="name">
								<a href="/space?uid=12569085" class="left"><%=studentBean.getStudentmobile()%></a>
								<a target="_blank" href="<%=basePath %>myinfoservlet?order=info" target=""><span
									class="ON_editor pl20" id="ON_editor"><b class="mr5"></b>编辑</span>
								</a>
							</div>
							<div class="my_messages">
								<span class="Mes_num">当前名称：<b><%=studentBean.getStudentname() %></b>
								</span>
								<c:if test="<%=studentBean.getStudentsex()==0%>">
									<span class="Mes_num">性别：<b>男</b>
									</span>
								</c:if>
								<c:if test="<%=studentBean.getStudentsex()==1%>">
									<span class="Mes_num">性别：<b>女</b>
									</span>
								</c:if>
							</div>
							<div class="my_messages">
								<span class="Mes_num">现居城市：<b><%=studentBean.getStudenthomeaddress() %></b>
								</span>
								<c:if test="<%=studentBean.getLeibie()!=0 %>">
									<span class="Mes_num">所属类别：<b>学生</b>
									</span>
								</c:if>
								<c:if test="<%=studentBean.getLeibie()==0 %>">
									<span class="Mes_num">所属类别：<b>讲师</b>
									</span>
								</c:if>
							</div>
							<div class="my_messages">
								<span class="Mes_num">邮箱地址：<b><%=studentBean.getStudentemail() %> &nbsp;</b>
								</span>
								<span class="Mes_num">注册日期：<b><%=studentBean.getStudentregisterdate() %> &nbsp;</b>
								</span>
							</div>

							<div class="my_messages">
								<span class="Mes_num">专业技能： <b>其他Web开发</b> </span>
							</div>
							<div class="my_title" id="jsUserHonor">

							</div>
						</div>
						<ul class="my_assets position_a clearfix">
							<li>
								<a href="/info/credit" target="_blank"><strong>10</strong><span>无忧币</span>
								</a>
							</li>
							<li>
								<a href="http://down.51cto.com/credits" target="_blank"><strong>5</strong><span>下载豆</span>
								</a>
							</li>
							<li class="last">
								<c:if test="<%=studentBean.getLeibie()==0 %>">
									<a href="http://edu.51cto.com/user" target="_blank"><strong><%=money %></strong><span>收入</span></a>
								</c:if>
								<c:if test="<%=studentBean.getLeibie()!=0 %>">
									<a href="http://edu.51cto.com/user" target="_blank"><strong><%=money %></strong><span>余额</span></a>
								</c:if>
							</li>
						</ul>
					</div>
					<!--用户发送私信-->
					<div style="display: none" class="jsFansSendMsg">
						<dl class="dl_340 pl20 mb10 clearfix">
							<dt class="left mt5">
								主题：
							</dt>
							<dd class="left validation_or">
								<span><input name="title" type="text"
										class="pop_input_290 inputtext_del t14" placeholder="最多输入30个字" /><span
									class="cl_red jsTitleError"></span> </span>
							</dd>
						</dl>
						<dl class="dl_340 pl20 mb10 clearfix">
							<dt class="left mt5">
								内容：
							</dt>
							<dd class="left validation_or">
								<span><textarea name="content" cols="" rows=""
										class="pop_area_290 inputtext_del t14" placeholder="最多输入500个字"></textarea><span
									class="cl_red jsContentError"></span> </span>
							</dd>
						</dl>
					</div>

					<div class="index_tabbox">
						<div class="tab_sub white_box">
							<ul class="clearfix">
								<li class="">
									<a href="<%=basePath %>datainfo/myface.jsp">我的动态</a>
								</li>
								<li  class="cur_tab">
									<a href="<%=basePath%>datainfo/guanzhu.jsp">我的关注</a>
								</li>
								<li class="">
									<a href="<%=basePath%>datainfo/renmai.jsp">我的人脉</a>
								</li>
								<li class="">
									<a href="<%=basePath %>datainfo/shoucang.jsp">我的收藏</a>
								</li>
								<li class="">
									<a href="<%=basePath%>datainfo/dingyue.jsp">我的订阅</a>
								</li>
								<!---->
							</ul>
						</div>
						<input type="hidden" name="uid" id="jsUserId" value="12539927">

						<div class="tab_conbox">
							<!--我的动态开始-->
							<div class="tab_con">
								<div class="white_box">
									<div class="tabin_screen">
										<ul class="clearfix">
											<li class="">
												<a href="/space/feed?uid=12539927">全部</a>
											</li>
											<li class="scr_cur">
												<a href="/space/feed?type=4&uid=12539927">博客</a>
											</li>
											<li class="">
												<a href="/space/feed?type=19&uid=12539927">下载</a>
											</li>
											<li class="">
												<a href="/space/feed?type=18&uid=12539927">论坛</a>
											</li>
											<li class="">
												<a href="/space/feed?type=28&uid=12539927">高招</a>
											</li>
											<li class="">
												<a href="/space/feed?type=30&uid=12539927">学院</a>
											</li>
											<li class="">
												<a href="/space/feed?type=23&uid=12539927">收藏</a>
											</li>
											<li class="">
												<a href="/space/feed?type=other&uid=12539927">其他</a>
											</li>
										</ul>
									</div>
									<!--我的关注-无关注开始-->

									<div class="tab_con">
										<div class="white_box">
											<div class="pt30 pb30 tc">
												<span class="t18">您还没有添加关注，请添加</span>
											</div>
											<div class="Ftitle_all  Ftitle_all_lf">
												<span class="titxet t18">人气推荐</span>
											</div>


											<div class="ctcdatabox ctcdatabox_rqtj clearfix pb20">
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=1805422"><img
																src="https://ucenter.51cto.com/avatar.php?uid=1805422&size=middle&random=576915"
																alt="51cto家园" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=1805422"
																title="51cto家园">51cto家园..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=1805422" class="pl5">195402</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=1805422" class="pl5">198458</a>
														</div>
														<div class="num_3">
															关注技能：项目管理 互联网运营 社区运营 企业管理 Android Unity3D Cocos2d-x
															其他移动开发
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(1805422)"
																class="Focus_add_btn right jsUserRelationFollow_1805422"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=10590028"><img
																src="https://ucenter.51cto.com/avatar.php?uid=10590028&size=middle&random=294850"
																alt="51CTO高招" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=10590028"
																title="51CTO高招">51CTO高招..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=10590028" class="pl5">48</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=10590028" class="pl5">144767</a>
														</div>
														<div class="num_3">
															关注技能：网络 PHP
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(10590028)"
																class="Focus_add_btn right jsUserRelationFollow_10590028"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=1083"><img
																src="https://ucenter.51cto.com/avatar.php?uid=1083&size=middle&random=841955"
																alt="小王" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=1083" title="小王">小王..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank" href="/user-follow-fans/fans?uid=1083"
																class="pl5">22833</a><span class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=1083" class="pl5">25833</a>
														</div>
														<div class="num_3">
															关注技能：黑客攻防 安全 综合布线 H3C 网络 网络监控 系统集成 硬件维护 华为技术
														</div>
														<div class="num_2">
															<div class="my_title">
																<a href="#"><b class="titon_tjian_h"></b>推荐博客</a>
															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(1083)"
																class="Focus_add_btn right jsUserRelationFollow_1083"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=940717"><img
																src="https://ucenter.51cto.com/avatar.php?uid=940717&size=middle&random=242257"
																alt="孙空空" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=940717" title="孙空空">孙空空..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=940717" class="pl5">22694</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=940717" class="pl5">25454</a>
														</div>
														<div class="num_3">
															关注技能：网络 黑客攻防 Linux F# C/C++ OA CCNA
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(940717)"
																class="Focus_add_btn right jsUserRelationFollow_940717"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=2031512"><img
																src="https://ucenter.51cto.com/avatar.php?uid=2031512&size=middle&random=582620"
																alt="大黄蜂ET" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=2031512"
																title="大黄蜂ET">大黄蜂ET..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=2031512" class="pl5">13535</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=2031512" class="pl5">15434</a>
														</div>
														<div class="num_3">
															关注技能：Java PHP .Net Web开发 Ajax j2ee CSS C#
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(2031512)"
																class="Focus_add_btn right jsUserRelationFollow_2031512"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=2379781"><img
																src="https://ucenter.51cto.com/avatar.php?uid=2379781&size=middle&random=624254"
																alt="nicedebo" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=2379781"
																title="nicedebo">nicedebo..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=2379781" class="pl5">13251</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=2379781" class="pl5">14272</a>
														</div>
														<div class="num_3">
															关注技能：云计算 AIX Unix 服务器
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(2379781)"
																class="Focus_add_btn right jsUserRelationFollow_2379781"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=1403416"><img
																src="https://ucenter.51cto.com/avatar.php?uid=1403416&size=middle&random=123519"
																alt="wxz5259217" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=1403416"
																title="wxz5259217">wxz525921..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=1403416" class="pl5">9232</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=1403416" class="pl5">9802</a>
														</div>
														<div class="num_3">
															关注技能：移动领域 Android
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(1403416)"
																class="Focus_add_btn right jsUserRelationFollow_1403416"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=204019"><img
																src="https://ucenter.51cto.com/avatar.php?uid=204019&size=middle&random=100945"
																alt="mnbv01" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=204019"
																title="mnbv01">mnbv01..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=204019" class="pl5">8748</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=204019" class="pl5">9385</a>
														</div>
														<div class="num_3">
															关注技能：黑客攻防 华为技术 硬件维护
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(204019)"
																class="Focus_add_btn right jsUserRelationFollow_204019"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=204681"><img
																src="https://ucenter.51cto.com/avatar.php?uid=204681&size=middle&random=925749"
																alt="hyy1988" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=204681"
																title="hyy1988">hyy1988..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=204681" class="pl5">9453</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=204681" class="pl5">9906</a>
														</div>
														<div class="num_3">
															关注技能：安全 企业管理 电子商务 项目管理 ERP 互联网运营
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(204681)"
																class="Focus_add_btn right jsUserRelationFollow_204681"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
												<div class="contacts left">
													<div class="tx left">
														<a target="_blank" class="position_r"
															href="/space?uid=2009376"><img
																src="https://ucenter.51cto.com/avatar.php?uid=2009376&size=middle&random=271774"
																alt="有钱没钱" class="ajax_layimg" /> </a>
													</div>
													<div class="ctcnumbox left position_r">
														<div class="num_1 pb10">
															<a target="_blank" href="/space?uid=2009376" title="有钱没钱">有钱没钱..</a>
														</div>
														<div class="num_2">
															关注:
															<a target="_blank"
																href="/user-follow-fans/fans?uid=2009376" class="pl5">9659</a><span
																class="pl10 pr10">|</span>粉丝:
															<a target="_blank"
																href="/user-follow-fans/follow?uid=2009376" class="pl5">10117</a>
														</div>
														<div class="num_3">
															关注技能：网络 安全 企业管理 电子商务 项目管理
														</div>
														<div class="num_2">
															<div class="my_title">

															</div>
														</div>
														<div class="fx_btns position_a clearfix">
															<!-- <span class="Dir_mes_btn right ml10 jsAddUserMsg" data-uid="" data-username = ""><b class="icon_mes left mr5"></b><em class="fs_n">发私信</em></span>-->

															<!--下面注释的两个按钮为点击过后的两种状态-->
															<span onclick="return addUserFollow(2009376)"
																class="Focus_add_btn right jsUserRelationFollow_2009376"><b
																class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!--我的关注结束-->

								</div>
								<input type="hidden" name="page" id="jsCurrentPage" value=1 />
								<input type="hidden" name="count" id="jsFeedType"
									value="userfollow">
								<input type="hidden" name="appType" id="jsAppType" value="4">
								<input type="hidden" name="uid" id="jsUserId" value="12539927">
							</div>
							<!--我的动态结束-->

						</div>
					</div>
				</div>

				<div class="mainindex_r right">
					<!-- 我的个人中心入口 -->
					<div class="Operation white_box mb20">
						<ul class="clearfix">
							<li class="left">
								<a target="_blank"
									href="http://blog.51cto.com/user_index.php?action=addblog_new"
									class="bke">写博文</a>
							</li>
							<li class="left">
								<a target="_blank"
									href="http://bbs.51cto.com/post.php?action=newthread"
									class="ftie">发帖</a>
							</li>
							<li class="left">
								<a target="_blank" href="http://down.51cto.com/upload"
									class="sczl">上传资料</a>
							</li>
							<li class="last left">
								<a target="_blank"
									href="http://edu.51cto.com/?edu_recommend_adid=214" class="edu">学课程</a>
							</li>
						</ul>
					</div>
					<!-- 我的资料完成度 -->
					<div class="white_box p20 mb20">
						<div class="data_Account pb20">
							<p class="pb10">
								个人资料完成度
								<em>22%</em>
							</p>
							<div class="Account">
								<span style="width: 22%;" class="Account_cur"></span>
							</div>

						</div>
						<div class="more" id="wsjlmy">
							<a href="/info">完善资料有奖励>></a>
						</div>


						<div class="hide_jltext position_a">
							<div class="jltext">
								完善资料40%获得5个无忧币；
								<br />
								完善资料80%奖励 5个下载豆；
								<br />
								完善全部资料奖励10个下载豆。
							</div>
						</div>

					</div>
					<!-- 我的快捷入口 -->
					<div class="white_box mb20 p20">
						<div class="my_blank" id="my_blank">
							<ul class="clearfix">
								<li class="left">
									<a target="_blank"
										href="http://blog.51cto.com/blog.php?uid=12539927&jump=1"><span
										class="icon_bke"></span>我的博客</a>
								</li>
								<li class="left">
									<a target="_blank" href="/bbs/get-user-threads?uid=12539927"><span
										class="icon_ltan"></span>我的论坛</a>
								</li>
								<li class="left">
									<a target="_blank" href="http://down.51cto.com/12539927/down"><span
										class="icon_xzai"></span>我的下载</a>
								</li>
								<li class="left">
									<a target="_blank"
										href="http://edu.51cto.com/user/user_id-12539927"><span
										class="icon_xyuan"></span>我的学院</a>
								</li>
								<li class="left bdnone">
									<a target="_blank"
										href="http://gaozhao.51cto.com/job/my-job-list"><span
										class="icon_zwei"></span>我的职位</a>
								</li>
								<li class="left bdnone">
									<a target="_blank" href="http://bbs.51cto.com/medal"><span
										class="icon_xzhang"></span>我的勋章</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 猜你喜欢 -->
					<div class="mrfixboxall">
						<div class="white_box mb20 p20 pt0">
							<div class="Ftitle_all">
								<span class="changenum right"> <a href="javascript:;"
									onclick="getUserGuess()"><b></b>换一批</a> </span>
								<span class="titxet t18">猜你喜欢</span>
							</div>
							<div id="jsYourslovebox" class="yourslovebox">
								<div class="yourslove mt20 clearfix">
									<div class="yourslove_l left mr5 position_r">
										<a class="future_img tips" rel="/user/user-info?uid=23357"
											href="/space?uid=23357"><img
												src="https://ucenter.51cto.com/avatar.php?uid=23357&size=small&random=192061"
												class="ajax_layimg" alt="小侠唐在飞" /> </a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="/space?uid=23357">小侠唐在飞</a>
										</div>
										<p>
											关注技术：项目管理 Windows Linux 网络管理 路由交换 系统集成 自动化运维 安全技术
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_23357"
											onclick="return addUserFollow(23357)"><b
											class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em> </span>
									</div>

								</div>
								<div class="yourslove mt20 clearfix">
									<div class="yourslove_l left mr5 position_r">
										<a class="future_img tips" rel="/user/user-info?uid=1638364"
											href="/space?uid=1638364"><img
												src="https://ucenter.51cto.com/avatar.php?uid=1638364&size=small&random=881526"
												class="ajax_layimg" alt="入围IT" /> </a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="/space?uid=1638364">入围IT</a>
										</div>
										<p>
											关注技术：
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_1638364"
											onclick="return addUserFollow(1638364)"><b
											class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em> </span>
									</div>

								</div>
								<div class="yourslove mt20 clearfix">
									<div class="yourslove_l left mr5 position_r">
										<a class="future_img tips" rel="/user/user-info?uid=192876"
											href="/space?uid=192876"><img
												src="https://ucenter.51cto.com/avatar.php?uid=192876&size=small&random=313756"
												class="ajax_layimg" alt="独钩寒江雪" /> </a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="/space?uid=192876">独钩寒江雪</a>
										</div>
										<p>
											关注技术：思科技术 华为技术 路由交换 思科认证 CCNP 华为认证 安全技术 网络管理
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_192876"
											onclick="return addUserFollow(192876)"><b
											class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em> </span>
									</div>

								</div>

							</div>

						</div>
					</div>
				</div>
				<div class="jsEditFollowRemark" style="display: none">
					<div class="tl t12 mb15 pl20 validation_or">
						<span>备注名</span>
						<span class="pl10"> <input
								class="pop_input_140 t14 inputtext_del" type="text"
								name="remark"> <input type="hidden" name="followId">
						</span>
						<div>
							<span class="cl_red pl5" style="padding-left: 45px;"></span>
						</div>
					</div>
				</div>
			</div>
			<!--主体结束-->

			<!--底部开始-->
			<div class="Ffooter">
				<div class="center">
					<p>
						Copyright © 2005-2017 51CTO.COM 京ICP证060544号 版权所有 未经许可 请勿转载
					</p>
				</div>
			</div>
			<!--底部开始-->
			<div class="fixexit">
				<div class="infixexit">
					<div class="exit_list exit_list_fkui">
						<a href="javascript:void(0)" class="ina popyjdatilfeedback">改版反馈</a>
					</div>
					<div class="exit_list exit_list_zxun">
						<a
							href="http://wpa.qq.com/msgrd?v=3&uin=1922702647&site=qq&menu=yes"
							target="_blank" class="ina">在线咨询</a>
					</div>
					<div class="exit_list exit_list_back">
						<a href="#" class="ina">返回顶部</a>
					</div>
				</div>

			</div>
			<div class="fixexit_small">
				<div class="infixexit">
					<div class="exit_list exit_list_fkui popyjdatilfeedback">
						<a href="javascript:void(0)" class="ina">改版反馈</a>
					</div>
					<div class="exit_list exit_list_zxun">
						<a
							href="http://wpa.qq.com/msgrd?v=3&uin=1922702647&site=qq&menu=yes"
							target="_blank" class="ina"><img
								src="https://static4.51cto.com/home/web/images/fix_zxun.png" />
						</a>
					</div>
					<div class="exit_list exit_list_back">
						<a href="#" class="ina"><img
								src="https://static4.51cto.com/home/web/images/fix_back.png" />
						</a>
					</div>
				</div>

			</div>

			<!--意见反馈-->
			<div class="feedback" style="display: none">
				<div class="popyjdatil">
					<dl class="dl_400 pl20 mb10 clearfix">
						<dt class="left mt5 tr">
							意见或建议：
						</dt>
						<dd class="left validation_or">
							<span><textarea name="feedarea" cols="" rows=""
									class="pop_area_320 inputtext_del t12"
									placeholder="请详细描述意见、问题或建议，2-300字以内"></textarea><span
								class="cl_red" id="cl_redp"></span> </span>
						</dd>

					</dl>
					<dl class="dl_400 pl20 mb10 clearfix">
						<dt class="left mt5 tr">
							联系方式：
						</dt>
						<dd class="left validation_or">
							<span><input type="text" value="" placeholder="邮箱/QQ号"
									class="pop_input_320 inputtext_del t12" name="feedord"><span
								class="cl_red" id="c1_redb"></span> </span>
						</dd>

					</dl>
				</div>
			</div>
			<div class="feedbackstatus" style="display: none">
				<div class="popsuctext">
					您已提交成功！
					<br />
					感谢您的宝贵意见，我们会尽快处理
				</div>
				<div class="regemailloeslist" style="display: none">
					<div class="tl t14 mb15 pl20 emailstatus"></div>
				</div>
			</div>
			<script src="http://home.51cto.com/iframe/iframe-member-adv?home"></script>
			<div style="display: none">
				<iframe frameborder="0" scrolling="no" width="0" height="0"
					src="//log.51cto.com/pageview.php?frompos=www_art"></iframe>
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
				<script src="https://logs.51cto.com/rizhi/count/count.js"></script>
			</div>
	</body>
</html>
