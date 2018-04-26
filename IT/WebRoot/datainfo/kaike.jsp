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
<title>加入51CTO讲师团_51CTO学院</title>
<meta name="keywords" content="IT在线教育,51CTO视频课程,IT在线培训,课程在线,培训视频,在线视频" />
<meta name="description" content="51CTO学院是专业的IT在线教育平台，聘请云计算、大数据、HTML5、网络安全、服务器、Android、iOS、开发技术、SQL Server、Oracle、数据库等技术领域的专家，更有思科认证、软考、Linux认证、微软认证、H3C认证系列精品IT在线培训课程，汇集最顶尖的IT技术精品课程，最优秀的IT培训讲师授课，大量技术培训教程，学员付费后可在线观看，此外还可以获得专家讲师亲自答疑，并参加课程的在线评测。" />
<meta   http-equiv="Expires"   CONTENT="0">
<meta   http-equiv="Cache-Control"   CONTENT="no-cache">
<meta   http-equiv="Pragma"   CONTENT="no-cache">
<LINK href="/favicon.ico" type="image/x-icon" rel=icon>
 
<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/msgbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/nav.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/mbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.4"></script>
<!-- 通用顶部简导航 -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.81">
<script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.81"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4">
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.4" rel="Stylesheet" />
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
        <a href="http://edu.51cto.com/px/train/108?banner" target="_blank">
            <img src="https://s1.51cto.com/images/201702/879fdb836a18ce6583811444451496eeadd3f8.jpg" />
        </a>
    </div>
</div>
<div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="http://edu.51cto.com/" title="51cto学院"><img src="https://static1.51cto.com/edu/css/../center/images/logo.png" class="fl"></a>
        </div>
            <ul class="Navigate fl">
            <li><a href="<%=basePath %>datainfo/shouye.jsp">首页</a></li>
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
                <button class="fr">搜索</button>
                <input type="text" class="fr" placeholder="找课程、找讲师" name="q" id="q" autocomplete="off" />
            </form>
        </div>
    </div>
