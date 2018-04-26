<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
			content="Q1plLm9PbTMTHSJpFhUqCzsvDHswIwcENSMGGAs4Kn4bHCZ7OTZUbA==">
		<title>IT课堂技术家园</title>
		<link rel="shortcut icon"
			href="https://static5.51cto.com/home/web/images/favicon.ico"
			type="image/x-icon">
		<meta name="keywords" content="51CTO技术家园">
		<meta name="description" content="51CTO技术家园">
		<link
			href="https://static5.51cto.com/home/web/css/jquery-ui.css?v=10002"
			rel="stylesheet">
		<link
			href="https://static5.51cto.com/home/web/css/datepicker.css?v=10002"
			rel="stylesheet">
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
		<script type="text/javascript">
			$(function(){
				$("#JsGetCity").bind("change",function(){
					$.post(
						"${pageContext.request.contextPath}/myinfoservlet",
						{
							"order":"changecity",
							"provinceid":$("#JsGetCity").val()
						},
						function(data){
							var op = "";
							for(var i=0;i<data.length;i++){
								op+="<option value='"+data[i].cityid+"'>"+data[i].cityname+"</option>"
							}
							$("#cityid").html(op);
						},
						"json"
					);
				});
				$("#emailpage").bind("click",function(){
					$("#systeminfo").css("display","none");
					$("#systememail").css("display","block");
				});
				$("#setbtn_save").bind("click",function(){
					$.post(
						"${pageContext.request.contextPath}/myinfoservlet",
						{
							"order":"email",
							"code":$("input[name=checkEmail]").val()
						},
						function(data){
							alert(data);
						},
						"text"
					);
				});
			});
		
		</script>
	</head>
	<body>
		<%
			StudentBean studentBean = (StudentBean) session
					.getAttribute("bean");
			int num = Integer.parseInt(session.getAttribute("num").toString());
			float money = Float.parseFloat(session.getAttribute("mm")
					.toString());
		%>
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
								class="pub_icon"></em> </a>
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
							<a href="<%=basePath %>courselistservlet?order=list" style="color: red">IT课堂<em
								class="pub_icon"></em> </a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a title="视频课程" href="javascript:void(0);" target="_blank">视频课程</a>
								</dd>
								<dd>
									<a title="微职位培训" href="javascript:void(0);" target="_blank">微职位培训</a>
								</dd>
								<dd>
									<a title="APP下载" href="javascript:void(0);" target="_blank">APP下载</a>
								</dd>
							</dl>
						</li>
						<li>
							<a href="#">线下学习<em class="pub_icon"></em> </a>
							<b class="line"></b>
							<dl class="hidchannel">
								<dd>
									<a title="WOT峰会" href="javascript:void(0);" target="_blank">WOT峰会</a>
								</dd>
								<dd>
									<a title="CTO训练营" href="javascript:void(0);" target="_blank">CTO训练营</a>
								</dd>
								<dd>
									<a title="百城沙龙" href="javascript:void(0);" target="_blank">百城沙龙</a>
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
								class="usericon"><img
										src="<%=basePath%><%=studentBean.getStudentface()%>" alt="头像"
										style="border-radius: 50%" /> </strong><%=studentBean.getStudentmobile()%>
							</a><a href="javascript:void(0);" style="position: relative;"><span
								class="jsVipDrop"> <c:if
										test="<%=studentBean.getVIP() != 1%>">
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
							<a href="javascript:void(0);">退出</a>
						</li>
						<li>

							<a>社区<em class="pub_icon"></em> </a>
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

		<div class="Fnav">
			<div class="center clearfix">
				<div class="Fnav_l left">
					<dl class="clearfix">
						<dt>
							<a
								href="<%=basePath%>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile()%>"><img
									src="<%=basePath%>image/itlogo.png" width="119" height="37"
									alt="家园" /> </a>
						</dt>
						<dd class="">
							<a
								href="<%=basePath%>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile()%>">首页</a>
						</dd>
						<dd class="curr">
							<a
								href="<%=basePath%>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile()%>">个人主页</a>
						</dd>
						<dd class="">
							<a href="javascript:void(0);" class="position_r">消息中心<b
								class="dot position_a"></b> </a>
						</dd>
						<dd class="">
							<a target="_blank"
								href="<%=basePath%>studentservlet?order=zhifucenter&username=<%=studentBean.getStudentname()%>">充值中心</a>
						<dd class="">
							<a style="position: relative;" target="_blank"
								href="<%=basePath%>huiyuanservlet?order=list&n=m">会员中心<img
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
							<a href="javascript:void(0);" target="_blank"><b></b>帮助</a>
						</li>
						<li class="exit_set left">
							<a href="javascript:void(0)"><b></b>设置<em class="arro_down"></em>
							</a>
							<span class="arro position_a"></span>
							<ul class="hideset position_a">
								<li>
									<a href="<%=basePath%>studentservlet?order=update">个人资料</a>
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
		<!--主体开始-->
		<div class="main mb20">
			<div class="setmain center clearfix">
				<div id="leftMenu" curr="index" class="setmain_l left">
					<div class="portbox w_120">
						<div class="mb10">
							<a href="javascript:void(0);" class="t16 cl_3"><%=studentBean.getStudentname()%></a>
						</div>
						<div class="mb10 tc">
							<table width="100%">
								<tr>
									<td height="100">
										<img onload="proDownImage(this,98,98);"
											src="<%=basePath%><%=studentBean.getStudentface()%>"
											style="border-radius: 50%; width: 120px; height: 120px"
											alt="头像" />
									</td>
								</tr>
							</table>
						</div>
						<div class="datas clearfix">
							<div class="num left tc">
								<a href="javascript:void(0);"><span>10</span> <br /> <strong>粉丝</strong>
								</a>
							</div>
							<div class="line left"></div>
							<div class="num right tc">
								<a href="javascript:void(0);"><span>15</span> <br /> <strong>关注</strong>
								</a>
							</div>
						</div>
					</div>
					<div class="set_fgline"></div>
					<div class="set_box">
						<div class="lev_box">
							<div class="lev_first">
								<a href="<%=basePath%>studentservlet?order=update"><b
									class="icon_set_gr"></b>个人资料</a>
							</div>
							<div class="lev_sec">
								<div class="lev_secin index">
									<a href="<%=basePath%>studentservlet?order=update">修改个人资料</a>
								</div>
								<div class="lev_secin face">
									<a
										href="<%=basePath%>studentface.jsp?studentmobile=<%=studentBean.getStudentmobile()%>"
										target="right">修改头像</a>
								</div>
								<div class="lev_secin attention-tech">
									<a href="javascript:void(0);">关注技术</a>
								</div>
								<div class="lev_secin credit">
									<a href="javascript:void(0);">无忧币</a>
								</div>
							</div>
						</div>
						<div class="lev_box">
							<div class="lev_first">
								<a href="javascript:void(0);"><b class="icon_set_dt"></b>账号设置</a>
							</div>
							<div class="lev_sec">
								<div class="lev_secin set-mobile">
									<a href="javascript:void(0);">修改手机</a>
								</div>

								<div class="lev_secin set-email">
									<a href="javascript:void(0);" id="emailpage">绑定邮箱</a>
								</div>

								<div class="lev_secin set-pass">
									<a
										href="<%=basePath%>data/oldstudentpwd.jsp?studentname=<%=studentBean.getStudentname()%>">修改密码</a>
								</div>
								<div class="lev_secin bind-social">
									<a href="javascript:void(0);">绑定登录账号</a>
								</div>
							</div>
						</div>
						<div class="lev_box">
							<div class="lev_first">
								<a href="javascript:;"><b class="icon_set_zh"></b>隐私设置</a>
							</div>
							<div class="lev_sec">
								<div class="lev_secin basic-screen">
									<a href="javascript:void(0);">访问限制</a>
								</div>
								<div class="lev_secin feed-screen">
									<a href="javascript:void(0);">动态筛选</a>
								</div>
								<div class="lev_secin notify-screen">
									<a href="javascript:void(0);">通知筛选</a>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- lev_secin_cur -->
				<div class="setmain_r right">
					<div class="setbox" id="systeminfo" style="dislay:block">					
						<div class="Ftitle_all mb25">
							<span class="titxet t18">个人资料</span>
						</div>
						<form id="userInfoForm" method="post">
							<input name="_csrf" type="hidden" id="_csrf"
								value="Q1plLm9PbTMTHSJpFhUqCzsvDHswIwcENSMGGAs4Kn4bHCZ7OTZUbA==">
							<div class="grzl_box">

								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											昵称：
										</dt>
										<dd class="left w_325 ml10">


											<div>
												<div class="ON_change_hide">
													<span class="pr20"><%=studentBean.getStudentname()%></span>
													<span class="ON_change"><b class="mr5"></b>修改</span>
												</div>
												<span class="ON_change_show"> <input
														style="width: 190px;" name="nickname" id="nickname"
														type="text" class="input_143" placeholder="请填写昵称，4-15字符"
														url="/info/check-nickname" msg="昵称不能为空|请输入昵称"
														value="<%=studentBean.getStudentname()%>"
														datatype="limit|ajax" /> <span class=" cl_9 t12">
														180天只能修改一次</span> </span>
											</div>
										</dd>
									</dl>
									<div class="set_jy jsErrornickname">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
								<div class="formlist t14">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											用户名：
										</dt>
										<dd class="left w_325 ml10">
											<span><%=studentBean.getStudentname()%></span>
										</dd>
									</dl>
								</div>

								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											姓名：
										</dt>
										<dd class="left w_325 ml10">
											<span> <input require="false" class="input_325"
													datatype="limit|ajax" max="18" placeholder="请填写姓名，最多6个字"
													url="/info/check-real-name" msg="请填写姓名，最多6个字|请输入真实姓名"
													type="text" name="trueName" value="" /> </span>
										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_true_name">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
									<div class="set_jy jsErrortrueName">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											性别：
										</dt>
										<dd class="left w_325 ml10">
											<span class="mr25 pointer_c"><input name="sex"
													type="radio" value="1" /> <label for="mail" class="pl10">
													男
												</label> </span>
											<span class="mr25 pointer_c"><input name="sex"
													type="radio" value="0" checked /> <label for="femail"
													class="pl10">
													女
												</label> </span>
											<span class="mr25 pointer_c"><input name="sex"
													type="radio" value="2" /> <label for="nomail" class="pl10">
													保密
												</label> </span>
										</dd>
										<dd class="left ml15">
											<span> <select name="" disabled="disabled">
													<option>
														所有人可见
													</option>
													<option>
														仅粉丝可见
													</option>
													<option>
														仅自己可见
													</option>
												</select> <input type="hidden" name="_privacy_sex" value="0">
											</span>
										</dd>
									</dl>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											生日：
										</dt>
										<dd class="left w_325 ml10">
											<span><input name="birthday" type="text"
													class="input_325 Wdate"
													onfocus="WdatePicker({lang:'zh-cn'})" value=""
													readonly="true" /> </span>
										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_birthday">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											联系电话：
										</dt>
										<dd class="left w_325 ml10">
											<span> <input type="text" require="false"
													datatype="phone" msg="区号-主机#分机" value="" name="phone"
													class="input_325" /> </span>
										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_phone">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
									<div class="set_jy jsErrorphone">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											手机号：
										</dt>
										<dd class="left w_325 ml10">
											<span><input type="text" require="false"
													datatype="mobile" maxlength="11" msg="请输入正确手机" value=""
													name="cellphone" class="input_325" /> </span>
										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_cellphone">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
									<div class="set_jy jsErrorcellphone">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											QQ：
										</dt>
										<dd class="left w_325 ml10">
											<span><input type="text" require="false"
													maxlength="20" datatype="qq" msg="请输入正确QQ" value=""
													name="qq" class="input_325" /> </span>
										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_qq">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
									<div class="set_jy jsErrorqq">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											关注领域：
										</dt>
										<dd class="left w_325 ml10 position_r">
											<span><input type="text" class="input_325  val_set_fc"
													id="val_set_fc" placeholder="请选择关注领域" name="areatxt"
													value="" readonly="readonly" /> </span>
											<input type="hidden" id="areaId" name="areaId" value="" />
											<input type="hidden" id="areaOtherId" name="areaid_other"
												value="" />
											<div class="fc_area jsareaDiv">

											</div>
										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_areaid">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
									<div class="set_jy jsErrorarea">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											通讯地址：
										</dt>
										<dd class="left w_325 ml10">
											<span><input type="text" require="false"
													datatype="limit" max="150" msg="通讯地址，最多支持50个字"
													placeholder="请输入通讯地址，最多支持50个字" value="" name="address"
													class="input_325" /> </span>
										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_address">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
									<div class="set_jy jsErroraddress">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
								<div class="pl40">
									<div class="Ftitle_all mb25">
										<span class="titxet t18">亮点信息</span><span
											class="cl_yel t12 pl30">公开会获得更多关注啊</span>
									</div>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											现居城市：
										</dt>
										<dd class="left w_325 ml10 jsGetAddress">
											<table id="tab">
												<tr>
													<td>
														<font size="3" face="楷体"></font>
													</td>
													<td>
														<select id="JsGetCity" name="province">
															<option>
																请选择省份
															</option>
															<c:forEach items="${sessionScope.provincelist}" var="p">
																<option value="${p.provinceid}">
																	${p.provinceName}
																</option>
															</c:forEach>
														</select>
													</td>
													<td>
														<select style="margin-left: 10px;" name="city" id="cityid">
															<option>
																请选择地区
															</option>
														</select>
													</td>
												</tr>
											</table>

										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_ts_areaval">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
									<div class="set_jy jsErrorcity">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											所属行业：
										</dt>
										<dd class="left w_325 ml10 position_r  validation_or"
											style="z-index: 8">
											<span> <input name="vocation" type="text"
													require="false" class="input_325  input_select"
													placeholder="请选择行业，手动输入最多10个字" msg="行业手动输入最多10个字"
													datatype="limit" max="30" value="" /> </span>
											<ul class="sel_hide">
												<li data-value="">
													请选择行业
												</li>
												<li data-value="电信/通讯">
													电信/通讯
												</li>
												<li data-value="金融/保险">
													金融/保险
												</li>
												<li data-value="商贸/零售">
													商贸/零售
												</li>
												<li data-value="医药/生物">
													医药/生物
												</li>
												<li data-value="能源/化工">
													能源/化工
												</li>
												<li data-value="教育/科研">
													教育/科研
												</li>
												<li data-value="制造/加工">
													制造/加工
												</li>
												<li data-value="政府部门">
													政府部门
												</li>
												<li data-value="交通/物流">
													交通/物流
												</li>
												<li data-value="ISV/SI">
													ISV/SI
												</li>
												<li data-value="信息技术/电子商务">
													信息技术/电子商务
												</li>
												<li data-value="广告/传媒">
													广告/传媒
												</li>
												<li data-value="酒店/旅游">
													酒店/旅游
												</li>
											</ul>
											<div class="set_jy jsErrorvocation">
												<span class="icon_gth"></span><em></em>
											</div>
										</dd>
										<dd class="left ml15">
											<span> <select name="_privacy_vocation">
													<option value="0" selected>
														所有人可见
													</option>
													<option value="1">
														仅粉丝可见
													</option>
													<option value="2">
														仅自己可见
													</option>
												</select> </span>
										</dd>
									</dl>
								</div>
								<div class="formlist t14">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											职业信息：
										</dt>
										<dd class="left  ml10" style="z-index: 8">

											<div class="mb20 clearfix position_r validation_or">
												<span class="left"><input name="company"
														require="false" datatype="limit" msg="工作单位字数在0到30之间"
														max="90" value="" type="text" class="input_325"
														placeholder="请填写单位，最多30个字" /> </span>
												<span class="left ml15"> <select
														name="_privacy_company">
														<option value="0">
															所有人可见
														</option>
														<option value="1">
															仅粉丝可见
														</option>
														<option value="2">
															仅自己可见
														</option>
													</select> </span>
												<div class="set_jy jsErrorcompany">
													<span class="icon_gth"></span><em></em>
												</div>
											</div>
											<div class="mb20 clearfix position_r validation_or">
												<span class="left"> <span> <input
															name="position" require="false" type="text" value=""
															msg="职位手动输入最多10个字" datatype="limit" max="30"
															class="input_325  input_select"
															placeholder="请选择职位，手动输入最多10个字" /> </span>
													<ul class="sel_hide">
														<li data-value="">
															请选择职位
														</li>
														<li data-value="技术经理">
															技术经理
														</li>
														<li data-value="项目经理">
															项目经理
														</li>
														<li data-value="产品经理">
															产品经理
														</li>
														<li data-value="架构师">
															架构师
														</li>
														<li data-value="数据库工程师">
															数据库工程师
														</li>
														<li data-value="安全工程师">
															安全工程师
														</li>
														<li data-value="系统/运维工程师">
															系统/运维工程师
														</li>
														<li data-value="网络工程师">
															网络工程师
														</li>
														<li data-value="开发工程师/程序员">
															开发工程师/程序员
														</li>
														<li data-value="测试工程师">
															测试工程师
														</li>
														<li data-value="技术支持/售前/售后">
															技术支持/售前/售后
														</li>
														<li data-value="IT顾问/咨询/分析">
															IT顾问/咨询/分析
														</li>
														<li data-value="前端设计师(UI/UE)">
															前端设计师(UI/UE)
														</li>
														<li data-value="非IT部门经理">
															非IT部门经理
														</li>
														<li data-value="非IT部门员工">
															非IT部门员工
														</li>
														<li data-value="销售/市场">
															销售/市场
														</li>
														<li data-value="HR">
															HR
														</li>
														<li data-value="科研人员/教师">
															科研人员/教师
														</li>
														<li data-value="学生">
															学生
														</li>
														<li data-value="采购">
															采购
														</li>
													</ul> </span>
												<span class="left ml15"> <select
														name="_privacy_position">
														<option value="0" selected>
															所有人可见
														</option>
														<option value="1">
															仅粉丝可见
														</option>
														<option value="2">
															仅自己可见
														</option>
													</select> </span>
												<div class="set_jy jsErrorposition">
													<span class="icon_gth"></span><em></em>
												</div>
											</div>
											<div class="clearfix">
												<span class="left"> <span> <select
															name="companysize" class="sel_325">
															<option value="0">
																请选择公司规模
															</option>
															<option value="1">
																99人以下
															</option>
															<option value="2">
																100－249人
															</option>
															<option value="3">
																250－499人
															</option>
															<option value="4">
																500－999人
															</option>
															<option value="5">
																1000人以上
															</option>
														</select> </span> </span>
												<span class="left ml15"> <select
														name="_privacy_companysize">
														<option value="0">
															所有人可见
														</option>
														<option value="1">
															仅粉丝可见
														</option>
														<option value="2">
															仅自己可见
														</option>
													</select> </span>
											</div>
										</dd>

									</dl>
								</div>
								<div class="pl40">
									<div class="Ftitle_all mb25">
										<span class="titxet t18">工作和教育经历</span>
									</div>
								</div>
								<div class="formlist t14 jsformWork" index=0>
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											工作经历：
										</dt>
										<dd class="left  ml10" style="z-index: 8">

											<div class="mb20 clearfix position_r validation_or">
												<span class="left"><input name="workCompanyName"
														require="false" datatype="limit" msg="工作单位字数在0到30之间"
														max="90" type="text" class="input_325"
														placeholder="请填写单位，最多30个字" /> </span>
												<span class="left ml15"> <select
														name="_privacyCompany">
														<option value="0">
															所有人可见
														</option>
														<option value="1">
															仅粉丝可见
														</option>
														<option value="2">
															仅自己可见
														</option>
													</select> </span>
												<div class="set_jy jsErrorworkCompanyName">
													<span class="icon_gth"></span><em></em>
												</div>
											</div>
											<div class="mb20 clearfix position_r validation_or">
												<span class="left"> <span> <input
															name="workPosition" type="text" max="30"
															class="input_325  input_select"
															placeholder="请选择职位，手动输入最多10个字" /> </span>
													<ul class="sel_hide">
														<li data-value="">
															请选择职位
														</li>
														<li data-value="技术经理">
															技术经理
														</li>
														<li data-value="项目经理">
															项目经理
														</li>
														<li data-value="产品经理">
															产品经理
														</li>
														<li data-value="架构师">
															架构师
														</li>
														<li data-value="数据库工程师">
															数据库工程师
														</li>
														<li data-value="安全工程师">
															安全工程师
														</li>
														<li data-value="系统/运维工程师">
															系统/运维工程师
														</li>
														<li data-value="网络工程师">
															网络工程师
														</li>
														<li data-value="开发工程师/程序员">
															开发工程师/程序员
														</li>
														<li data-value="测试工程师">
															测试工程师
														</li>
														<li data-value="技术支持/售前/售后">
															技术支持/售前/售后
														</li>
														<li data-value="IT顾问/咨询/分析">
															IT顾问/咨询/分析
														</li>
														<li data-value="前端设计师(UI/UE)">
															前端设计师(UI/UE)
														</li>
														<li data-value="非IT部门经理">
															非IT部门经理
														</li>
														<li data-value="非IT部门员工">
															非IT部门员工
														</li>
														<li data-value="销售/市场">
															销售/市场
														</li>
														<li data-value="HR">
															HR
														</li>
														<li data-value="科研人员/教师">
															科研人员/教师
														</li>
														<li data-value="学生">
															学生
														</li>
														<li data-value="采购">
															采购
														</li>
													</ul> </span>
												<div class="set_jy jsErrorworkPosition">
													<span class="icon_gth"></span><em></em>
												</div>
											</div>
											<div class="mb20 clearfix">
												<span class="left"> <span> <input type="text"
															readonly="readonly" placeholder="入职时间"
															class="input_143 Wdate"
															onfocus="WdatePicker({lang:'zh-cn'})"
															name="workStartTime"> </span> <span class="newline">-</span>
													<span> <input type="text" readonly="readonly"
															placeholder="离职时间" class="input_143 Wdate"
															onfocus="WdatePicker({lang:'zh-cn'})" name="workEndTime">
												</span> <span><input name="workNowTime" type="checkbox"
															value="1" class="jsWorkNowTime" />至今</span> </span>

											</div>
											<div class="add_gz jsAddWork">
												添加工作经历
											</div>
										</dd>

									</dl>
								</div>
								<div class="formlist t14 jsformEdu" index=0>
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											教育经历：
										</dt>
										<dd class="left  ml10">
											<div class="mb20 clearfix position_r validation_or">
												<span class="left"><input name="eduShoolName"
														type="text" class="input_325 " msg="学校名称字数在0到30之间"
														require="false" datatype="limit" max="90"
														placeholder="请填写学校，最多25个字" /> </span>
												<span class="left ml15"> <select name="_privacyEdu">
														<option value="0">
															所有人可见
														</option>
														<option value="1">
															仅粉丝可见
														</option>
														<option value="2">
															仅自己可见
														</option>
													</select> </span>
												<div class="set_jy jsErroreduShoolName">
													<span class="icon_gth"></span><em></em>
												</div>
											</div>
											<div class="mb20 clearfix position_r validation_or">
												<span class="left"><input name="eduClass" type="text"
														msg="学院或专业字数在0到25之间" class="input_325 " require="false"
														datatype="limit" max="90" placeholder="请填写学院或专业，最多25个字" />
												</span>
												<div class="set_jy jsErroreduClass">
													<span class="icon_gth"></span><em></em>
												</div>
											</div>
											<div class="mb20 clearfix">
												<span class="left"> <span> <input type="text"
															readonly="readonly" placeholder="入学时间"
															class="input_143 Wdate"
															onfocus="WdatePicker({lang:'zh-cn'})" name="eduStartTime">
												</span> </span>
											</div>
											<div class="add_gz jsAddEdu">
												添加教育经历
											</div>
										</dd>

									</dl>
								</div>


								<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											专业技能：
										</dt>
										<dd class="left  ml10">
											<div class="clearfix">
												<span class="left mr5"> <select
														name="professionalArea" id="jsChangeProfessional">
														<option value="0">
															请选择领域
														</option>
														<option value="204">
															移动开发
														</option>
														<option value="199">
															Web开发
														</option>
														<option value="8878">
															认证考试
														</option>
														<option value="243">
															数据库
														</option>
														<option value="2389">
															大数据
														</option>
														<option value="2662">
															系统运维
														</option>
														<option value="2499">
															企业信息化
														</option>
														<option value="2380">
															其他
														</option>
														<option value="1497">
															开发技术
														</option>
														<option value="571">
															云技术
														</option>
														<option value="159">
															虚拟化
														</option>
													</select> </span>
												<span class="left"> <select name="professionalSkill"
														id="jsProfessionalSkill">
														<option value="">
															请选择技能
														</option>
													</select> </span>
												<span class="left ml15">最多选5个技能</span>
											</div>
											<div class="add_zyjn jsProfessional"></div>
											<input type="hidden" value="" id="professionalSkill"
												name="professionalSkill">
										</dd>

									</dl>
								</div>
								<input type="hidden" name="workIndex" value="">
								<input type="hidden" name="eduIndex" value="">
								<div class="grzlbox_btn">
									<input name="" type="submit" value="保存修改 "
										class="setbtn_save jsSaveUserInfo">
								</div>
							</div>
						</form>
					</div>
					<div class="setmain_r right"  id="systememail" style="dislay:none">
						<div class="setbox">
							<div class="Ftitle_all mb25">
								<span class="titxet t18">绑定邮箱</span>
								<span class="pl20 cl_yel emailstatus">绑定邮箱，可快速登录，快速找回密码</span>
							</div>
							<div class="xgyx_box pt10">
								<dl class="xgyx_dl mb20 clearfix">
									<dt class="left">
										<span>邮箱：</span>
									</dt>
									<dd class="left">
										<div class="position_r validation_or">
											<div>
												<input name="checkEmail" onblur="checkEmail(this)"
													type="text" class="input_xgyx inputtext_del" />
											</div>
											<div class="set_jy">
												<span class="icon_gth"></span>发送内容含有违
												<em>禁字***</em>，请删除后重新发送
											</div>
										</div>
									</dd>

								</dl>
								<dl class="xgyx_dl clearfix">
									<dt class="left">
										<span>验证码：</span>
									</dt>
									<dd class="left">
										<div class="yzmbox position_r validation_or">
											<div class="clearfix">
												<input maxlength="4"
													name="captcha" type="text"
													class="input_xgmm inputtext_del left" />
												<span class="yzmimg left">
												</span>
											</div>
											<div class="set_jy mt5">
												<span class="icon_gth"></span>发送内容含有违
												<em>禁字***</em>，请删除后重新发送
											</div>
										</div>
									</dd>
								</dl>
								<p class="textts">
									提示：您的邮箱会收到一封确认信，请点击激活以确认更改邮箱成功。
								</p>
								<div class="xgyxbox_btn">
									<div>
										<input name="" type="button"
											value="绑定" class="setbtn_save" id="setbtn_save" />
									</div>
									<div class="set_jy mt5">
										<span class="icon_gth"></span>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!--主体结束-->
		<!--底部开始-->
		<div class="Ffooter">
			<div class="center">
				<p>
					Copyright © 2017-2017 IT课堂.COM 京ICP证060544号 版权所有 未经许可 请勿转载
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
		<script
			src="https://static5.51cto.com/home/web/js/form_check/jquery.validator.reg.js?v=10002"></script>
		<script
			src="https://static5.51cto.com/home/web/js/form_check/jquery.corners.min.js?v=10002"></script>
		<script
			src="https://static5.51cto.com/home/web/js/WdatePicker.js?v=10002"></script>
		<script
			src="https://static5.51cto.com/home/web/js/template/guanzhu.js?v=10002"></script>
		<script
			src="https://static5.51cto.com/home/web/js/public/info_index.js?v=10002"></script>
	</body>
</html>
