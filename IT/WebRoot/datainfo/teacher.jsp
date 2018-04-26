<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=1200, initial-scale=device-width/1200, user-scalable=no, minimal-ui">
<title>签约讲师_51CTO学院_最专业的IT在线教育平台！</title>
<meta name="keywords" content="IT在线教育,51CTO视频课程,IT在线培训,课程在线,培训视频,在线视频" />
<meta name="description" content="51CTO学院是专业的IT在线教育平台，聘请云计算、大数据、HTML5、网络安全、服务器、Android、iOS、开发技术、SQL Server、Oracle、数据库等技术领域的专家，更有思科认证、软考、Linux认证、微软认证、H3C认证系列精品IT在线培训课程，汇集最顶尖的IT技术精品课程，最优秀的IT培训讲师授课，大量技术培训教程，学员付费后可在线观看，此外还可以获得专家讲师亲自答疑，并参加课程的在线评测。" />
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
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.5">
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.5" rel="Stylesheet" />
<script type="text/javascript">
var gen_logo = '';
</script>
</head>
<body>

<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til"><a href="http://edu.51cto.com/">中国最大的IT技能学习平台</a></li>
        <li class="fr navi"><a href="http://edu.51cto.com/sitemap.html" target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="http://edu.51cto.com/px" target="_blank">微职位</a></li>
                <li><a href="http://edu.51cto.com/ke" target="_blank">视频课程</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="http://edu.51cto.com/activity/lists/id-23.html?dh2" target="_blank">企业学习</a></li>
                <li><a href="http://edu.51cto.com/lecturer/lectopics" target="_blank">申请开课</a></li>
                <li><a href="http://www.51cto.com/" target="_blank">51CTO主站</a></li>
                <li><a href="http://x.51cto.com/act/cto/camp/page/video?edutop" target="_blank">CTO训练营</a></li>
                <li><a href="http://wot.51cto.com/?edutop" target="_blank">WOT峰会</a></li>
                <li><a href="http://wot.51cto.com/act/bcsl/info?edutop" target="_blank">百城沙龙</a></li>
            </ul>
        </li>
        <li class="fr"><a target="_blank" href="http://edu.51cto.com/user/studyGains.html?dingbujdh">学员故事</a></li>
        <li class="fr apps"><a href="http://edu.51cto.com/activity/lists/id-10.html" target="_blank" style="background:none;">学院APP</a>
            <ul>
                <li><a href="http://edu.51cto.com/download/android/v-02.html" target="_blank">Android</a></li>
                <li><a href="https://itunes.apple.com/us/app/51cto-xue-yuan-shi-zhanit/id1038062672?l=zh&ls=1&mt=8" target="_blank">iPhone</a></li>
                <li><a href="https://itunes.apple.com/us/app/51cto-xue-yuan/id948807016?ls=1&mt=8"  target="_blank">iPad</a></li>
            </ul>
        </li>
        <li class="fr" id="TopCart">
            <a href="http://edu.51cto.com/user/login.html" target="_blank" class="red">购物车<span>0</span></a>
        </li>
        <li class="fr reg"><a href="http://edu.51cto.com/user/register.html" target="_blank">注册</a></li>
        <li class="fr"><a href="http://edu.51cto.com/user/login.html">登录</a></li>
    </ul>
</div>        <ul class="FixedSideBar">
        <li class="FixedSideBar_Spree">
            <p><a href="/spree/index" target="_blank">新人<br >大礼包</a></p>
        </li>
        <li class="FixedSideBar_iPad">
            <ul class="reddot"></ul>
            <p>APP下载</p>
            <div class="FixedSideBar_SSS"></div>
            <div class="FixedSideBar_iPad_QrCode">
                <img src="https://static1.51cto.com/edu/images/whitestyle/download_qr2.png" style="width:90px;" />
                <div class="tc">下载学院APP<br />缓存视频离线看</div>
            </div>
        </li>
        <li class="FixedSideBar_FeedBack">
            <p><a href="/user/feedback.html" target="_blank">意见反馈</a></p>
        </li>
        <li class="FixedSideBar_GoTop">
            <p>返回顶部</p>
        </li>
    </ul>
    
