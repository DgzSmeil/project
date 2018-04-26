<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.StudentBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${o.course_name}</title>
<meta name="keywords" content="vSphere,vCenter,ESXi,VMware,服务器虚拟化" />
<meta name="description" content="课程目标：（1）掌握基于VMware服务器虚拟化的数据中心中，服务器、存储的规划、安装与配置。（2）使用vCenter Server管理VMware ESXi虚拟化主机，介绍虚拟机管理与应用、模板应用、高可用群集（HA、FT及DRS）、VMotion、vSphere虚拟网络、从物理机（或虚拟机）迁移到vSphere虚拟机、资源池、ESXi的安装与升级等内容。通过本课程的学习，可以达到安装、配置管理小规模虚拟化数据中心的能力。&nbsp;&nbsp;&nbsp;&nbsp;适合对象：【网络管理员、虚拟机爱好者】&nbsp;学习条件：【（1）了解或熟悉VMware Workstation虚拟机的基本使用；（2）" />
<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
<link rel="shortcut icon" href="<%=basePath %>images/lo.png" type="image/x-icon"/>	
<script type="text/javascript" src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/msgbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/nav.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/mbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.4"></script>
<!-- 通用顶部简导航 -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.82"/>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.82"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4"/>
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.4" rel="Stylesheet" />
<script type="text/javascript">
var gen_logo = '';
</script>
<script src="<%=basePath %>js/jquery-1.4.1.min.js"></script>
</head>
<body>
<% 
	StudentBean studentBean = (StudentBean)session.getAttribute("bean");
	int num=0;
	if(session.getAttribute("num")!=null){
		num = Integer.parseInt(session.getAttribute("num").toString());
	}
%>
<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til"><a href="http://edu.51cto.com/">中国最大的IT技能学习平台</a></li>
        <li class="fr navi"><a  target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="<%=basePath %>courselistservlet?order=study" target="_blank">微职位</a></li>
                <li><a  target="_blank">视频课程</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a target="_blank">企业学习</a></li>
               <c:if test="<%=studentBean!=null %>">
                	<li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                	<li><a href="<%=basePath %>datainfo/myface.jsp" target="_blank">个人主页</a></li>
                </c:if>
            </ul>
        </li>
		<c:if test="${studentBean!=null}">
        	<li class="fr"><a target="_blank" href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>">学习中心</a></li>
        </c:if>
        <li class="fr apps"><a href="<%=basePath %>datainfo/app.jsp" target="_blank" style="background:none;">课堂APP</a>
            <ul>
                <li><a  target="_blank">Android</a></li>
                <li><a  target="_blank">iPhone</a></li>
                <li><a  target="_blank">iPad</a></li>
            </ul>
        </li>
        <li class="fr" id="TopCart">
            <a href="<%=basePath %>courselistservlet?order=mycar1" target="_blank" class="red">购物车<span><%=num %></span></a>
        </li>
        <li class="fr reg"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册</a></li>
        <c:if test="${studentBean==null}">
        	<li class="fr"><a href="<%=basePath %>datainfo/login.jsp">登录</a></li>
        </c:if>
       <c:if test="${studentBean!=null}">
       		 <li class="fr"><a href="<%=basePath %>loginservlet?order=exit"><font color="red">【安全退出】</font></a></li>
       		 <c:if test="<%=studentBean.getVIP()!=1 %>">
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vip_grey2.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%"/></a></li>
       		 </c:if>
       		 <c:if test="<%=studentBean.getVIP()==1 %>">
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vipred.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%";/></a></li>
       		 </c:if>
       </c:if> 
       </ul>
</div>        
<ul class="FixedSideBar">
        <li class="FixedSideBar_iPad">
            <ul class="reddot"></ul>
            <p>APP下载</p>
            <div class="FixedSideBar_SSS"></div>
            <div class="FixedSideBar_iPad_QrCode">
                <img src="<%=basePath %>image/big.png" style="width:90px;" />
                <div class="tc">下载学院APP<br />缓存视频离线看</div>
            </div>
        </li>
        <li class="FixedSideBar_FeedBack">
            <p><a href="<%=basePath %>courselistservlet?order=fankui" target="_blank">意见反馈</a></p>
        </li>
        <li class="FixedSideBar_GoTop">
            <p>返回顶部</p>
        </li>
    </ul>
    
<div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="<%=basePath %>courselistservlet?order=list" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" class="fl"/></a>
        </div>
            <ul class="Navigate fl">
            <li>
            	<li><a href="<%=basePath %>courselistservlet?order=list">首页</a></li>
				<li><a target="_blank" href="<%=basePath %>courselistservlet?order=study">微职位培训</a></li>
		        <li><a target="_blank" >视频课程</a></li>
		        <li><a target="_blank" >套餐</a></li>
		        <li><a target="_blank" >职业路线图</a></li>
		        <li><a target="_blank" >企业学习</a></li>
		        <li><a target="_blank" >免费试听</a></li>
            <li>
              <p class="min_more">线下学习</p>
              <div class="min_more">
                  <a target="_blank" >CTO训练营</a>
	              <a target="_blank" >WOT峰会</a>
	              <a target="_blank" >百城沙龙</a>
              </div>
            </li>
        </ul>
        </div>
    </div>
