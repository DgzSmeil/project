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
					$("#data").css("display","none");
					$("#data1").css("display","block");
					$("#remen").css("class","");
					$("#linux").css("class","show");
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
				$("#remen13").bind("click",function(){
					$("#data24").css("display","block");
					$("#data25").css("display","none")
				
				});
				$("#qian").bind("click",function(){
					$("#data25").css("display","block");
					$("#data24").css("display","none")
				});
				$("#remen14").bind("click",function(){
					$("#data26").css("display","block");
					$("#data27").css("display","none")
				
				});
				$("#exchange").bind("click",function(){
					$("#data27").css("display","block");
					$("#data26").css("display","none")
				});
				$("#remen15").bind("click",function(){
					$("#data28").css("display","block");
					$("#data29").css("display","none")
				
				});
				$("#man").bind("click",function(){
					$("#data29").css("display","block");
					$("#data28").css("display","none")
				});
				$("#remen16").bind("click",function(){
					$("#data30").css("display","block");
					$("#data31").css("display","none")
				
				});
				$("#excel").bind("click",function(){
					$("#data31").css("display","block");
					$("#data30").css("display","none")
				});
				$("#remen17").bind("click",function(){
					$("#data32").css("display","block");
					$("#data33").css("display","none")
				
				});
				$("#pro").bind("click",function(){
					$("#data33").css("display","block");
					$("#data32").css("display","none")
				});
				$("#remen18").bind("click",function(){
					$("#data34").css("display","block");
					$("#data35").css("display","none")
				
				});
				$("#it").bind("click",function(){
					$("#data35").css("display","block");
					$("#data34").css("display","none")
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
		<jsp:include page="/faceimage.jsp"></jsp:include>
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