</div>
<link type="text/css" href="https://static1.51cto.com/edu/css/topicsstyle.css?v=1.2" rel="Stylesheet" />
<div class="page">
	<div class="joinUsTop Page">
		<a href="http://edu.51cto.com/center/lec/apply" target="_blank" class="go1"></a>
		<a href="http://edu.51cto.com/center/org/apply" target="_blank" class="go2"></a>
		<div class="sLines" style="height:44px;margin-top:120px;"></div>
		<p>51CTO学院——专业的IT职业在线教育及实战培训平台，是老牌知名技术网站51CTO旗下的IT实战在线教育培训平台</p>
		<p>依托于1500多万专业IT用户，面向IT人员及互联网从业人员、职场新人、大学生等，提供全品类技术领域精品课程</p>
		<p>帮助提升实战IT技能，解决工作实际问题，获得职业成长。</p>
		<div class="sLines" style="height:33px;"></div>
		<div class="arrow"></div>
	</div>
	<div class="Page JoinUsLv0">
		<h1 class="JoinUsTitle">51CTO学院优势</h1>
		<ul class="JoinUsLv0List">
			<li>
				<img src="https://static1.51cto.com/edu/images/lectopics/lv0_pic1.png" />
				<p>800多位实战技术专家入驻</p>
			</li>
			<li>
				<img src="https://static1.51cto.com/edu/images/lectopics/lv0_pic2.png" />
				<p>已有视频课程80000多个</p>
			</li>
			<li>
				<img src="https://static1.51cto.com/edu/images/lectopics/lv0_pic3.png" />
				<p>视频时长超过30,000小时</p>
			</li>
			<li>
				<img src="https://static1.51cto.com/edu/images/lectopics/lv0_pic4.png" />
				<p>500多万活跃学员</p>
			</li>
			<li>
				<img src="https://static1.51cto.com/edu/images/lectopics/lv0_pic5.png" />
				<p>课程播放次数超过1亿人次</p>
			</li>
		</ul>
		<div class="sLines" style="height:33px;"></div>
		<div class="arrow"></div>
	</div>
	<div class="Page JoinUsLv1">
		<h1 class="JoinUsTitle">讲师权益保驾护航</h1>
		<table class="">
			<tr>
				<td><img src="https://static1.51cto.com/edu/images/lectopics/lv1_pic1.png"></td>
				<td><img src="https://static1.51cto.com/edu/images/lectopics/lv1_pic2.png"></td>
				<td><img src="https://static1.51cto.com/edu/images/lectopics/lv1_pic3.png"></td>
				<td><img src="https://static1.51cto.com/edu/images/lectopics/lv1_pic4.png"></td>
			</tr>
			<tr>
				<td>
					<h4>技术变现</h4>
					<p>技术、知识方便兑现且收益可持续</p>
					<p>最高月收入超过10万元，技术成就梦想</p>
				</td>
				<td>
					<h4>精湛加密</h4>
					<p>业界最靠谱的视频加密技术</p>
					<p>100%保护你的知识版权</p>
				</td>
				<td>
					<h4>品牌塑造</h4>
					<p>高规格的讲师荣誉体系</p>
					<p>帮你打造在线教育领域个人品牌</p>
				</td>
				<td>
					<h4>版权办理</h4>
					<p>专职管家为您办理版权，帮讲师维权，打击盗版</p>
				</td>
			</tr>
			<tr>
			    <td>
					<h4>出书服务</h4>
					<p>51CTO学院与多家专业出版社深度合作</p>
					<p>为讲师出书提供一条龙服务</p>
					
				</td>
				<td>
					<h4>移动学习</h4>
					<p>移动端App满足讲师学员移动互动学习</p>
					
				</td>
				<td>
					<h4>人脉拓展</h4>
					<p>加入专家圈与同行大牛交流技术，结交好友</p>
					
				</td>
				<td>
					<h4>免费门票</h4>
					<p>51CTO主办的技术大会任性参加</p>
					<p>推荐优秀讲师成为大会主讲嘉宾</p>
				</td>
			</tr>
			<tr>
				<td>
					<h4>内训外包</h4>
					<p>企业内训、项目外包</p>
					<p>我们提供更多额外收益机会</p>
				</td>
				<td>
					<h4>移动网页</h4>
					<p>移动网页版，免登陆、免购买</p>
					<p>支持全系统，随时随地，想学就学</p>
				</td>
				<td>
					<h4>推广支持服务</h4>
					<p>您的内容可得到学院、51CTO首页、家园、</p>
					<p>论坛、下载等多个渠道宣传推广</p>
				</td>
				<td>
					<h4>讲师机会</h4>
					<p>直线推荐优秀讲师为技术大会主讲嘉宾</p>
				</td>
			</tr>
			<tr>
			    <td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
					<h4>礼品+服务</h4>
					<p>学院独家定制礼品+美女管家贴心服务</p>
				</td>
			</tr>
		</table>
		<div class="sLines" style="height:77px;"></div>
		<div class="arrow"></div>
	</div>
	<div class="Page JoinUsLv2">
		<h1 class="JoinUsTitle">快速签约</h1>
		<img src="https://static1.51cto.com/edu/images/lectopics/lv2_bg.png">
		<a href="http://edu.51cto.com/center/lec/apply" target="_blank" class="go1"></a>
		<a href="http://edu.51cto.com/center/org/apply" target="_blank" class="go2"></a>
		<div class="clear"></div>
		<div class="sLines" style="height:77px;"></div>
		<div class="arrow"></div>
	</div>
	<div class="Page JoinUsLv3">
		<h1 class="JoinUsTitle">结语</h1>
		<div class="JoinUsLv3Txt">
			<p>这里有一群执着于技术的人</p>
			<p>这里有一群执着于教育的人</p>
			<p>我们希望与你一起</p>
			<p>站在时代的风口，让技术成就梦想</p>
		</div>
	</div>
</div>

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
    var sessionid = "fr6tcbcq20cjn4khdijnh45nb6",
            ip = "182.97.50.89",
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
