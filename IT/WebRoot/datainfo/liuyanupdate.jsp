<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>问题更改</title>
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
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.75">
<script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.75"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4">
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.4" rel="Stylesheet" />
<script type="text/javascript">
var gen_logo = '';
</script>
</head>
<body>
<form action="<%=basePath %>courselistservlet?order=updatehuifu" method="post" name="form1">
	<input type="hidden"  name="coursename" value="<%=request.getParameter("coursename") %>" />
	<input type="hidden"  name="url" value="<%=request.getParameter("url") %>" />
	<input type="hidden"  name="studentid" value="<%=request.getParameter("studentid") %>" />
	<input type="hidden"  name="userid" value="${forumBean.userid}"/>
	<input type="hidden"  name="replayid" value="${forumBean.replayUserid}"/>
	<input type="hidden"  name="forumid" value="${forumBean.forumid}"/>
	<ul class="FixedSideBar">
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
    
<div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="http://edu.51cto.com/" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" class="fl"></a>
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
    </div>
</div>

<div class="Page" id="tips">
	<div class="CourseComm_Top">
		<h2>课程提问回复</h2>
		<p class="clear"></p>
	</div>
	<div class="CourseComm_Info" style="width:1000;height:200">
		<div style="float:left">
			<p><font size="4">${forumBean.username}提问:${forumBean.countent}</font></p>
		</div>
	</div>
	<div class="clear"></div>
	<div class="clear"></div>
	<div class="CourseComm_Talk">
		<h2>请选择操作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="tiwen" value="0"/>提问&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="tiwen" value="1" checked="checked"/>回复
		</h2>
		<textarea id="CourseComm_Word" name="msg">${forumBean.countent}~</textarea>
		<div class="CourseComm_Words">
			<p class="CourseComm_WordCount">还可以输入  <span>200</span> 字</p>
			<p class="CourseComm_WordNULL">请输入评价内容</p>
		</div>
		<button id="CourseComm_Submit">确认修改</button>
		<p class="CourseComm_Guest"><label for="isGuest">匿名</label></p>
		<input type="checkbox" id="isGuest" />
		<input type="hidden" id="Course_id" value="7737" />
		<div class="clear"></div>
	</div>
</div>
	

