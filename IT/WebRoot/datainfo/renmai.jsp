<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.StudentBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
								class="pub_icon"></em>
							</a>
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
								class="pub_icon"></em>
							</a>
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
							<a href="#">线下学习<em class="pub_icon"></em>
							</a>
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
										src="<%=basePath %><%=studentBean.getStudentface() %>"
										alt="头像" />
							</strong><%=studentBean.getStudentmobile() %> </a><a
								href="http://home.51cto.com/members/in-fo?home"
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

							<a>社区<em class="pub_icon"></em>
							</a>
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
							<a href="/home"><img
									src="<%=basePath %>image/itlogo.png"
									width="119" height="37" alt="家园" />
							</a>
						</dt>
						<dd class="">
							<a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>">首页</a>
						</dd>
						<dd class="curr">
							<a href="/space?uid=12569085">个人主页</a>
						</dd>
						<dd class="">
							<a href="/msg/notify" class="position_r">消息中心<b
								class="dot position_a"></b>
							</a>
						</dd>
						<dd class="">
							<a target="_blank" href="<%=basePath %>studentservlet?order=zhifucenter&username=<%=studentBean.getStudentname() %>">充值中心</a>
						<dd class="">
							<a style="position: relative;" target="_blank"
								href="<%=basePath %>huiyuanservlet?order=list">会员中心<img
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
													src="<%=basePath%><%=studentBean.getStudentface() %>"
													alt="<%=studentBean.getStudentname() %>" style="width:120px;height:120px;margin:3px auto;border-radius:50%" />
											</td>
										</tr>
									</table>
							</div>
							<div class="datas clearfix">
								<div class="num left tc">
									<a href="/user-follow-fans/fans?uid=12569085"><span>100</span>
									<br />
										<strong>粉丝</strong>
									</a>
								</div>
								<div class="line left"></div>
								<div class="num right tc">
									<a href="/user-follow-fans/follow?uid=12569085"><span>100</span>
									<br />
										<strong>关注</strong>
									</a>
								</div>
							</div>
						</div>
						<div class="port_m_box left  ml20">
							<div class="name">
								<a href="/space?uid=12569085" class="left"><%=studentBean.getStudentmobile() %></a>
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
								<li class="">
									<a href="<%=basePath %>datainfo/myface.jsp">我的动态</a>
								</li>
								<li class="">
									<a href="<%=basePath%>datainfo/guanzhu.jsp">我的关注</a>
								</li>
								<li class="cur_tab">
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
							<!--我的人脉开始-->
							<div class="tab_con">
								<div class="white_box pt30">
									<div class="contacts_box clearfix">
										<div class="groupside left">
											<div class="side_sub_box">
												<div class="side_sub jsFollowAmount side_sub_cur t16">
													<a href="/user-follow-fans/follow"> <span
														class="icon_gzhu left mr5"></span> <span class="subtext">关注</span>
														<span class="subnum"></span> </a>
												</div>
												<div class="side_sub_sec t14 mt10 jsNotGroupAmount ">
													<a href="/user-follow-fans/follow?gid=0"> <span
														class="icon_fzu left mt5 mr5"></span> <span
														class="subtext">未分组</span> <span class="subnum"></span> </a>
												</div>
												<div class="side_sub_sec jsFollowAmount6  t14 mt10">
													<a href="/user-follow-fans/follow?gid=6"> <span
														class="icon_fzu left mt5 mr5"></span> <span
														class="subtext">同事</span> <span class="subnum"></span> </a>
												</div>
												<div class="side_sub_sec jsFollowAmount7  t14 mt10">
													<a href="/user-follow-fans/follow?gid=7"> <span
														class="icon_fzu left mt5 mr5"></span> <span
														class="subtext">同学</span> <span class="subnum"></span> </a>
												</div>
												<div class="side_sub_sec jsFollowAmount13404  t14 mt10">
													<a href="/user-follow-fans/follow?gid=13404"> <span
														class="icon_fzu left mt5 mr5"></span> <span
														class="subtext">其他</span> <span class="subnum"></span> </a>
												</div>
												<div class="side_sub_sec t14">
													<a href="javascript:;"> <span
														class="subicon  icon_kjia left mr5 "></span> <span
														class="subtext">自定义分类</span> </a>
													<span class="side_edit">编辑</span>
												</div>

												<div class="side_sub_threbox jsFollowGroupList">
												</div>

												<div class="cre_group mb25 ml5">
													<b class="icon_hjia left mr5 "></b>创建分组
												</div>
												<div
													class="cre_group_inp mb25 ml5 clearfix jsUserAddGroupDiv">
													<input name="groupName" type="text"
														class="cre_group_val left mb10" placeholder="新组名最多8个字" />
													<span class="cl_red pl5"
														style="display: none; padding-left: 27px;"></span>
													<input name="" type="button" value="创建"
														class="btn_cre left mr10 jsCreateUserFollowGroup" />
													<input name="" type="button" value="取消"
														class="btn_cancel left" />

												</div>
											</div>


											<div class="side_sub_box">
												<div class="side_sub t16 jsFansAmount ">
													<a href="/user-follow-fans/fans"> <span
														class="icon_fsi left mr5"></span> <span class="subtext">粉丝</span>
														<span class="subnum"></span> </a>
												</div>
											</div>
											<div class="side_sub_box">
												<div class="side_sub t16 jsFriendAmount ">
													<a href="/user-follow-fans/friend"> <span
														class="icon_hyou left mr5"></span> <span class="subtext">好友</span>
														<span class="subnum"></span> </a>
												</div>
											</div>
											<!-- <div class="side_sub_box">
        <div class="side_sub t16">
            <a href="/user-follow-fans/search">
                <span class="icon_czhao left mr5"></span>
                <span class="subtext">查找</span>
                <span class="subnum"></span>
            </a>
        </div>
    </div>-->
										</div>
										<!--主体结束-->
										<!--修改读书分类开始 -->
										<div style="display: none;" class="jsFollowFansGroupDiv">
											<div class="tl t12 mb15 pl20  validation_or">
												<span>分组名</span><span class="pl10"> <input
														type="hidden" name="gid"> <input name="gname"
														type="text" class="pop_input_140  t14 inputtext_del" />
												</span>
												<div>
													<span class="cl_red pl5" style="padding-left: 45px;"></span>
												</div>
											</div>
										</div>

										<div class="ctcside left">
											<div class="ctcside_tab" style="display: block;">
												<!-- <div class="ctc_scrbox mb20">
                                        <div class="inpscrbox">
                                            <span class="left"><input name="" type="text" class="group_findval inputtext_del"  value="输入用户名或备注"  /></span>
                                            <div class="right group_condit tr">
                                                <input name="" type="text" class="group_styleval" readonly="readonly" value="用户名" />
                                                <div class="stylehide">
                                                    <a href="javascript:;">用户名</a>
                                                    <a href="javascript:;">备注</a>
                                                </div>

                                            </div>
                                            <span><input name="" type="button" class="group_findbtn" value="查找" /></span>
                                        </div>
                                    </div>-->
												<div class="ctcdatabox clearfix pb20">
													<div class="contacts left jsFollowFansDiv_2379781">
														<div class="tx left">
															<a href="/space?uid=2379781" target="_blank"
																class="future_img tips position_r"
																rel="/user/user-info?uid=2379781"><img
																	src="https://ucenter.51cto.com/avatar.php?uid=2379781&size=small&random=106739"
																	alt="名字" class="ajax_layimg" />
															</a>
														</div>
														<div class="ctcnumbox left w_170">
															<div class="num_1 pb10">
																<a href="/space?uid=2379781" target="_blank"
																	title="nicedebo">nicedebo</a>
															</div>
															<div class="num_2">
																<span><b class="icon_dui mr5"></b>已关注</span>
															</div>
															<div class="num_3" id="userFollowRemark_2379781" title="">
																备注：
															</div>
															<div class="num_4  mt10 position_r">
																<div class="op_group clearfix">
																	<span class="op_group_val left" data-fuid="2379781"><em><b>同事</b>
																	</em>
																	</span>
																	<span class="op_group_set left" data-fuid="2379781"><b
																		class="icon_set"></b>
																	</span>
																	<input value="6" type="hidden"
																		id="userGroupIds_2379781" name="userGroupIds_2379781">
																</div>

																<div class="op_group_set_hide position_a">
																	<a href="javascript:;"
																		onclick="return cancelFollow('2379781')">取消关注</a>
																	<a href="javascript:;"
																		onclick="return editFollowRemark('2379781')">修改备注</a>
																</div>
															</div>
														</div>
													</div>
													<div class="contacts left jsFollowFansDiv_2031512">
														<div class="tx left">
															<a href="/space?uid=2031512" target="_blank"
																class="future_img tips position_r"
																rel="/user/user-info?uid=2031512"><img
																	src="https://ucenter.51cto.com/avatar.php?uid=2031512&size=small&random=314635"
																	alt="名字" class="ajax_layimg" />
															</a>
														</div>
														<div class="ctcnumbox left w_170">
															<div class="num_1 pb10">
																<a href="/space?uid=2031512" target="_blank"
																	title="大黄蜂ET">大黄蜂ET</a>
															</div>
															<div class="num_2">
																<span><b class="icon_dui mr5"></b>已关注</span>
															</div>
															<div class="num_3" id="userFollowRemark_2031512" title="">
																备注：
															</div>
															<div class="num_4  mt10 position_r">
																<div class="op_group clearfix">
																	<span class="op_group_val left" data-fuid="2031512"><em><b>未分组</b>
																	</em>
																	</span>
																	<span class="op_group_set left" data-fuid="2031512"><b
																		class="icon_set"></b>
																	</span>
																	<input value="" type="hidden" id="userGroupIds_2031512"
																		name="userGroupIds_2031512">
																</div>

																<div class="op_group_set_hide position_a">
																	<a href="javascript:;"
																		onclick="return cancelFollow('2031512')">取消关注</a>
																	<a href="javascript:;"
																		onclick="return editFollowRemark('2031512')">修改备注</a>
																</div>
															</div>
														</div>
													</div>
													<div class="contacts left jsFollowFansDiv_1083">
														<div class="tx left">
															<a href="/space?uid=1083" target="_blank"
																class="future_img tips position_r"
																rel="/user/user-info?uid=1083"><img
																	src="https://ucenter.51cto.com/avatar.php?uid=1083&size=small&random=524538"
																	alt="名字" class="ajax_layimg" />
															</a>
														</div>
														<div class="ctcnumbox left w_170">
															<div class="num_1 pb10">
																<a href="/space?uid=1083" target="_blank" title="小王">小王</a>
															</div>
															<div class="num_2">
																<span><b class="icon_dui mr5"></b>已关注</span>
															</div>
															<div class="num_3" id="userFollowRemark_1083" title="">
																备注：
															</div>
															<div class="num_4  mt10 position_r">
																<div class="op_group clearfix">
																	<span class="op_group_val left" data-fuid="1083"><em><b>未分组</b>
																	</em>
																	</span>
																	<span class="op_group_set left" data-fuid="1083"><b
																		class="icon_set"></b>
																	</span>
																	<input value="" type="hidden" id="userGroupIds_1083"
																		name="userGroupIds_1083">
																</div>

																<div class="op_group_set_hide position_a">
																	<a href="javascript:;"
																		onclick="return cancelFollow('1083')">取消关注</a>
																	<a href="javascript:;"
																		onclick="return editFollowRemark('1083')">修改备注</a>
																</div>
															</div>
														</div>
													</div>
													<div class="contacts left jsFollowFansDiv_10590028">
														<div class="tx left">
															<a href="/space?uid=10590028" target="_blank"
																class="future_img tips position_r"
																rel="/user/user-info?uid=10590028"><img
																	src="https://ucenter.51cto.com/avatar.php?uid=10590028&size=small&random=753054"
																	alt="名字" class="ajax_layimg" />
															</a>
														</div>
														<div class="ctcnumbox left w_170">
															<div class="num_1 pb10">
																<a href="/space?uid=10590028" target="_blank"
																	title="51CTO高招">51CTO高招</a>
															</div>
															<div class="num_2">
																<span><b class="icon_dui mr5"></b>已关注</span>
															</div>
															<div class="num_3" id="userFollowRemark_10590028"
																title="">
																备注：
															</div>
															<div class="num_4  mt10 position_r">
																<div class="op_group clearfix">
																	<span class="op_group_val left" data-fuid="10590028"><em><b>未分组</b>
																	</em>
																	</span>
																	<span class="op_group_set left" data-fuid="10590028"><b
																		class="icon_set"></b>
																	</span>
																	<input value="" type="hidden"
																		id="userGroupIds_10590028"
																		name="userGroupIds_10590028">
																</div>

																<div class="op_group_set_hide position_a">
																	<a href="javascript:;"
																		onclick="return cancelFollow('10590028')">取消关注</a>
																	<a href="javascript:;"
																		onclick="return editFollowRemark('10590028')">修改备注</a>
																</div>
															</div>
														</div>
													</div>
													<div class="contacts left jsFollowFansDiv_1805422">
														<div class="tx left">
															<a href="/space?uid=1805422" target="_blank"
																class="future_img tips position_r"
																rel="/user/user-info?uid=1805422"><img
																	src="https://ucenter.51cto.com/avatar.php?uid=1805422&size=small&random=652862"
																	alt="名字" class="ajax_layimg" />
															</a>
														</div>
														<div class="ctcnumbox left w_170">
															<div class="num_1 pb10">
																<a href="/space?uid=1805422" target="_blank"
																	title="51cto家园">51cto家园</a>
															</div>
															<div class="num_2">
																<span><b class="icon_dui mr5"></b>已关注</span>
															</div>
															<div class="num_3" id="userFollowRemark_1805422" title="">
																备注：
															</div>
															<div class="num_4  mt10 position_r">
																<div class="op_group clearfix">
																	<span class="op_group_val left" data-fuid="1805422"><em><b>未分组</b>
																	</em>
																	</span>
																	<span class="op_group_set left" data-fuid="1805422"><b
																		class="icon_set"></b>
																	</span>
																	<input value="" type="hidden" id="userGroupIds_1805422"
																		name="userGroupIds_1805422">
																</div>

																<div class="op_group_set_hide position_a">
																	<a href="javascript:;"
																		onclick="return cancelFollow('1805422')">取消关注</a>
																	<a href="javascript:;"
																		onclick="return editFollowRemark('1805422')">修改备注</a>
																</div>
															</div>
														</div>
													</div>
												</div>

											</div>

										</div>
									</div>
									<div class="pl185">
									</div>
								</div>
							</div>
							<!--我的人脉结束-->

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
										<a class="future_img tips" rel="/user/user-info?uid=1168411"
											href="/space?uid=1168411"><img
												src="https://ucenter.51cto.com/avatar.php?uid=1168411&size=small&random=754976"
												class="ajax_layimg" alt="星月" />
										</a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="/space?uid=1168411">星月</a>
										</div>
										<p>
											关注技术：网络 软考 微软 虚拟化
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_1168411"
											onclick="return addUserFollow(1168411)"><b
											class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
										</span>
									</div>

								</div>
								<div class="yourslove mt20 clearfix">
									<div class="yourslove_l left mr5 position_r">
										<a class="future_img tips" rel="/user/user-info?uid=2120831"
											href="/space?uid=2120831"><img
												src="https://ucenter.51cto.com/avatar.php?uid=2120831&size=small&random=245536"
												class="ajax_layimg" alt="chenghaifeng24" />
										</a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="/space?uid=2120831">chenghaifeng24</a>
										</div>
										<p>
											关注技术：系统集成 网络 数据恢复 思科技术 黑客攻防 安全 网络排错 数据库
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_2120831"
											onclick="return addUserFollow(2120831)"><b
											class="icon_hjia_btn mr5 left"></b><em class="fs_n">关注</em>
										</span>
									</div>

								</div>
								<div class="yourslove mt20 clearfix">
									<div class="yourslove_l left mr5 position_r">
										<a class="future_img tips" rel="/user/user-info?uid=3305781"
											href="/space?uid=3305781"><img
												src="https://ucenter.51cto.com/avatar.php?uid=3305781&size=small&random=354629"
												class="ajax_layimg" alt="签约恋人" />
										</a>
									</div>
									<div class="yourslove_c left mr10">
										<div class="name pb5">
											<a href="/space?uid=3305781">签约恋人</a>
										</div>
										<p>
											关注技术：
										</p>
									</div>
									<div class="yourslove_r right mt10">
										<span
											class="Focus_add_btn right ml10 jsUserRelationFollow_3305781"
											onclick="return addUserFollow(3305781)"><b
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
		</div>
		<!--修改读书分类结束 -->
		<!--主体结束-->
		<!--关注开始-->
		<div class="ajax_foucs jsUserGroups">
			<div class="op_group_val_hide position_a">
				<h5 class="mb15">
					请选择分组：
				</h5>
				<!--<div class="no_group mb15">没有分组</div>-->
				<div class="val_add mb15 jsUpdateUserGroupInfo"
					style="display: none">
					<b class="icon_rdui left"></b>成功添加组员到
					<span>0</span>个组！
				</div>
				<ul class="clearfix">
					<li>
						<input name="userGroups[]" type="checkbox" value="6" />
						<span>同事</span>
					</li>
					<li>
						<input name="userGroups[]" type="checkbox" value="7" />
						<span>同学</span>
					</li>
					<li>
						<input name="userGroups[]" type="checkbox" value="13404" />
						<span>其他</span>
					</li>
				</ul>

				<span class="cre_group"><b class="icon_hjia left mr5"></b>创建分组</span>
				<div class="cre_group_inp clearfix">
					<input name="userGroupName" type="text"
						class="cre_group_val left mr5" placeholder="新组名最多8个字" />
					<input name="fuid" value="" type="hidden">
					<input name="gid" value="" type="hidden">
					<input name="uid" value="12539927" type="hidden">
					<input name="" type="button" value="创建"
						class="btn_cre left mr10 jsCreateUserGroup" />
					<input name="" type="button" value="取消" class="btn_cancel left" />
					<span class="cl_red pl5"
						style="display: none; padding-left: 111px;"></span>

				</div>
			</div>
		</div>
		<!--关注结束-->

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
							src="https://static3.51cto.com/home/web/images/fix_zxun.png" />
					</a>
				</div>
				<div class="exit_list exit_list_back">
					<a href="#" class="ina"><img
							src="https://static3.51cto.com/home/web/images/fix_back.png" />
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
