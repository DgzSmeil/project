<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="SQLBean.JifenBean"%>
<%@ page import="SQLBean.StudentBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<title>IT课堂_专业的IT技能学习平台|自学网络视频教程|IT在线培训课程|Python|大数据|Java|PHP|IT考证|产品经理|Office|IT在线教育</title>
		<meta name="keywords"
			content="IT在线教育,IT在线培训,IT培训,我要自学网,IT精品课,大数据培训,Python培训,Linux运维培训,华为认证培训,安卓培训,软考培训,PHP培训,微职位,慕课,MOOC,慕课课程" />
		<meta name="description"
			content="51CTO学院IT职业在线教育平台是依托12年行业品牌、1400万IT技术用户建立的专业IT技能学习培训平台，已签约1000多位技术专家发布了12万个自学式实战慕课MOOC视频。此外，我们还开设了辅导式微职位IT在线培训班，涵盖Python培训、Linux运维培训、大数据培训、Web前端培训、IT考证培训等领域，随到随学、通关学习、一对一辅导，助你升职加薪。" />
		<link
			href="https://static1.51cto.com/edu/center/css/base.css?v=2.3.36"
			rel="stylesheet">
		<link href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.41"
			rel="stylesheet">
		<link href="https://static1.51cto.com/edu/center/css/home.css"
			rel="stylesheet">
		<script>
