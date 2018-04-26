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
<meta name="viewport" content="width=1200, initial-scale=device-width/1200, user-scalable=no, minimal-ui">
<title>IT课堂APP</title>
<meta name="keywords" content="公交、地铁、被窝、咖啡厅，利用碎片时间、下载缓存离线学习IT课程，和300万小伙伴一起学习500位一线大牛的18大类5万个IT实战课程。学习最火、最新、最实用的IT课程从这里开始！" />
<meta name="description" content="" />
<meta   http-equiv="Expires"   CONTENT="0">
<meta   http-equiv="Cache-Control"   CONTENT="no-cache">
<meta   http-equiv="Pragma"   CONTENT="no-cache">
<LINK href="/favicon.ico" type="image/x-icon" rel=icon>
<link href="https://static1.51cto.com/edu/css/reset.css?v=2.4.5" rel="stylesheet" type="text/css" />
<link href="https://static1.51cto.com/edu/css/style.css?v=2.4.5" rel="stylesheet" type="text/css" />
 
<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.4.5"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/msgbox.js?v=2.4.5"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/nav.js?v=2.4.5"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/mbox.js?v=2.4.5"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.5"></script>
<!-- 通用顶部简导航 -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.82">
<script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.82"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.5"/>
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.5" rel="Stylesheet" />
<script type="text/javascript">
var gen_logo = '1';
</script>
</head>
<body>
<%
	StudentBean studentBean = (StudentBean)session.getAttribute("bean");
	int num = Integer.parseInt(session.getAttribute("num").toString());
%>
<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til"><a href="http://edu.51cto.com/">中国最大的IT技能学习平台</a></li>
        <li class="fr navi"><a href="javascript:void(0);" target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="javascript:void(0);" target="_blank">微职位</a></li>
                <li><a href="javascript:void(0);" target="_blank">视频课程</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="javascript:void(0);" target="_blank">企业学习</a></li>
                <li><a href="javascript:void(0);" target="_blank">申请开课</a></li>
                <li><a href="javascript:void(0);" target="_blank">51CTO主站</a></li>
                <li><a href="javascript:void(0);" target="_blank">CTO训练营</a></li>
                <li><a href="javascript:void(0);" target="_blank">WOT峰会</a></li>
                <li><a href="javascript:void(0);" target="_blank">百城沙龙</a></li>
            </ul>
        </li>
<c:if test="${studentBean!=null}">
        	<li class="fr"><a target="_blank" href="<%=basePath %>loginservlet?order=loginin&name=${studentBean.studentmobile}">学习中心</a></li>
        </c:if>
        <li class="fr apps"><a href="<%=basePath %>datainfo/app.jsp" target="_blank" style="background:none;">课堂APP</a>
            <ul>
                <li><a href="http://edu.51cto.com/download/android/v-02.html" target="_blank">Android</a></li>
                <li><a href="https://itunes.apple.com/us/app/51cto-xue-yuan-shi-zhanit/id1038062672?l=zh&ls=1&mt=8" target="_blank">iPhone</a></li>
                <li><a href="https://itunes.apple.com/us/app/51cto-xue-yuan/id948807016?ls=1&mt=8"  target="_blank">iPad</a></li>
            </ul>
        </li>
        <li class="fr" id="TopCart">
            <a href="<%=basePath %>courselistservlet?order=mycar1" target="_blank" class="red">购物车<span><%=num %></span></a>
        </li>
        <li class="fr reg"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册</a></li>
        <c:if test="<%=studentBean.getStudentname()==null %>">
        	<li class="fr"><a href="<%=basePath %>datainfo/login.jsp">登录</a></li>
        </c:if>
       <c:if test="<%=studentBean!=null %>">
       		 <li class="fr"><a href="<%=basePath %>loginservlet?order=exit">安全退出</a></li>
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
        <li class="FixedSideBar_Spree">
            <p><a href="/spree/index" target="_blank">新人<br/>大礼包</a></p>
        </li>
        <li class="FixedSideBar_iPad">
            <ul class="reddot"></ul>
            <p>APP下载</p>
            <div class="FixedSideBar_SSS"></div>
            <div class="FixedSideBar_iPad_QrCode">
                <img src="https://static1.51cto.com/edu/images/whitestyle/download_qr2.png" style="width:90px;" />
                <div class="tc">下载课堂APP<br />缓存视频离线看</div>
            </div>
        </li>
        <li class="FixedSideBar_FeedBack">
            <p><a href="/user/feedback.html" target="_blank">意见反馈</a></p>
        </li>
        <li class="FixedSideBar_GoTop">
            <p>返回顶部</p>
        </li>
    </ul>
    <script src='http://zhushou.360.cn/script/plugin_tiper.js'></script>
