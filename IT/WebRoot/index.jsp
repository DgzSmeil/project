<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>【王佩丰】PowerPoint2010视频教程1：课前必读
			课程概述_【王佩丰】PowerPoint2010视频教程（共20课时）_在线培训教程_51CTO学院</title>
		<meta name="keywords" content="ppt学习,ppt培训,ppt,ppt实战,ppt教程" />
		<meta name="description"
			content="分析其他PowerPoint视频教程体系的优缺点，探讨日常工作中使用PPT时的常见问题及解决方法，介绍本套PowerPoint2010视频教程的课程设计。如果您感觉学习了很多PowerPoint视频教程以后，还是在制作PPT的时候无从下手，那么您可以在这一讲的PowerPoint2010视频教程中找到答案。" />
		<meta http-equiv="Expires" CONTENT="0">
		<meta http-equiv="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="Pragma" CONTENT="no-cache">

		<link href="https://static1.51cto.com/edu/css/reset.css?1.0"
			rel="stylesheet" type="texdasdasdt/css" />
		<link href="https://static1.51cto.com/edu/css/new-class.css?20151106"
			rel="stylesheet" type="text/css" />
		<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/md5.js"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/mbox.js?v=2.5.3"></script>
		<!--<link href="/static/css/new-class.css"  rel="stylesheet" type="text/css"/>-->
		<style>
body {
	background: #000;
}

.red {
	color: #bf1920;
}

.ui_lt,.ui_rt,.ui_l,.ui_r,.ui_lb,.ui_b,.ui_t,.ui_rb {
	background: none repeat scroll 0 0;
}

.ico-sell {
	position: relative;
	background: url(https://static1.51cto.com/edu/images/sellbg_.gif)
		no-repeat left center;
	padding-left: 8px;
	top: -5px;
}

.ico-sell em {
	font-style: normal;
	background: url(https://static1.51cto.com/edu/images/sellbg_.gif)
		no-repeat right center;
	padding-right: 5px;
	color: #fff;
	height: 15px;
	line-height: 15px;
	text-decoration: none;
}

#ADs {
	height: 100%;
	background: #000;
	position: relative;
	z-index: 1000;
	display: none;
}

#ADs_time,#ADs_close {
	top: 50px;
	right: 40px;
	width: 40px;
	background: #000;
	color: #FFF;
	line-height: 40px;
	text-align: center;
	font-size: 16px;
	border-radius: 10px;
	position: absolute;
	z-index: 10;
}

#ADs_close {
	top: auto;
	bottom: 50px;
	right: 40px;
	width: 80px;
	cursor: pointer;
}

#ADs ul#ADsList {
	overflow: hidden;
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	z-index: 9;
}

#ADs ul#ADsList li {
	position: absolute;
	width: 100%;
	height: 100%;
}

#ADs ul#ADsList li a {
	display: block;
}

#ADs ul#ADsList li img {
	max-height: 100%;
	max-width: 100%;
}

#ADs button {
	font-size: 26px;
	height: 55px;
	line-height: 55px;
	width: 350px;
	border: 0;
	padding: 0;
	margin-top: 3%;
	background: #00baf2;
}

