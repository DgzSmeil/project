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
		<title>IT课堂</title>
		<meta name="keywords"
			content="移动开发、编程语言、云计算、大数据、Web开发、网络安全、系统集成、考试认证、Office办公、数据库等" />
		<meta name="description"
			content="51CTO学院是51CTO旗下的职业IT在线教育平台，依托于11年行业品牌、1400万技术用户，目前已成为中国最大的IT技能学习平台。51CTO学院秉承“学以致用”、 “因材施教”、“有教无类”的教育理念，提供辅导式“微职位”和自学式“视频课程”两种在线学习模式，帮助广大IT技术人员实现技能提升、高薪就业的职业梦想。" />
		<link rel="shortcut icon" href="<%=basePath%>images/lo.png"
			type="image/x-icon" />
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
			href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.80">
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.80"></script>
		<!-- New Header -->
		<link rel="stylesheet" type="text/css"
			href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4">
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
			int num = 0;
			if (session.getAttribute("num") != null) {
				num = Integer.parseInt(session.getAttribute("num").toString());
			}
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
						<c:if test="<%=studentBean != null%>">
							<li>
								<a
									href="<%=basePath%>studentservlet?order=teacher&studentname=${studentbean.studentname}"
									target="right">申请开课</a>
							</li>
							<li>
								<a href="<%=basePath%>datainfo/myface.jsp" target="_blank">个人主页</a>
							</li>
						</c:if>
					</ul>
				</li>
				<c:if test="${studentBean!=null}">
					<li class="fr">
						<a target="_blank"
							href="<%=basePath%>loginservlet?order=loginin&name=${studentBean.studentmobile}">学习中心</a>
					</li>
				</c:if>
				<li class="fr apps">
					<a href="<%=basePath%>courselistservlet?order=app" target="_blank"
						style="background: none;">课堂APP</a>
					<ul>
						<li>
							<a target="_blank">Android</a>
						</li>
						<li>
							<a target="_blank">iPhone</a>
						</li>
						<li>
							<a target="_blank">iPad</a>
						</li>
					</ul>
				</li>
				<li class="fr" id="TopCart">
					<a href="<%=basePath%>courselistservlet?order=mycar1"
						target="_blank" class="red">购物车<span><%=num%></span>
					</a>
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
						<a href="<%=basePath%>loginservlet?order=exit"><font
							color="red">【安全退出】</font>
						</a>
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
					<img src="<%=basePath%>image/big.png" style="width: 90px;" />
					<div class="tc">
						下载学院APP
						<br />
						缓存视频离线看
					</div>
				</div>
			</li>
			<li class="FixedSideBar_FeedBack">
				<p>
					<a href="<%=basePath%>courselistservlet?order=fankui"
						target="_blank">意见反馈</a>
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
				<a target="_blank"> <img src="<%=basePath%>image/bg1.jpg" /> </a>
			</div>
		</div>
		<div class="Header">
			<div class="Page">
				<div class="Logo fl">
					<a href="<%=basePath%>datainfo/shouye.jsp" title="IT课堂">
					<img src="<%=basePath%>image/itlogo.png" class="fl"/>
					</a>
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
				<div class="Search fr">

            <form class="form-search" id="q-form" method="post" action="<%=basePath %>courselistservlet?order=shousuo">
                <button class="fr">搜索</button>
                <input type="text" class="fr" placeholder="请输入要搜索的内容" name="sousuo" id="q" />
            </form>
        </div>
			</div>
		</div>
		<link
			href="https://static1.51cto.com/edu/css/member/index/css/style.css?v=11.05"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/member.js?v=10.01"></script>
		<style type="text/css">
.lec_member span em {
	top: 9px;
}

.w960 {
	width: 1190px;
}

.p_kc_li dl {
	width: 790px;
}

.hyk-bar {
	width: 915px;
}
</style>
		<p class="clear hr15"></p>
		<div class="cont w960">
			<div class="lecturer_li">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="210" align="center" valign="top" class="p_left">
							<style type="text/css">