<link type="text/css" href="https://static1.51cto.com/edu/css/actlist/10/css/style.css?v=1.4" rel="stylesheet" />
<style>
body{line-height: 1.75}
button.posA a,button.posA{color:#FFF;display:block;}
.Btns	{text-align: center;position: absolute;bottom:100px;left:50%;margin-left:-330px;}
	.Btns td	{padding:0px 10px;}
	.Btns a	{display: block;width:200px;height:55px;}
	.Btns a.a1	{background:url(${pagecontext.request.contextPath}/imgages/download_pic_btn_android.png);}
	.Btns a.a2	{background:url(${pagecontext.request.contextPath}/imgages/download_pic_btn_ios.png);}
	.Btns a.a3	{background:url(${pagecontext.request.contextPath}/imgages/download_pic_btn_pad.png);}
</style>
<div style="background:url(<%=basePath %>image/big.jpg) no-repeat center top;height:874px;position: relative;">
	<div class="Btns">
	<table>
		<tr>
			<td><a class="a1" href="<%=basePath %>datainfo/kaifa.jsp?name=Android客户端" target="_blank" title="Android客户端">&nbsp;</a></td>
			<td><a class="a2" href="<%=basePath %>datainfo/kaifa.jsp?name=iPhone客户端" title="iPhone客户端" target="_blank">&nbsp;</a></td>
			<td><a class="a3" href="<%=basePath %>datainfo/kaifa.jsp?name=iPad客户端" title="iPad客户端" target="_blank">&nbsp;</a></td>
		</tr>
	</table>
	</div>
</div>
<ul class="Intro Page">
	<li class="I1">
		<h2>高效学习</h2>
		<p>全微课形式的课时，可利用碎片时间高效学习，每一分每一秒都不虚度</p>
	</li>
	<li class="I2">
		<h2>云端同步</h2>
		<p>支持课程收藏，分享及云端同步学习记录，随意切换学习终端，升职加薪还会远么</p>
	</li>
	<li class="I3">
		<h2>自由学习</h2>
		<p>批量下载视频，保证离线观看，摆脱网络限制，更加自由自在的学习</p>
	</li>
	<li class="I4">
		<h2>课全学友多</h2>
		<p>500专家讲师、300万学员、18大类50000课程、30000个免费课程，找到适合自己的课程和讲师</p>
	</li>
</ul>


<!-- Footer End -->
<script type="text/javascript">
//
function TopLBT(){
	this.init();
}
TopLBT.prototype={
	size:$(".TopImgs img").length,
	now:0,
	mouse:false,
	init:function(){
		var me = this;
		this.show(0);
		setInterval(function(){
			if(me.mouse==true) return false;
			me.show(me.now);
		},5000);
	},
	show:function(n){
		this.hide();
		$(".TopImgs a").eq(n).fadeIn(100);
		$(".Top").css('background-color','#'+$(".TopImgs a").eq(n).children('img').attr('bgcolor'));
		$(".LBBns li").eq(n).addClass('Cur').siblings().removeClass('Cur');
		this.now++;
		if(this.now==this.size) this.now=0;
		//console.log(this.now);
	},
	hide:function(){
		$(".TopImgs a").hide();
		$(".Top").css('background-color','#FFF');
	}
};
var _LB = new TopLBT();

$(".LBBns li").mouseenter(function(){
	_LB.show($(this).index());
	_LB.mouse = true;
}).mouseleave(function(){
	_LB.mouse = false;
});

//
$('button.posA').mouseenter(function(){
	$(this).next().fadeIn(200);
}).mouseleave(function(){
	$(this).next().fadeOut(200);
});
</script>
<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="<%=basePath %>courselistservlet?order=list" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" alt="51cto学院" width="194" height="40"/>
            </caption>
            <tr>
                <td>
                    <img src="https://static1.51cto.com/edu/css/../center/images/qrcode.png" alt="学院APP" width="110" height="110"/>
                    <p>课堂APP</p>
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
            <p class="copy">Copyright &copy; 2017-2027 <a href="<%=basePath %>courselistservlet?order=list" target="_blank">51CTO.com</a></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<img src="<%=basePath %>images/qqbm_bs.png" style="position: fixed;right:10px;bottom:100px;z-index: 99;cursor: pointer;" onclick="$('#AdviceMask').show();$('#Advice').show();"/>
<div class="mask disp-n" id="AdviceMask"></div>
<div class="Advice disp-n" id="Advice">
    <div class="Main">
        <button class="close" onclick="$('#AdviceMask').hide();$('#Advice').hide();">&nbsp;</button>
        <button id="bizQQ_WPA">&nbsp;</button>
        <h3>可以开发票么？</h3>
        <p>可以的，购买课程或者充值余额后都是可以开具发票的，具体详情点击：<a href="javascript:void(0);" target="_blank">我要开发票</a></p>
        <h3>购买的课程可以下载么？</h3>
        <p>目前PC端暂不支持下载课程视频，请手机或者平板电脑下载“IT课堂”APP后再下载视频哦！</p>
        <h3>优惠券如何使用？</h3>
        <p>非折扣课程（不包含1元课程/套餐）可使用，一个订单（可包含多个课程）只可使用一张；优惠券一经使用，不再返还；若被冻结请在PC端删除订单即可返还。</p>
        <p class="mt20">更多问题查询点击 <a href="<%=basePath %>courselistservlet?order=help" target="_blank">帮助中心</a></p>
        <p class="mt10">欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，<a href="<%=basePath %>courselistservlet?order=fankui" target="_blank">我要反馈意见</a></p>
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
    var sessionid = "81e1coln08no06tojapd35s3e1",
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
<div style="display:none">
    <iframe frameborder="0" scrolling="no" width="0" height="0" src="http://log.51cto.com/pageview.php?frompos=edu_art"></iframe>
</div>
</body>
</html>