.vipSide {
	position: relative;
	display: inline-block;
	width: 15px;
	height: 15px;
	background:
		url(https://s1.51cto.com/images/201703/d7d63a5043c7b2d31cf3571066374f95ed51b3.png)
		no-repeat left top;
	cursor: pointer;
}

/* vip页面 zjf20170222 */
.vipBox_bg {
	position: relative;
	background: #000;
}

.vipBox {
	position: absolute;
	top: 300px;
	left: 50%;
	margin-left: -350px;
	text-align: center;
	width: 700px;
}

.vip_h2 {
	font-size: 36px;
	color: #52b8ed;
	text-align: center;
	cursor: pointer;
}

.vip_list {
	padding-top: 40px;
}

.vip_list li {
	float: left;
	font-size: 32px;
	width: 158px;
	height: 48px;
	color: #8d8d8d;
	text-align: center;
	line-height: 48px;
	border: 1px solid #8d8d8d;
	margin-left: 12px;
	border-radius: 4px;
}

.vip_list li:first-child {
	margin-left: 0;
}
</style>
	</head>
	<body>
		<input type="hidden" value="<%=basePath %>"
			id="HTTP_ROOT" />
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/plugin/ckplayer/offlights.js?v=1.0"
			charset="utf-8"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/play.js?v=1.3" charset="utf-8"></script>
		<script type="text/javascript"
			src="<%=basePath %>js/jquery.syplayer.js?v=2.7"></script>
		<!--<script type="text/javascript" src="/static/js/jquery.syplayer.js?v=1.51"></script>-->
		<script type="text/javascript">
var price = parseInt("199");
//var pxb_cmmd = "Array";
var playTime  = parseInt("0");
//var playTime  = 1000;
function SyPlayerStatus(type, info) {
  if(type == 'videoStop') {
    var nextUrl = 'http://edu.51cto.com/lesson/id-28887.html';
    if(nextUrl != '') {
      window.location.href = nextUrl;
    }
  }
  //指定播放点
  if(type == 'videoStart' && playTime > 0){
    //setTimeout("setVideoTime(playTime)",500,function(){playTime = 0;});
    setTimeout(function(){
      setVideoTime(playTime);
      playTime = 0;
    },500);
  }
}
function initVideo(size) {
  $.syplayer({
    player_id :'player',
    width :size.w,
    height:size.h,
    lesson_id:28885,
    callbackJs:'SyPlayerStatus',
    infotip : 0
  });
}

$(function(){
  var getwidth  = $(window).width();
  var getheight = $(window).height();
  var w = getwidth - 361<425?425:getwidth - 361;
  var h = w*0.75 //>656?656:(w*0.75)+36;
  if(h>(getheight-100)){
    h = getheight-100;
  }
  //
    initVideo({w:w,h:h});
          $("#ADs").remove();
      //
  Jaydar.commentList();
  setRightHeight()
  setTimeout('setRightHeight();',1000);
  $("#ADs_close").click(function(){
    clearInterval(djs5)
    $("#ADs").remove();
    $("#player").show();
    initVideo({w:w,h:h})
  })
});

$(window).resize(function() {
  setRightHeight();
  if($(window).width()<=800){
    $(".course-top-l").children("strong").css('width','200px');
  }else{
    $(".course-top-l").children("strong").css('width',ctlw);
  }
});
function setRightHeight(){
  var x = $(window).height()-60;
  var y = 203;
  //
  $("#playList_lession").css('height',x-45+'px');
  $("#dv_scroll").css('height',x-45+'px');
  $("#dv_scroll_bar").css('height',x-45+'px');
  $("#dv_scroll_track").css('height',x-45+'px');

  //
  $("#playList_note").css('height',x-y+'px');
  $("#dv_scroll_note").css('height',x-y+'px');
  $("#dv_scroll_bar_note").css('height',x-y+'px');
  $("#dv_scroll_track_note").css('height',x-y+'px');

  //
  $("#playList_comm").css('height',x-y+'px');
  $("#dv_scroll_comm").css('height',x-y+'px');
  $("#dv_scroll_bar_comm").css('height',x-y+'px');
  $("#dv_scroll_track_comm").css('height',x-y+'px');

  //
  $("#right_onoff_off").css('height',x-14+'px');
  $("#right_onoff_on").css('height',x-14+'px');

  var h = $("#ADs").width()*0.75 - 36;
  h = h>($(window).height()-100)?$(window).height()-100:h
  $("#ADs").height(h).find('li').height(h);
  setTimeout(function(){
    $("#ADs").css('min-height',$("#ADs").width()*.55)
  },10)
}
//设置COOKIE
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

var date_ = 1495714255;
</script>
		<input type="hidden" value="https://static1.51cto.com/edu/images/"
			id="imgpath" />
		<input type="hidden" value="28885" id="lesId" />
		<input type="hidden" value="1" id="isplay" />
		<div class="course-top" style="position: relative; z-index: 10000;">
			<div class="course-top-l">
				<a href="/course/course_id-1586.html">&lt; 返回课程页</a>
				<strong class="fl" style="height: 49px; overflow: hidden;">正在播放：【王佩丰】PowerPoint2010视频教程1：课前必读
					课程概述</strong>
				<div class="intbox" id="show_describe_div">
					<a href="javascript:void(0);">查看简介>></a>
					<div class="intLayer" style="display: none;">
						<div class="intIn">
							<span class="arr">◆</span>
							<div class="int-scroll">
								<p style="text-align: left;">
									分析其他PowerPoint视频教程体系的优缺点，探讨日常工作中使用PPT时的常见问题及解决方法，介绍本套PowerPoint2010视频教程的课程设计。如果您感觉学习了很多PowerPoint视频教程以后，还是在制作PPT的时候无从下手，那么您可以在这一讲的PowerPoint2010视频教程中找到答案。
								</p>
							</div>
						</div>
					</div> 
				</div>

			</div>
			<div class="course-top-r">
				<div class="mod-ad edu-ad" ad_id="10" course_id="1586"
					style="float: right; margin-right: 10px; width: 285px; padding-left: 20px; overflow: hidden; text-align: right; height: 48px;"></div>
			</div>
		</div>
		<div class="course-main">
			<!-- 视频播放 start-->
			<div class="n-coursebox" id="playerMaxF">
				<div class="courseVdo" style="position: relative;">
					<div class="m-cvideo" id="m-cvideo">
						<div id="player"
							style="width: 1085px; height: 656px; float: left; z-index: 1000;"></div>
						<div id="ADs">
							<p id="ADs_time" class="fr">
								5
							</p>
							<div class="clear"></div>
							<ul id="ADsList">
								<li>

								</li>
							</ul>
							<p id="ADs_close">
								跳过
							</p>
						</div>
					</div>
				</div>
				<div class="course-bt">
					<div class="txt_ad edu-ad" id="edutxt_ad"
						style="float: left; line-height: 28px;" ad_id="11"
						course_id="1586"></div>
					<div class="course-tool" style="z-index: 903;">
						<div class="CoursePrQrCode fl mr10" style="width: 100px;">
							<img
								src="https://static1.51cto.com/edu/images/whitestyle/appdownload90.png" />
							<div class="tc">
								下载学院APP
								<br />
								缓存视频离线看
							</div>
						</div>
						<div class="CoursePr cp_7 fl mr15"
							style="position: relative; overflow: visible; z-index: 902;">
							<span>下载课程</span>
						</div>
						<a class="feedback" href="/user/feedback.html" target="_blank">意见反馈</a>
						<div class="cdbox" id="show_filedown_div">
							<a class="courseDown">资料下载</a>
							<div class="cdLayer" style="display: none; left: -200px;">
								<div class="cdIn">
									<span class="arr" style="left: 210px;">◆</span>
									<dl style="margin-top: 15px;">
										<!-- <dt>课时课件</dt> -->
										<dd>
											<a target="_blank"
												href="/download/index/fid-UlILUDoWTj0CAQoH.html"
												title="PPT-S1-01.pptx">PPT-S1-01.pptx</a>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<!-- Baidu Button BEGIN -->
						<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare"
							style="width: 50px; float: left; overflow: hidden;"
							data="{'url':'http://edu.51cto.com/credit/sid-DTsIVlBWDlsBA20DWwFeAWsCDFZICwIfUFcFSgRWUg.html','pic':'https://s1.51cto.com/images/201607/55b0a9336bb451717ef6407124330c904aa6fc.jpg','wbuid':3500408981}">
							<span class="bds_more"
								style="float: left; width: 50px; margin-left: -30px; padding-top: 0; background: none;">
								<p class="bds_more_n"
									style="height: 20px; line-height: 20px; border: none; padding-left: 23px; padding-top: 5px;">
									分享
								</p> <!-- <img alt="分享" src="https://static1.51cto.com/edu/images//share_btn.jpg" align="absmiddle">
              <img alt="分享" src="https://static1.51cto.com/edu/images/lesson/ico-share.gif" align="absmiddle" style="margin-top:-2px;"/> -->
							</span>

						</div>
						<p style="width: 150px; float: left; text-align: left;">
							<a href="http://51edu.blog.51cto.com/7345720/1337250"
								target="_blank"
								style="text-decoration: underline; padding-top: 0;">(分享送学分，每天100)</a>
						</p>
						<script type="text/javascript" id="bdshare_js"
							data="type=tools&amp;uid=6720061"></script>
						<script type="text/javascript" id="bdshell_js"></script>
						<script type="text/javascript">
            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
            </script>
						<!-- Baidu Button END -->
						<p class="courseZan" href="javascript:void(0);"
							onclick="less_addLessPraise(this)"}>
							赞 （
							<span>419</span>）
						</p>
						<p class="courseNum mr5"
							style="margin-left: 12px; float: left; padding-top: 1px;">
							<em>67940</em>次播放
						</p>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<!-- 视频播放end-->


			<!-- 右边列表 start-->
			<a class="courseOpen" id="right_onoff_on" style="display: none;"></a>
			<div class="course-toolbar-box" id="edu_less_right">
				<div class="courseCont" id="edu_lesson_right_pare">
					<div class="n-course-tabhd clearfix">
						<span sign="list" class="cur">课程目录</span>
						<span sign="note">记笔记</span>
						<span sign="comm" style="margin: 0;">提问题</span>
					</div>
					<p class="clear"></p>

					<!-- 课时列表 start -->
					<div class="n-course-tabbd" id="edu_lesson_right_list">
						<div class="scr_con playlist" style="border: 0px;"
							id="playList_lession">
							<div id="dv_scroll">
								<div id="dv_scroll_text" class="Scroller-Container">
									<ul style="display: inline-block; width: 100%;">
										<script>
              var scrH = "38";
              </script>
										<li class="cur" lession_id="28885">
											<a href="/lesson/id-28885.html"
												title="【王佩丰】PowerPoint2010视频教程1：课前必读 课程概述">1
												【王佩丰】PowerPoint2010视频教程1：课前必读 课程概述</a><span>16:39</span>
											<a href="javascript:void(0);" class="exam">试卷</a>
										</li>
										<li class="notActive" lession_id="28887">
											<a href="/lesson/id-28887.html"
												title="【王佩丰】PowerPoint2010视频教程2：首页PPT设计（一）">2
												【王佩丰】PowerPoint2010视频教程2：首页PPT设计（一）</a><span>54:47</span>
										</li>
										<li class="notActive" lession_id="28891">
											<a href="/lesson/id-28891.html"
												title="【王佩丰】PowerPoint2010视频教程3：首页PPT设计（二）">3
												【王佩丰】PowerPoint2010视频教程3：首页PPT设计（二）</a><span>01:00:29</span>
										</li>
										<li class="notActive" lession_id="30737">
											<a href="/lesson/id-30737.html"
												title="【王佩丰】PowerPoint2010视频教程4：首页PPT设计（三）">4
												【王佩丰】PowerPoint2010视频教程4：首页PPT设计（三）</a><span>51:46</span>
										</li>
										<li class="notActive" lession_id="30763">
											<a href="/lesson/id-30763.html"
												title="【王佩丰】PowerPoint2010视频教程5：首页PPT设计（四）">5
												【王佩丰】PowerPoint2010视频教程5：首页PPT设计（四）</a><span>01:00:11</span>
										</li>
										<li class="notActive" lession_id="31842">
											<a href="/lesson/id-31842.html"
												title="【王佩丰】PowerPoint2010视频教程6：首页PPT设计（五）">6
												【王佩丰】PowerPoint2010视频教程6：首页PPT设计（五）</a><span>01:06:41</span>
										</li>
										<li class="notActive" lession_id="31852">
											<a href="/lesson/id-31852.html"
												title="【王佩丰】PowerPoint2010视频教程7：PPT目录页设计（一）">7
												【王佩丰】PowerPoint2010视频教程7：PPT目录页设计（一）</a><span>01:05:46</span>
										</li>
										<li class="notActive" lession_id="31856">
											<a href="/lesson/id-31856.html"
												title="【王佩丰】PowerPoint2010视频教程8：PPT目录页设计（二）">8
												【王佩丰】PowerPoint2010视频教程8：PPT目录页设计（二）</a><span>01:08:00</span>
										</li>
										<li class="notActive" lession_id="31868">
											<a href="/lesson/id-31868.html"
												title="【王佩丰】PowerPoint2010视频教程9：PPT目录页设计（三）">9
												【王佩丰】PowerPoint2010视频教程9：PPT目录页设计（三）</a><span>01:18:31</span>
										</li>
										<li class="notActive" lession_id="31870">
											<a href="/lesson/id-31870.html"
												title="【王佩丰】PowerPoint2010视频教程10：过渡页设计">10
												【王佩丰】PowerPoint2010视频教程10：过渡页设计</a><span>59:16</span>
										</li>
										<li class="notActive" lession_id="33558">
											<a href="/lesson/id-33558.html"
												title="【王佩丰】PowerPoint2010视频教程11：内容页设计（一）">11
												【王佩丰】PowerPoint2010视频教程11：内容页设计（一）</a><span>01:23:43</span>
										</li>
										<li class="notActive" lession_id="34410">
											<a href="/lesson/id-34410.html"
												title="【王佩丰】PowerPoint2010视频教程12：内容页设计（二）">12
												【王佩丰】PowerPoint2010视频教程12：内容页设计（二）</a><span>01:28:08</span>
										</li>
										<li class="notActive" lession_id="35068">
											<a href="/lesson/id-35068.html"
												title="【王佩丰】PowerPoint2010视频教程13：内容页设计（三）">13
												【王佩丰】PowerPoint2010视频教程13：内容页设计（三）</a><span>01:02:51</span>
										</li>
										<li class="notActive" lession_id="35070">
											<a href="/lesson/id-35070.html"
												title="【王佩丰】PowerPoint2010视频教程14：内容页设计（四）">14
												【王佩丰】PowerPoint2010视频教程14：内容页设计（四）</a><span>01:18:03</span>
										</li>
										<li class="notActive" lession_id="35831">
											<a href="/lesson/id-35831.html"
												title="【王佩丰】PowerPoint2010视频教程15：结束页及导航栏设计">15
												【王佩丰】PowerPoint2010视频教程15：结束页及导航栏设计</a><span>01:19:46</span>
										</li>
										<li class="notActive" lession_id="35840">
											<a href="/lesson/id-35840.html"
												title="【王佩丰】PowerPoint2010视频教程16：定制你的专属PPT模板">16
												【王佩丰】PowerPoint2010视频教程16：定制你的专属PPT模板</a><span>01:17:45</span>
										</li>
										<li class="notActive" lession_id="36595">
											<a href="/lesson/id-36595.html"
												title="【王佩丰】PowerPoint2010视频教程17：页面切换中的逻辑与禁忌">17
												【王佩丰】PowerPoint2010视频教程17：页面切换中的逻辑与禁忌</a><span>01:02:59</span>
										</li>
										<li class="notActive" lession_id="36806">
											<a href="/lesson/id-36806.html"
												title="【王佩丰】PowerPoint2010视频教程18：小心翼翼的使用动画">18
												【王佩丰】PowerPoint2010视频教程18：小心翼翼的使用动画</a><span>01:35:24</span>
										</li>
										<li class="notActive" lession_id="37353">
											<a href="/lesson/id-37353.html"
												title="【王佩丰】PowerPoint2010视频教程19：使用多媒体对象">19
												【王佩丰】PowerPoint2010视频教程19：使用多媒体对象</a><span>56:51</span>
										</li>
										<li class="notActive" lession_id="37506">
											<a href="/lesson/id-37506.html"
												title="【王佩丰】PowerPoint2010视频教程20：幻灯片放映">20
												【王佩丰】PowerPoint2010视频教程20：幻灯片放映</a><span>41:41</span>
										</li>
										<li
											style="height: 0px; width: 0px; overflow: hidden; clear: both;"></li>
									</ul>
								</div>
							</div>
							<!--dv_scroll end-->
							<div id="dv_scroll_bar">
								<div id="dv_scroll_track" class="Scrollbar-Track">
									<div class="Scrollbar-Handle"></div>
								</div>
							</div>
							<!--dv_scroll_bar end-->
						</div>
					</div>
					<!-- 课时列表 end -->

					<!-- 记笔记 start-->
					<div class="n-course-tabbd" id="edu_lesson_right_note"
						style="display: none;">
						<!-- 没有观看权限 start-->
						<div>
							<div class="charge-tip2bg"></div>
							<div class="charge-tip2">
								<p>
									购买本课程后，就可以记笔记了~~
								</p>
								<p>
									<a href="/index.php?do=buycourse&m=buyOrCode&course_id=1586"
										target="_blank"><input type="button" class="cha-buybtn"
											value="购买课程" />
									</a>
								</p>
							</div>
						</div>
						<input type="hidden" id="isnotplay" value="1" />
						<!-- 没有观看权限 end-->

						<div class="n-editbox">
							<textarea class="addarea" name="content"
								id="add_new_note_content">开始记笔记……</textarea>
							<div class="n-editbox-bt">
								<div class="pt5 fl">
									<table class="sendnoteaction">
										<tr>
											<!-- <td><a class="screencap" title="截取当前视频画面" id="screenVideoImg" style="margin-top:3px;cursor: pointer;"></a></td> -->
											<td>
												<div class="tlbox" style="margin: 3px 0px 0px 3px;">
													<span class="untimeLock"></span>
													<div class="lockPop" style="display: none;">
														<p class="p01" onclick="note_setPrivate(this,0)">
															<a href="javascript:void(0);">私密笔记</a>
														</p>
														<p class="p02" onclick="note_setPublic(this,0)">
															<a href="javascript:void(0);">公开笔记</a>
														</p>
													</div>
												</div>
											</td>
											<td>
												<input style="line-height: 16px;" type="checkbox"
													id="is_addPlayTime_note" name="" checked="true"
													title="记录视频播放位置" />
											</td>
											<td>
												<p style="line-height: 16px;">
													<label for="is_addPlayTime_note" title="记录视频播放位置">
														记录时间点
													</label>
												</p>
											</td>
											<td>
												<span class="note-time"
													style="padding-left: 15px; padding-right: 7px;">00:00</span>
											</td>
										</tr>
									</table>
								</div>
								<input type="hidden" name="is_hide" value="0">
								<input type="hidden" name="img_id" value="0">
								<input type="hidden" name="img_url" value="">
								<input type="hidden" name="play_time" value="0">
								<input type="button" value="发布" class="n-submit fr">
								<div class="insetbox" id="mynote_imgshow_0"
									style="display: none;">
									<p class="close">
										<a href="javascript:void(0);" id="less_addnote_imgclose_0">x</a>
									</p>
									<p>
										<img width="111px" height="63px"
											src="http://placehold.it/111x63"/>
									</p>
								</div>
							</div>
							<p class="clear"></p>
						</div>
						<div class="n-qaTab clearfix" id="less_addnote_mether">
							<span class="cur">我的笔记</span><span>同学的笔记</span>
						</div>
						<p class="clear"></p>
						<div class="scr_con playlist" id="playList_note">
							<div class="Container" id="dv_scroll_note">
								<div id="dv_scroll_text_note" class="Scroller-Container">

									<!-- 我的笔记 -->
									<div class="n-qaTabc" id="less_addNote_noteList">
									</div>
									<!-- 我的笔记 end-->

									<!-- 同学的笔记 start-->
									<div class="n-qaTabc" id="less_addNote_noteOther"
										style="display: none;">
									</div>
									<!-- 同学的笔记 end-->

								</div>
							</div>
							<div id="dv_scroll_bar_note">
								<div id="dv_scroll_track_note" class="Scrollbar-Track">
									<div class="Scrollbar-Handle"></div>
								</div>
							</div>
						</div>

						<div class="n-askMore">
							<!--<a href="#">查看更多笔记</a>-->
						</div>
					</div>
					<!-- 记笔记 end -->

					<!-- 答疑 start-->
					<div class="n-course-tabbd" id="edu_lesson_right_comm"
						style="display: none;">
						<!-- 没有观看权限 start-->
						<div>
							<div class="charge-tip2bg"></div>
							<div class="charge-tip2">
								<p>
									购买本课程后，就可以提问题了~~
								</p>
								<p>
									<a href="/index.php?do=buycourse&m=buyOrCode&course_id=1586"
										target="_blank"><input type="button" class="cha-buybtn"
											value="购买课程" />
									</a>
								</p>
							</div>
						</div>
						<!-- 没有观看权限 end-->

						<div class="n-editbox clearfix">
							<textarea class="addarea" id="add_new_commcontent">向老师提问……</textarea>
							<div class="pt5 n-editbox-bt">
								<div class="pt5 fl">
									<span class="addt">
										<table>
											<tr>
												<td>
													<input type="checkbox" id="is_addPlayTime_comm" name=""
														checked="true" title="记录视频播放位置" />
												</td>
												<td>
													<label for="is_addPlayTime_comm" title="记录视频播放位置">
														记录时间点
													</label>
												</td>
												<td>
													<span class="note-time"
														style="padding-left: 15px; padding-right: 7px;">00:00</span>
												</td>
											</tr>
										</table> </span>

								</div>
								<input type="hidden" name="play_time" value="0" />
								<input type="button" class="n-submit fr"
									onclick="submitCommForm(this);" value="提问" />
							</div>
						</div>
						<div class="n-qaTab clearfix" id="less_addcomm_mether">
							<span class="cur">我的问题</span><span>同学的问题</span>
						</div>
						<p class="clear"></p>

						<div class="scr_con playlist" id="playList_comm">
							<div class="Container" id="dv_scroll_comm">
								<div id="dv_scroll_text_comm" class="Scroller-Container">
									<!-- 我的答疑 start -->
									<div class="n-qaTabc" id="right_myComm_div">
									</div>
									<!-- 我的答疑 end -->

									<!-- 同学的答疑 start-->
									<div class="n-qaTabc" style="display: none;"
										id="right_otherComm_div">
									</div>
									<!-- 同学的答疑 end-->
								</div>
							</div>
							<div id="dv_scroll_bar_comm">
								<div id="dv_scroll_track_comm" class="Scrollbar-Track">
									<div class="Scrollbar-Handle"></div>
								</div>
							</div>
						</div>

						<div class="n-askMore">
							<!-- <a href="#">查看更多答疑</a>-->
						</div>
					</div>
					<!-- 答疑 end -->
				</div>
			</div>
			<!-- 右边列表 end-->
		</div>
		<script type="text/javascript">