.contectTeacherQ {
	height: 20px;
	background: #00baf2
		url(https://static1.51cto.com/edu/images/whitestyle/contectteacherq.png)
		no-repeat center center;
	min-width: 83px;
	margin-top: 10px;
	border: none;
	cursor: pointer;
}

.ConsoleLeft_Tag_p p a {
	background: none;
	padding: 0px;
}
</style>
<div class="ConsoleLeft fl">
	<div class="ConsoleLeft_userInfo">
		<a href="<%=basePath%>courselistservlet?order=list"
			title="点击进入家园" target="_blank"><img alt="IT课堂"
				src="<%=basePath%>image/mylogobg.png" width="120"
				height="120" style="border-radius: 50%" />
		</a>
		<p class="tc">
			<a href="<%=basePath%>courselistservlet?order=list"
				title="点击进入家园" target="_blank"> IT课堂 </a>
		</p>
		<a href="<%=basePath%>courselistservlet?order=list">
			<div class="chl_3 LecHonorNameAfter fl"
				style="width: 100px; height: 40px; margin-left: 25px; border: none;"></div>
		</a>
		<p>
			学员总数：77987人
		</p>
		<p>
			好 评 率：98%
		</p>
		<div class="clear"></div>
	</div>
	<div class="per_menu">
		<div class="ibx-nav">
			<dl>
				<dt class="dtIcon1">
					<a href="javascript:void(0);">讲师的教学</a>
				</dt>
				<dd id="cur_index">
					<a href="javascript:void(0);">讲师的发布</a>
				</dd>
				<dd>
					<a href="javascript:void(0);" target="_blank">讲师的博客</a>
				</dd>
			</dl>
		</div>
	</div>

	<div class="ConsoleLeft_Tag">
		讲师职称
	</div>
	<div class="ConsoleLeft_Tag_p">
		<p>
			IT课堂旗下IT技能学习平台，依托于11年行业品牌、1400万技术用户，提供辅导式“微职位”和自学式“视频课程”两种在线学习模式，帮助广大IT技术人员实现技能提升、高薪就业的职业梦想。
		</p>
	</div>
	<div class="ConsoleLeft_Tag">
		擅长领域
	</div>
	<div class="ConsoleLeft_Tag_p">
		<p>
			移动开发、编程语言、云计算、大数据、Web开发、网络安全、系统集成、考试认证、Office办公、数据库等
		</p>
	</div>
	<div class="ConsoleLeft_Tag">
		讲师简介
	</div>
	<div class="ConsoleLeft_Tag_p">
		<p>
			IT课堂是旗下的职业IT在线教育平台，依托于11年行业品牌、1400万技术用户，目前已成为中国最大的IT技能学习平台。IT课堂秉承“学以致用”、
			“因材施教”、“有教无类”的教育理念，提供辅导式“微职位”和自学式“视频课程”两种在线学习模式，帮助广大IT技术人员实现技能提升、高薪就业的职业梦想。
		</p>
	</div>
	<div class="ConsoleLeft_Tag">
		标签
	</div>
	<div class="ConsoleLeft_Tag_p">
		<c:forEach items="${list}" var="s">
			<a
				href="<%=basePath%>courselistservlet?order=datainfo&sectionid=${s.sectionid}&courseid=${s.course_id}"
				target="_blank" style="white-space: nowrap; margin: 3px;">${s.course_name}</a>
		</c:forEach>
	</div>
</div>

<script>
    if(!setCookie){
        setCookie(name, value, iDay);
        getCookie(name);
    }
var cur = "index" || "index";
$("#cur_"+cur).addClass("cur");



// 关闭弹窗
$('.pop-close, .pop-btn').click(function(){
    $('.pop-box').hide();
});
// 种cookie
function setPopShow() {
    console.log(111);
    var nowday = new Date();
    var t = nowday.getTime(); 
    // 获取当前时间戳(以s为单位)
    var timestamp = (Date.parse(new Date())) / 1000;
    var stringTime = "2018-05-01 23:59:59";
    var timestamp2 = Date.parse(new Date(stringTime))/1000;
    var cookietimes = timestamp2 - timestamp;
    document.cookie='popshow'+ "=" + escape(1) + ";expires="+cookietimes;
}
</script>
</td>
		<td valign="top" class="p_right">
			<div class="tl title01 bd_bottom1">
				<h3>
					<a href="javascript:;" class="Cur">课程</a>
				</h3>
			</div>
			<c:forEach items="${courselist}" var="l">
				<p class="clear"></p>
				<div class="p_kc_li clearfix bd_bottom1"
					style="position: relative;">
					<a
						href="<%=basePath%>courselistservlet?order=datainfo&courseid=${l.course_id}"
						target="_blank"> <img alt="点击进入详情" src="${l.picture_url}"
							width="126" height="94" /> </a>
					<dl>
						<dt class="font14">
							<span class="fl kc_name"><a
								href="<%=basePath%>courselistservlet?order=datainfo&courseid=${l.course_id}"
								target="_blank">${l.course_name}----${l.one_word}(${l.course_count}课时)</a>
							</span>
							<span class="fr c_red font12 tr"> <c:if
									test="${l.ismoney==0}">
            	  				免费
            	  			</c:if> <c:if test="${l.ismoney==1}">
            	  				付费
            	  			</c:if> </span>
						</dt>
						<dd class="p_dd02">
							${l.one_word}${l.introduce}
						</dd>
						<dd class="p_dd03">
							<p class="fl p_dd03_l">
								<span><em>1028</em>人学习</span>
								<span><em><a href="" target="_blank">10</a>
								</em>条讨论</span>
								<c:if test="${l.ismoney==1}">
									<span><font color="red"><em>￥</em>${l.price}</font>
									</span>
								</c:if>
							</p>
							<span class="p_play"> <a
								href="<%=basePath%>courselistservlet?order=datainfo&courseid=${l.course_id}"
								target="_blank"><img alt="开始学习"
										src="https://static1.51cto.com/edu/images/p_play_ico.png"
										align="absmiddle" />开始学习</a> </span>
						</dd>
					</dl>
				</div>
			</c:forEach>
			<div class="box3">
				<div class="aa">
					<div class="pagesDevice">
						<a class="pagesNum pagesNumCur" style="width: 60px">共${pager.sumpage}页</a>
						<c:forEach begin="1" end="${pager.sumpage}" var="p" step="1">
							<a
								href="<%=basePath%>courselistservlet?order=shousuo&currenpage=${p}&handle=firstpage&sousuo=<%=request.getAttribute("name")%>"
								class="pagesNum pagesNumCur">1</a>
						</c:forEach>
						<a
							href="<%=basePath%>courselistservlet?order=shousuo&currenpage=${pager.currentpage }&handle=downpage&sousuo=<%=request.getAttribute("name")%>"
							class="pagesGoNext">&nbsp;</a>
					</div>
				</div>
			</div>
		</td>
	</tr>
</table>
</div>

</div>
<script>
    paybox.css("width", paychild.length*paychildwidth+'px');
    var lt = 0;
    var rt = paychild.length-2;
    
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

    var old_user = '';
    var user_id = "";
</script>

		<script type="text/javascript">
var lecid = "8899635"; 
</script>
		<div class="Footer">
			<div class="Page">
				<table class="QRcode tc">
					<caption>
						<img src="<%=basePath%>image/itlogo.png" alt="IT课堂" width="194"
							height="40" />
					</caption>
					<tr>
						<td>
							<img
								src="https://static1.51cto.com/edu/css/../center/images/qrcode.png"
								alt="学院APP" width="110" height="110" />
							<p>
								学院APP
							</p>
						</td>
						<td>
							<img
								src="https://static1.51cto.com/edu/css/../center/images/qrcode2.png"
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
						<a href="<%=basePath%>courselistservlet?order=dengji"
							target="_blank">课程登记</a>
						<span>|</span>
						<a href="<%=basePath%>courselistservlet?order=gushi"
							target="_blank">学员故事</a>
						<span>|</span>
						<a href="<%=basePath%>courselistservlet?order=jiaoliu"
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
						<a href="<%=basePath%>courselistservlet?order=list"
							target="_blank">IT课堂</a>
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
					<a href="<%=basePath%>courselistservlet?order=list"
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
					<a href="http://edu.51cto.com/help.html" target="_blank">帮助中心</a>
				</p>
				<p class="mt10">
					欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，
					<a href="http://edu.51cto.com/user/feedback.html" target="_blank">我要反馈意见</a>
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
    var sessionid = "jje0hpk4aae4b5be7lpantjdd6",
            ip = "182.97.87.71",
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