<style type="text/css">
	body {background: #f4f4f4;}
	.Page {width: 1200px;}
	.page-bgs .CourseTeacher-top-right {font-size: 16px;color: #00baf2;border:1px solid #00baf2;border-radius: 4px;padding: 0 24px;height: 32px;line-height: 32px;margin-top: 15px;}
	.page-bgs .CourseTeacher-top-right:hover {background: #fff;color: #00baf2;}
</style>
<div class="page-bgs">
	<img src='/index.php?do=course&m=addView&id=1034'  style="display:none"  />
	<input type="hidden" value="1" id="ThisIsCoursePage" />
	<div class="FixedPage" style="box-shadow:none;">
		<div class="Page">
			<ul class="CourseTabControlF" style="float:left;margin-bottom:-6px;margin-top:5px;">
				<li class="CTItem ">目录</li>
				<li class="CTItem CARCur">介绍</li>
				<li class="CTItem">资料</li>
			</ul>
			<div class="CourseBtn" style="float:right;margin:5px 0px;" id="FixedPageCourseBtn">
				<button  class= "buyCourseButton" style="background: #c01920;"  onclick="_educto.push(['_trackEvent', 'edu', 'buy','id=1034&title=VMware服务器虚拟化视频课程之入门篇'])" >立即购买</button>
				</div>
			<div class="DisCount">
				<h5 class="red fl" id="DisCount-chid">
						${o.price}</h5>
							</div>
			<div class="clear"></div>
		</div>
	</div>
<c:if test="${msg!=null}">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</c:if>
	<input name="courseid" value="${o.course_id}" type="hidden"/>
	<div class="CoursePage" style="position:relative;z-index: 2;">
		<div class="Page">
			<ul class="Crumbs">
				<li><a href="/course/courseList/id-all.html" target="_blank"><h1>视频课程</h1></a></li>
				<li><span>&gt;</span></li>
				<li><a href="/course/courseList/id-61.html" target="_blank"><h1>${o.course_name}</h1></a></li>
				<li><span>&gt;</span></li>
				<li>${o.one_word}</li>
				<!-- 广告位6  -->
			</ul>
			<div class="CourseIntro page-top">
				<div class="clear"></div>
				<div class="CourseImg" style="">
				<div class="courseCardType">独家</div>
					          <!-- 小角标 -->
				<!-- 课程图片 -->
					<c:if test="${o.ismoney==0}">
							<img alt="${o.sectionname}" width="400px" height="300px" src="${o.picture_url}" title="${o.sectionname}" />
					</c:if>
					<c:if test="${o.ismoney==1}">
						<img alt="${o.sectionname}" width="400px" height="300px" src="${o.picture_url}" title="${o.sectionname}" />
						<div class="CoursePlay"></div>
					</c:if>
				</div>
				<div style="clear:both;"></div>
				<div class="CourseIntro_Text CourseIntro_Text_top" style="margin-top:-365px;">
					<h1 title="${o.sectionname}" style="line-height:30px;">${o.one_word}</h1>
					<!--  课程标签 -->
				 	<div class="CoursePrePrice CoursePrePrice-top">
            		<div class="top">
            			<c:if test="${o.ismoney==1}">
  							<p class="fl f40 cf" id="coursePrice">付费&nbsp;&nbsp;￥${o.price}<span class="f14 c3"></span></p>
  							<div class="clear"></div>
            			</c:if>
            			<c:if test="${o.ismoney==0}">
  							<p class="fl f40 cf" id="coursePrice">免费<span class="f14 c3"></span></p>
  							<div class="clear"></div>
            			</c:if>
            		</div>

						<div class="bottom">
              <c:if test="${o.ismoney==1}">
              		<div class="courseInfo_line courseInfo_line_bg fl" style="line-height: 14px;">
                        <span class="fl line-wo">优惠</span>
        				<a class="fl line-bg" href="#lina">${requestScope.price}折</a>
                        <span id="maxcoupon"></span>
              		</div>
              </c:if>
              <!-- 手机专享 start -->
                                              <!-- 手机专享 end -->
            </div>
						<div class="clear"></div>
					</div>

					<div class="courseInfo_line courseInfo_line_top">
						<span class="fl">
						${o.course_count}课时 · 45分钟<em class="lop-top02">|</em>						</span>
						<span class="fl">5分(15人评价)<em class="lop-top02">|</em></span>
						<span class="fl">发布时间： <%=new Date().toLocaleString() %></span>
						<div class="clear"></div>
					</div>
					<p>讲师寄语：${o.one_word}</p>
					<p>加入VIP可以更加优惠</p>
					<p class="CourseVipD">
							付费特权：
							<a href="javascript:void(0);" class="CourseVip CourseVIP1">24小时內讲师答疑</a>
							<a href="javascript:void(0);" class="CourseVip CourseVIP4">所有课时永久观看</a>
					</p>
					<div class="CourseBtn" style="padding-top: 30px">
						<c:if test="${o.ismoney!=0}">
							<a href="<%=basePath %>courselistservlet?order=buy&courseid=${o.course_id}&code=<%=request.getAttribute("codeid") %>"><img src="<%=basePath %>image/button.png"/></a>
						</c:if>
						<c:if test="${o.ismoney!=0}">
							<a id="car" href="<%=basePath %>courselistservlet?order=gouwuche&sectionid=${o.course_id}"><img src="<%=basePath %>image/button1.png"/></a>
						</c:if>
						<c:if test="${o.ismoney==0}">
							<span>点下方的我要学习，寻找喜欢的章节即可观看视频</span>
						</c:if>
            		</div>
					<div class="CoursePrP">
						<div class="CoursePr cp_7 c42 f14" style="position:relative;overflow: visible;">
							<span class="c9">下载课程</span>
						</div>
						<div class="CoursePrQrCode fl" style="width:100px;z-index:99;position: relative;margin-left: -85px;margin-top:20px;margin-right: -52px;">
							<img src="<%=basePath %>image/big.png" />
							<div class="tc">下载学院APP<br />缓存视频离线看</div>
						</div>
						<span class="lop-top"></span>
						<a class="CoursePr c9 f14 cp_1 " href="javascript:void(0);">
						收藏						(742)
						</a>
						<!--
												-->
												<span class="lop-top"></span>
						<a class="CoursePr cp_6 c9" href="javascript:void(0);">学习码观看</a>
												<span class="lop-top"></span>
						<a class="CoursePr cp_5 c9 f14" href="javascript:void(0);" style="margin-right: 10px;">分享</a>
						<style type="text/css">
						.bdsharebuttonbox	{float:left !important;margin-right: 10px !important;}
						.bdshare-button-style1-16 a, .bdshare-button-style1-16 .bds_more	{margin:0px 6px 0px 0px !important;background-image: url(https://static1.51cto.com/edu/images/whitestyle/share_icons.png?v=20160711) !important;padding-left:20px !important;}
						.bdshare-button-style1-16 .bds_weixin	{background-position: 0px 0px !important;}
						.bdshare-button-style1-16 .bds_tsina	{background-position: -45px 0px !important;}
						.bdshare-button-style1-16 .bds_qzone	{background-position: -90px 0px !important;}
						.bdshare-button-style1-16 .bds_more	{background-position: -135px 0px !important;}
						</style>
						<div class="bdsharebuttonbox">
							<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
							<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
							<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
							<a href="#" class="bds_more" data-cmd="more"></a>
						</div>
                        <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":["mshare","bdysc","renren","tqq","bdxc","kaixin001","tqf","tieba","douban","tsohu","bdhome","sqq","thx","ibaidu","meilishuo","mogujie","diandian","huaban","duitang","hx","fx","youdao","sdo","qingbiji","people","xinhua","mail","isohu","yaolan","wealink","ty","iguba","fbook","twi","linkedin","copy","print"],"bdPic":"https://s1.51cto.com/wyfs02/M01/57/76/wKiom1SaijbxI9PAAAHy6RMdXrc141_big.jpg","bdStyle":"1","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='<%=basePath%>/js/share.js?v=2.4.4'];</script>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div><!--Page End-->
	</div>
	<div style="display:none" id="confirm"></div>
	<div class="Page CourseAbout" style="position: relative;z-index: 1;">
		<div class="CA_Left CA_Left_top">
			<!--  套餐 路线图 start -->
						<a name="lina"></a>
			<ul class="CA_RecTitle" style="margin-top:25px;">
				<li class="CARItem CARCur">名课榜单</li>
			</ul>
			<div class="CourseAbout-box">
				<div class="CourseAbout-btn pay-title" style="padding: 0;">
					<span class="fr right" id="pay-right">&#62;</span>
					<em class="fr" id="pay-middle"></em>
					<span class="fr left active" id="pay-left">&#60;</span>
				</div>
			<div class="CourseAbout-list">
				<ul class="box-list-01 CourseAbout-box-list">
					<c:forEach items="${courselist}" var="i">
						<li class="fl">
							<a class="left fl" href="<%=basePath %>courselistservlet?order=datainfo&courseid=${i.course_id}" target="_blank"><img src="${i.picture_url}" width="94" height="70"><p>共${i.course_count}课程</p></a>
							<div class="right fl">
								<a class="title" href="<%=basePath %>courselistservlet?order=datainfo&courseid=${i.course_id}" target="_blank">${teacherbean.teachername}老师全部课程套餐（${i.course_name}+${i.one_word}）</a>
									<c:if test="${i.ismoney==0}">
										免费
									</c:if>
									<c:if test="${i.ismoney==1}">
										<span class="fl">价格&nbsp;<em>${i.price}</em>&nbsp;<i>元</i></span>
									</c:if>
									<c:if test="${i.ismoney==0}">
										<a class="box-list-01-btn fr" href="<%=basePath %>courselistservlet?order=datainfo&courseid=${i.course_id}" target="_blank">我要试学</a>
									</c:if>
									<c:if test="${i.ismoney==1}">
										<a class="box-list-01-btn fr" href="<%=basePath %>courselistservlet?order=datainfo&courseid=${i.course_id}" target="_blank">去购买</a>
									</c:if>
									<div class="clear"></div>
							</div>
							<div class="clear"></div>
						</li>
					</c:forEach>
				</ul>
					</div>
			<div class="CourseAbout-list" style="display:none;">
				<ul class="box-list-02 CourseAbout-box-list">
					<li>
						<a  target="_blank"><img title="vSphere企业运维（入门到提高）学习路线图" src="https://s1.51cto.com/images/201611/424897186bc1ac10c7c742d4c365c4e85dd685.jpg" width="116" height="70"></a>
					</li>
					<div class="clear"></div>
				</ul>
					</div>
							</div>
			<div class="clear"></div>

						<!--  套餐 路线图 end -->
			<div class="CourseTabControlMask"></div>
			<ul class="CourseTabControl">
				<li class="CTItem ">目录</li>
				<li class="CTItem CARCur">资料</li>
				<li class="CTItem">介绍</li>
			</ul>
			<!-- 课程百分比数组 -->
			<script>var FillA = new Array();</script>
			<div class="clear"></div>
			<ul class="CourseTab">
				<li style="display:block">
					<ul class="List ListPXB">
						<div style="font-size:30px;text-align:center">课程&nbsp;&nbsp;&nbsp;&nbsp;${o.course_name}</div>
			        	<c:forEach items="${sectionlist}" var="s">
			        		<li>
								<div class="right fl">
								<p>&nbsp;</p>
									<p>
										<c:if test="${o.ismoney==0}">
											${s.sectionname}:${s.sectionremark}<p><a class="box-list-01-btn fr"  style="margin-left:600px" href="<%=basePath %>datainfo/shipin.jsp?sectionurl=${s.sectionurl}&coursename=${o.course_name}&imgsrc=${o.picture_url}&studentid=${studentbean.studentid}" target="_blank">我要试学</a></p>
										</c:if>
										<c:if test="${o.ismoney==1}">
											${s.sectionname}:${s.sectionremark}<p><a class="box-list-01-btn fr"  style="margin-left:600px" href="<%=basePath %>courselistservlet?order=datainfo&courseid=${o.course_id}" target="_blank">我要购买</a></p>
										</c:if>
									</p>
									<div class="clear"></div>
								</div>
							<div class="clear"></div>
			            	</li>
			        	</c:forEach>
			        	<li>
								<div class="right fl">
								<p>&nbsp;</p>
									<c:if test="${o.ismoney==1}">
										<p>
											第三节:JSP提供了9个内置对象，常用的几个分别是request，response，session，application和pageContext<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">去购买</a></p>
									</c:if>
									<c:if test="${o.ismoney==0}">
										<p>
											第三节:JSP提供了9个内置对象，常用的几个分别是request，response，session，application和pageContext<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">我要试学</a></p>
									</c:if>
									<div class="clear"></div>
								</div>
							<div class="clear"></div>
			            </li>
			            <li>
								<div class="right fl">
								<p>&nbsp;</p>
								<c:if test="${o.ismoney==1}">
									<p>
										第四节:4种属性范围可以直接通过pageContext类的setAttribute(String name,Object value,int scope)方法完成<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">去购买</a></p>
								</c:if>
								<c:if test="${o.ismoney==0}">
									<p>
										第四节:4种属性范围可以直接通过pageContext类的setAttribute(String name,Object value,int scope)方法完成<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">我要试学</a></p>
								</c:if>
									<div class="clear"></div>
								</div>
							<div class="clear"></div>
			            </li>
			            <li>
								<div class="right fl">
								<p>&nbsp;</p>
								<c:if test="${o.ismoney==1}">
									<p>
										第五节:request对象是javax.servlet.http.HttpServlet接口的实例，主要表示取得客户端发送而来的请求，<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">去购买</a></p>
								</c:if>
								<c:if test="${o.ismoney==0}">
									<p>
										第五节:request对象是javax.servlet.http.HttpServlet接口的实例，主要表示取得客户端发送而来的请求，<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">我要试学</a></p>
								</c:if>
									<div class="clear"></div>
								</div>
							<div class="clear"></div>
			            </li>
			            <li>
								<div class="right fl">
								<p>&nbsp;</p>
								<c:if test="${o.ismoney==1}">
									<p>
										第六节:response对象是javax.servlet.http.HttpServletResponse接口的实例，主要表示服务器端对客户端的回应<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">去购买</a></p>
								</c:if>
								<c:if test="${o.ismoney==0}">
									<p>
										第六节:response对象是javax.servlet.http.HttpServletResponse接口的实例，主要表示服务器端对客户端的回应<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">我要试学</a></p>
								</c:if>
									<div class="clear"></div>
								</div>
							<div class="clear"></div>
			            </li>
			            <li>
								<div class="right fl">
								<p>&nbsp;</p>
								<c:if test="${o.ismoney==1}">
									<p>
										第七节:一个文件保存在WEB-INF文件夹中是绝对安全的，但是需要通过修改web.xml进行路径的映射才可以访问<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">去购买</a></p>
								</c:if>
								<c:if test="${o.ismoney==0}">
									<p>
										第七节:一个文件保存在WEB-INF文件夹中是绝对安全的，但是需要通过修改web.xml进行路径的映射才可以访问<p><a class="box-list-01-btn fr" style="margin-left:600px"  target="_blank">我要试学</a></p>
								</c:if>
									<div class="clear"></div>
								</div>
							<div class="clear"></div>
			            </li>
			        </ul>
				</li>
				<li style="display:none;" id="course_comment_list">
					<div class="CourseFile">
						<dl>
							<dd class="CourseFile_Down">
								<table>
									<tr>
										<th style="width:50%">标题</th>
										<th style="width:15%">课时</th>
										<th style="width:15%">资料大小</th>
										<th style="width:20%">下载</th>
									</tr>
									<tr title="MicrosoftPower Map for Excel2013安装">
										<td class="tc">Microsoft Power Map Preview for Excel.rar</td>
											<td>课时2</td>
											<td>12.18MB</td>
											<td><span>付费学员专享</span></td>
									</tr>
									<tr title="通过简单流程，快速熟悉Microsoft Power Map for Excel。">
										<td class="tc">福州新开楼盘-Power MAP.xlsx</td>
										<td>课时4</td>
										<td>428.43KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="场景一制作：演示报告封面（地球旋转）">
										<td class="tc">公司销售报表.xlsx</td>
										<td>课时5</td>
										<td>538.23KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="生成独立播放视频">
										<td class="tc">背景音乐.rar</td>
										<td>课时9																				</td>
										<td>278.83KB</td>
										<td><span>付费学员专享</span>
									</td>
									</tr>
									<tr title="EXCEL2016中自定义地图背景">
										<td class="tc">自定义地图文件.rar</td>
										<td>课时11																				</td>
										<td>311.41KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="MicrosoftPower Map for Excel2013安装">
										<td class="tc">Microsoft Power Map Preview for Excel.rar</td>
											<td>课时2</td>
											<td>12.18MB</td>
											<td><span>付费学员专享</span></td>
									</tr>
									<tr title="通过简单流程，快速熟悉Microsoft Power Map for Excel。">
										<td class="tc">福州新开楼盘-Power MAP.xlsx</td>
										<td>课时4</td>
										<td>428.43KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="场景一制作：演示报告封面（地球旋转）">
										<td class="tc">公司销售报表.xlsx</td>
										<td>课时5</td>
										<td>538.23KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="生成独立播放视频">
										<td class="tc">背景音乐.rar</td>
										<td>课时9																				</td>
										<td>278.83KB</td>
										<td><span>付费学员专享</span>
									</td>
									</tr>
									<tr title="EXCEL2016中自定义地图背景">
										<td class="tc">自定义地图文件.rar</td>
										<td>课时11																				</td>
										<td>311.41KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
								</table>
							</dd>
													</dl>
						<dl id="Related">
							<dt>相关资料推荐</dt>
							<dd class="CourseFile_About">
								<ul id="RelatedList">
									<table>
										<tr title="MicrosoftPower Map for Excel2013安装">
										<td class="tc">Microsoft Power Map Preview for Excel.rar</td>
											<td>课时2</td>
											<td>12.18MB</td>
											<td><span>付费学员专享</span></td>
									</tr>
									<tr title="通过简单流程，快速熟悉Microsoft Power Map for Excel。">
										<td class="tc">福州新开楼盘-Power MAP.xlsx</td>
										<td>课时4</td>
										<td>428.43KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="场景一制作：演示报告封面（地球旋转）">
										<td class="tc">公司销售报表.xlsx</td>
										<td>课时5</td>
										<td>538.23KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="生成独立播放视频">
										<td class="tc">背景音乐.rar</td>
										<td>课时9																				</td>
										<td>278.83KB</td>
										<td><span>付费学员专享</span>
									</td>
									</tr>
									<tr title="EXCEL2016中自定义地图背景">
										<td class="tc">自定义地图文件.rar</td>
										<td>课时11																				</td>
										<td>311.41KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="MicrosoftPower Map for Excel2013安装">
										<td class="tc">Microsoft Power Map Preview for Excel.rar</td>
											<td>课时2</td>
											<td>12.18MB</td>
											<td><span>付费学员专享</span></td>
									</tr>
									<tr title="通过简单流程，快速熟悉Microsoft Power Map for Excel。">
										<td class="tc">福州新开楼盘-Power MAP.xlsx</td>
										<td>课时4</td>
										<td>428.43KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="场景一制作：演示报告封面（地球旋转）">
										<td class="tc">公司销售报表.xlsx</td>
										<td>课时5</td>
										<td>538.23KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									<tr title="生成独立播放视频">
										<td class="tc">背景音乐.rar</td>
										<td>课时9																				</td>
										<td>278.83KB</td>
										<td><span>付费学员专享</span>
									</td>
									</tr>
									<tr title="EXCEL2016中自定义地图背景">
										<td class="tc">自定义地图文件.rar</td>
										<td>课时11																				</td>
										<td>311.41KB</td>
										<td><span>付费学员专享</span></td>
									</tr>
									</table>
								</ul>
							</dd>
						</dl>
					</div>
				</li>
				<!-- 试卷 -->
				<li style="display:none;">
					<div class="CourseTabIntro-box">
						<div class="clear"></div>
						</div>
						<div class="CourseTabIntro-box">
							<span class="left fl">讲师寄语</span>
							<p class="right fl" id="content_code">
								${o.one_word}
								使大家能够从平时代码的基础性操作,及简单问题代码计算。通过学习真正领略到编程领域高深难点问题(递归调用,全排列,组合,快排序,动态规划)算法解题 思路及精髓。让大家 真正意义上站在VBA 算法层面的最高处
							</p>
							<div class="clear"></div>
						</div>
						<div class="CourseTabIntro-box">
							<span class="left fl">课程简介</span>
							<div class="right fl" id="content_code">
								<p class="right fl">
									${o.introduce}
									DisplayTag是一个开源的自定义标签库（Custom Tag lib），提供了直接而有效的格式化web视图层数据的有效手段。你可以在现在流行的web应用的MVC模式中集成DisplayTag到View层， 其提供的强大表格格式化功能一定会令你爱不释手。或许上面说的有些夸张了，但是DisplayTag在表格的格式化方面表现确实出色，当然，他也只能显示 表格，视图层的大部分工作不就是使用表格来格式化数据嘛？！
									
								
								</p>
							</div>
							<div class="clear"></div>
						</div>
						<div class="CourseTabIntro-box">
							<span class="left fl">课程资料</span>
							<div class="right fl" id="content_code">
								<p class="right fl">
									<ul>
										<li>
											·C/C++笔试题集锦（找工作必读）
										</li>
										<li>
											·面试题汇总（java、c/c++合集）
										</li>
										<li>
											·学习java基础的好资料
										</li>
										<li>
											·javaee邮箱的开发【适合初学者】
										</li>
										<li>
											·Linux C函数使用手册
										</li>
										<li>
											·Linux C编程一站式学习经典资料
										</li>
										<li>
											·GoF_23种设计模式解析【附C++实现源码】
										</li>
										<li>
											·【独家汇总】专家解析C/C++常见bug经典问答
										</li>
										<li>
											·小巧而全面的C/C++参考手册
										</li>
										<li>
											·网上非常经典的C 入门教程
										</li>
									</ul>
							<div class="clear"></div>
						</div>
						<div class="CourseTabIntro-box">
							<span class="left fl">课程简介</span>
							<div class="right fl" id="content_code">
								<p class="right fl">${o.introduce}</p>
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
						<div class="clear"></div>
						<div class="QQ_recom">
						<div class="Info fl">
							<h5>加入IT课堂office学习交流群，</h5>
							<p>随时和讲师、学伴交流</p>
						</div>
						<div class="fr Btn">
							275300091<a href="http://shang.qq.com/wpa/qunwpa?idkey=9ea1f863fdc6f96c6368eb24e00b9fcebdd858fa78a38865da3d024431fcfee0" target="">立即加入</a>
						</div>
						<div class="clear"></div>
					</div>
				</li>
			</ul>
			<!--  -->
			<div class="clear" id="AndStudyThisNBSP"></div>
			<div class="UWillLike disp-n" id="AndStudyThis">
				<h2>学习过此课程的人还学习了</h2>
					<ul class="CRL_RecoC CRL_RecoCB" id="AndStudyThisList" style="overflow:hidden">
					</ul>
			</div>
			<!--  -->
		</div>
		<div class="CA_Right">
			<div class="poster-box poster-box-padd">
				<div class="IndexBannerPics poster-img-box">
					<c:if test="${o.ismoney!=0}">
						<c:if test="${requestScope.code!=0}">
							<c:if test="${codebean.exchangemeony!=0}">
								<div class="edu-ad" ad_id="230" course_id="1034">
									<a href="<%=basePath %>courselistservlet?order=lingqu&money=${codebean.exchangemeony}&code=${codebean.exchangecode}&courseid=${o.course_id}"><img src="<%=basePath %>image/code${codebean.exchangemeony}.jpg"/></a>
								</div>
							</c:if>
							<c:if test="${codebean.exchangemeony==0}">
								<div class="edu-ad" ad_id="230" course_id="1034">
									<a ><img src="<%=basePath %>image/code0.jpg"/></a>
								</div>
							</c:if>
						</c:if>
					</c:if>
						<c:if test="${requestScope.code==0}">
							<div class="edu-ad" ad_id="230" course_id="1034">
								<img src="<%=basePath %>image/code${requestScope.money}h.jpg"/>
							</div>
						</c:if>
						<c:if test="${codebean==null}">
							<div class="edu-ad" ad_id="230" course_id="1034">
							无优惠券！
							</div>
						</c:if>
				</div>
			</div>
			<!-- 分类广告位 -->
			<!-- 讲师展示 start -->
			<div class="CourseTeacher poster-box">
				<!-- 购买后或者免费课程显示 -->
								<div class="CourseTeacher_Head CourseTeacher_Head_top">
					<div class="right-title-box"><h2 class="right-title">讲师</h2></div>
					<div class="CourseTeacher_Head_top_teach">
						<div class="left fl">
				      		<a  target="_blank">
					      	<img alt="${teacherbean.teachername}" src="${teacherbean.teacherpictureurl}" />
					      	</a>						    
				        </div>
					    <div class="right fr" style="width: 190px;">
					    	<!-- 讲师名称 -->
					    	<div class="CourseTeacher_Info">
								<h2><a href="" target="_blank">${teacherbean.teachername}</a></h2>
			                <a href=""  target="_blank">
				                </a>
				             <div class="clear"></div>
							</div>
						    <p>好评率：<span class="org">96%</span></p>
							</div>
						<div class="clear"></div>
				    </div>
				    <p class="CourseTeacher_Head_top_con">${teacherbean.teacherjianjie}</p>
				</div>
				<!-- 评价-没购买并且不免费的 -->
					<div class="student-box fl">
						<div class="right-title-box"><h2 class="right-title">学员评价<b class="right-title-btn"></b></h2></div>
							<div class="CourseTeacher-top pb40 CourseTeacher-height">
								<div class="fl left">5</div>
								<div class="fl center" style="margin-top: 8px;">
									<div class="CCS_Stars" style="margin: 0;">
										<input type="hidden" class="ccs_ccs" value="5" />
										<div class="CCS_StarsBG"></div>
										<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" />
									</div>
									<span>15人评价</span>
											<span>好于63%的课程</span>
											</div>
								<div class="clear"></div>
							</div>
						<ul class="list">
							<li>
									<em>精</em>
									<span>
										非常好的课程还有资料可以下载 就是后面的内容看着难啊 感觉这才是有用的东西 对解决实际问题帮助太大了 真正的能提升自己 超喜欢 &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; 
									</span>
									<div class="list-bottom">
										<a class="left fl" href="/user/user_id-12493746.html" target="_blank">kkxzjbmpp</a>
										<div class="right fr">
											<div class="CCS_Stars_sm">
												<input type="hidden" class="ccs_ccs_sm" value="5" />
												<div class="CCS_StarsBG_sm"></div>
												<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
											</div>
											<span>5分</span>
										</div>
										<div class="clear"></div>
									</div>
								</li>
									<em>精</em><span>终于找到我想要的了 老师课程后面的内容太经典了 还以为自己很厉害了看了才知道 差的太远了 &nbsp;  看12课  组合 问题 帮助别人解决体彩问题  把学费赚回来了  哈  赞赞</span>
									<div class="list-bottom">
										<a class="left fl" href="/user/user_id-10138870.html" target="_blank">乐逍遥2015</a>
										<div class="right fr">
											<div class="CCS_Stars_sm">
												<input type="hidden" class="ccs_ccs_sm" value="3.7" />
												<div class="CCS_StarsBG_sm"></div>
												<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
											</div>
											<span>3.7分</span>
										</div>
										<div class="clear"></div>
									</div>
								<c:forEach items="${pingjia}" var="p">
								<li>
									<span>${p.evalcontent}！</span>
									<div class="list-bottom">
										<a class="left fl" href="/user/user_id-7714799.html" target="_blank">${p.studentname}</a>
										<div class="right fr">
											<div class="CCS_Stars_sm">
												<input type="hidden" class="ccs_ccs_sm" value="5" />
												<div class="CCS_StarsBG_sm"></div>
												<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
											</div>
											<span>${p.evallevel}分</span>
										</div>
										<div class="clear"></div>
								</li>
							
							</c:forEach>
						<div class="clear"></div>
					</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<pre id="content_temp" style="display:none">
		<span style="color: rgb(127, 127, 127); font-size: 14px;">
			<span style="color: rgb(127, 127, 127); background-color: rgb(255, 255, 255);">
				<strong>课程目标</strong>
			</span>
			<strong>：</strong>
		</span>
	<span style="color: rgb(127, 127, 127); font-size: 14px;"><strong><br/>
	<div class="clear"></div>
</div>
<script>
	$.ajax({
	    url:'http://edu.51cto.com/?do=course&m=getRelated',
	    data:{course_id:"1034"},
	    dataType:'json',
	    type:'post',
	    success:function(e){
	        if(e.relatedData && e.relatedData.length>0){
	            $(e.relatedData).each(function(i,e){
	                $("#RelatedList").append('<li><a href="http://down.51cto.com/data/'+e.downloads+'" target="_blank"><span>·</span>'+e.title+'</a></li>')
	            })
	        }else{
	            $("#Related").remove();
	        }

	        if(e.book && e.book.length>0){
	            $(e.book).each(function(i,e){
	                var item = '<li style="padding-bottom:15px;margin-bottom: 15px;padding-top:15px;">'+
	                        '<a href="'+e.url+'" target="_blank"><img src="'+e.thumb+'"style="width:98px;height:144px;float:left;display:block;margin-left:17px;" /></a>'+
	                        '<div class="fr" style="width:190px;font-size:14px;">'+
	                        '<p style="margin-bottom: 10px;"><a href="'+e.url+'" target="_blank">'+e.title+'</a></p>'+
	                        '<p style="margin-bottom: 10px;" class="c9"> </p>'+
	                        '<p style="margin-bottom: 10px;">作者：'+e.author+'</p>'+
	                        '<p>价格：<span class="red">'+e.price+'.00 元</span></p>'+
	                        '</div>'+
	                        '<div class="clear"></div>'+
	                        '</li>';
	                $("#BooksList").append(item);
	            })
	        }else{
	            $("#Books").remove();
	        }

	        // 没有图书不显示模块
	        if($('#BooksList li').length == 0){
	        	$("#Books").remove();
	        }
	    }
	})

	//$("#content_code").html($("#content_temp").html());
		document.getElementById("content_code").innerHTML = document.getElementById("content_temp").innerHTML;
	//课程Tab
		$(".CourseTabControl>li").click(function(){
			if($(this).index()<7){
				tabList(this)
			}
		});
		$(".CourseTabControlF>li").click(function(){
			tabList(this);
			var ftop =$(".CourseTabControl").offset().top;
			$(window).scrollTop(ftop+1);
		});
		var tabList = function(e){//
			var n = $(e).index();
			tabListClick(n);
		}

		// 123
		tabListClick = function(n){
			if(n == 3){
				$.get('/index.php?do=comment&m=courseCommentList&course_id='+course_id,function(h){
					$('#course_comment_list').html(h);
					//回复
					$(".CourseQuest_Reply").click(function(){
						ShowReply(this)
					});

				})
			}else if(n == 4){
				$.get('/index.php?do=note&m=courseNoteList&course_id='+course_id,function(h){
					$('#course_note_list').html(h);
					// $('.CourseNotes_img').css('cursor','url('+imgpath+'../images/magnifier.png),pointer');
					// 笔记图片放大
					$('.CourseNotes_img').click(function(){
						if($(this).attr('name') == 'Notes_img'){
							$(this).parent().removeClass('show');
							$(this).attr('name','');
						}else{
							$(this).attr('name','Notes_img');
							$(this).parent().addClass('show');
						}
					});
				})
			}else if(n == 6){
				var lessonURL = 'http://edu.51cto.com/exam/lesson?y=1&course_id='+course_id;
				// 获取课时列表 
				function setGet(e){
					$.get(e,function(h){
						$('#exam_less_time').html(h);
						$('#pagination a').click(function(){
							var thHref = $(this).attr('href');
							setGet(thHref);
							return false;
						})
					})
				}
				setGet(lessonURL);
			}
			$(".CourseTabControl>li").removeClass('CARCur');
			$(".CourseTabControlF>li").removeClass('CARCur');
			$(".CourseTabControl>li").eq(n).addClass('CARCur');
			$(".CourseTabControlF>li").eq(n).addClass('CARCur');
			$(".CourseTab>li").css('display','none');
			$(".CourseTab>li").eq(n).css('display','block');
		}
		//
		$(".CourseAnnex>li,.tab1").click(function(){//
			var n=this.className.replace('tab','');
			$(".CourseTabControl>li").eq(n).click();
			var x =$(".CourseTabControl").offset().top;
			$(window).scrollTop(x);

		});

		//课程评价动作
		function appraisesInit(){}{
			$('#appraiseList_info').on('click', '.pagesGoPrve, .pagesNum, .pagesGoNext, .pagesGoHome, .pagesGoEnd',function(event) {
				var obj = $(this);
				if(obj.hasClass('pagesNumCur')) return ;

				var href = $(this).attr('href');
				$.get(href,function(h){
					$('#appraiseList_info').html(h);
					appraisesInit();
					$(".CourseTabControlF li").eq(5).click();
				});
				return false;
			});
		}
</script>

<script type="text/javascript">
	var favNum		= 	"742";
	var user_email	=	"";
	
	
	var username 	=	"";
	var isRemin 	= 	"false";
	var examData = [];
	$.getJSON('/index.php',{'do':'course','m':'getExam','id':course_id},function(data){
		if(data.status==1 && data.data.length>0){
			examData = data.data;
			$('.cp_4').show();
		}else{
			$('.cp_4').remove();
		}
	});

	$('.cp_4').click(function(){
		var BoxMain = $('<div style="padding:10px;line-height:30px;"></div>');
		if(examData.length == 1){
			location.href = examData[0].url;
		}else{
			$.each(examData,function(i,e){
				BoxMain.append($('<p style="border-top:1px dotted #DDD;text-align:left;padding-left:5px;"><a href="'+e.url+'" target="_blank" style="display:block;">'+e.title+'</a></p>'));
			});
			new AutoBox({
				title:'<span style="font-weight:bold;color:#333;">测验列表</span>',
				noCon:true,
				ADD:BoxMain,
				mask:true,
				Yes:'关闭'
			});
		}
	});
	//课时列表动作
	function lessionInit(){}{
		$('#course_lessions_lists').on('click', '.pagesGoPrve, .pagesNum, .pagesGoNext, .pagesGoHome, .pagesGoEnd',function(event) {
			var obj = $(this);
			if(obj.hasClass('pagesNumCur')) return ;

			var href = $(this).attr('href');
			$.get(href,function(h){
				$('#course_lessions_lists').html(h);
				lessionInit();
				$(".CourseTabControlF li").eq(0).click();
			});
			return false;
		});
	}
	lessionInit();
	$(function(){
		
		//订阅操作
		$(".cp_2").bind('click',function(){//鼠标经过
			var me = this;
			if(user_id == '0'){
				location.href='/index.php?do=msg&m=index&msg=no_login';
				return false;
			}
			if(!$(this).hasClass('cp_2ed')){//
				var c = '<div style="padding:30px 30px 0px 30px;width:340px;padding-right:10px;font-size:12px;text-align:left;">';
				c+='<input type="" style="width:210px;height:22px;line-height:22px;border:1px solid #DDD;padding:3px;" value="'+user_email+'"  id="email"/><button id="ok_do" style="width:80px;height:30px;overflow:hidden;color:#FFF;background:#00baf2;border:none;cursor:pointer;padding:0px;" class="closeMB">确认订阅</button>';
				c+='<table style="display:inline-block;text-align:left;"><tr>';
				c+='<td><input type="checkbox" checked="checked" style="margin-left:0;" id="isc" name="send_msg" value="1" /></td>';
				c+='<td><label for="isc">是否发送站内通知</label></td>';
				c+='</tr></table>';
				c+='<p>邮箱默认提取您的注册邮箱，您可以修改为您的常用邮箱。</p>';
				c+='<p>订阅课程后，当课程更新时，将向您的订阅邮箱发送提醒邮件。</p>';
				c+='</div>';
				new AutoBox({
					'title':'订阅课程更新',
					'W':390,
					'mask':true,
					'noCon':true,
					'ADD':c,
					'ok':function(){
						var email = $('#email').val();
						var myreg = /^([a-zA-Z0-9]+[_|_|.]?)*[a-za-z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+.[a-zA-Z]{2,3}$/;
			            if(!myreg.test(email)){
							new AutoBox({
								'content':'请输入正确的邮箱',
								'autoClose':3
							});
							return false;
			            }
						var send_msg = $('#send_msg').attr('checked');
						send_msg	=	( send_msg !== 'checked' ) ? '0' : '1' ;
						$.ajax({
							type:'post',
							url:'/index.php?do=subscribe&m=addSub',
							dataType:'json',
							data:{email:email,send_msg:send_msg,course_id:course_id},
							success:function(data) {
								var d_content	=	'订阅失败！';
								if(data.status) {
									$(me).html('已订阅');
									$(me).addClass('cp_2ed');
									var d_content	=	'订阅成功！';
								}
								new AutoBox({
									'img': 'remind',
									'noCBtn':true,
									'content':d_content,
									'autoClose':3
								});
							}
						})
					}
				});
			}
		});
		//套餐鼠标经过
		$(".CA_TCL p").bind('mouseover',function(){
			var n = $(this).index();
			$(this).siblings().removeClass('CA_TCLCur');
			$(this).addClass('CA_TCLCur')
			$(".CA_TCMainItem").css('display','none');
			$(".CA_TCMainItem").eq(n).css('display','block');
		});
		//套餐翻页
		var cats = $(".CA_TCC");
		$(".CA_TCC").each(function(i){
			var n = $(this).find('li').length;
			$(this).prev().val(n);
			if(n > 3){
				$(this).parent().next().next().find('.CA_TCBtnDown').removeClass('CA_TCBtnDownNo').addClass('CA_TCBtnDownYes');
			}
		});
		$(".CA_TCBtnDown").click(function(){
			var x = $(this).parent().prev().prev().children('ul');
			var t = x.next().val();
			var n = Math.ceil(x.prev().val()/3);
			//console.log(n,t);
			if(n==t) {
				return false;
			}else{
				x.animate({'top':0-(160*t)});
				t++;
				x.next().val(t);
				$(this).prev().removeClass('CA_TCBtnUpNo').addClass('CA_TCBtnUpYes');
				if(n==t){
					$(this).removeClass('CA_TCBtnDownYes').addClass('CA_TCBtnDownNo');
				}
			}
		});
		$(".CA_TCBtnUp").click(function(){
			var x = $(this).parent().prev().prev().children('ul');
			var t = x.next().val();
			var n = Math.ceil(x.prev().val()/3);
			//console.log(n,t);
			if(t==1) {
				return false;
			}else{
				x.animate( {'top':0-(160*(t-2))} );
				t--;
				x.next().val(t);
				$(this).next().removeClass('CA_TCBtnDownNo').addClass('CA_TCBtnDownYes');
				if(t==1){
					$(this).removeClass('CA_TCBtnUpYes').addClass('CA_TCBtnUpNo');
				}
			}
		});
		
		//appraisesInit();
		//分享
		$("#bdshare").bind('mouseover',function(){//
			$(".cp_5").addClass('cp_5ed');
		}).bind('mouseleave',function(){//
			$(".cp_5").removeClass('cp_5ed');
		});
		//回复
		$(".CourseQuest_Reply").click(function(){
			ShowReply(this)
		});
		$(".CourseQuest_ReplyT button").click(function(){
			StartReply(this);
		});
		//赞
		$(".CourseNotes_Good").click(function(){//
			if($(this).attr('disabled')) return false;
			var x = $(this).next().val();
			x++;
			$(this).html('已赞('+x+')');
			$(this).attr('disabled',true);
		});
		//课程评价 161616 
		$(".ccs_ccs").each(function(e){//
			var n = $(this).val();
			var x = (9*parseInt(n))+(n*20);
			$(this).next().animate({'width':x},500);
		});
		$('.ccs_ccs_sm').each(function(e){//
			var n = $(this).val();
			var x = (4.9*parseInt(n))+(n*13);
			$(this).next().animate({'width':x},500);
		});
		$(".CCSCCN").each(function(e){//
			var n = $(this).val();
			var x = 1+(5*parseInt(n))+(n*15);
			$(this).prev().animate({'width':x},500);
		});

		//固定TabControls
		$(window).scroll(function(){//
			isScroll();
		});
		/*$('button#addCartBtn').bind('click', function() {
			if(user_id == 0) {
				tripLogin();
				return false;
			}
			addCart(course_id);
		});*/

		isScroll();

		//Goto Comm
		if(location.hash == '#comm'){
			$(".CourseTabControl>li").eq(5).click();
			var x =$(".CourseTabControl").offset().top;
			$(window).scrollTop(x);
		}
		//
		if(location.hash == '#exam'){
			$(".CourseTabControl>li").eq(6).click();
			var x =$(".CourseTabControl").offset().top;
			$(window).scrollTop(x);
		}
		if(location.hash == '#down'){
			$(".CourseTabControl>li").eq(2).click();
			var x =$(".CourseTabControl").offset().top;
			$(window).scrollTop(x);
		}
		
	});

	


	//字符串切割
	var strSplitByLen = function (str,len) {
		var l = 0;
		var str1 = '';
		var str2 = '';
		for(var i in str){
			var length = str[i].charCodeAt();
			l = ( length >= 0 && length <= 128 ) ? l+1 : l+2;
			if(l < len){
				str1 += str[i];
			}else{
				str2 += str[i];
			}
		}
		var newstr = {0:str1,1:str2}
		return newstr;
	}

	//数字长度格式化
	var zeroize = function (value, length) {
	    if (!length) length = 2;
	    value = String(value);
	    for (var i = 0, zeros = ''; i < (length - value.length); i++) {
	        zeros += '0';
	    }
	    return zeros + value;
	};

	//时间戳转换
	var getLocalTime = function(nS,sign) {
		var dateval	 =	nS ? new Date(parseInt(nS) * 1000) : new Date();
		var yy	=	dateval.getFullYear();
		var mm 	=	zeroize(dateval.getMonth() + 1);
		var dd 	=	zeroize(dateval.getDate());
		if(sign > 0){
			var hh  = 	zeroize(dateval.getHours());
			var ii	=	zeroize(dateval.getMinutes());
			var ss 	=	zeroize(dateval.getSeconds());
			return yy + '-' + mm + '-' + dd + ' ' + hh + ':' + ii + ':' + ss;
		}
		return yy + '-' + mm + '-' + dd;
	}

	//字符串长度计算
	var strHtmlLen = function(value){
		var _tmp = value.length;
		var _length = 0;
		for (var i = 0; i < _tmp; i++) {
			if (value.charCodeAt(i) > 255) {
				_length = _length + 2;
			}else {
				_length++;
			}
		}
		return _length;
	}
	


	// 显示手机专享二维码
	$('.phone-erwm').mouseover(function() {
		$(this).find('.phone-erwm-down').show();
	}).mouseout(function(){
		$('.phone-erwm-down').hide();
	});



	var start_time = '';
	var end_time = '';

	function setCookie(name, value, iDay) {
	    var oDate = new Date();
	    oDate.setTime(oDate.getTime() + iDay*1000);
	    var dateStr = ( iDay == 0 ) ? '' : ';expires='+oDate.toGMTString();
	    document.cookie = name+'='+value+dateStr+';path=/';
	}
	//获取cookie
	function getCookie(name) {
	    var arr = document.cookie.split('; ');
	    var i = 0;
	    for(i=0; i<arr.length; i++) {
	        var arr2 = arr[i].split('=');
	        if(arr2[0] == name) {return arr2[1];}
	    }
	    return '';
	}
	//删除cookie
	function removeCookie(name) {
	    setCookie(name,'',-1);
	}

	// 点击最高优惠显示超值套餐
	$('.line-bg').eq(0).click(function(){
		$('.CARItem').eq(0).addClass('CARCur');
		$('.CourseAbout-list').eq(0).show();
		$('.CARItem').eq(1).removeClass('CARCur');
		$('.CourseAbout-list').eq(1).hide();
	});

	// 超值套餐轮播图
	var paychild01 = $('.box-list-01 li'),
		payLeft01 = $("#pay-left01"),
		payLight01 = $("#pay-right01"),
		pay_middle01 = $('#pay-middle01'),
		paybox01 = $('.box-list-01'),
		paychildwidth01 = paychild01.width()+20;

	var payLeft = $("#pay-left"),
		payLight = $("#pay-right"),
		pay_middle = $('#pay-middle'),
		CourseAbout_btn = $('.CourseAbout-btn');

	// 相关路线图
	var paychild02 = $('.box-list-02 li'),
		payLeft02 = $("#pay-left02"),
		payLight02 = $("#pay-right02"),	
		pay_middle02 = $('#pay-middle02'),
		paybox02 = $('.box-list-02'),
		paychildwidth02 = paychild02.width()+45;

	//套餐路线图
	$(".CARItem").click(function(){
		var n = $(this).index();
		$(this).siblings().removeClass('CARCur');
		$(this).addClass('CARCur');
		$(".CourseAbout-list").css('display','none');
		$(".CourseAbout-list").eq(n).css('display','block');
		if(n==0) setPayBox(paychild01,paybox01,paychildwidth01,2);
		if(n==1) setPayBox(paychild02,paybox02,paychildwidth02,5);
	});

	setPayBox(paychild01,paybox01,paychildwidth01,2);
	function setPayBox(paychild,paybox,paychildwidth,n){
		if(paychild.length <= n){
			CourseAbout_btn.hide();
		}else{
			CourseAbout_btn.show();
		}
		paybox.css("width", paychild.length*paychildwidth+'px');
		var lt = 0;
		var rt = paychild.length-n;
		payLeft.click(function(){
			payLight.removeClass('active');
			if (lt < 1) {
				return;
			}
			if( lt == 1){
				payLeft.addClass('active');
			}
			lt--;
			rt++;
			paybox.animate({left:'+='+paychildwidth+'px'}, 700);
		});

		payLight.click(function(){
			payLeft.removeClass('active');
			if (rt < 1){
				return;
			}
			if( rt == 1){
				payLight.addClass('active');
			}
			lt++;
			rt--;
			paybox.animate({left:'-='+paychildwidth+'px'}, 700);
		});
	};
	var CheckCourseBuy = '',price = '79';
	if(!CheckCourseBuy && price > 0 ){
		$.ajax({
		    url:'http://edu.51cto.com/?do=course&m=getCourseCoupon',
		    data:{course_id:"1034"},
		    type:'get',
		    success:function(data){
		    	$(".CA_Right").prepend(data);
		    	$("#maxcoupon").html($('#max_coupon').html());
		    	var it_lef = $('.coupon-l'),
					it_rig = $('.coupon-r'),
					it_coupon_li = $(".coupon-list .coupon_ch_box"),
					it_coupon_btn = $(".coupon-list-btn-item");
					it_coupon_btn_li = $(".coupon-list-btn li"),
					it_img_coupon_btn = $(".coupon-list-btn");
		    	setIndexBanner(it_lef, it_rig, it_coupon_li, it_coupon_btn, it_coupon_btn_li, it_img_coupon_btn,8);
		    }
		})  
	}
	 

	// 点击更多跳到评价
	$('.right-title-btn').click(function(){
		$('.CTItem').eq(5).click();
	});

	// 继续学习进度条
	var courseStudyPercent = '';
	if(courseStudyPercent != ''){
		barWidth = $(".graph").width()*courseStudyPercent/100;
		$("#bar").css({'width': barWidth+'px'});
	}

</script>

<script charset="utf-8" src="https://wpa.b.qq.com/cgi/wpa.php"></script>
<script type="text/javascript">
	BizQQWPA.addCustom({aty: '0',a: '1001',
		nameAccount: '4008519651',
		selector: 'qqwaps'});
	BizQQWPA.visitor({nameAccount: '4008519651'});
</script>
<!----------------------数据分析  begin ---------------------->
<script type="text/javascript">
var
	levelid = "", 
	packid = "",
	returnData = "",
	returnLikeCourse = "";
	$.get('/index.php?do=course&m=courseInfoTract&course_id=1034',function(e){
		if(e.status==1){
			course_id = e.data.course_id;
			levelid = e.data.levelid;
			packid = e.data.packid;
			returnData = e.data.returnData;
			returnLikeCourse = e.data.returnLikeCourse;
			$.getScript('https://static1.51cto.com/edu/js/pv_tract.js?v=2016092803');
		}
	},'json')

</script>
<!----------------------数据分析  end ------------------------>

<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="http://edu.51cto.com/" title="51cto学院"><img src="<%=basePath %>image/itlogo.png" alt="IT课堂" width="194" height="40"/></a>
            </caption>
            <tr>
                <td>
                    <img src="https://static1.51cto.com/edu/css/../center/images/qrcode.png" alt="学院APP" width="110" height="110"/>
                    <p>学院APP</p>
                </td>
                <td>
                    <img src="https://static1.51cto.com/edu/css/../center/images/qrcode2.png" alt="官方微信" width="110" height="110"/>
                    <p>官方微信</p>
                </td>
            </tr>
        </table>
        <div class="Info fl">
            <div class="Map">
<a href="<%=basePath %>courselistservlet?order=guanyu" target="_blank">关于我们</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=help" target="_blank">帮助中心</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=fankui1" target="_blank">意见反馈</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=lianxi" target="_blank"  title="联系我们">联系我们</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=dengji" target="_blank">课程登记</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=gushi" target="_blank">学员故事</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=jiaoliu" target="_blank"  title="学员交流">学员交流</a>            </div>
            <p class="Call fl red">176-0797-5702</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">eamil &copy; 275300091 <a  target="_blank">@qq.com</a></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="mask disp-n" id="AdviceMask"></div>
<div class="Advice disp-n" id="Advice">
    <div class="Main">
        <button class="close" onclick="$('#AdviceMask').hide();$('#Advice').hide();">&nbsp;</button>
        <button id="bizQQ_WPA">&nbsp;</button>
        <h3>可以开发票么？</h3>
        <p>可以的，购买课程或者充值余额后都是可以开具发票的，具体详情点击：<a href="http://bbs.51cto.com/thread-1472105-1.html" target="_blank">我要开发票</a></p>
        <h3>购买的课程可以下载么？</h3>
        <p>目前PC端暂不支持下载课程视频，请手机或者平板电脑下载“51CTO学院”APP后再下载视频哦！</p>
        <h3>优惠券如何使用？</h3>
        <p>非折扣课程（不包含1元课程/套餐）可使用，一个订单（可包含多个课程）只可使用一张；优惠券一经使用，不再返还；若被冻结请在PC端删除订单即可返还。</p>
        <p class="mt20">更多问题查询点击 <a href="http://edu.51cto.com/help.html" target="_blank">帮助中心</a></p>
        <p class="mt10">欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，<a href="http://edu.51cto.com/user/feedback.html" target="_blank">我要反馈意见</a></p>
    </div>
</div>
<script type="text/javascript">
$("#bizQQ_WPA").click(function(){
    window.open('http://edu.51cto.com/contactqq.html')
})
</script>

<script type="text/javascript" src="https://static1.51cto.com/edu/js/edu-ad.js?v=20161009"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/edu_header.js?v=1.2.2"></script>
<!----------------------数据分析  begin --------------------->
<script type="text/javascript">
    var sessionid = "su6anuqienkqbudnbf37171gg7",
            ip = "182.97.23.197",
            user_id = "0",
            source = 0;
</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/md5.js"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/tract_public.js?v=10.21"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/pv_tract.js?v=2016092803"></script>
<!----------------------数据分析  end -------------------->
<span style="display:none;">
<script src="https://logs.51cto.com/rizhi/count/count.js"></script>
</span>




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
</body>
</html>