<input type="hidden" value="">
<div class="pagebg" style="width: 100%;background: #fff;">
    <div class="Page" style="height:90px;">
        <a href="http://edu.51cto.com/px/train/94?banner" target="_blank">
            <img src="https://s1.51cto.com/images/201702/e1276dd07bfcc5263ff09704b2cb57f4fb07de.jpg" />
        </a>
    </div>
</div>
<div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="http://edu.51cto.com/" title="51cto学院"><img src="https://static1.51cto.com/edu/css/../center/images/logo.png" class="fl"></a>
        </div>
            <ul class="Navigate fl">
            <li><a href="http://edu.51cto.com/">首页</a></li>
            <li><a href="http://edu.51cto.com/px" target="_blank">微职位培训</a></li>
            <li><a href="http://edu.51cto.com/course/courseList/id-all.html" target="_blank">视频课程</a></li>
            <li><a href="http://edu.51cto.com/package/packagelist.html?ejdh" target="_blank">套餐</a></li>
            <li><a href="http://edu.51cto.com/roadmap/index.html" target="_blank">职业路线图</a></li>
            <li><a href="http://edu.51cto.com/activity/lists/id-23.html?dh1" target="_blank">企业学习</a></li>
            <li><a href="http://edu.51cto.com/activity/lists/id-32.html?dh"  target="_blank">免费试听</a></li>
            <li>
              <p class="min_more">线下学习</p>
              <div class="min_more">
                  <a target="_blank" href="http://x.51cto.com/act/cto/camp/page/video?edunav">CTO训练营</a>
                  <a target="_blank" href="http://wot.51cto.com/?edunav ">WOT峰会</a>
                  <a target="_blank" href="http://wot.51cto.com/act/bcsl/info?edunav">百城沙龙</a>
              </div>
            </li>
        </ul>
        <div class="Search fr">
            <form class="form-search" id="q-form" method="get" action="http://edu.51cto.com/index.php">
                <input name="do" type="hidden" value="search">
                <input name="m" type="hidden" value="course" id="_SearchType">
                <button class="fr">搜索</button>
                <input type="text" class="fr" placeholder="找课程、找讲师" name="q" id="q" autocomplete="off" />
            </form>
        </div>
    </div>
</div>
<style type="text/css">
  .w960	{width:1200px;}
  .lec_cont	{width:1220px;margin-left: -20px;}
  .lec_box	{width:555px;}
</style>
<div class="w960" style="margin-top:20px;">
  	<div class="title01">
    	<h3 class="fl">IT课堂签约讲师<font color="#666" style="font-size:12px;">（1个讲师）</font></h3>
   		<div class="lec_bar_r"> <a href="/lecturer/lectopics" class="c_blue mr10 underline fl">申请讲师</a>
   		<form name="searchL" action="/index.php" method="get" onsubmit="return checkLecform();">
	      <p class="lec_soso">
	      	<input type="hidden" name="do" value="lecturer" />
	      	<input type="hidden" name="m" value="leclist" />
	        <input name="keyword" type="text" class="txt" id="searchLec" value="赖国荣" />
	        <input id="searchLecSubmit" name="" value="" type="image" src="https://static1.51cto.com/edu/images/lec_so.jpg" class="btn" title="搜索" />
	      </p>
	      </form>
	    </div>
  	</div>
  	<div class="lec_cont">
  	  		<div class="lec_box">
  			<div class="lec_01">
  				<a href="/lecturer/user_id-8307455.html" target="_blank">
		      	<img alt="赖国荣" src="https://s1.51cto.com/images/201606/e8611a709e0afc5de7c39267cdbaf242efcdd1_small.jpg"  width="120" height="120"/>
		      	</a>
		      	<div style="overflow: hidden;">
	  				<p class="font14" style="float:left;"><strong><a href="/lecturer/user_id-8307455.html" target="_blank">赖国荣</a></strong>
	  				</p>
					<a href="/index/help.html#honor"  target="_blank">
                		<div class="chl_2 LecHonorNameAfter fl ml10" style="width:70px;height:30px;margin-top: -9px;border:none;"></div>
                   </a>
		      	</div>
  				<p class="c_black" style="height:44px;overflow: hidden;">专业从事IT软件开发19年,10年的大学教学工作</p>
				<p><span class="mr10">课程：18门 </span><span>学员：20186人</span></p>
				<p class="enter">
					<a href="/lecturer/user_id-8307455.html" target="_blank">他的课程</a>
					<a href="http://gkimlaps.blog.51cto.com" target="_blank">他的博客</a>            <!-- 赞赏 -->
            	</p>
				<p class="clear"></p>
  			</div>
  			<dl style="height:99px;">
  				<dt class="font14"><strong>最新课程</strong></dt>
  				<dd><a href="/course/course_id-8010.html" target="_blank">JSP从入门到精通2016+在线视频教学平台项目实训视频课程（共74课时）</a></dd>
  				<dd><a href="/course/course_id-7815.html" target="_blank">JavaScript从入门到精通2016版教学视频（共14课时）</a></dd>
  				<dd><a href="/course/course_id-7662.html" target="_blank">仿QQ即时通信系统开发教学视频课程（2016版）（共23课时）</a></dd>
  			</dl>  
  		</div>
 	</div>
 	<div class="box3 clearall">
	    <div class="aa">
	     </div>
	</div>