$(function(){//
  //
  $(".cp_7").bind('mouseenter',function(){
    $(".CoursePrQrCode").fadeIn(100);
  }).bind('mouseleave',function(){
    $(".CoursePrQrCode").fadeOut(100);
  });
});
</script>
		<style type="text/css">
button {
	padding: 0px 10px;
	height: 24px;
	background: #00baf2;
	color: #FFF;
	border: none;
	cursor: pointer;
}
</style>
		<script type="text/javascript">
var courseId = "1586";
var lesson_id = "28885";
var imgurl    = "https://s1.51cto.com/",
imgpath   = "https://static1.51cto.com/edu/images/",
lession_id  =   "28885", 
user_id   = "12539927",
username  = "菜鸟的编程生涯",
lec_user_id = "1129943",
lec_realname= "王佩丰",
lec_avatar  = imgurl + "wyfs02/M02/6C/AF/wKioL1VQXWjyXLq_AAAtK0jYRbk603_small.jpg",
isplay    = "1",
show    = "0";
ctlw = $(".course-top-l").children("strong").css('width');
var exam_id = 0;
$.getJSON('http://edu.51cto.com/exam/getrel',{'y':'1','course_id':courseId,'lesson_id':lesson_id},function(data){
  if(!data.status) return false;
  exam_id = data.data['exam_id'];
    if(exam_id != 0){
        $('a.exam').show();
    }else{
        $('a.exam').remove();
    }
});
$('a.exam').click(function(){
  if(exam_id != 0){
        window.open('http://edu.51cto.com/t/exam/id-'+exam_id+'.html');
  }
});