</form>
<script type="text/javascript">
var pft = new Array('较差','一般','比较满意','满意','非常满意');
$(function(){
	$(".CourseComm_ActionItem input").val('');	//初始化评分的input
	$(".UserLinkLi p").bind('mouseover',function(){
		$(this).next().css('display','block');
	});
	$(".UserLinkLi ul").bind('mouseleave',function(){
		$(this).css('display','none');
	});
	//Help
	$(".CourseComm_Help").bind('mouseover',function(){
		$(this).children('p').css('display','block');
	});
	$(".CourseComm_Help").bind('mouseleave',function(){
		$(this).children('p').css('display','none');
	});
	//评分的星星
	$(".courseAction li").bind('mouseover',function(){
		var n = $(this).index();
		$(this).prevAll().andSelf().removeClass('noStar');
		$(this).prevAll().andSelf().addClass('hasStar');

		$(this).nextAll().removeClass('hasStar');
		$(this).nextAll().addClass('noStar');

		$(this).parent().next().html(n+1+'级 '+'<span style="color:red;">'+pft[n]+'</span>')
	});
	$(".courseAction li").bind('click',function(){
		var n = $(this).index();
		$(this).parent().prev().val(n+1);
		$(this).parent().next().html(n+1+'级 '+'<span style="color:red;">'+pft[n]+'</span>');
		$(this).parent().prev().prev().css('color','#333');
	});
	$(".courseAction").bind('mouseleave',function(){
		showStar(this);
	});

	//字数统计
	var wCount = 200;
	$("#CourseComm_Word").keyup(function(){
		var wCount = 200 - $(this).val().length;
		var h = $(".CourseComm_WordCount");
		if(wCount<0){
			h.html('超出  <span style="color:red;">'+(0-wCount)+'</span> 字');
			$("#CourseComm_Word").css('border-color','#BF1B21');
		}else{
			h.html('还可以输入  <span>'+wCount+'</span> 字');
			$("#CourseComm_Word").css('border-color','#CCC');
		}
		//恢复样式
		if($(this).val().length > 0 && $(this).val().length < 200){
			$("#CourseComm_Word").css('border-color','#CCC');
			$(".CourseComm_WordNULL").fadeOut(200);
		}
	});
	//
	var cwT = '赠人玫瑰 ，手有余香，分享，帮助更多学员~';
	$("#CourseComm_Word").bind('focus',function(){
		if($(this).val()==cwT){
			$(this).val('');
			$(this).css('color','#333');
		}
	})
	$("#CourseComm_Word").bind('blur',function(){
		if($(this).val()==''){
			$(this).val(cwT);
			$(this).css('color','#999');
		}
	})

	//提交按钮
	$("#CourseComm_Submit").bind('click',function(){
		var x = false;
		var f = $(".CourseComm_ActionItem");
		var s = $(".CourseComm_ActionItem input");
		var stars = new Array();
		for(var i=0;i<s.length;i++){
			stars.push($(s[i]).val());
			if($(s[i]).val()==''){
				$(f[i]).find('p').css('color','#BF1B21');
				$(f[i]).find('div').html(errorIcon);
				x = true;
			}else{
				$(f[i]).find('p').css('color','#333');
			}
		}
		var wCounts = 200 - $("#CourseComm_Word").val().length;
		if(wCounts==200 || $("#CourseComm_Word").val()==cwT){
			$("#CourseComm_Word").css('border-color','#BF1B21');
			$(".CourseComm_WordNULL").fadeIn(200);
			$("#CourseComm_Word").focus();
			x = true;
		}else if(wCounts<0){
			$("#CourseComm_Word").css('border-color','#BF1B21');
			$("#CourseComm_Word").focus();
			x = true;
		}else{
			$("#CourseComm_Word").css('border-color','#CCC');
			$(".CourseComm_WordNULL").fadeOut(200);
		}
		if(x==true){
		}else{
			var CourseComm_Word = $("#CourseComm_Word").val();
			var Course_id = $("#Course_id").val();
			if ($("#isGuest").is(":checked")){
				var isGuest = 1;
			}else{
				var isGuest = 0;
			}	

			$.ajax({
				type:'post',
				url:'/index.php?do=appraise&m=addAppraise',
				data:{Score:stars,appraiseContet:CourseComm_Word,Guest:isGuest,course_id:Course_id},
				dataType:'json',
				success:function(data) {	
					if(data.status) {
						$("#tips").addClass("CourseCommOK");
						$("#tips").html('<p>'+data.msg+'</p><p><a href="/course/course_id-7737.html#comm">返回查看</a></p>');
					} else {
						alert(data.msg);
					}
				}
			})
		}
		
	});

	
});
var errorIcon = '<img src="https://static1.51cto.com/edu/images/whitestyle/error_icon.png" />';
var showStar = function(e){
	var c = $(e).prev().val()?$(e).prev().val():0;
	if(c==0){
		$(e).children().removeClass('hasStar');
		$(e).children().addClass('noStar');
		$(e).next().html('');
		return false;
	}
	var s = $(e).find('li').eq(c-1);
	s.nextAll().removeClass('hasStar');
	s.nextAll().addClass('noStar');

	s.prevAll().andSelf().removeClass('noStar');
	s.prevAll().andSelf().addClass('hasStar');

	c=parseInt(c);
	$(e).next().html(c+'分 '+'<span style="color:red;">'+pft[c-1]+'</span>');

}
</script>
<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="<%=basePath %>courselistservlet?order=list" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" alt="IT课堂" width="194" height="40"/>
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
            <p class="Call fl red">179-0797-5702</p>
            <p class="fl callTime">客服工作时间:09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2017-2027 <a href="http://www.51cto.com/" target="_blank">www.lleducation.com</a></p>
        </div>
        <div class="clear"></div>
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
    var sessionid = "pn54b0tvp2lme2rui46mcdfoj0",
            ip = "182.97.87.71",
            user_id = "12569085",
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