</script>
		<script src="https://static1.51cto.com/edu/center/js/jquery.min.js"></script>
		<script
			src="https://static1.51cto.com/edu/center/js/prototype_create.js"></script>
		<script
			src="https://static1.51cto.com/edu/center/js/plugins.js?v=1.0.3"></script>
		<script src="https://static1.51cto.com/edu/plugin/mbox.js?v=1.0.1"></script>
		<script
			src="https://static1.51cto.com/edu/center/js/autoload_list.js?v=1.0.1"></script>
		<script src="https://static1.51cto.com/edu/center/js/base.js?v=1.0.3"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#remen1").bind("click",function(){
					$("#data").css("display","block");
					$("#data1").css("display","none")
				
				});
				$("#linux").bind("click",function(){
					$("#data").css("display","none");
					$("#data1").css("display","block");
					$("#remen").css("class","");
					$("#linux").css("class","show");
				
				});
				$("#windows").bind("click",function(){
					alert("windows");
				
				});
				$("#remen2").bind("click",function(){
					$("#data2").css("display","block");
					$("#data3").css("display","none")
				
				});
				$("#openstack").bind("click",function(){
					$("#data3").css("display","block");
					$("#data2").css("display","none")
				});
				$("#remen3").bind("click",function(){
					$("#data4").css("display","block");
					$("#data5").css("display","none")
				
				});
				$("#hadoop").bind("click",function(){
					$("#data5").css("display","block");
					$("#data4").css("display","none")
				});
				$("#remen4").bind("click",function(){
					$("#data6").css("display","block");
					$("#data7").css("display","none")
				
				});
				$("#php").bind("click",function(){
					$("#data7").css("display","block");
					$("#data6").css("display","none")
				});
				$("#remen5").bind("click",function(){
					$("#data8").css("display","block");
					$("#data9").css("display","none")
				
				});
				$("#python").bind("click",function(){
					$("#data9").css("display","block");
					$("#data8").css("display","none")
				});
				$("#remen6").bind("click",function(){
					$("#data10").css("display","block");
					$("#data11").css("display","none")
				
				});
				$("#ruanjian").bind("click",function(){
					$("#data11").css("display","block");
					$("#data10").css("display","none")
				});
				$("#remen7").bind("click",function(){
					$("#data12").css("display","block");
					$("#data13").css("display","none")
				
				});
				$("#ruankao").bind("click",function(){
					$("#data13").css("display","block");
					$("#data12").css("display","none")
				});
				$("#remen8").bind("click",function(){
					$("#data14").css("display","block");
					$("#data15").css("display","none")
				
				});
				$("#mysql").bind("click",function(){
					$("#data15").css("display","block");
					$("#data14").css("display","none")
				});
				$("#remen9").bind("click",function(){
					$("#data16").css("display","block");
					$("#data17").css("display","none")
				
				});
				$("#inter").bind("click",function(){
					$("#data17").css("display","block");
					$("#data16").css("display","none")
				});
				$("#remen10").bind("click",function(){
					$("#data18").css("display","block");
					$("#data19").css("display","none")
				
				});
				$("#study").bind("click",function(){
					$("#data19").css("display","block");
					$("#data18").css("display","none")
				});
				$("#remen11").bind("click",function(){
					$("#data20").css("display","block");
					$("#data21").css("display","none")
				
				});
				$("#html5").bind("click",function(){
					$("#data21").css("display","block");
					$("#data20").css("display","none")
				});
				$("#remen12").bind("click",function(){
					$("#data22").css("display","block");
					$("#data23").css("display","none")
				
				});
				$("#unity3d").bind("click",function(){
					$("#data23").css("display","block");
					$("#data22").css("display","none")
				});
			});
		</script>
	</head>
	<body>
		<%
			StudentBean studentBean = (StudentBean) session
					.getAttribute("bean");
			int num = 0;
			if (session.getAttribute("num") != null) {
				num = Integer.parseInt(session.getAttribute("num").toString());
			}
			JifenBean jifen = (JifenBean) session.getAttribute("jifenBean");
		%>
		<!-- 通用顶部导航 start -->
		<div class="IndexHeader_old_bg Header3">
			<ul class="Page IndexHeader_old">
				<li class="fl">
					<p class="f12 c66">
						IT人充电，上IT课堂！
					</p>
				</li>
				<li class="fr">
					<span class="tab_list">网站导航</span>
					<div class="tab_more network_list">
						<ul class="list">
							<li class="list_child">
								<h2>
									线上学习
								</h2>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/px/?wzdh" target="_blank">微职位</a>
							</li>
							<li class="list_child">
								<a
									href="http://edu.51cto.com/course/courseList/id-all.html?wzdh"
									target="_blank">视频课程</a>
							</li>
							<li class="list_child">
								<a href="/center/skillmap/index/list" target="_blank">技能图谱</a>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/activity/lists/id-23.html?wzdh"
									target="_blank">企业学习</a>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/activity/lists/id-10.html?wzdh"
									target="_blank">APP下载</a>
							</li>
						</ul>
						<ul class="list list_on">
							<li class="list_child">
								<h2></h2>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/user/studyGains.html?wzdh"
									target="_blank">学员故事</a>
							</li>
							<li class="list_child">
								<a href="http://51edu.blog.51cto.com/8899635/1862738"
									target="_blank">学员QQ群</a>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/lecturer/leclist.html?wzdh"
									target="_blank">签约讲师</a>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/partner/index.html?wzdh"
									target="_blank">合作机构</a>
							</li>
							<li class="list_child">
								<a href="http://book.51cto.com/" target="_blank">读书频道</a>
							</li>
						</ul>
						<ul class="list">
							<li class="list_child">
								<h2>
									互动社区
								</h2>
							</li>
							<li class="list_child">
								<a href="http://blog.51cto.com/" target="_blank">博客</a>
							</li>
							<li class="list_child">
								<a href="http://bbs.51cto.com/" target="_blank">论坛</a>
							</li>
							<li class="list_child">
								<a href="http://down.51cto.com/" target="_blank">下载</a>
							</li>
							<li class="list_child">
								<a href="http://weizhan.51cto.com/" target="_blank">微站</a>
							</li>
							<li class="list_child">
								<a href="http://home.51cto.com/" target="_blank">家园</a>
							</li>
						</ul>
						<ul class="list">
							<li class="list_child">
								<h2>
									媒体资讯
								</h2>
							</li>
							<li class="list_child">
								<a href="http://www.51cto.com/tag/practice/" target="_blank">实践录</a>
							</li>
							<li class="list_child">
								<a href="http://zhuanlan.51cto.com/" target="_blank">专栏</a>
							</li>
							<li class="list_child">
								<a href="http://www.51cto.com/tag/original/" target="_blank">原创</a>
							</li>
							<li class="list_child">
								<a href="http://www.51cto.com/tag/translation/" target="_blank">译文</a>
							</li>
							<li class="list_child">
								<a href="http://www.51cto.com/col/35/" target="_blank">专题</a>
							</li>
						</ul>
						<ul class="list list_on">
							<li class="list_child">
								<h2></h2>
							</li>
							<li class="list_child">
								<a href="http://developer.51cto.com/col/1728/" target="_blank">人工智能</a>
							</li>
							<li class="list_child">
								<a href="http://mdsa.51cto.com/" target="_blank">MDSA</a>
							</li>
							<li class="list_child">
								<a href="http://news.51cto.com/col/1717/" target="_blank">早报</a>
							</li>
							<li class="list_child">
								<a href="http://cio.51cto.com/col/1721/" target="_blank">调查</a>
							</li>
							<li class="list_child">
								<a href="http://www.51cto.com/tag/video/" target="_blank">视频</a>
							</li>
						</ul>
						<ul class="list">
							<li class="list_child">
								<h2>
									线下学习
								</h2>
							</li>
							<li class="list_child">
								<a href="http://x.51cto.com/?edutop" target="_blank">CTO训练营</a>
							</li>
							<li class="list_child">
								<a href="http://wot.51cto.com/?edutop" target="_blank">WOT峰会</a>
							</li>
							<li class="list_child">
								<a href="http://x.51cto.com/act/cto/caff/?edutop"
									target="_blank">CTO俱乐部</a>
							</li>
							<li class="list_child">
								<a href="http://wot.51cto.com/act/bcsl/info/?edutop"
									target="_blank">百城沙龙</a>
							</li>
						</ul>
						<ul class="list">
							<li class="list_child">
								<h2>
									服务指南
								</h2>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/center/about/index/help"
									target="_blank">帮助中心</a>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/center/about/index/feedback"
									target="_blank">意见反馈</a>
							</li>
							<li class="list_child">
								<a href="http://bbs.51cto.com/thread-1113045-1.html"
									target="_blank">课程登记</a>
							</li>
							<li class="list_child">
								<a href="http://edu.51cto.com/contactqq.html" target="_blank">联系客服</a>
							</li>
							<li class="list_child">
								<a href="http://www.51cto.com/?wzdh" target="_blank">51CTO主站</a>
							</li>
						</ul>
						<ul class="clear" style="height: 0;"></ul>
					</div>
				</li>
				<li class="fr" id="TopCart">
					<a href="<%=basePath%>courselistservlet?order=mycar1"
						target="_blank" class="red">购物车<%=num%></a>
				</li>
				<li class="fr reg">
					<a href="<%=basePath%>datainfo/zhuce.jsp" target="_blank">注册</a>
				</li>
				<c:if test="${studentBean==null}">
					<li class="fr">
						<a href="<%=basePath%>datainfo/login.jsp">登录</a>
					</li>
				</c:if>
				<c:if test="${studentBean!=null}">
					<li class="fr">
						<a href="<%=basePath%>loginservlet?order=exit">安全退出</a>
					</li>
					<c:if test="<%=studentBean.getVIP() != 1%>">
						<li class="fr reg">
							<a
								href="<%=basePath%>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile()%>"
								target="_blank"><%=studentBean.getStudentname()%>&nbsp;<img
									src="<%=basePath%>images/vip_grey2.png"
									style="float: right; margin-top: 8px; height: 20px; width: 20px; border-radius: 50%" />
							</a>
						</li>
					</c:if>
					<c:if test="<%=studentBean.getVIP() == 1%>">
						<li class="fr reg">
							<a
								href="<%=basePath%>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile()%>"
								target="_blank"><%=studentBean.getStudentname()%>&nbsp;<img
									src="<%=basePath%>images/vipred.png"
									style="float: right; margin-top: 8px; height: 20px; width: 20px; border-radius: 50%" />
							</a>
						</li>
					</c:if>
				</c:if>
				<li class="clear"></li>
			</ul>
		</div>
		<!-- 通用顶部导航 end -->
		<div class="Page adverTop">
			<a href="<%=basePath%>huiyuanservlet?order=list&n=n" target="_blank">
				<img src="<%=basePath%>images/20170515.png"> </a>
		</div>
		<div class="Header3 white Fix">
			<div class="Page">
				<ul>
					<li class="fl logo">
						<a href="/"><img src="<%=basePath%>image/itlogo.png"> </a>
					</li>
					<li class="fl">
						<a href="<%=basePath %>courselistservlet?order=list">首页</a>
					</li>
					<li class="fl">
						<a href="/center/course/index/list">找课程</a>
						<div class="ALLCourse" id="ALLCourse">
							<div class="List" id="ALLCourseList"></div>
						</div>
					</li>
					<li class="fl">
						<a href="/center/wejob/index/list">微职位</a>
					</li>
					<li class="fl">
						<a href="/center/special/index/list">专题</a>
					</li>
					<li class="fl">
						<a href="/center/skillmap/index/list">首页</a>
					</li>
					<li class="topSearch fl">
						<form action="/center/course/index/search" method="get"
							id="TopSearchFrom">
							<input type="text" placeholder="找课程,找讲师" name="q" maxlength="30">
							<button class="icon search" type="submit"></button>
						</form>
					</li>
					<li class="fr links">
						<a href="javascript:void(0);"> <i class="icon"></i> </a>
						<div class="More">
							<dl>
								<dt>
									线上学习
								</dt>
								<dd class="th2">
									<p>
										<a href="http://edu.51cto.com/px/?wzdh" target="_blank">微职位</a>
									</p>
									<p>
										<a
											href="http://edu.51cto.com/course/courseList/id-all.html?wzdh"
											target="_blank">视频课程</a>
									</p>
									<p>
										<a href="http://edu.51cto.com/roadmap/index.html?wzdh"
											target="_blank">技能图谱</a>
									</p>
									<p>
										<a href="http://edu.51cto.com/activity/lists/id-23.html?wzdh"
											target="_blank">企业学习</a>
									</p>
									<p>
										<a href="http://edu.51cto.com/activity/lists/id-10.html?wzdh"
											target="_blank">APP下载</a>
									</p>
									<p>
										<a href="http://edu.51cto.com/user/studyGains.html?wzdh"
											target="_blank">学员故事</a>
									</p>
									<p>
										<a href="http://51edu.blog.51cto.com/8899635/1862738"
											target="_blank">学员QQ群</a>
									</p>
									<p>
										<a href="http://edu.51cto.com/lecturer/leclist.html?wzdh"
											target="_blank">签约讲师</a>
									</p>
									<p>
										<a href="http://edu.51cto.com/partner/index.html?wzdh"
											target="_blank">合作机构</a>
									</p>
									<p>
										<a href="http://book.51cto.com/" target="_blank">读书频道</a>
									</p>
								</dd>
							</dl>
							<dl>
								<dt>
									互动社区
								</dt>
								<dd class="th1">
									<p>
										<a href="http://blog.51cto.com/" target="_blank">博客</a>
									</p>
									<p>
										<a href="http://bbs.51cto.com/" target="_blank">论坛</a>
									</p>
									<p>
										<a href="http://down.51cto.com/" target="_blank">下载</a>
									</p>
									<p>
										<a href="http://weizhan.51cto.com/" target="_blank">微站</a>
									</p>
									<p>
										<a href="http://home.51cto.com/" target="_blank">家园</a>
									</p>
								</dd>
							</dl>
							<dl>
								<dt>
									媒体资讯
								</dt>
								<dd class="th2">
									<p>
										<a href="http://www.51cto.com/tag/practice/" target="_blank">实践录</a>
									</p>
									<p>
										<a href="http://zhuanlan.51cto.com/" target="_blank">专栏</a>
									</p>
									<p>
										<a href="http://www.51cto.com/tag/original/" target="_blank">原创</a>
									</p>
									<p>
										<a href="http://www.51cto.com/tag/translation/"
											target="_blank">译文</a>
									</p>
									<p>
										<a href="http://www.51cto.com/col/35/" target="_blank">专题</a>
									</p>
									<p>
										<a href="http://developer.51cto.com/col/1728/" target="_blank">人工智能</a>
									</p>
									<p>
										<a href="http://mdsa.51cto.com/" target="_blank">MDSA</a>
									</p>
									<p>
										<a href="http://news.51cto.com/col/1717/" target="_blank">早报</a>
									</p>
									<p>
										<a href="http://cio.51cto.com/col/1721/" target="_blank">调查</a>
									</p>
									<p>
										<a href="http://www.51cto.com/tag/video/" target="_blank">视频</a>
									</p>
								</dd>
							</dl>
							<dl>
								<dt>
									线下学习
								</dt>
								<dd class="th1">
									<p>
										<a href="http://x.51cto.com/?edutop" target="_blank">CTO训练营</a>
									</p>
									<p>
										<a href="http://wot.51cto.com/?edutop" target="_blank">WOT峰会</a>
									</p>
									<p>
										<a href="http://x.51cto.com/act/cto/caff/?edutop"
											target="_blank">CTO俱乐部</a>
									</p>
									<p>
										<a href="http://wot.51cto.com/act/bcsl/info/?edutop"
											target="_blank">百城沙龙</a>
									</p>
								</dd>
							</dl>
							<dl class="noBorder">
								<dt>
									服务指南
								</dt>
								<dd class="th1">
									<p>
										<a href="http://edu.51cto.com/center/about/index/help"
											target="_blank">帮助中心</a>
									</p>
									<p>
										<a href="http://edu.51cto.com/center/about/index/feedback"
											target="_blank">意见反馈</a>
									</p>
									<p>
										<a href="http://bbs.51cto.com/thread-1113045-1.html"
											target="_blank">课程登记</a>
									</p>
									<p>
										<a href="http://edu.51cto.com/contactqq.html" target="_blank">联系客服</a>
									</p>
									<p>
										<a href="http://www.51cto.com/?wzdh" target="_blank">51CTO主站</a>
									</p>
								</dd>
							</dl>
						</div>
						<div class="empty"></div>
					</li>
					<li class="fr">
						<a class="fr" href="http://edu.51cto.com/user/login.html">登录/注册</a>
					</li>
					<li class="clear"></li>
				</ul>
			</div>
		</div>

		<!-- logo search start -->
		<div class="Page search_box_top" id="Nav01">
			<div class="fl Logo">
				<a href="<%=basePath%>courselistservlet?order=list" target="_blank"
					title="IT课堂_中国最大的IT技能学习平台"> <!-- <img src="https://static1.51cto.com/edu/center/images/activity/logo.gif" class="fl"> -->
					<img class="fl" src="<%=basePath%>image/itlogo.png"
						style="width: 200px; height: 40px; margin-top: 10px"> </a>
			</div>
			<div class="fr Search">
				<form class="form-search" id="Search" method="post"
					action="<%=basePath %>courselistservlet?order=shousuo"
					target="_blank">
					<button type="submit" class="fr"
						onclick="_educto.push(['_trackEvent', 'edu', 'search',$('#searchQ').val()])"></button>
					<input type="text" class="fr" id="searchQ" name="sousuo"
						placeholder="找课程、找讲师">
				</form>
				<div class="fl Select" id="SearchSelect">
					<p>
						找课程
					</p>
					<ul>
						<li sear=1>
							找课程
						</li>
						<li sear=2>
							找讲师
						</li>
					</ul>
				</div>
				<div class="hotKey">
					<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">OpenCV</a>
					<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">kotlin</a>
					<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
						target="_blank">图书8折</a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<!-- logo search end -->

		<!-- nav start -->
		<div class="Page NavTop">
			<div class="fl Left">
				全部课程
			</div>
			<ul class="fl">
				<li>
					<a href="<%=basePath%>courselistservlet?order=list"
						target="_blank">首页</a>
				</li>
				<li>
					<p class="more">
						<a href="<%=basePath %>findcourselistservlet?order=list"
							target="_blank">职业生涯</a>
					</p>
					<div class="more">
						<a href="http://edu.51cto.com/package/packagelist.html?edunav"
							target="_blank">专题(套餐)</a>
						<a href="http://edu.51cto.com/center/discount/activity?edunav"
							target="_blank">限时折扣</a>
						<a href="http://51edu.blog.51cto.com/8899635/1893141?edunav"
							target="_blank">好课秒杀</a>
						<a href="http://edu.51cto.com/center/course/index/list?is_vip=1"
							target="_blank">会员免费</a>
						<a href="http://edu.51cto.com/zt/microClass?dhxl" target="_blank"
							style="color: #c01920;">实战微课</a>
						<a href="http://edu.51cto.com/course/courseList/id-all.html?dhxl"
							target="_blank">全部课程</a>
					</div>
				</li>
				<li>
					<a href="<%=basePath %>findcourselistservlet?order=list" target="_blank">微职位培训</a>
				</li>
				<li class="border">
					<i></i>
				</li>
				<li>
					<p class="more">
						社区
					</p>
					<div class="more">
						<a href="javascript:void(0);" target="_blank">博客</a>
						<a href="javascript:void(0);" target="_blank">论坛</a>
						<a href="javascript:void(0);" target="_blank">下载</a>
					</div>
				</li>
				<li>
					<a href="javascript:void(0);" target="_blank">读书</a>
				</li>
				<li>
					<a href="javascript:void(0);"
						target="_blank">企业培训</a>
				</li>
				<li>
					<p class="more">
						线下学习
					</p>
					<div class="more">
						<a href="javascript:void(0);"
							target="_blank">CTO训练营</a>
						<a href="javascript:void(0);" target="_blank">WOT峰会</a>
						<a href="javascript:void(0);"
							target="_blank">百城沙龙</a>
					</div>
				</li>
				<li class="border">
					<i></i>
				</li>
				<li>
					<a href="javascript:void(0);"
						target="_blank">讲师</a>
				</li>
				<li>
					<a href="javascript:void(0);" target="_blank">学员故事</a>
				</li>
				<!-- <li><a class="red" href="http://home.51cto.com/members/in-fo?edu" target="_blank">会员专区</a></li> -->
			</ul>
			<p class="fr">
				<a href="javascript:void(0);"
					target="_blank">我要开课</a>
			</p>
			<div class="clear"></div>
		</div>
		<!-- nav end -->

		<!-- banner start -->
		<div class="NavBanner">
			<!-- <div class="whatBG"></div> -->
			<div class="Page">
				<!-- banner 左侧nav -->
				<ul class="Left">
					<li class="first">
						<h2>
							<a href="javascript:void(0);"
								target="_blank">系统/运维</a>
							<i></i>
							<a href="javascript:void(0);"
								target="_blank">云计算</a>
							<i></i>
							<a href="javascript:void(0);"
								target="_blank">大数据</a>
						</h2>

						<p>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank" class="">Linux</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank" class="">OpenStack</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank" class="">Hadoop</a>
						</p>
						<div class="More">
							<dl class="fl">
								<dt>
									系统/运维
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Linux">Linux<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Windows">Windows<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Unix">Unix<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Mac os">Mac os<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									云计算
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="OpenStack">OpenStack<i class="hot"></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="虚拟化">虚拟化<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="云平台">云平台<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Office 365">Office 365<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="云服务">云服务<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Docker">Docker<i class="hot"></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									大数据
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Hadoop">Hadoop<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Spark">Spark<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Storm">Storm<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Hive">Hive<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="Yarn">Yarn<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>

								<dt>
									管家推荐
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank">【折扣】Linux云计算与架构师课程>>抢2000奖学金</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank">XenApp and XenDesktop 7.11 全新深度演绎</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank">【高薪】百万年薪大数据工程师课程>>抢2000奖学金</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank">Linux运维工程师必学技能实战</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank">【火爆】虚拟化与云计算工程师课程>>抢2000奖学金</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
											target="_blank">【免费】Windows全能工程师课程>>抢2000奖学金</a>
									</p>
								</dd>
							</dl>
							<dl class="ad fr">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/03fb27a498f7f16d9ea69161f1de3fb8137c25.png"/>
								</a>
							</dl>
							<div class="White"></div>
						</div>
					</li>
					<li>
						<h2>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">Web开发</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">编程语言</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">软件研发</a>
						</h2>

						<p>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank" class="">PHP</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank" class="">Python</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank" class="">软件测试</a>
						</p>
						<div class="More">
							<dl class="fl">
								<dt>
									Web开发
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="PHP">PHP<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="Html/CSS">Html/CSS<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="JavaScript">JavaScript<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="jQuery">jQuery<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="Node.js">Node.js<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="XML/XSL">XML/XSL<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									编程语言
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="Python">Python<i class="hot"></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="Java">Java<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="C/C++">C/C++<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title=".Net">.Net<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="Ruby">Ruby<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="Go语言">Go语言<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="VB">VB<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="R语言">R语言<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									软件研发
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="软件测试">软件测试<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="敏捷开发">敏捷开发<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="研发管理">研发管理<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="软件设计">软件设计<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="软件架构">软件架构<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>

								<dt>
									管家推荐
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">【火爆】Python自动化|全栈|爬虫课程>>抢2000奖学金</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank">高级JAVA工程师必备</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank">【免费】PHP高端开发工程师课程>>点击申请免费试听</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank">受人欢迎的前端工程师系列</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
											target="_blank">【热门】自动化测试工程师高端课程>>抢2000奖学金</a>
									</p>
									<p>
										<a href="" target="_blank"></a>
									</p>
								</dd>
							</dl>
							<dl class="ad fr">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/02775ad07d1008e3a1744184d5bb855b4bed54.png">
								</a>
							</dl>
							<div class="White"></div>
						</div>
					</li>
					<li>
						<h2>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">考试认证</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">数据库</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">网络/安全</a>
						</h2>

						<p>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank" class="">软考</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank" class="">MySQL</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank" class="">网络管理</a>
						</p>
						<div class="More">
							<dl class="fl">
								<dt>
									考试认证
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="软考">软考<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="红帽认证">红帽认证<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="华为认证">华为认证<i class="hot"></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="思科认证">思科认证<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="微软认证">微软认证<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="H3C认证">H3C认证<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="等级考试">等级考试<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									数据库
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="MySQL">MySQL<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="Oracle">Oracle<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="SQL Server">SQL Server<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="Access">Access<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="NoSQL">NoSQL<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="MongoDB">MongoDB<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="Hbase">Hbase<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="Sybase">Sybase<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									网络/安全
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="网络管理">网络管理<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="路由交换">路由交换<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="安全技术">安全技术<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="通信技术">通信技术<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="数据中心">数据中心<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>

								<dt>
									管家推荐
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank">【华为】零基础签约100%一次过华为>>了解保过班</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank">备战2017软考网络工程师终极解密</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank">【软考】零基础签约100%一次过软考>>了解保过班</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank">韩立刚老师门徒套餐（Windows Server+网络安全+数据库）</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
											target="_blank">【红帽】红帽认证签约100%一次过红帽>>了解保过班</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"></a>
									</p>
								</dd>
							</dl>
							<dl class="ad fr">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/879f88360323a9f3c1a41030c46f2f59bcebb9.png">
								</a>
							</dl>
							<div class="White"></div>
						</div>
					</li>
					<li>
						<h2>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">人工智能</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">移动开发</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">游戏开发</a>
						</h2>

						<p>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank" class="">深度学习</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank" class="">HTML5</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank" class="">Unity3D</a>
						</p>
						<div class="More">
							<dl class="fl">
								<dt>
									人工智能
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="深度学习">深度学习<i class="new"></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="机器人开发">机器人开发<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									移动开发
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="HTML5">HTML5<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="移动测试">移动测试<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="微信开发">微信开发<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="iOS">iOS<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="Android">Android<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="Swift">Swift<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="WinPhone">WinPhone<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									游戏开发
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="Unity3D">Unity3D<i class="new"></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="Cocos2d-x">Cocos2d-x<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="VR虚拟现实">VR虚拟现实<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="手游开发">手游开发<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="3D游戏">3D游戏<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="开发工具">开发工具<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>

								<dt>
									管家推荐
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank">【折扣】Android高级开发工程师课程>>抢2000奖学金</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank">人工智能-深度学习实践套餐</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank">【免费】Unity游戏开发工程师课程>>申请免费试听</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
											target="_blank">Unity3D游戏开发工程师职业学习套餐</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"></a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"></a>
									</p>
								</dd>
							</dl>
							<dl class="ad fr">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/a7b4d538311dfa685a64293cbba5f013f614e9.png">
								</a>
							</dl>
							<div class="White"></div>
						</div>
					</li>
					<li>
						<h2>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">嵌入式</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">服务器</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">企业信息化</a>
						</h2>

						<p>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank" class="">嵌入式Linux</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank" class="">Exchange</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank" class="">项目管理</a>
						</p>
						<div class="More">
							<dl class="fl">
								<dt>
									嵌入式
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="嵌入式Linux">嵌入式Linux<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="驱动/内核开发">驱动/内核开发<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="单片机/工控">单片机/工控<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="物联网">物联网<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="智能硬件">智能硬件<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									服务器
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="Exchange">Exchange<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="Windows Server">Windows Server<i
											class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="Lync">Lync<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="SharePoint">SharePoint<i class=""></i>
										</a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="Nginx">Nginx<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="集群">集群<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="分布式">分布式<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="邮件服务器">邮件服务器<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									企业信息化
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="项目管理">项目管理<i class="hot"></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="ERP">ERP<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="CRM">CRM<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="BPM">BPM<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="管理软件">管理软件<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>

								<dt>
									管家推荐
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank">0基础一个月学会51单片机</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank">PMP认证网络套餐（免费提供35永久PMP考试学时证明）</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank">微软Dynamics CRM和Exchange 双剑合璧套餐</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank">嵌入式软件工程师学习路线图-项目实战</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
											target="_blank">FastDFS实战开发与Nginx实战</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"></a>
									</p>
								</dd>
							</dl>
							<dl class="ad fr">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/e4cfed8996a58df603f746a540e3b3c140adc9.png">
								</a>
							</dl>
							<div class="White"></div>
						</div>
					</li>
					<li class="last">
						<h2>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
								target="_blank">Office办公</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
								target="_blank">产品/设计</a>
							<i></i>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
								target="_blank">其它</a>
						</h2>

						<p>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
								target="_blank" class="">Excel</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
								target="_blank" class="">产品经理</a>
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
								target="_blank" class="">IT职场</a>
						</p>
						<div class="More">
							<dl class="fl">
								<dt>
									Office办公
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="Excel">Excel<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="PPT">PPT<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="Word">Word<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									产品/设计
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="产品经理">产品经理<i class="hot"></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="互联网运营">互联网运营<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="交互设计">交互设计<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="平面设计">平面设计<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="室内设计">室内设计<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>
								<dt>
									其它
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="IT职场">IT职场<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="网络营销">网络营销<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="多媒体">多媒体<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="英语四六级">英语四六级<i class=""></i> </a>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank" title="其他">其他<i class=""></i> </a>
									</p>
								</dd>

								<dt>
									管家推荐
								</dt>
								<dd>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank">【热门】职场办公必备Office技能实战直播课>>点击查看</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank">【火爆】企业实战办公英语直播系列课程>>点击查看</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank">产品经理设计实战视频课程套餐</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
											target="_blank">手把手教你做产品经理</a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}" target="_blank"></a>
									</p>
									<p>
										<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}" target="_blank"></a>
									</p>
								</dd>
							</dl>
							<dl class="ad fr">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/a1c58f1883efeaf4bda0265999822bb3ebaa90.png"/>
								</a>
							</dl>
							<div class="White"></div>
						</div>
					</li>

				</ul>
				<!-- banner 右侧login -->
				<div class="Login">
					<div class="UserInfo">
						<c:if test="${studentBean!=null}">
		                	<div class="Avatar">
		                    	<a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>"><img src="<%=basePath%><%=studentBean.getStudentface() %>" id="UserAvatar" style="width:60px;height:60px;margin-top:8p;x border-radius:50%;margin-left:0px"></a>
		                    	<img src="<%=basePath %>images/avatar.png" >
		               	 	</div>
		               	 	<div class="Main">
							<h3 id="UserName" class="oneLine">
								<%=studentBean.getStudentname() %>
							</h3>
							<p id="UserScore">
								<a>新用户首单7折,送5元劵</a>
							</p>
						</div>
                		</c:if>
						<div class="clear"></div>
						<c:if test="<%=studentBean==null %>">
							<div class="Btns" id="BannerBtn">
								<a href="<%=basePath %>datainfo/login.jsp" class="login fl"
									id="loginBtn">登录</a>
								<a href="<%=basePath %>datainfo/zhuce.jsp"
									class="register fr">注册</a>
							</div>
						</c:if>
					</div>
					<h2 class="NewsList_title">
						热门课程
					</h2>
					<div class="NewsList_bg">
						<ul class="NewsList">
							<c:forEach items="${courselist}" var="s">
								<c:if test="${s.ismoney==0}">
			                		<li><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${s.sectionid}&courseid=${s.course_id}" target="_blank" class="blue" title="【免费】2017Linux高端课程">【免费】${s.course_name}&nbsp;&nbsp;&nbsp;&nbsp;${s.one_word}</a></li>
			                	</c:if>
			                	<c:if test="${s.ismoney==1}">
			                		<li><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${s.sectionid}&courseid=${s.course_id}" target="_blank"  title="【收费】2017Linux高端课程">【付费】${s.course_name}&nbsp;&nbsp;&nbsp;&nbsp;${s.one_word}</a></li>
			                	</c:if>
							</c:forEach>
							<li>
								<a href="http://edu.51cto.com/px/train/94?g" target="_blank"
									title="【免费】Python>>自动化|全栈|爬虫">【免费】Python>>自动化|全栈|爬虫</a>
							</li>
							<li>
								<a href="http://edu.51cto.com/course/course_id-7906.html?wzl"
									target="_blank" class="blue" title="手把手教AE影视动画特效">手把手教AE影视动画特效</a>
							</li>
							<li>
								<a href="http://edu.51cto.com/px/train/115?g" target="_blank"
									title="【折扣】Linux云计算与架构师课程">【折扣】Linux云计算与架构师课程</a>
							</li>
							<!-- 
								
							<li>
								<a href="http://edu.51cto.com/px/train/108?g" target="_blank"
									title="【高薪】百万年薪大数据学习路线图">【高薪】百万年薪大数据学习路线图</a>
							</li>
							<li>
								<a href="http://edu.51cto.com/topic/1126.html?wzl"
									target="_blank" class="blue" title="软考系统集成项目管理工程师基础知识">软考系统集成项目管理工程师基础知识</a>
							</li>
							
							 -->
						</ul>
					</div>
				</div>
				<!-- banner 轮播图 -->
				<div class="Banner">
					<div class="IndexBannerPics IndexBanner">
						<ul class="IndexBannerPicsList">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"> <img
										src="<%=basePath%>/itimage/c73ee6b634d90fe2bb1755973327d217976c87.png"
										alt="问题反馈"> </a>
							</li>
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">
									<img
										src="<%=basePath%>/itimage/b9f5ae672192707eb17991967ef864624f856a.png"
										alt="Python"> </a>
							</li>
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean31.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"> <img
										src="<%=basePath%>/itimage/377989516ef31a642c081320256f52ecffa8e2.png"
										alt="WORD"> </a>
							</li>
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank">
									<img
										src="<%=basePath%>/itimage/d315b8081c916c6216d0500e912fb1e22708a8.png"
										alt="Linux"> </a>
							</li>
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"> <img
										src="<%=basePath%>/itimage/a3deb8188b170e2acc66173c4ddec217a97b5e.jpeg"
										alt="红帽认证"> </a>
							</li>
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean6.sectionid}&courseid=${courseBean6.course_id}"
									target="_blank"> <img
										src="<%=basePath%>/itimage/969b0c771f8158c90fa83924abd14f70c131ec.png"
										alt="自然语言处理"> </a>
							</li>
							<!--轮播图-->
						</ul>
						<a href="javascript:;" class="fl IBPB_L"></a>
						<a href="javascript:;" class="fr IBPB_R"></a>
						<ul class="IndexBannerPicsList_Btn">
							<li class="IBPLBs_Iemt IBPLBs_IemtCur"></li>
							<li class="IBPLBs_Iemt "></li>
							<li class="IBPLBs_Iemt "></li>
							<li class="IBPLBs_Iemt "></li>
							<li class="IBPLBs_Iemt "></li>
							<li class="IBPLBs_Iemt "></li>
						</ul>
					</div>
				</div>
			</div>
			<!--培训班广告-->
			<div class="Page banner_list_bg">
				<ul class="banner_list">
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="Python培训|Python学习|Python课程"><img
								src="<%=basePath%>/itimage/771b3f364295f74965a795b2167b13551fea7d.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="Linux培训|Linux学习|Linux课程"><img
								src="<%=basePath%>/itimage/243584a10e3c7355b6e744595118263a237363.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="大数据培训|大数据学习|大数据课程"><img
								src="<%=basePath%>/itimage/d3f50d946c9573a90779540695189f0a4eadfb.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="oracle培训|oracle学习|oracle课程"><img
								src="<%=basePath%>/itimage/13cef20130342fb5551455c99719dba1242b5a.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="PHP培训|PHP学习|PHP课程"><img
								src="<%=basePath%>/itimage/d897c1301a6c4232a61706c94cdab5276609bb.png">
						</a>
					</li>
					<li>
						<a
							href="javascript:void(0);"
							target="_blank" title="HTML5培训|HTML5学习|HTML5课程"><img
								src="<%=basePath%>/itimage/a499a32646d68593b6b963dbbbf5ba69deb734.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="Windows培训|Windows学习|Windows课程"><img
								src="<%=basePath%>/itimage/f35e4f107dc71446b00352e4fda42532de39b0.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="虚拟化培训|虚拟化学习|虚拟化课程"><img
								src="<%=basePath%>/itimage/393942879e6ab112f0d974fd37a3bf259d3e82.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="机器学习培训|机器学习课程"><img
								src="<%=basePath%>/itimage/f7d9d5b792d267bd69e802f2bf52610f576c7a.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="unity培训|unity学习|unity课程"><img
								src="<%=basePath%>/itimage/23611c140feadcd6385621983779df50ba52c1.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="Android培训|Android学习|Android课程"><img
								src="<%=basePath%>/itimage/f9397aa49d58e4a1ea2787906313edc8f20d57.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="自动化测试培训|自动化测试学习|自动化测试课程"><img
								src="<%=basePath%>/itimage/f5bb98b50f0b121912940914fa7ad9781a0753.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="华为认证培训|华为认证学习|华为认证课程"><img
								src="<%=basePath%>/itimage/d41d6a901459c1eca2886409e2a185e4d8f77e.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="软考培训|软考学习|软考课程"><img
								src="<%=basePath%>/itimage/a1027f466a3e66334d095029ce7caee155fa89.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="红帽认证培训|红帽认证学习|红帽认证课程"><img
								src="<%=basePath%>/itimage/87eef6413c423499988556e6bf64ce2f1cf29c.png">
						</a>
					</li>
					<li>
						<a
							href="javascript:void(0);"
							target="_blank" title="access培训|access学习|access课程"><img
								src="<%=basePath%>/itimage/9912cf076d40370a0313482ce47b378fb6e571.png">
						</a>
					</li>
					<li>
						<a
							href="javascript:void(0);"
							target="_blank" title="java培训|java学习|java课程"><img
								src="<%=basePath%>/itimage/22a581c47867ca09147812344fe04c2cff796d.png">
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" target="_blank"
							title="IT考研培训|IT考研学习|IT考研课程"><img
								src="<%=basePath%>/itimage/35e576289071fcf0a6a396a90fd730d7900cad.png">
						</a>
					</li>
					<div class="clear"></div>
				</ul>
			</div>
		</div>
		<!-- banner emd -->
		<!-- 课程列表 start -->
		<div class="Page_bg">
			<p id="nav0"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">系统/运维</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/790550c890c47be45352448aa2bbfdd3030294.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">Linux</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">Windows</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Shell</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen1">
								热门
							</li>
							<li class="" id="linux">
								Linux
							</li>
							<li class="" id="windows">
								Windows
							</li>
							<li class="" id="unix">
								Unix
							</li>
							<li class="" id="mac">
								Mac os
							</li>
							<li class="" id="shujuqita">
								其他
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl"
							style="display: block;" id="data">
							<li>
								<a href="http://edu.51cto.com/px/train/115?sytp" target="_blank"><img
										src="<%=basePath%>/itimage/3522232992ba001085b242ecb07b3195ce3e1f.png">
								</a>
							</li>
							<li class="two">
								<a href="http://edu.51cto.com/px/train/132?sytp" target="_blank"><img
										src="<%=basePath%>/itimage/26a977f3883bc8376079911c23e1a1634f7886.png">
								</a><a
									href="http://edu.51cto.com/course/course_id-8922.html?shouyetupian"
									target="_blank"><img
										src="<%=basePath%>/itimage/f6c591433883454230d038b0aac44b2013c012.png">
								</a>
							</li>
							<li>
								<a
									href="http://edu.51cto.com/pack/view/id-899.html?shouyetupian"
									target="_blank"><img
										src="<%=basePath%>/itimage/f5b2c0e630e48541464993e0f9e4d52ce9cea4.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" id="data1"
							style="display: none;">
							<c:forEach items="${courselist}" var="s">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&courseid=${s.course_id}" 
									target="_blank"><img
										src="${s.picture_url}">
									<p>
										共${s.course_count}课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&courseid=${s.course_id}"
									target="_blank">${s.one_word}</a>
								<p class="course_price">
									<c:if test="${s.ismoney!=1}">
										<span class="first">免费</span>
									</c:if>
									<c:if test="${s.ismoney==1}">
										<span class="first">￥${s.price}</span>
									</c:if>
								</p>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav1"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">云计算</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/a280d318205f9d1fc42954dbe4fc37379d73a0.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">虚拟化</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">云计算</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">Openstack</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen2">
								热门
							</li>
							<li class="" id="openstack">
								OpenStack
							</li>
							<li>
								虚拟化
							</li>
							<li>
								云平台
							</li>
							<li>
								Office 365
							</li>
							<li>
								云服务
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl"
							style="display: block" id="data2">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/2369b8b4222ce8b51d5583ae9d7b54916082de.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d56ae0a88928e4a38bf98991c8674e0a932a30.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/440d9f889f993d41ca295336a35f260a1de857.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none" id="data3">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d567db9812b44ec9f182891bbef029c843e16c.jpg">
									<p>
										共19课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Openstack Newton手动部署实战视频课程</a>
								<p class="course_price">
									<span class="first">￥579</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/88b5f3c197c4720aa2c024f57ccdeabb30f50f.jpg">
									<p>
										共5课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">【张彬Linux】Openstack实战部署、运维和管理实战视频课程</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/651212277ce4c2a828f005d7b943f091279e88.png">
									<p>
										共32课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Openstack从入门到放弃视频课程</a>
								<p class="course_price">
									<span class="first">￥399</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/53efaea0188a617c37d09002f85cff5c3f2397.jpg">
									<p>
										共27课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Openstack入门与实践（ceph+Keystone+虚拟机镜像）视频课程</a>
								<p class="course_price">
									<span class="first">￥29</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav2"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">大数据</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/7342dbd987bab9ca47f4190cabfce77b990f29.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">大数据</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">机器学习</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Storm</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen3">
								热门
							</li>
							<li class="" id="hadoop">
								Hadoop
							</li>
							<li>
								Spark
							</li>
							<li>
								Storm
							</li>
							<li>
								Hive
							</li>
							<li>
								Yarn
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl"
							style="display: block;" id="data4">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/599719470ea5f52109b275d6108b2763df8263.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f809f0509375c11a73c3670e692ac88b9a67eb.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/a65e55b22aafeabbc44977d761ad98c073565e.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f3e24900700654dfbf288273269b3c7e980145.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none" id="data5">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/18c33256b4dd61aed7ec37283f86c7a9.png">
									<p>
										共26课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop 2.x（五） MapReduce案例视频课程</a>
								<p class="course_price">
									<span class="first">￥139</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/764bba98812725e33f2462ea9423fe8c843747.png">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop平台HDFS存储原理、MapReduce与Yarn工作机制视频课程</a>
								<p class="course_price">
									<span class="first">￥119</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/f2e5e91595a18bcbb062515bfaf7520cef4aa1.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">大数据——Zookeeper权威指南视频课程(集群环境搭建+底层API操作+Watcher)（上）</a>
								<p class="course_price">
									<span class="first">￥179</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/10cadcb52b8d6713a5be1d2b1f25f6ed.png">
									<p>
										共43课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop 2.x（一） 大数据基础实战视频课程</a>
								<p class="course_price">
									<span class="first">￥279</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/c2a491e30bd8294304852794050fed5f319b55.jpg">
									<p>
										共8课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop实战教学视频---用Mahout构建职位推荐引擎</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/66cbea861dab62989cc2340cd7807ef73c3056.jpg">
									<p>
										共82课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">大数据——Hadoop大数据实战开发视频课程【李兴华】</a>
								<p class="course_price">
									<span class="first">￥1999</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/wKioL1UQ_oHy1GCfAAdGUutgrdI757.jpg">
									<p>
										共11课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">大数据流处理系统之Apache Kafka专题视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/221e18e806196b21381145b70d4fbf394c68df.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop数据分析实战演练(入门篇)</a>
								<p class="course_price">
									<span class="first">￥19</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav3"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">Web开发</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img
								src="<%=basePath %>itimage/e7a9e8a7549b02a454736284fb680d6aba8298.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">PHP</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">Javascript</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">Jquery</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen4">
								热门
							</li>
							<li class="" id="php">
								PHP
							</li>
							<li>
								Html/CSS
							</li>
							<li>
								JavaScript
							</li>
							<li>
								jQuery
							</li>
							<li>
								Node.js
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl"
							style="display: block" id="data6">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/4548980591b661ce3c23664b89bdf6853d9b8c.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d9c4c157010eb14f8f173325def10e9f410cd3.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/f6e21a989ad8957b87904813262b3dc3cad992.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data7">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/d5bcd8499c3c68c0036883b48bf02cbbf8ee79.png">
									<p>
										共56课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">七日成蝶-ThinkPHP5标准教程（综合实战篇【一】）</a>
								<p class="course_price">
									<span class="first">￥169</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>e0e743495148b4f2012950738eeb979b63e.jpg">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">阿里云ECS Linux服务器项目部署实战视频课程</a>
								<p class="course_price">
									<span class="first">￥69</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/045edde886c2aea1def125d3d42199013d94c6.jpg">
									<p>
										共54课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">PHP开发-零基础到精通疯狂实战教程（第二季）【韦玮老师】</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/59940da3115e6df3a9c16304c42fd310853ba1.jpg">
									<p>
										共43课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">私活级ThinkPHP实战速学视频课程私活级ThinkPHP实战速学视频课程</a>
								<p class="course_price">
									<span class="first">￥159</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/69f1bff6871a7c85fa6971d9411e2aa0e835a2.jpg">
									<p>
										共58课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">PHP动态网站开发实录之后台编程及框架应用视频课程</a>
								<p class="course_price">
									<span class="first">￥79</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav4"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">编程语言</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/95a78d2985fc2e0dcb5773816df179b77db5c4.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">自动化开发</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">全栈开发</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">.net</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen5">
								热门
							</li>
							<li class="" id="python">
								Python
							</li>
							<li>
								Java
							</li>
							<li>
								C/C++
							</li>
							<li>
								.Net
							</li>
							<li>
								Ruby
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display:block" id="data8">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img
										src="<%=basePath%>/itimage/95538ec50419ba94e22173cb5dc4aecc01e64a.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/841d5a158d3c23d8fa63376110fbf103c0bc8e.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b1c861063f6c4df9cb42032a7c5d1b336ece39.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/74dc0e554ab477a7efc418afab65828da94e74.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;"  id="data8">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/d46358d22dfb31b59815847db9fd674315f5a7.jpg">
									<p>
										共64课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Python网络爬虫工程师系列培训视频课程（全套详细版）</a>
								<p class="course_price">
									<span class="first">￥899</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/01caa88868ea87f72aa5935424df6b4a72d585.jpg">
									<p>
										共15课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Python(3.6)黑板报之字典与列表解析</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/865a6c21130612b037a7000b49725e70863902.png">
									<p>
										共22课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Python实战视频课程（面向对象+异常处理+文件管理）-基础篇(老段)</a>
								<p class="course_price">
									<span class="first">￥599</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/92cec4b0302f2521fe57884199fe7e2d7eec47.png">
									<p>
										共133课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Python自动化开发实战视频课程-全新2.0版本</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/556c556806f14d7ddc81089988921ecfff2929.png">
									<p>
										共18课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">跟Alex学-用Python分分钟开发一个BBS论坛系统实战视频课程</a>
								<p class="course_price">
									<span class="first">￥29</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/d5389ed689a0a16707e89874231dcf1eef6fec.png">
									<p>
										共23课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">跟Alex学Python-开发Web实时聊天室撩妹吧</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/b14fe0584c047291e0b216fb7f99c93320793d.png">
									<p>
										共27课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">跟Alex学Python之-快速设计和开发CMDB视频教程</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/29135f16757b3ca9033250274d917ab78912ff.jpg">
									<p>
										共124课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">跟Alex学Python之Python开发基础-1</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav5"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
						target="_blank">软件研发</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/87d378f8606d82b81ab6570782ff01268f4d48.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">自动化测试</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">软件设计</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">软件架构</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen6">
								热门
							</li>
							<li  class="" id="ruanjian">
								软件测试
							</li>
							<li>
								敏捷开发
							</li>
							<li>
								研发管理
							</li>
							<li>
								软件设计
							</li>
							<li>
								软件架构
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl"  style="display:block" id="data10">
							<li>
								<a
									href="http://edu.51cto.com/pack/view/id-928.html?shouyetupian"
									target="_blank"><img
										src="<%=basePath%>/itimage/9555fbc6398c5859ea18086e7418fd3dab1f79.png">
								</a>
							</li>
							<li>
								<a
									href="http://edu.51cto.com/pack/view/id-822.html?shouyetupian"
									target="_blank"><img
										src="<%=basePath%>/itimage/997eea749a7feb51fd1803e0e7b8397db4b15c.png">
								</a>
							</li>
							<li>
								<a
									href="http://edu.51cto.com/pack/view/id-1019.html?shouyetupian"
									target="_blank"><img
										src="<%=basePath%>/itimage/13fc6c382adc626c3012767713e2c394e4d9ce.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data11">
							<li>
								<a class="course_img"
									href="http://edu.51cto.com/course/course_id-5611.html"
									target="_blank"><img
										src="https://s1.51cto.com/images/201603/c7b6b92819c9ace6e9d3073fe2dd08361a0de0.jpg">
									<p>
										共11课时
									</p>
								</a><a class="course_title"
									href="http://edu.51cto.com/course/course_id-5611.html"
									target="_blank">IT测试行业职业生涯规划精品课视频课程（新增了第二章）</a>
								<p class="course_price">
									<span class="first">￥49</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="http://edu.51cto.com/course/course_id-7565.html"
									target="_blank"><img
										src="https://s1.51cto.com/images/201611/f6504d92095d671c9f510262f554afd0b3e6fc.jpg">
									<p>
										共45课时
									</p>
								</a><a class="course_title"
									href="http://edu.51cto.com/course/course_id-7565.html"
									target="_blank">【2016版】自动化测试QuickTest视频课程-上部</a>
								<p class="course_price">
									<span class="first">￥399</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="http://edu.51cto.com/course/course_id-7578.html"
									target="_blank"><img
										src="https://s1.51cto.com/images/201611/011ca3999aabc7aea43689d2850268f5a60dc5.png">
									<p>
										共15课时
									</p>
								</a><a class="course_title"
									href="http://edu.51cto.com/course/course_id-7578.html"
									target="_blank">Selenium IDE WEB 自动化测试入门视频课程（下）</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="http://edu.51cto.com/course/course_id-6364.html"
									target="_blank"><img
										src="https://s1.51cto.com/images/201606/e8a6c5774953c07197559398258d400fea826e.jpg">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="http://edu.51cto.com/course/course_id-6364.html"
									target="_blank">高级性能测试工程师-Nginx性能调优视频课程</a>
								<p class="course_price">
									<span class="first">￥179</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav6"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
						target="_blank">考试认证</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/51b3d8d9259e0bfa106005f97916dbe45f48f9.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">华为认证</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">红帽认证</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">信息安全</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen7">
								热门
							</li>
							<li id="ruankao">
								软考
							</li>
							<li>
								红帽认证
							</li>
							<li>
								华为认证
							</li>
							<li>
								思科认证
							</li>
							<li>
								微软认证
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display:block" id="data12">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
										src="<%=basePath%>/itimage/6453d3262e89acd0ed8247f46b8a2ec9d7546d.png">
								</a>
							</li>
							<li class="two">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
										src="<%=basePath%>/itimage/98c822486b60e41f9959601a42354d67d4b145.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/195ffea59936340fa7807502b044024bd9c105.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/331032a5914fe8cd7eb612a44a3e2584998da0.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data13">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/66c3835678fd601779c37786ebe11cf31b0a50.gif">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017年11月软考-数据库工程师之《数据库设计》视频课程</a>
								<p class="course_price">
									<span class="first">￥29</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201705/b50cb6b37c182b6ae171482b6585196bee81bc.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017软考信息系统项目管理师-考前冲刺重难点解析视频课程</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201610/d3653d924f7cbf69f3e925c9224f57966d39ed.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">软件评测师考试第六季视频课程-程序设计语言基础知识</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201612/f18a6d047cec76e905214079dde19e2b442fa3.jpg">
									<p>
										共37课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017软考信息系统项目管理师-案例分析真题解析视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201612/c39bd3a7971716eca88054398b5a2eac6657ce.jpg">
									<p>
										共30课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017软考系统集成项目管理工程师-基础知识（上）备考视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201703/e55f25b17c7d49356fe046ec80ec5ca33b60df.gif">
									<p>
										共14课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017年11月软考-数据库工程师之《数据库技术基础》</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201703/a741b9a363c350465281718acfe07968d8f5be.jpg">
									<p>
										共58课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">信息安全工程师5天修炼实战视频课程</a>
								<p class="course_price">
									<span class="first">￥518</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201703/02a658904cdbb7fd4fd24840ceda625e57834e.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017软考网络工程师-考前冲刺重、难点串讲视频</a>
								<p class="course_price">
									<span class="first">￥149</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav7"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
						target="_blank">数据库</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/7639fe0714eebeeb657289a3262cca6c535080.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank">Oracle</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">MySQL</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">Redis</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show"  id="remen8">
								热门
							</li>
							<li id="mysql">
								MySQL
							</li>
							<li>
								Oracle
							</li>
							<li>
								SQL Server
							</li>
							<li>
								Access
							</li>
							<li>
								NoSQL
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl" style="display:block" id="data14">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/96fdc51515b26dd8cb20547c236490514c150a.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c863cf3459952878fe79918b3b2bc9961931a6.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/2586ca174f448593920081dc34b7720a07d279.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data15">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201705/61cff510110fd6d5da715790c27578f08a3849.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">201705老男孩的MySQL私房菜深入浅出精品视频第5-6章视频课程</a>
								<p class="course_price">
									<span class="first">￥49</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201603/f27bc33257273b3866a10155bead393461c74c.png">
									<p>
										共138课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">2016最新老男孩MySQL数据库DBA核心视频课程-第一到第十六部完整</a>
								<p class="course_price">
									<span class="first">￥599</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201605/d61543812cd1b554be38811a7695f4c9032e75.jpg">
									<p>
										共1课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">Mysql新手入门视频教程详解</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201608/24128fe640a5ac3128a6387ff6b8812833c575.png">
									<p>
										共24课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">企业常见MySQL架构应用实战(高可用集群系统+调优经验)视频课程</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/d1a040308c1b285733b831fcfd5d871ebc29ae.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">跟王老师学MySQL MySQL的数据类型视频课程</a>
								<p class="course_price">
									<span class="first">￥10</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/a3c01940139a34fefe4270fac9970761a411b6.jpg">
									<p>
										共18课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">精通MySQL存储过程、函数和触发器视频课程（已更新高级部分）</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201609/381ef7312094d043b3c556e0ae082302f8f9c2.jpg">
									<p>
										共16课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">七日成蝶-MySQL5部署及应用（Linux与Windows双环境案例）</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201609/053469535ec499dea0d0547f5fda495fa45ead.jpg">
									<p>
										共6课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">【张彬Linux】MySQL管理与双主集群实战</a>
								<p class="course_price">
									<span class="first">￥109</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav8"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">网络/安全</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/51e5163201dfa19bb770542c0047c4606df678.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">Wireshark</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">黑客</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">防火墙</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show"  id="remen9">
								热门
							</li>
							<li id="inter">
								网络管理
							</li>
							<li>
								路由交换
							</li>
							<li>
								安全技术
							</li>
							<li>
								通信技术
							</li>
							<li>
								数据中心
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display: none;" id="data16">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c4f1a364151db795e711635e3ef0e31554d9c3.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d63d8564540f5447fa6952fab860afd13b6a12.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f78e63008c365ad4f478128166629ecdaf44b2.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/682a0e579a63b3f6f802293e174c54c2a90c42.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data17">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201705/648e415493fa250f0ae829fff1a113b6091db1.jpg">
									<p>
										共25课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">企业网络智慧城市物联网解决方案工程师培训实战视频课程</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs01/M02/51/5D/wKioOVLY7fGRONVcAACLfZZrjHw696.jpg">
									<p>
										共2课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">那些年一起犯过的错--大侠讲经典网络错误配置【大侠唐在飞出品】</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/6C/3D/wKiom1VByIPS4uQSAACCADDiDk4355.jpg">
									<p>
										共36课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">计算机导论视频课程</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M01/47/2C/wKiom1P3YNXTZ3NyAAFCYyiWEcg058.jpg">
									<p>
										共80课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">网康上网行为管理精讲视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M00/4D/B1/wKiom1RXQuuAWNPDAAFXA1cf7nY470.jpg">
									<p>
										共20课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">微软Forefront TMG 2010防火墙与websense整合实战视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/5B/26/wKioL1UA7_DTghT7AAGnUM7EguU625.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">微软Forefront TMG 2010 防火墙实战Part 1视频课程</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M00/5B/9D/wKiom1UOZbvRyI1yAAKKvTYq6rI070.jpg">
									<p>
										共67课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">网络管理员实战系列视频课程【大侠唐在飞出品】</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/5D/FD/wKiom1Uoi4_ydn-XAAHH3dRd8us129.jpg">
									<p>
										共1课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">20个常见的中小企业组网方案讲解高清视频【大侠唐在飞】</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav9"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
						target="_blank">人工智能</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/552efac53b924ec9c7b734e63ef8d84799a729.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">机器学习</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">机器人</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">深度学习</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show"  id="remen10">
								热门
							</li>
							<li  id="study">
								深度学习
							</li>
							<li>
								计算机视觉
							</li>
							<li>
								自然语言
							</li>
							<li>
								机器人开发
							</li>
							<li>
								其他
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl"  style="display: none;" id="data18">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/76b597c49ce594ce00b490cb041721657cfd32.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/030815791700defed279903470b1d98c54e35b.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/172db45098ca0a71a4577716c279cefe192d57.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data19">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/44f0798a5ba68901a9fbfafa68c54db3.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">大型企业自然语言开发框架实战之NLTK视频课程</a>
								<p class="course_price">
									<span class="first">￥198</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/99b02d0228383dff8898564dbb99ea61e7ab4b.jpg">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">验证码识别 深度学习视频课程</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/086bd2677f42d1c9e2e704467e3660dc522c11.jpg">
									<p>
										共21课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">3天搞定机器学习深度学习基础-Python入门视频课程</a>
								<p class="course_price">
									<span class="first">￥48</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/582b2a7061074598c7758865020bfcf167b13a.png">
									<p>
										共16课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">大数据:深度学习项目实战视频课程-人脸检测</a>
								<p class="course_price">
									<span class="first">￥128</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav10"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
						target="_blank">移动开发</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/63ed3542806bbe2e4857536307d75e0ae87cbf.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank">Android</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">Html5</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">Swift</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen11">
								热门
							</li>
							<li class="" id="html5">
								HTML5
							</li>
							<li>
								移动测试
							</li>
							<li>
								微信开发
							</li>
							<li>
								iOS
							</li>
							<li>
								Android
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display: none;" id="data20">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/e3a8853880c45b471d1609b9b54c83b8fc770d.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/91a80e177683eda64e1951cdc9fc715c1a43aa.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/1703fe843814cce019d1330755c6ccb823bc1b.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c78a83f84514080e57d0916fc72351acc4ae0d.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data21">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201604/539f672221c04f4979a027ba1fb29c3ad4c0f0.jpg">
									<p>
										共38课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">移动端开发利器 jQuery Mobile开发实录视频课程</a>
								<p class="course_price">
									<span class="first">￥36</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201605/058447b292c6ccd63a1528d0eb25325da37547.png">
									<p>
										共30课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">教你轻松玩转“密室探索”类H5视频课程</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/5664e13850feadefbbc035e04ebf55f43f5a23.png">
									<p>
										共20课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">应用Ionic构建企业级Hybrid APP 基础视频教程 之JS组件篇</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/40/92/wKiom1PPHNeiFqNlAAEr7-uFxQo350.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">HTML5从零到实战视频教程（2017年5月1号会陆续进行更新到最新）</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/4C/BD/wKioL1REs3OzrJdaAAHmycKW9mw052.jpg">
									<p>
										共29课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">【李宁】征服HTML5视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/4D/4C/wKiom1RPK0rzVx-FAAB2IK5Et2g543.jpg">
									<p>
										共32课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">深入浅出HTML5游戏引擎视频教程</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201601/a840a849036ba27f6454697a4ded1228de6420.jpg">
									<p>
										共31课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">结合MUI框架完成HTML5移动端混合应用开发（微信实战）</a>
								<p class="course_price">
									<span class="first">￥669</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201603/046a08f320e39cedb74917a908ceb45decfe60.jpg">
									<p>
										共40课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">HTML5开发手机App之：HTML5系统视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav11"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
						target="_blank">游戏开发</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/d214166816b2b55d2889007e456b236e2721a7.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">Unity</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">手游开发</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">unity5</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen12">
								热门
							</li>
							<li class="" id="unity3d">
								Unity3D
							</li>
							<li>
								Cocos2d-x
							</li>
							<li>
								VR虚拟现实
							</li>
							<li>
								手游开发
							</li>
							<li>
								3D游戏
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl" style="display:block" id="data22">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/6897e3c841f03119a862291af77281f2a460c0.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/31432fe389e89964cf3827e68172e1a8a057c8.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/336b852266eaf72165e820e9f1cab18f6a8290.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/283a6f6925035eabfa4618da944b8fb6ac64a3.jpg">
									<p>
										共43课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">Unity客户端框架设计PureMVC篇视频课程(上)</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/201605/3760acb23ab5578d89f259efeb8f5c4ab8ffe2.jpg">
									<p>
										共36课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">Unity3D游戏开发视频课程-飞机大战,三消游戏,Flappy
									bird等干货案例来袭</a>
								<p class="course_price">
									<span class="first">￥189</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c337eca97764d7d3ed1753cf3b5e20072b357e.png">
									<p>
										共21课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">Unity5游戏开发Mecanim高级特性项目实战视频课程</a>
								<p class="course_price">
									<span class="first">￥59</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/e3f046d520739d67fb16324d4d235a63cd716c.jpg">
									<p>
										共3课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">Unity原生技术视频课程：iOS GameCenter 接入（ 2015版）</a>
								<p class="course_price">
									<span class="first">￥59</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav12"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">嵌入式</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/43769ad3878597b5b3793129ed6f187f811a0b.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">单片机</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">U-Boot</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">硬件设计</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen13">
								热门
							</li>
							<li>
								嵌入式Linux
							</li>
							<li>
								驱动/内核开发
							</li>
							<li>
								单片机/工控
							</li>
							<li>
								物联网
							</li>
							<li>
								智能硬件
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/a7ecffb044fbc869ed2917d8bcdc8841b42916.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c712fd61872f9fa5c160589011ca177490753d.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c1c19c777805219bc84824f286f48054b9b9d1.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/05720a351ba3f32bfe2763f5384472f0f0b38b.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/79f930e089ec68d43d8846dc860060769dfcac.jpg">
									<p>
										共12课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Qt程序设计基础视频课程</a>
								<p class="course_price">
									<span class="first">￥28</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f9090d76845dfe2aba5223b0fad909f230f620.jpg">
									<p>
										共41课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">6.小项目.图片解码播放器视频课程-嵌入式Linux核心终点站</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/25ca92697efd2129799971f4c9b2e023f9da9a.jpg">
									<p>
										共52课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">TCP/IP/UDP
									Socket通讯开发实战视频课程——适合iOS/Android/Linux</a>
								<p class="course_price">
									<span class="first">￥999</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b9832653185c8e5e65463479fa4fb2666c6547.jpg">
									<p>
										共21课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">嵌入式Linux内核移植视频课程</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b76b3da01cde1876ba67666cec9bf3c3442f1e.jpg">
									<p>
										共15课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">vim从入门到精通(第2季)：使用插件定制自己的IDE开发环境</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/04431a390070c8e6de10126609ce15a7c4e208.jpg">
									<p>
										共23课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Linux教学视频从入门到精通视频课程</a>
								<p class="course_price">
									<span class="first">￥129</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioL1UaabbDj5c5AAFCmvLPnPk228.jpg">
									<p>
										共57课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">嵌入式Linux C语言完全学习视频课程</a>
								<p class="course_price">
									<span class="first">￥1</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/814663647bbdca6bc71847f7f1eb2c6d12b3fb.jpg">
									<p>
										共10课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">指针才是C的精髓-4.3.C语言高级专题第三部分视频课程</a>
								<p class="course_price">
									<span class="first">￥35</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav13"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">服务器</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/169db43477dee8bcac75355df794fd786955ef.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Exchange</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">集群</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Windows Server</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="renmen14">
								热门
							</li>
							<li>
								Exchange
							</li>
							<li>
								Windows Server
							</li>
							<li>
								Lync
							</li>
							<li>
								SharePoint
							</li>
							<li>
								Nginx
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f624b0000d45758610d6041ebfaac3d4c51fd2.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/996586a06e4cfb2d0df8864411d86260719158.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d72d9d297219cb7e325352b795231bbc6bbd9c.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioJlL8IZXRgwY9AADKAznWvIw440.jpg">
									<p>
										共20课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Exchange 2013 管理</a>
								<p class="course_price">
									<span class="first">￥399</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioOVMpNf3CwiSkAACZFuHmiRo691.jpg">
									<p>
										共44课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Exchange Server 2010 SP2企业信息平台实战视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioL1NQm77yNaEVAAFCfmLdNNo848.jpg">
									<p>
										共1课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">51CTO第46期公开课:Exchange 2013会议功能详解</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKiom1SOTffQH7PQAAGS6WwGdbg849.jpg">
									<p>
										共1课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Outlook 大附件解决方案视频课程</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioL1Uc2w3xAHWKAAHXXO0Aj2g750.jpg">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Exchange数据库灾难恢复视频课程</a>
								<p class="course_price">
									<span class="first">￥599</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/6C/D0/wKiom1VSsjuz5FYPAAHxA_emzkA260.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">邮件系统-Exchange Server 2013的核心解决方案视频课程</a>
								<p class="course_price">
									<span class="first">￥499</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201510/682a2cd54a9c40cb65b137204cf7b9cc8d4810.jpg">
									<p>
										共35课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">AD&amp;Exchange 部署实战系列视频课程</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201702/21a057d489095fd3dc1421897cecbcaff42ad8.jpg">
									<p>
										共22课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Exchange 2013部署管理实战入门视频教程</a>
								<p class="course_price">
									<span class="first">￥98</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav14"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">企业信息化</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/125b6e609867323428e187d6689af5e1488840.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">PMP</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">ERP</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Project</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="renmen16">
								热门
							</li>
							<li>
								项目管理
							</li>
							<li>
								ERP
							</li>
							<li>
								CRM
							</li>
							<li>
								BPM
							</li>
							<li>
								管理软件
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/57be34811d359c5449a3867cb9c3b7b96e58b1.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c81821211789530877f95918c8a84684eaef1d.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c355bd150e5755ba3c1534548de0cf40580450.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/3863493928e734e5b4f19355b54d6cb3ce5a03.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201601/936ce6a465aeb84736c911b103f2c2869af376.jpg">
									<p>
										共40课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">项目质量管理实战视频课程（乔俊峰）</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201512/c15d27f36622297259d55682afaa500aed24d5.jpg">
									<p>
										共18课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">职场拼杀必备技能之：目标管理</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201604/113fb85523e10ba79fc7254d83a1b728fd18ac.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">众学微课程： PMP 项目管理介绍及引论 （适用于PMBOK 第五版）</a>
								<p class="course_price">
									<span class="first">￥10</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201605/b5edd9b46c98c4f73b7907b106c8028c4199c4.JPG">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Project Server 2013部署和应用视频课程</a>
								<p class="course_price">
									<span class="first">￥59</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201612/930b611318b1d7bb199052dffc93c84b793ab8.jpg">
									<p>
										共8课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">90分钟教你做活动策划执行视频课程（论坛+展览+沙龙）</a>
								<p class="course_price">
									<span class="first">￥88</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201703/360980b2094ff6b8369380a95786ee1191f772.jpg">
									<p>
										共10课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">IT项目实施宝典—项目文档编写技巧规范实战视频课程</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201701/561cb3570543cbe38135737befc36c13cffccc.png">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">学会商业计划书，打破商业的封锁-视频课程</a>
								<p class="course_price">
									<span class="first">￥49</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201703/49babc365766de75e29012315980f432e0bf13.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">IT行业常见技术及专业术语讲解实战视频课程</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav15"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">Office办公</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/d71602503591fd6b1b60526332b6a8a5b47fb6.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">Office</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">高效办公</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">表格之道</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="renmen16">
								热门
							</li>
							<li>
								Excel
							</li>
							<li>
								PPT
							</li>
							<li>
								Word
							</li>
							<li>
								其他
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c5b18111424214ae2e12440e06256ab2c2ba7a.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/52e588e607f85703fff382080eda4fa7d11e17.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/17d9430057e40da8e63102d8a1fa0234176068.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/877808654c33d9be9f2986b0bfbb68c415bce6.png">
									<p>
										共40课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Excel视频教程之Power Query M语言第2季</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201705/81358cd83656e09047d2639d41fc487c527bd4.png">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">【王佩丰】Excel 图表实战 视频教程</a>
								<p class="course_price">
									<span class="first">￥149</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201611/b70629212426509416520925d737810471dc0d.png">
									<p>
										共24课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">【曾贤志】Excel从零到精通视频课程第2季（函数篇）</a>
								<p class="course_price">
									<span class="first">￥169</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201706/04/9454c01910cd90e9ad5eac7d8f5435af.png">
									<p>
										共15课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">【大猫(王伟)】Excel VBA 基础编程及经典算法视频</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201701/72725de116884178f01441b79443584c998929.jpg">
									<p>
										共29课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Excel VBA高手之路系列视频课程之进阶篇</a>
								<p class="course_price">
									<span class="first">￥78</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201702/09fdbb550f23d792c8d6377dee753be8258f44.jpg">
									<p>
										共52课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Excel 2016 函数公式必修视频课程【时间、逻辑、数学函数】</a>
								<p class="course_price">
									<span class="first">￥19</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav16"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">产品/设计</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/7458db874b981e60c6c122ce1bcb6026e69cc2.png">
						</a>
						<div class="bottom">
							<a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">产品经理</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">互联网运营</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">设计</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="renmen17">
								热门
							</li>
							<li>
								产品经理
							</li>
							<li>
								互联网运营
							</li>
							<li>
								交互设计
							</li>
							<li>
								平面设计
							</li>
							<li>
								室内设计
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d18572295d6eac6551a3166db2b0b637631f81.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/269af6c3715030d4ba9485bcb4f9b00be2475c.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f866418034c15715a2c318ec5cce504fdfd780.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b2497a7077043961d7e20838cc9cb72a3f7601.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201612/b915fb37892d5e6d8be40870c45114b72be691.jpg">
									<p>
										共6课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">ProcessOn思维导图入门实战视频课程</a>
								<p class="course_price">
									<span class="first">￥4</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201608/66917c548f5082f91d9243dbcac9ff09cc005b.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品交互设计那些事儿-实战视频课程</a>
								<p class="course_price">
									<span class="first">￥1</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201609/b66c689794e4af96bdd038101b970c04751593.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Axure部件详解与实践提升视频课程</a>
								<p class="course_price">
									<span class="first">￥10</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201608/69b3a7b064481d4c786928975ec80be13be154.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品系列课程之UCD设计方法视频课程</a>
								<p class="course_price">
									<span class="first">￥10</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201608/033bc4d5114dd46479e8256e66bbb78b5bacb0.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品设计课程—Axure入门基础及实践视频课程</a>
								<p class="course_price">
									<span class="first">￥6</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201608/e6780e518858bb6b7c84886200bf2cc665e5e7.jpg">
									<p>
										共3课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品设计系列课程—产品必备文档编写视频课程</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201608/d89dae117af0b9a0ca3977960af1d53ebaeb18.jpg">
									<p>
										共6课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品原型设计工具“墨刀”实战课程</a>
								<p class="course_price">
									<span class="first">￥4</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201608/815826873c70aa79b3d47025718658e6e43915.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品设计系列课程之绘制流程图视频课程</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav17"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">其它</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/b2bcc1d581be9d9a18c7081a1351cb8d595f09.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">职场英语</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">看案例管理</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">CTO修炼</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="renmen18">
								热门
							</li>
							<li>
								IT职场
							</li>
							<li>
								网络营销
							</li>
							<li>
								多媒体
							</li>
							<li>
								英语四六级
							</li>
							<li>
								其他
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/260a51c05caed51281794128fd1b89aa5080e3.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/e9b780d18bb5ef1632d60756a49ad9a0936d8e.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/565884138e69b8b032d5141025452ad975e777.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/249415a181561ddd25a882ea0da4747c5c1282.jpg">
									<p>
										共6课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">教师资格证面试培训视频课程</a>
								<p class="course_price">
									<span class="first">￥29</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201606/f2ebadf292b356905c9014abdb9358929e78e3.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">定路线No.3 程序员职业发展路线</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/69ded706306720ef5db575aa005047c96a8d7c.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">定路线No.4 网管员职业发展路线</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/56f376f436d5489c16f240bdbf7aafa58cd394.jpg">
									<p>
										共8课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">转折点No.1 程序员到架构师商业画布设计</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/b9ee667831de4d233c335813c1ec623f68c4a6.jpg">
									<p>
										共8课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">转折点No.2 程序员到软件项目经理商业画布设计</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/12d69be39b380aedb59163b62ed0128834b1fd.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">转折点No.3 程序员转岗方式分析</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/0644a7006380075163700883348ad22fd798ce.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">人才去哪儿？——高级招聘面试技巧视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/52287f330d44b64d6d381565d74fa7cc7d68be.png">
									<p>
										共26课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">网络工程师面试视频课程【经典十问】（面试技巧+技术问题）</a>
								<p class="course_price">
									<span class="first">￥49</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>

		<!-- 实战讲师 -->
		<div class="atment_bg bgff w1160">
			<h2 class="tea_title">
				<a href="http://edu.51cto.com/lecturer/leclist.html" target="_blank"
					style="color: #333;">实战讲师</a>
			</h2>
			<ul class="tea_list">
				<li>
					<a class="tea_list_img"
						href="http://edu.51cto.com/lecturer/8403723.html" title="赖国荣"
						target="_blank"> <img
							src="https://s1.51cto.com/images/201609/948821a65c49fff80e0175725665d309f82d80.jpg">
						<img class="lec_mask" src="<%=basePath%>image/lgr.jpg"> </a>
					<a class="tea_list_user"
						href="http://edu.51cto.com/lecturer/8403723.html" target="_blank"
						title="赖国荣">赖国荣</a>
					<p>
						特级讲师
					</p>
					<p>
						C/C++/Unity3D
					</p>
				</li>
				<li>
					<a class="tea_list_img"
						href="http://edu.51cto.com/lecturer/12863882.html" title="陈飞龙"
						target="_blank"> <img
							src="https://s1.51cto.com/images/201705/d329f5d40f09a74f9e961750f1967eef304741.png">
						<img class="lec_mask" src="<%=basePath%>images/1.JPG"> </a>
					<a class="tea_list_user"
						href="http://edu.51cto.com/lecturer/12863882.html" target="_blank"
						title="陈飞龙">陈飞龙</a>
					<p>
						认证讲师
					</p>
					<p>
						深度学习/机器人开发
					</p>
				</li>
				<li>
					<a class="tea_list_img"
						href="http://edu.51cto.com/lecturer/400469.html" title="陈飞龙"
						target="_blank"> <img
							src="https://s1.51cto.com/images/201606/75fe84761c6a3576c668279f544c10173c10d1.jpg">
						<img class="lec_mask" src="<%=basePath%>images/1.JPG"> </a>
					<a class="tea_list_user"
						href="http://edu.51cto.com/lecturer/400469.html" target="_blank"
						title="陈飞龙">陈飞龙</a>
					<p>
						金牌讲师
					</p>
					<p>
						Windows/Windows Server
					</p>
				</li>
				<li>
					<a class="tea_list_img"
						href="http://edu.51cto.com/lecturer/3050674.html" title="陈飞龙"
						target="_blank"> <img
							src="https://s1.51cto.com/images/201605/250e89021196175e172460e6e46af42c58426e.jpg">
						<img class="lec_mask" src="<%=basePath%>images/1.JPG"> </a>
					<a class="tea_list_user"
						href="http://edu.51cto.com/lecturer/3050674.html" target="_blank"
						title="陈飞龙">陈飞龙</a>
					<p>
						金牌讲师
					</p>
					<p>
						Python
					</p>
				</li>
				<li>
					<a class="tea_list_img"
						href="http://edu.51cto.com/lecturer/1129943.html" title="陈飞龙"
						target="_blank"> <img
							src="https://s1.51cto.com/wyfs02/M02/6C/AF/wKioL1VQXWjyXLq_AAAtK0jYRbk603.jpg">
						<img class="lec_mask" src="<%=basePath%>images/1.JPG"> </a>
					<a class="tea_list_user"
						href="http://edu.51cto.com/lecturer/1129943.html" target="_blank"
						title="陈飞龙">陈飞龙</a>
					<p>
						金牌讲师
					</p>
					<p>
						Excel
					</p>
				</li>
				<li>
					<a class="tea_list_img"
						href="http://edu.51cto.com/lecturer/8371666.html" title="陈飞龙"
						target="_blank"> <img
							src="https://s1.51cto.com/images/201507/7801e4b5499651ec0e373709fbe16ebf0d0366.png">
						<img class="lec_mask"
							src="<%=basePath%>images/1.JPG">
					</a>
					<a class="tea_list_user"
						href="http://edu.51cto.com/lecturer/8371666.html" target="_blank"
						title="陈飞龙">陈飞龙</a>
					<p>
						金牌讲师
					</p>
					<p>
						软考
					</p>
				</li>
				<li>
					<a class="tea_list_img"
						href="http://edu.51cto.com/lecturer/5428084.html" title="陈飞龙"
						target="_blank"> <img
							src="https://s1.51cto.com/wyfs02/M01/6C/B4/wKiom1VQW_Kj2F00AAAkGQa0O1Y936.jpg">
						<img class="lec_mask"
							src="<%=basePath%>images/1.JPG">
					</a>
					<a class="tea_list_user"
						href="http://edu.51cto.com/lecturer/5428084.html" target="_blank"
						title="陈飞龙">陈飞龙</a>
					<p>
						特级讲师
					</p>
					<p>
						Linux/红帽认证
					</p>
				</li>

				<div class="clear"></div>
			</ul>
		</div>

		<!-- 合作机构 -->
		<div class="atment_bg bgff mecList_bg w1160">
			<h2 class="fl">
				<a href="http://edu.51cto.com/partner/index.html" target="_blank"
					style="color: #02a6e3;">合作机构</a>
			</h2>
			<ul class="mecList fl">
				<li>
					<a href="http://edu.51cto.com/partner/view/id-174.html"
						target="_blank"><img
							src="<%=basePath %>itimage/c97ca2e44b0168569a1690663b706d450fbe34.png">
					</a>
				</li>
				<li>
					<a href="http://edu.51cto.com/partner/view/id-188.html"
						target="_blank"><img
							src="<%=basePath %>itimage/b9d65e8782a09bba32f805f6e57e0eb0450d3f.jpg">
					</a>
				</li>
				<li>
					<a href="http://edu.51cto.com/partner/view/id-190.html"
						target="_blank"><img
							src="<%=basePath %>itimage/a61f47b261096750605065057d9d1f4b933a45.jpg">
					</a>
				</li>
				<li>
					<a href="http://edu.51cto.com/partner/view/id-186.html"
						target="_blank"><img
							src="<%=basePath %>itimage/843d29f023134c39a31567c13bc4cd3ce9f4e3.gif">
					</a>
				</li>
				<li>
					<a href="http://edu.51cto.com/partner/view/id-176.html"
						target="_blank"><img
							src="<%=basePath %>itimage/640a35232ddf1ef7223559bcf9a24259eb2368.jpg">
					</a>
				</li>
				<li>
					<a href="http://edu.51cto.com/partner/view/id-158.html"
						target="_blank"><img
							src="<%=basePath %>itimage/17b79da99388a416a6c139d27bf77d0cc64a56.png">
					</a>
				</li>
				<div class="clear"></div>
			</ul>
			<div class="clear"></div>
		</div>

		<!-- 学院新闻 后期再上-->
		<div class="atment_bg bgff w1160">
			<div class="title_box">
				<h2 class="tea_title fl">
					<a href="http://edu.51cto.com/center/index/news/list"
						target="_blank" style="color: #333;">学院新闻</a>
				</h2>
				<a class="moreurl fr"
					href="http://edu.51cto.com/center/index/news/list" target="_blank">查看更多&gt;&gt;</a>
				<div class="clear"></div>
			</div>
			<ul class="news_list">
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=21"
						target="_blank">51CTO推出计算机考研免费公开课</a>
					<span>2017-05-31</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=20"
						target="_blank">1+1&gt;2，51CTO学院拓宽教育服务新边界</a>
					<span>2017-05-25</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=19"
						target="_blank">51CTO校园行 走进内蒙古大学</a>
					<span>2017-05-18</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=18"
						target="_blank">进军企业IT培训，51CTO学院正式推出企业版</a>
					<span>2017-05-12</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=14"
						target="_blank">51CTO学院微职位战略合作伙伴授牌</a>
					<span>2017-05-05</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=15"
						target="_blank">微软MVP在51CTO学院举办Access数据库公益讲座</a>
					<span>2017-04-26</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=11"
						target="_blank">两天385万交易，51CTO学院打造属于IT人的专属节日</a>
					<span>2017-04-21</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=12"
						target="_blank">51CTO成功入选教育部2017年首批“产学合作协同育人项目”</a>
					<span>2017-04-20</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=17"
						target="_blank">51CTO为海南互联网产业发展建言献策</a>
					<span>2017-04-12</span>
					<div class="clear"></div>
				</li>
				<li>
					<a href="http://edu.51cto.com/center/index/news/index?id=10"
						target="_blank">熊平：由社区进入IT培训，51CTO学院的另类打法</a>
					<span>2017-03-30</span>
					<div class="clear"></div>
				</li>

				<div class="clear"></div>
			</ul>
		</div>
		<!-- 课程列表 end -->
		<!-- APP -->
		<div class="APPs">
			<div class="Page">
				<div classMain></div>
				<img src="<%=basePath%>image/apps.png" class="fl">
				<div class="clear"></div>
			</div>
		</div>
		<div class="footer_bg">
			<div class="footer">
				<ul class="footer_list">
					<li>
						<h2>
							新手指南
						</h2>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/help"
							target="_blank">如何购买</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/help"
							target="_blank">如何使用优惠券</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/help"
							target="_blank">如何开发票</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/help"
							target="_blank">退款政策</a>
					</li>
				</ul>
				<ul class="footer_list">
					<li>
						<h2>
							关于课程
						</h2>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/help"
							target="_blank">手机上如何看课程</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/help"
							target="_blank">如何下载资料</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/contactqq.html" target="_blank">视频卡顿反馈</a>
					</li>
					<li>
						<a href="http://bbs.51cto.com/thread-1113045-1.html"
							target="_blank">课程登记</a>
					</li>
				</ul>
				<ul class="footer_list">
					<li>
						<h2>
							互动交流
						</h2>
					</li>
					<li>
						<a href="http://51edu.blog.51cto.com/8899635/1862738"
							target="_blank">学员QQ群</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/feedback"
							target="_blank">意见反馈</a>
					</li>
					<li>
						<a href="http://bbs.51cto.com" target="_blank">论坛交流</a>
					</li>
					<li>
						<a href="http://down.51cto.com" target="_blank">资料下载</a>
					</li>
				</ul>
				<ul class="footer_list">
					<li>
						<h2>
							关于我们
						</h2>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/about"
							target="_blank">关于我们</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/center/about/index/contactus"
							target="_blank">联系我们</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/lecturer/lectopics" target="_blank">内容合作</a>
					</li>
					<li>
						<a href="http://edu.51cto.com/friendlink" target="_blank">友情链接</a>
					</li>
				</ul>
				<ul class="footer_last">
					<li>
						<h2>
							客服热线
						</h2>
						09:00-19:00
					</li>
					<li>
						<h3>
							176-0797-5702
						</h3>
					</li>
					<li>
						<div class="sbox_more">
							<a class="sina"
								href="http://weibo.com/51ctoedu?refer_flag=1001030101_&is_hot=1"
								target="_blank"></a>
							<div class="wechat_bg fl">
								<a class="wechat" href="javascript:;" target="_blank"></a>
								<div class="wechat_box">
									<img
										src="https://static1.51cto.com/edu/index/images/qrcode2.png"
										alt="官方二维码">
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			<div class="footer_company">
				<a href="http://edu.51cto.com" target="_blank"
					title="51CTO学院_中国最大的IT技能学习平台"><img
						src="https://static1.51cto.com/edu/index/images/logo_f2.png"
						alt="51CTO学院_中国最大的IT技能学习平台"> </a>
				<div>
					Copyright © 2005-2017
					<a href="http://www.51cto.com" target="_blank">51CTO.com</a>
				</div>
			</div>
		</div>
		<div class="qqbm_bs_box"
			style="position: fixed; right: 10px; top: 42%; width: 60px; z-index: 999; cursor: pointer; opacity: .8; filter: opacity(80);">
			<a href="http://edu.51cto.com/px/?eduvideo" style="display: block;"
				target="_blank"><img
					src="https://static1.51cto.com/edu/images/whitestyle/slider_01.png"
					style="display: block;"> </a>
			<img
				src="https://static1.51cto.com/edu/images/whitestyle/slider_02.png"
				onclick="$('#AdviceMask').show();$('#Advice').show();"
				style="display: block; margin-top: 6px;">
			<a href="http://edu.51cto.com/activity/lists/id-10.html"
				style="display: block; margin-top: 2px;" target="_blank">
				<p onmousemove="$(this).children().eq(1).show();"
					onmouseout="$(this).children().eq(1).hide();"
					style="position: relative; width: 58px; height: 58px;">
					<img
						src="https://static1.51cto.com/edu/images/whitestyle/slider_05.png"
						style="position: absolute; left: 0; top: 0; display: block;">
					<img
						src="https://static1.51cto.com/edu/images/whitestyle/slider_05s.png"
						style="position: absolute; left: 0; top: 0; display: none;">
				</p> </a>
			<div onmousemove="$(this).children().eq(1).show();"
				onmouseout="$(this).children().eq(1).hide();"
				onclick="$(window).scrollTop(0);"
				style="position: relative; width: 58px; height: 58px; margin-top: 2px;">
				<img
					src="https://static1.51cto.com/edu/images/whitestyle/slider_03.png"
					style="position: absolute; left: 0; top: 0; display: block;">
				<img
					src="https://static1.51cto.com/edu/images/whitestyle/slider_03s.png"
					style="position: absolute; left: 0; top: 0; display: none;">
			</div>
		</div>
		<div class="mask disp-n" id="AdviceMask"></div>
		<div class="Advice disp-n" id="Advice">
			<div class="Main">
				<button class="close"
					onclick="$('#AdviceMask').hide();$('#Advice').hide();">
					&nbsp;
				</button>
				<h3>
					可以开发票么？
				</h3>
				<p>
					可以的，购买课程或者充值余额后都是可以开具发票的，具体详情点击：
					<a href="http://bbs.51cto.com/thread-1472105-1.html"
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
					<a href="http://edu.51cto.com/center/about/index/help"
						target="_blank">帮助中心</a>
				</p>
				<p class="mt10">
					欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，
					<a href="http://edu.51cto.com/center/about/index/help"
						target="_blank">我要反馈意见</a>
				</p>
				<button id="bizQQ_WPA">
					&nbsp;
				</button>
			</div>
		</div>
		<script type="text/javascript">