<script>
  var imgteacher = 'https://static1.51cto.com/edu/images/';
	$('#searchLecSubmit').bind('click',checkLecform);
	
	function checkLecform(){
		if ($("#searchLec").val()=="" || $("#searchLec").val()=="查找签约讲师"){
			$("#searchLec").val("查找签约讲师");
			return false;
		} else {
			window.location.href="/index.php?do=lecturer&m=leclist&keyword=" + $('#searchLec').val();
			return false;
		}
		return false;
	};
	$("#searchLec").live("click",function(){
		if ($("#searchLec").val()=="" || $("#searchLec").val()=="查找签约讲师"){
			$("#searchLec").val("");
		}
    $("#searchLec").attr("style","color:#000000;");
	});
	$("#searchLec").live("blur",function(){
		if ($("#searchLec").val()==""){
			$("#searchLec").val("查找签约讲师");
      		$("#searchLec").attr("style","color:#c9c9c9;"); 
		}
	});
	var old_user = '';
	var user_id = "";
	</script>
<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="http://edu.51cto.com/" title="51cto学院"><img src="https://static1.51cto.com/edu/css/../center/images/logo.png" alt="51cto学院" width="194" height="40"/>
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
                <a href="http://edu.51cto.com/about/index.html" title="关于我们" target="_blank">关于我们</a>
                <span></span>
                <a href="http://edu.51cto.com/help.html" target="_blank"  title="帮助中心">帮助中心</a>
                <span></span>
                <a href="http://edu.51cto.com/user/feedback.html" title="意见反馈" target="_blank">意见反馈</a>
                <span></span>
                <a href="http://edu.51cto.com/about/contactus.html" target="_blank"  title="联系我们">联系我们</a>
                <span></span>
                <a href="http://bbs.51cto.com/thread-1113045-1.html" target="_blank"  title="课程登记">课程登记</a>
                <span></span>
                <a href="http://edu.51cto.com/user/studyGains.html" target="_blank"  title="学员故事">学员故事</a>
                <span></span>
                <a href="http://51edu.blog.51cto.com/8899635/1862738" target="_blank"  title="学员交流">学员交流</a>
            </div>
            <p class="Call fl red">400-851-9651</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2005-2017 <a href="http://www.51cto.com/" target="_blank">51CTO.com</a></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<img src="https://static1.51cto.com/edu/images/whitestyle/qqbm_bs.png" style="position: fixed;right:10px;bottom:100px;z-index: 99;cursor: pointer;" onclick="$('#AdviceMask').show();$('#Advice').show();">
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
    var sessionid = "42j1orkd6fk4pqbihq5e3sj2o1",
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
<div style="display:none">
    <iframe frameborder="0" scrolling="no" width="0" height="0" src="http://log.51cto.com/pageview.php?frompos=edu_art"></iframe>
</div>
</body>
</html>
