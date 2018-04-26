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
		<meta name="csrf-token" content="a0x3MUNHVHE7OT5yBzM7Ezp7IXZ1H2ElLSFGQhR.AS4ENDtCGxZjPw==">
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
							<a href="javascript:void(0);" target="_blank">技术频道<em
								class="pub_icon"></em>
							</a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a href="javascript:void(0);" target="_blank">组网</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">安全</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">开发</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">数据库</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">服务器</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">系统</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">虚拟化</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">云计算</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">嵌入式</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" target="_blank">移动开发</a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="javascript:void(0);">IT课堂旗下网站<em class="pub_icon"></em>
							</a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a title="中国领先的IT技术网站" href="javascript:void(0);"
										target="_blank">IT课堂.COM</a>
								</dd>
								<dd>
									<a title="中国首个专门服务于CIO的专业网站" href="javascript:void(0);"
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
							<a href="javascript:void(0);" style="color: red">IT课堂<em
								class="pub_icon"></em>
							</a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a title="视频课程"
										href="javascript:void(0);"
										target="_blank">视频课程</a>
								</dd>
								<dd>
									<a title="微职位培训" href="javascript:void(0);"
										target="_blank">微职位培训</a>
								</dd>
								<dd>
									<a title="APP下载"
										href="javascript:void(0);"
										target="_blank">APP下载</a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="#">线下学习<em class="pub_icon"></em>
							</a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a title="WOT峰会" href="javascript:void(0);"
										target="_blank">WOT峰会</a>
								</dd>
								<dd>
									<a title="CTO训练营" href="javascript:void(0);"
										target="_blank">CTO训练营</a>
								</dd>
								<dd>
									<a title="百城沙龙" href="javascript:void(0);"
										target="_blank">百城沙龙</a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="javascript:void(0);" target="_blank">地图</a>
						</li>
					</ul>
				</div>
				<div style="width: 590px;" class="Fheader_r right clearfix"
					id="login_status">
					<ul class="clearfix">

						<li>
							<a href="javascript:void(0);" style="padding-right: 0;"><strong
								class="usericon"><img src="<%=basePath %><%=studentBean.getStudentface() %>" alt="头像" style="border-radius:50%"/>
							</strong><%=studentBean.getStudentmobile() %> </a><a
								href="javascript:void(0);"
								style="position: relative;"><span class="jsVipDrop">
								<c:if test="<%=studentBean.getVIP()!=1 %>">
									<img src="<%=basePath %>images/vip_grey2.png" style="float: left; margin-top: 8px">
								</c:if>
								<c:if test="<%=studentBean.getVIP()==1 %>">
									<img src="<%=basePath %>images/vipred.png" style="float: left; margin-top: 8px;width:20px;height:20px;border-radius:50%">
								</c:if>
									<div id="vip_mes_top" style="display: none; position: absolute; right: -37px; top: 29px; width: 137px; z-index: 99;">
										<div
											style="background: #faf7e6 none repeat scroll 0 0; border: 1px solid #ecb7a5; color: #666; font-size: 12px; padding: 3px 5px; position: relative;">
											<span
												style="background: rgba(0, 0, 0, 0) url(https://static5.51cto.com/home/web/images/hidearro.png) no-repeat scroll center center; display: inline-block; height: 7px; position: absolute; right: 57px; top: -6px; width: 12px;"></span>
											<div style="color: #f60; text-align: center;">
												一个会员，全站特权
											</div>
										</div>
									</div>
							</span>
							</a>
							<script src="https://static5.51cto.com/home/web/js/vip_top.js"></script>
						</li>
						<li>
							<a href="javascript:void(0)">消息<strong
								class="mesdot mesdot_first"></strong><em class="pub_icon"></em>
							</a>
							<dl class="hidchannel">
								<dd>
									<a href="javascript:void(0);" class="position_r">通知 <strong
										class="mesdot"></strong> </a>
								</dd>
								<dd>
									<a href="javascript:void(0);" class="position_r">私信 </a>
								</dd>
								<dd>
									<a href="javascript:void(0);" class="position_r">活动 <strong
										class="mesdot"></strong> </a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="<%=basePath %>loginservlet?order=exit">退出</a>
						</li>
						<li>

							<a>社区<em class="pub_icon"></em>
							</a>
							<dl class="hidchannel">
								<dd>
									<a target="_blank" href="javascript:void(0);">家园</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">博客</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">论坛</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">下载</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">学院</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">招聘</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">题库</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">周刊</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">读书</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">门诊</a>
								</dd>
								<dd>
									<a target="_blank" href="javascript:void(0);">自测</a>
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
							<a href="/home"><img
									src="<%=basePath %>image/itlogo.png"
									width="119" height="37" alt="家园" />
							</a>
						</dt>
						<dd class="">
							<a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>">首页</a>
						</dd>
						<dd class="curr">
							<a href="javascript:void(0);">个人主页</a>
						</dd>
						<dd class="">
							<a href="javascript:void(0);" class="position_r">消息中心<b
								class="dot position_a"></b>
							</a>
						</dd>
						<dd class="">
							<a target="_blank" href="<%=basePath %>studentservlet?order=zhifucenter&username=<%=studentBean.getStudentname() %>">充值中心</a>
						<dd class="">
							<a style="position: relative;" target="_blank"
								href="<%=basePath %>huiyuanservlet?order=list&n=m">会员中心<img
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
							<a href="javascript:void(0);"
								target="_blank"><b></b>帮助</a>
						</li>
						<li class="exit_set left">
							<a href="javascript:void(0)"><b></b>设置<em class="arro_down"></em>
							</a>
							<span class="arro position_a"></span>
							<ul class="hideset position_a">
								<li>
									<a href="javascript:void(0);">个人资料</a>
								</li>
								<li>
									<a href="javascript:void(0);">账号设置</a>
								</li>
								<li>
									<a href="javascript:void(0);">隐私设置</a>
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
													src="<%=basePath%><%=studentBean.getStudentface() %>"
													alt="<%=studentBean.getStudentname() %>" style="width:120px;height:120px;margin:3px auto;border-radius:50%" />
											</td>
										</tr>
									</table>
							</div>
							<div class="datas clearfix">
								<div class="num left tc">
									<a href="javascript:void(0);"><span>100</span>
									<br />
										<strong>粉丝</strong>
									</a>
								</div>
								<div class="line left"></div>
								<div class="num right tc">
									<a href="javascript:void(0);"><span>100</span>
									<br />
										<strong>关注</strong>
									</a>
								</div>
							</div>
						</div>
						<div class="port_m_box left  ml20">
							<div class="name">
								<a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" class="left"><%=studentBean.getStudentmobile() %></a>
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
									<span class="Mes_num">所属类别：<b>女</b>
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
								<a href="javascript:void(0);" target="_blank"><strong>10</strong><span>无忧币</span>
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" target="_blank"><strong>5</strong><span>下载豆</span>
								</a>
							</li>
							<li class="last">
								<c:if test="<%=studentBean.getLeibie()==0 %>">
									<a href="javascript:void(0);" target="_blank"><strong><%=money %></strong><span>收入</span></a>
								</c:if>
								<c:if test="<%=studentBean.getLeibie()!=0 %>">
									<a href="javascript:void(0);" target="_blank"><strong><%=money %></strong><span>余额</span></a>
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
									class="cl_red jsTitleError"></span>
								</span>
							</dd>
						</dl>
						<dl class="dl_340 pl20 mb10 clearfix">
							<dt class="left mt5">
								内容：
							</dt>
							<dd class="left validation_or">
								<span><textarea name="content" cols="" rows=""
										class="pop_area_290 inputtext_del t14" placeholder="最多输入500个字"></textarea><span
									class="cl_red jsContentError"></span>
								</span>
							</dd>
						</dl>
					</div>

					<div class="index_tabbox">
						<div class="tab_sub white_box">
							<ul class="clearfix">
								<li class="first cur_tab">
									<a href="javascript:void(0);">我的动态</a>
								</li>
								<li class="">
									<a href="<%=basePath %>datainfo/guanzhu.jsp">我的关注</a>
								</li>
								<li class="">
									<a href="<%=basePath %>datainfo/renmai.jsp">我的人脉</a>
								</li>
								<li class="">
									<a href="<%=basePath %>datainfo/shoucang.jsp">我的收藏</a>
								</li>
								<li class="">
									<a href="<%=basePath %>datainfo/dingyue.jsp">我的订阅</a>
								</li>
								<!---->
							</ul>
						</div>
						<input type="hidden" name="uid" id="jsUserId" value="12569085">

						<div class="tab_conbox">
							<!--我的动态开始-->
							<div class="tab_con">
								<div class="white_box">
									<div class="tabin_screen">
										<ul class="clearfix">
											<li class="scr_cur">
												<a href="javascript:void(0);">全部</a>
											</li>
											<li class="">
												<a href="javascript:void(0);">博客</a>
											</li>
											<li class="">
												<a href="javascript:void(0);">下载</a>
											</li>
											<li class="">
												<a href="javascript:void(0);">论坛</a>
											</li>
											<li class="">
												<a href="javascript:void(0);">高招</a>
											</li>
											<li class="">
												<a href="javascript:void(0);">学院</a>
											</li>
											<li class="">
												<a href="javascript:void(0);">收藏</a>
											</li>
											<li class="">
												<a href="javascript:void(0);">其他</a>
											</li>
										</ul>
									</div>

									<div class="pt30 pb30 tc">
										<table width="100%" border="0" class="dy_table">
											<tr class="dy_head">
												<td width="150" height="48">
													周刊名称
												</td>
												<td>
													周刊内容简介
												</td>
												<td width="95">
													发送时间
												</td>
												<td width="95">
													订阅总数
												</td>
												<td width="110">
													我的订阅状态
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);" class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/passport.jpg"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">面向IT人士，涵盖了IT行业每周的重大要闻，及时发布行业发展动态，掌握行业活动讯息，为从业者提供最丰富、最新颖的企业级IT资讯以及有深度的原创技术文章。</span>
												</td>
												<td>
													<span>每周周一</span>
												</td>
												<td>
													<span>657719</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=passport><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);" class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/blog.png"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">每期撷取社区平台中最新鲜最热门的博客、帖子、资料、视频课程等，让技术人更好地学习和交流。</span>
												</td>
												<td>
													<span>每周周三</span>
												</td>
												<td>
													<span>493544</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=blog><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);" class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/watchstor.jpg"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">针对一周发生的重大新闻事件以整合形式的分析文章，帮助用户了解这些事件的来龙去脉，以更好地了解存储产业的发展。</span>
												</td>
												<td>
													<span>每周周一</span>
												</td>
												<td>
													<span>197470</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=watchstor><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);" class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/book.jpg"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">专业的IT技术图书电子杂志，精选当月热点图书，并提供网友喜爱的IT技术图书排行榜。</span>
												</td>
												<td>
													<span>每月下旬</span>
												</td>
												<td>
													<span>190618</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=book><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);"
														class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/net.jpg"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">技术不一定枯燥，当用另外一种眼光看的时候，技术也会妙趣横生。转变心态，让我们以更阳光的心情来欣赏、解读网络与安全技术。</span>
												</td>
												<td>
													<span>每周周三</span>
												</td>
												<td>
													<span>205341</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=net><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a
														href="javascript:void(0);"
														class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/activity.jpg"
															alt="样刊" /> </a>
													<br />
													<a
														href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">作为IT人，光有理论知识，没有实践行动怎能行。活动专刊为您提供近期线上重头赛事，让您从活动中不断获取最新资讯，收获好礼，真正体验边学边玩的乐趣。</span>
												</td>
												<td>
													<span>每月中旬</span>
												</td>
												<td>
													<span>176781</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=activity><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);"
														class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/develop.jpg"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">面向IT开发者和开发团队，汇聚当下开发领域热门的技术点，将优秀的文章和精彩的专题以周刊呈现，引领从业者的技术之路。</span>
												</td>
												<td>
													<span>每周周二</span>
												</td>
												<td>
													<span>173466</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=develop><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);" class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/cioage.jpg"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">一法通时，万法通。企业信息化建设亦如此。这里可以帮助CIO们及时掌握全球新热技术趋势与产业洞察，立足全行业，发现你最需要的、最新且比较优秀的场景应用，从而开拓思路。</span>
												</td>
												<td>
													<span>月中月末</span>
												</td>
												<td>
													<span>160846</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=cioage><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);" class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/cloud.jpg"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">云计算半月刊，为您提供最新、最快、最具价值的云计算新闻资讯和技术应用，解读云计算发展趋势，提供最全面的云计算技术讲解，欢迎订阅！</span>
												</td>
												<td>
													<span>月中月末</span>
												</td>
												<td>
													<span>130</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=cloud><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
											<tr>
												<td class="yangkan_td">
													<a href="javascript:void(0);"
														class="yangkan"><img
															src="https://static3.51cto.com/home/web/images/subscribe/TechNeo.jpg"
															alt="样刊" /> </a>
													<br />
													<a href="javascript:void(0);">样刊查询>></a>
												</td>
												<td style="text-align: left;">
													<span class="pl10 pr10">51CTO网+平台推出《态牛-TechNeo》电子杂志，通过精选和技术原创内容，精致的排版，给技术人员的阅读带来绝佳的体验。“读我懂你，做千万开发者的选择”是《态牛-TechNeo》的口号，本杂志面向广大开发者、技术总监以及架构师，杂志具涵盖独家的经验分享、案例剖析、核心技术解读，为您的岔路口指点迷津，提升工作效率。</span>
												</td>
												<td>
													<span>每月月底</span>
												</td>
												<td>
													<span>20</span>
												</td>
												<td>
													<span class="btn_yuding jsYudingSub" data-subname=TechNeo><b
														class="icon_wtjia  mr5"></b>预订</span>
												</td>
											</tr>
										</table>
									</div>
								</div>
								<input type="hidden" name="page" id="jsCurrentPage" value=1 />
								<input type="hidden" name="count" id="jsFeedType" value="user">
								<input type="hidden" name="appType" id="jsAppType" value="all">
								<input type="hidden" name="uid" id="jsUserId" value="12569085">
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
									href="javascript:void(0);"
									class="bke">写博文</a>
							</li>
							<li class="left">
								<a target="_blank"
									href="javascript:void(0);"
									class="ftie">发帖</a>
							</li>
							<li class="left">
								<a target="_blank" href="javascript:void(0);"
									class="sczl">上传资料</a>
							</li>
							<li class="last left">
								<a target="_blank"
									href="javascript:void(0);" class="edu">学课程</a>
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
							<a href="javascript:void(0);">完善资料有奖励>></a>
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
										href="javascript:void(0);"><span
										class="icon_bke"></span>我的博客</a>
								</li>
								<li class="left">
									<a target="_blank" href="javascript:void(0);"><span
										class="icon_ltan"></span>我的论坛</a>
								</li>
								<li class="left">
									<a target="_blank" href="javascript:void(0);"><span
										class="icon_xzai"></span>我的下载</a>
								</li>
								<li class="left">
									<a target="_blank"
										href="javascript:void(0);"><span
										class="icon_xyuan"></span>我的学院</a>
								</li>
								<li class="left bdnone">
									<a target="_blank"
										href="javascript:void(0);"><span
										class="icon_zwei"></span>我的职位</a>
								</li>
								<li class="left bdnone">
									<a target="_blank" href="javascript:void(0);"><span
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
										<a class="future_img tips" rel="/user/user-info?uid=2379781"
											href="javascript:void(0);"><img
												src="https://ucenter.51cto.com/avatar.php?uid=2379781&size=small&random=665802"
												class="ajax_layimg" alt="nicedebo" />
										</a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="javascript:void(0);">nicedebo</a>
										</div>
										<p>
											关注技术：云计算 AIX Unix 服务器
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_2379781"
											onclick="return addUserFollow(2379781)"><b
											class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
										</span>
									</div>

								</div>
								<div class="yourslove mt20 clearfix">
									<div class="yourslove_l left mr5 position_r">
										<a class="future_img tips" rel="/user/user-info?uid=1403416"
											href="javascript:void(0);"><img
												src="https://ucenter.51cto.com/avatar.php?uid=1403416&size=small&random=392425"
												class="ajax_layimg" alt="wxz5259217" />
										</a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="javascript:void(0);">wxz5259217</a>
										</div>
										<p>
											关注技术：移动领域 Android
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_1403416"
											onclick="return addUserFollow(1403416)"><b
											class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
										</span>
									</div>

								</div>
								<div class="yourslove mt20 clearfix">
									<div class="yourslove_l left mr5 position_r">
										<a class="future_img tips" rel="/user/user-info?uid=65148"
											href="javascript:void(0);"><img
												src="https://ucenter.51cto.com/avatar.php?uid=65148&size=small&random=723561"
												class="ajax_layimg" alt="waring_id" />
										</a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="javascript:void(0);">waring_id</a>
										</div>
										<p>
											关注技术：存储 黑客攻防 云计算 虚拟化 ITIL CISSP
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_65148"
											onclick="return addUserFollow(65148)"><b
											class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
										</span>
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
							href="javascript:void(0);"
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
							href="javascript:void(0);"
							target="_blank" class="ina"><img
								src="https://static5.51cto.com/home/web/images/fix_zxun.png" />
						</a>
					</div>
					<div class="exit_list exit_list_back">
						<a href="javascript:void(0);" class="ina"><img
								src="https://static5.51cto.com/home/web/images/fix_back.png" />
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
								class="cl_red" id="cl_redp"></span>
							</span>
						</dd>

					</dl>
					<dl class="dl_400 pl20 mb10 clearfix">
						<dt class="left mt5 tr">
							联系方式：
						</dt>
						<dd class="left validation_or">
							<span><input type="text" value="" placeholder="邮箱/QQ号"
									class="pop_input_320 inputtext_del t12" name="feedord"><span
								class="cl_red" id="c1_redb"></span>
							</span>
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