$("#bizQQ_WPA,#qqwaps").click(function(){
    window.open('http://edu.51cto.com/contactqq.html')
})
//百度统计代码
var _hmt = _hmt || [];
(function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?8c8abdb71d78d33dfdb885e0bc71dae0";
    var s = document.getElementsByTagName("script")[0]; 
    s.parentNode.insertBefore(hm, s);

})();


</script>
		<!-- 左侧导航 -->
		<div class="Side_right_bg" id="Side_list">
			<div class="Side_right">
				<a href="#nav0">系统/运维</a>
				<a href="#nav1">云计算</a>
				<a href="#nav2">大数据</a>
				<a href="#nav3">Web开发</a>
				<a href="#nav4">编程语言</a>
				<a href="#nav5">软件研发</a>
				<a href="#nav6">考试认证</a>
				<a href="#nav7">数据库</a>
				<a href="#nav8">网络/安全</a>
				<a href="#nav9">人工智能</a>
				<a href="#nav10">移动开发</a>
				<a href="#nav11">游戏开发</a>
				<a href="#nav12">嵌入式</a>
				<a href="#nav13">服务器</a>
				<a href="#nav14">企业信息化</a>
				<a href="#nav15">Office办公</a>
				<a href="#nav16">产品/设计</a>
				<a href="#nav17">其它</a>
			</div>
		</div>

		<!-- 右侧导航 -->
		<!-- <ul class="FixedSideBar_new">
      <li class="FixedSideBar_Spree_new" id="bizQQ_WPA"></li>
      <li class="FixedSideBar_iPad_new">
          <a href="/activity/lists/id-10.html" target="_blank"></a>
      </li>
      <li class="FixedSideBar_FeedBack_new">
          <a href="/user/feedback.html" target="_blank"></a>
      </li>
      <li class="FixedSideBar_GoTop_new" onclick="$(window).scrollTop(0);"></li>
  </ul> -->
		<div class="qqbm_bs_box"
			style="position: fixed; right: 10px; top: 42%; width: 60px; z-index: 999; cursor: pointer; opacity: .8; filter: opacity(80);">
			<a href="http://edu.51cto.com/px/?eduvideo" style="display: block;"
				target="_blank"><img
					src="https://static1.51cto.com/edu/images/whitestyle/slider_01.png"
					style="display: block;"> </a>
			<img
				src="https://static1.51cto.com/edu/images/whitestyle/slider_02.png"
				onclick="$('#AdviceMask').show();$('#Advice').show();"
				style="display: block; margin-top: 6px;">
			<a href="http://edu.51cto.com/activity/lists/id-10.html"
				style="display: block; margin-top: 2px;" target="_blank">
				<p onmousemove="$(this).children().eq(1).show();"
					onmouseout="$(this).children().eq(1).hide();"
					style="position: relative; width: 58px; height: 58px;">
					<img
						src="https://static1.51cto.com/edu/images/whitestyle/slider_05.png"
						style="position: absolute; left: 0; top: 0; display: block;">
					<img
						src="https://static1.51cto.com/edu/images/whitestyle/slider_05s.png"
						style="position: absolute; left: 0; top: 0; display: none;">
				</p> </a>
			<div onmousemove="$(this).children().eq(1).show();"
				onmouseout="$(this).children().eq(1).hide();"
				onclick="$(window).scrollTop(0);"
				style="position: relative; width: 58px; height: 58px; margin-top: 2px;">
				<img
					src="https://static1.51cto.com/edu/images/whitestyle/slider_03.png"
					style="position: absolute; left: 0; top: 0; display: block;">
				<img
					src="https://static1.51cto.com/edu/images/whitestyle/slider_03s.png"
					style="position: absolute; left: 0; top: 0; display: none;">
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
					<a href="http://bbs.51cto.com/thread-1472105-1.html"
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
					<a href="http://edu.51cto.com/center/about/index/help"
						target="_blank">帮助中心</a>
				</p>
				<p class="mt10">
					欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，
					<a href="http://edu.51cto.com/user/feedback.html" target="_blank">我要反馈意见</a>
				</p>
			</div>
		</div>
		<script
			src="https://static1.51cto.com/edu/center/js/index_load_list.js"></script>
		<script src="https://static1.51cto.com/edu/center/js/home.js"></script>
		<script type="text/javascript">
  
  $("#bizQQ_WPA").click(function(){
    window.open('http://edu.51cto.com/contactqq.html')
  })
</script>

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
