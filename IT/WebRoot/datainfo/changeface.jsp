<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<meta charset="UTF-8">
		<meta name="csrf-param" content="_csrf">
		<meta name="csrf-token"
			content="YVFPZkxnaXQXNX0wAR0iPCsaJzB8Ej0xIxIbAg4VWgEoGRUTOAA4BA==">
		<title></title>
		<link rel="shortcut icon"
			href="https://static5.51cto.com/home/web/images/favicon.ico"
			type="image/x-icon">
		<link href="https://static5.51cto.com/home/web/css/public.css?v=10005"
			rel="stylesheet">
		<link href="https://static4.51cto.com/home/web/css/fset.css?v=10001"
			rel="stylesheet">
		<script
			src="https://static5.51cto.com/home/web/js/jquery.min.js?v=10001"></script>
		<script
			src="https://static5.51cto.com/home/web/js/system/yii.js?v=10001"></script>
		<script src="https://static4.51cto.com/home/web/js/51cto.js?v=10001"></script>
		<script
			src="https://static5.51cto.com/home/web/js/jquery.message.js?v=10001"></script>
		<script src="https://static5.51cto.com/home/web/js/public.js?v=10003"></script>
		<script src="https://static3.51cto.com/home/web/js/imgscal.js?v=10001"></script>
		<script
			src="https://static1.51cto.com/home/web/js/jquery.masonry.min.js?v=10001"></script>
		<script
			src="https://static1.51cto.com/home/web/js/tip/jquery.cluetip.js?v=10001"></script>
		<script
			src="https://static2.51cto.com/home/web/js/public/ts_common.js?v=10003"></script>
		<script
			src="https://static3.51cto.com/home/web/js/public/info.js?v=10014"></script>
		<script
			src="https://static1.51cto.com/home/web/js/public/msg.js?v=10001"></script>
		<%
			StudentBean studentBean = (StudentBean) session
					.getAttribute("bean");
			int num = Integer.parseInt(session.getAttribute("num").toString());
			float money = Float.parseFloat(session.getAttribute("mm")
					.toString());
		%>
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
										src="<%=basePath%><%=studentBean.getStudentface()%>"
										alt="头像" style="border-radius: 50%" /> </strong><%=studentBean.getStudentmobile()%>
							</a><a href="http://home.51cto.com/members/in-fo?home"
								style="position: relative;"><span class="jsVipDrop">
									<c:if test="<%=studentBean.getVIP() != 1%>">
										<img src="<%=basePath%>images/vip_grey2.png"
											style="float: left; margin-top: 8px">
									</c:if> <c:if test="<%=studentBean.getVIP() == 1%>">
										<img src="<%=basePath%>images/vipred.png"
											style="float: left; margin-top: 8px; width: 20px; height: 20px; border-radius: 50%">
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

		<!--主体开始-->
		<div class="main mb20">
			<div class="setmain center clearfix">
				<div id="leftMenu" curr="face" class="setmain_l left">
					<div class="portbox w_120">
						<div class="mb10">
							<a href="/space" class="t16 cl_3"><%=studentBean.getStudentface() %></a>
						</div>
						<div class="mb10 tc">
							<a href="/space" class="tx_100"><table width="100%">
									<tr>
										<td height="100">
											<img onload="proDownImage(this,98,98);"
												src="<%=basePath%><%=studentBean.getStudentface() %>" style="border-radius:50%;width:120px;height:120px"
												alt="头像" />
										</td>
									</tr>
								</table>
							</a>
						</div>
						<div class="datas clearfix">
							<div class="num left tc">
								<a href="/user-follow-fans/fans"><span>0</span>
								<br />
									<strong>粉丝</strong>
								</a>
							</div>
							<div class="line left"></div>
							<div class="num right tc">
								<a href="/space/feed?uid=12539927"><span>5</span>
								<br />
									<strong>关注</strong>
								</a>
							</div>
						</div>
					</div>
					<div class="set_fgline"></div>
					<div class="set_box">
						<div class="lev_box">
							<div class="lev_first">
								<a href="javascript:;"><b class="icon_set_gr"></b>个人资料</a>
							</div>
							<div class="lev_sec">
								<div class="lev_secin index">
									<a href="/info">修改个人资料</a>
								</div>
								<div class="lev_secin face">
									<a href="/info/face">修改头像</a>
								</div>
								<div class="lev_secin attention-tech">
									<a href="/attention-tech">关注技术</a>
								</div>
								<div class="lev_secin credit">
									<a href="/info/credit">无忧币</a>
								</div>
							</div>
						</div>
						<div class="lev_box">
							<div class="lev_first">
								<a href="javascript:;"><b class="icon_set_dt"></b>账号设置</a>
							</div>
							<div class="lev_sec">
								<div class="lev_secin set-mobile">
									<a href="/info/set-mobile">修改手机</a>
								</div>

								<div class="lev_secin set-email">
									<a href="/info/set-email">绑定邮箱</a>
								</div>

								<div class="lev_secin set-pass">
									<a href="/info/set-pass">修改密码</a>
								</div>
								<div class="lev_secin bind-social">
									<a href="/info/bind-social">绑定登录账号</a>
								</div>
							</div>
						</div>
						<div class="lev_box">
							<div class="lev_first">
								<a href="javascript:;"><b class="icon_set_zh"></b>隐私设置</a>
							</div>
							<div class="lev_sec">
								<div class="lev_secin basic-screen">
									<a href="/info/basic-screen">访问限制</a>
								</div>
								<div class="lev_secin feed-screen">
									<a href="/info/feed-screen">动态筛选</a>
								</div>
								<div class="lev_secin notify-screen">
									<a href="/info/notify-screen">通知筛选</a>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- lev_secin_cur -->
				<div class="setmain_r right">
					<div class="setbox">
						<div class="Ftitle_all mb25">
							<span class="titxet t18">修改头像</span>
						</div>
						<div>
							<table width="98%" border="1" align="center" cellpadding="0"
								cellspacing="0" style="margin-top: 20px;">
								<tbody>
									<tr>
										<td width="240" align="center" valign="top">
											<div class="len_bbs_userpic" id="userfacediv">
												<div class="headpic100">
													<table width="100%" height="100%" cellspacing="0"
														cellpadding="0" border="1">
														<tbody>
															<tr>
																<td align="center">
																	<img name="userface" id="userface"
																		src="<%=basePath%><%=studentBean.getStudentface() %>" style="border-radius:50%;width:120px;height:120px">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

										</td>
										<td width="607" valign="top">
											<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
												codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0"
												width="447" height="477" id="mycamera" align="middle">
												<param name="allowScriptAccess" value="always" />
												<param name="scale" value="exactfit" />
												<param name="wmode" value="transparent" />
												<param name="quality" value="high" />
												<param name="bgcolor" value="#ffffff" />
												<param name="movie"
													value="https://ucenter.51cto.com//images/camera.swf?inajax=1&appid=12&input=483evawHE6ebxArgwx9cgmKw%2FgMLjBD3mTCbPH8Ip0bmVP%2BqjSrsg1iTOap5NhLIgHLTpfc6qhJIVVLJmvJ9J5SmvfnKhWYGJeuif%2BJd%2Fh1E5L11ijKy29pWDR7oqDHz&agent=ce290af4083a5e71c26c2d360ac888b6&ucapi=https%3A%2F%2Fucenter.51cto.com%2F" />
												<param name="menu" value="false" />
												<embed
													src="https://ucenter.51cto.com//images/camera.swf?inajax=1&appid=12&input=483evawHE6ebxArgwx9cgmKw%2FgMLjBD3mTCbPH8Ip0bmVP%2BqjSrsg1iTOap5NhLIgHLTpfc6qhJIVVLJmvJ9J5SmvfnKhWYGJeuif%2BJd%2Fh1E5L11ijKy29pWDR7oqDHz&agent=ce290af4083a5e71c26c2d360ac888b6&ucapi=https%3A%2F%2Fucenter.51cto.com%2F"
													quality="high" bgcolor="#ffffff" width="447" height="477"
													name="mycamera" align="middle" allowScriptAccess="always"
													allowFullScreen="false" scale="exactfit"
													wmode="transparent" type="application/x-shockwave-flash"
													pluginspage="http://www.macromedia.com/go/getflashplayer" />
											</object>
										</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
    function updateavatar() {
        $('#userface').attr('src','https://ucenter.51cto.com/avatar.php?uid=12539927&size=middle&random=' + Math.random());
      //  $.get("/Info/doUpdateFace");
    }
</script>
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
							src="https://static5.51cto.com/home/web/images/fix_zxun.png" />
					</a>
				</div>
				<div class="exit_list exit_list_back">
					<a href="#" class="ina"><img
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