//////////////////////////
(function(){
  var cid = '90'
  var ads_data = [
    {pic:'201609/a7e8097064b0e2f0771989243a9a421be76428.jpg',link:'http://edu.51cto.com/training/training_id-25.html?1609bxhqp1&edu_recommend_adid=206',tit:'IT十八掌大数据培训班第三期,挑战月薪20k！1'},
    {pic:'201609/924a1e65002dd7b8f90797ea7853143dff2ee2.jpg',link:'http://edu.51cto.com/training/training_id-25.html?1609bxhqp2&edu_recommend_adid=206',tit:'IT十八掌大数据培训班第三期,挑战月薪20k！2'},
    {pic:'201609/32cd47c00242c1db24347447c2112ddf601163.jpg',link:"javascript:void(0);",tit:'IT十八掌大数据培训班第三期,挑战月薪20k！3',cid:'120,11'},
    {pic:'201609/03e314f4983c6a504bf9015e6f9887dcf49b2c.jpg',link:"javascript:void(0);",cid:'48',tit:'Linux高薪运维培训班-老男孩4期【全程班】'},
    {pic:'201609/a6ecdc726a98be3bfa2255736214c998285831.jpg',link:"http://edu.51cto.com/px/train/97?tp&edu_recommend_adid=206",tit:'Linux高薪运维培训班-老男孩4期【全程班】2'}
  ],used = [];

  function fRandomBy(under, over){ 
    switch(arguments.length){ 
      case 1: return parseInt(Math.random()*under+1); 
      case 2: return parseInt(Math.random()*(over-under+1) + under); 
      default: return 0; 
    }
  }
  for(var a = 0;a<10;a++){
    if(ads_data.length == 0) break;
    if(used.length<3){
      ui = ads_data.splice(fRandomBy(0,ads_data.length-1),1)[0]
      if(!ui.cid || ui.cid.indexOf(cid)>-1){
        used.push(ui);
      }
    }else{
      break
    }
  }
  var items = new Array()
  $.each(used,function(i,e){
    items[i] = $('<li><a href="'+e.link+'" target="_blank" title="'+e.tit+'"><img src="https://s1.51cto.com/images/'+e.pic+'"></a></li>')
    if(e.cid){
      items[i].click(function(){
        _educto.push(['_trackEvent', 'edu', 'advicePlay','lessionId=28885']);
        doyoo.util.openChat('g=10057266');
      })
      
    }
    $("#ADsList").append(items[i])
  })
  var del = setInterval(function(){
    $("#ADsList li").last().fadeOut(200,function(e){
      $(this).remove()
      if($("#ADsList li").length == 1) {
        clearInterval(del)
      }
    })
  },6000)
})//()
</script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/plupload/plupload.full.js"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/scrollbar.js?v=2.5.3"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/lession.js?v=2.5.3"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/edu-ad.js?v=2.5.3"></script>
		<span style="display: none;"> <script type="text/javascript">
