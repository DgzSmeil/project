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
<title>视屏的播放</title>
<meta name="keywords" content="IT在线教育,51CTO视频课程,IT在线培训,课程在线,培训视频,在线视频" />
<meta name="description" content="51CTO学院是专业的IT在线教育平台，聘请云计算、大数据、HTML5、网络安全、服务器、Android、iOS、开发技术、SQL Server、Oracle、数据库等技术领域的专家，更有思科认证、软考、Linux认证、微软认证、H3C认证系列精品IT在线培训课程，汇集最顶尖的IT技术精品课程，最优秀的IT培训讲师授课，大量技术培训教程，学员付费后可在线观看，此外还可以获得专家讲师亲自答疑，并参加课程的在线评测。" />
<LINK href="/favicon.ico" type="image/x-icon" rel=icon/>
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
</head>
<body>
<% 
	StudentBean studentBean = (StudentBean)session.getAttribute("bean");
	int num=0;
	if(session.getAttribute("num")!=null){
		num = Integer.parseInt(session.getAttribute("num").toString());
	}
%>
<!-- 通用顶部导航 -->
<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til">中 国 最 大 的 IT 技 能 学 习 平 台</li>
        <li class="fr navi"><a  target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="<%=basePath %>courselistservlet?order=list" target="_blank">首页</a></li>
                <li><a href="<%=basePath %>datainfo/login.jsp" target="_blank">登录界面</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册界面</a></li>
                <c:if test="<%=studentBean!=null %>">
                	<li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                	<li><a href="<%=basePath %>datainfo/myface.jsp" target="_blank">个人主页</a></li>
                </c:if>
            </ul>
        </li>
        <c:if test="<%=studentBean.getVIP()==1 %>">
        	<li class="fr apps"><a href="<%=basePath %>datainfo/app.jsp" target="_blank" style="background:none;">会员专区</a>
	            <ul>
	                <li><a href="<%=basePath %>snack/snack.jsp" target="_blank">贪吃蛇</a></li>
	                <li><a href="<%=basePath %>3Dquanwang/demo.html" target="_blank"><span id="openmusic">3D拳王</span></a></li>
	                <li><a href="<%=basePath %>taiqiuyouxi/index.html" target="_blank">台球游戏</a></li>
	            	<li><a href="<%=basePath %>fivechess/index.html" target="_blank">五子棋</a></li>
	            	
	            </ul>
        	</li>
        </c:if>
        <c:if test="<%=studentBean!=null %>">
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
        <c:if test="<%=studentBean==null %>">
        	<li class="fr"><a href="<%=basePath %>datainfo/login.jsp">登录</a></li>
        </c:if>
       <c:if test="<%=studentBean!=null %>">
       		 <li class="fr"><a href="<%=basePath %>loginservlet?order=exit">安全退出</a></li>
       		 <c:if test="<%=studentBean.getVIP()!=1 %>">
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vip_grey2.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%"/></a></li>
       		 </c:if>
       		 <c:if test="<%=studentBean.getVIP()==1 %>">
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vipred.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%"/></a></li>
       		 </c:if>
       </c:if>
    </ul>
</div><!-- 顶部广告位 -->
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
            <p><a href="<%=basePath %>courselistservlet?order=fakui" target="_blank">意见反馈</a></p>
        </li>
        <li class="FixedSideBar_GoTop">
            <p>返回顶部</p>
        </li>
    </ul>
    
<div class="pagebg" style="width: 100%;background: #fff;">
    <div class="Page" style="height:90px;">
        <a href="<%=basePath %>courselistservlet?order=list" target="_blank">
            <img src="<%=basePath %>image/bg2.jpg" />
        </a>
    </div>
</div>
<div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="<%=basePath %>courselistservlet?order=list" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" class="fl"></a>
        </div>
            <ul class="Navigate fl">
            <li><a href="<%=basePath %>courselistservlet?order=list">首页</a></li>
            <li><a href="<%=basePath %>datainfo/tiwen.jsp?coursename=${param.coursename}&url=${param.sectionurl}&imgsrc=${param.imgsrc}&studentid=${param.studentid}" target="_blank">我要提问</a></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><a  target="_blank"><font color="red" ><%=request.getParameter("coursename") %>课程的播放</font></a></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><a href="<%=basePath %>data/pingjia.jsp?coursename=${param.coursename}&url=${param.sectionurl}&imgsrc=${param.imgsrc}&studentid=${param.studentid}" target="_blank">我要评价</a></li>
            <li><a href="<%=basePath %>courselistservlet?order=jiaoliutaolun" target="_blank">讨论交流</a></li>
        </ul>
    </div>
</div>
	 <div style="margin-left:78px">
		<c:if test="${param.sectionurl!=null}">
			<embed width='1200' height='520' border='1'  style="float:center" src='<%=basePath %>${param.sectionurl}'/>
		</c:if>
		<c:if test="${param.sectionurl==null}">
			<embed width='1200' height='520' border='1'  style="float:center" src='<%=basePath %>${requestScope.sectionurl}'/>
		</c:if>
	</div>

<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="http://edu.51cto.com/" title="51cto学院"><img src="<%=basePath %>image/itlogo.png" alt="51cto学院" width="194" height="40"/>
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
                <a href="<%=basePath %>courselistservlet?order=jiaoliu" target="_blank"  title="学员交流">学员交流</a>   
            </div>
            <p class="Call fl red">176-0797-5702</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2017-2027 <a href="http://www.51cto.com/" target="_blank">51CTO.com</a></p>
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
    var sessionid = "mavmlnrshc02mtvs6e7ajlk6k3",
            ip = "218.204.104.235",
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