//百度统计代码
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?8c8abdb71d78d33dfdb885e0bc71dae0";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script> <script src="https://logs.51cto.com/rizhi/count/count.js"></script> </span>

		<!----------------------数据分析  begin --------------------->
		<script type="text/javascript">
var lession_id  =   "28885", 
  user_id   = "12539927",
  cardid = "0",//会员卡期限
  isfree = "0",
  duration = "999",
  sessionid = "ooofehgodb64sfv7vpvp4sldo4",
  packid = "658#66",
  ip = "182.97.242.120",
  lestitle = "【王佩丰】PowerPoint2010视频教程1：课前必读 课程概述",
  source = 0; 
</script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/tract_public.js?v=10.21"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/vv_tract.js?v=10.21"></script>
		<script type="text/javascript"
			src="https://static1.51cto.com/edu/js/pv_tract.js?v=2016092803"></script>
		<!----------------------数据分析  end -------------------->
		<script type="text/javascript"> document.write(unescape("%3Cscript src='https://tongji.51cto.com/cto.js/b57176900a4805e17afc7b8e25a43abf' type='text/javascript'%3E%3C/script%3E")); </script>
		<script type="text/javascript">
if(document.location.protocol=='https:'){
  document.write('\<script type="text\/javascript" charset="utf-8" src="https\:\/\/gate.soperson.com\/20000923\/10066022.js"\>\<\/script\>')
}else{
  document.write('\<script type="text\/javascript" charset="utf-8" src="http\:\/\/lead.soperson.com\/20000923\/10066022.js"\>\<\/script\>')
}
</script>
	</body>
</html>
