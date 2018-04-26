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
<title>face页面</title>
<meta name="keywords" content="移动开发、编程语言、云计算、大数据、Web开发、网络安全、系统集成、考试认证、Office办公、数据库等" />
<meta name="description" content="51CTO学院是51CTO旗下的职业IT在线教育平台，依托于11年行业品牌、1400万技术用户，目前已成为中国最大的IT技能学习平台。51CTO学院秉承“学以致用”、 “因材施教”、“有教无类”的教育理念，提供辅导式“微职位”和自学式“视频课程”两种在线学习模式，帮助广大IT技术人员实现技能提升、高薪就业的职业梦想。" />
<meta   http-equiv="Expires"   CONTENT="0">
<meta   http-equiv="Cache-Control"   CONTENT="no-cache">
<meta   http-equiv="Pragma"   CONTENT="no-cache">
<LINK href="/favicon.ico" type="image/x-icon" rel=icon>
<link href="https://static1.51cto.com/edu/css/reset.css?v=2.4.4" rel="stylesheet" type="text/css" />
<link href="https://static1.51cto.com/edu/css/style.css?v=2.4.4" rel="stylesheet" type="text/css" />
 
<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/msgbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/nav.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/mbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.4"></script>
<!-- 通用顶部简导航 -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.80">
<script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.80"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4">
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.4" rel="Stylesheet" />
<script type="text/javascript">
var gen_logo = '';
</script>
</head>
<body>
<% 
	StudentBean studentBean = (StudentBean)session.getAttribute("studentBean");
%>
<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til"><a href="http://edu.51cto.com/">中国最大的IT技能学习平台</a></li>
        <li class="fr navi"><a href="http://edu.51cto.com/sitemap.html" target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="<%=basePath %>courselistservlet?order=list" target="_blank">首页</a></li>
                <li><a href="<%=basePath %>datainfo/login.jsp" target="_blank">登录界面</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册界面</a></li>
                <li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                <li><a href="<%=basePath %>mainservlet?order=face" target="_blank">IT课堂主站</a></li>
            </ul>
        </li>
       <c:if test="${studentBean!=null}">
        	<li class="fr"><a target="_blank" href="<%=basePath %>loginservlet?order=loginin&name=${studentBean.studentmobile}">学习中心</a></li>
        </c:if>
        <li class="fr apps"><a href="<%=basePath %>courselistservlet?order=app" target="_blank" style="background:none;">课堂APP</a>
            <ul>
                <li><a  target="_blank">Android</a></li>
                <li><a  target="_blank">iPhone</a></li>
                <li><a  target="_blank">iPad</a></li>
            </ul>
        </li>
        <li class="fr" id="TopCart">
            <a href="<%=basePath %>courselistservlet?order=mycar1" target="_blank" class="red">购物车<span>${requestScope.num}</span></a>
        </li>
        <li class="fr reg"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册</a></li>
        <c:if test="${studentBean==null}">
        	<li class="fr"><a href="<%=basePath %>datainfo/login.jsp">登录</a></li>
        </c:if>
       <c:if test="${studentBean!=null}">
       		 <li class="fr"><a href="<%=basePath %>loginservlet?order=exit"><font color="red">【安全退出】</font></a></li>
       		 <li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=${studentBean.studentname}" target="_blank">${studentBean.studentname}</a></li>
       </c:if>
    </ul>
</div>        <ul class="FixedSideBar">
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
    
<div class="pagebg" style="width: 100%;background: #fff;">
    <div class="Page" style="height:90px;">
        <a  target="_blank">
            <img src="<%=basePath %>image/bg1.jpg" />
        </a>
    </div>
</div>
<div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="<%=basePath %>datainfo/shouye.jsp" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" class="fl"></a>
        </div>
            <ul class="Navigate fl">
            <li><a href="<%=basePath %>courselistservlet?order=list">首页</a></li>
            <li><a href="<%=basePath %>courselistservlet?order=study" target="_blank">微职位培训</a></li>
            <li><a  target="_blank">视频课程</a></li>
            <li><a  target="_blank">职业路线图</a></li>
            <li><a  target="_blank">企业学习</a></li>
            <li><a   target="_blank">免费试听</a></li>
            <li>
              <p class="min_more">线下学习</p>
              <div class="min_more">
                  <a target="_blank" >IT训练营</a>
                  <a target="_blank" >IT峰会</a>
                  <a target="_blank" >IT集训</a>
              </div>
            </li>
        </ul>
        <div class="Search fr">
        </div>
    </div>
</div>
<link href="https://static1.51cto.com/edu/css/member/index/css/style.css?v=11.05" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://static1.51cto.com/edu/js/member.js?v=10.01"></script>
<style type="text/css">
  .lec_member span em {top:9px;}
  .w960	{width:1190px;}
  .p_kc_li dl	{width:790px;}
  .hyk-bar	{width:915px;}
</style>
<p class="clear hr15"></p>
<div class="cont w960">
  <div class="lecturer_li">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="210" align="center" valign="top" class="p_left">
          <style type="text/css">
.contectTeacherQ{
	height: 20px;
	background: #00baf2 url(https://static1.51cto.com/edu/images/whitestyle/contectteacherq.png) no-repeat center center;
	min-width: 83px;
	margin-top: 10px;
	border:none;
	cursor:pointer;
}
.ConsoleLeft_Tag_p p a	{background: none;padding:0px;}
</style>
<div class="ConsoleLeft fl">
    <div class="ConsoleLeft_userInfo">
        <a href="http://home.51cto.com/index.php?s=/space/8899635" title="点击进入家园" target="_blank"><img alt="51CTO学院" src="<%=basePath %>image/mylogobg.png" width="120" height="120"></a>
        <p class="tc"><a href="http://home.51cto.com/index.php?s=/space/8899635" title="点击进入家园" target="_blank">
					51CTO学院		</a></p>
                <a href="/lecturer/honor.html">
            <div class="chl_3 LecHonorNameAfter fl" style="width:100px;height:40px;margin-left: 25px;border:none;"></div>
        </a>
                                    <p>学员总数：77987人</p>
                <p>好 评 率：98%</p>
                <div class="clear"></div>
    </div>
    <div class="per_menu">
        <div class="ibx-nav">
                        <dl>
                <dt class="dtIcon1"><a href="javascript:void(0);">讲师的教学</a></dt>
                <dd id="cur_index" ><a href="/lecturer/index/user_id-8899635.html">讲师的发布</a></dd>
                                <dd><a href="http://51edu.blog.51cto.com" target="_blank">讲师的博客</a></dd>
                             </dl>
                    </div>
    </div>
    
        <div class="ConsoleLeft_Tag">讲师职称</div>
    <div class="ConsoleLeft_Tag_p">
        <p>51CTO旗下IT技能学习平台，依托于11年行业品牌、1400万技术用户，提供辅导式“微职位”和自学式“视频课程”两种在线学习模式，帮助广大IT技术人员实现技能提升、高薪就业的职业梦想。</p>
    </div>
        <div class="ConsoleLeft_Tag">擅长领域</div>
    <div class="ConsoleLeft_Tag_p">
        <p>移动开发、编程语言、云计算、大数据、Web开发、网络安全、系统集成、考试认证、Office办公、数据库等</p>
    </div>
        <div class="ConsoleLeft_Tag">讲师简介</div>
    <div class="ConsoleLeft_Tag_p">
        <p>51CTO学院是51CTO旗下的职业IT在线教育平台，依托于11年行业品牌、1400万技术用户，目前已成为中国最大的IT技能学习平台。51CTO学院秉承“学以致用”、 “因材施教”、“有教无类”的教育理念，提供辅导式“微职位”和自学式“视频课程”两种在线学习模式，帮助广大IT技术人员实现技能提升、高薪就业的职业梦想。</p>
    </div>
    <div class="ConsoleLeft_Tag">标签</div>
    <div class="ConsoleLeft_Tag_p">
                    <a href="/index.php?do=search&m=course&q=视频课程" target="_blank"  style="white-space:nowrap;margin:3px;">视频课程</a>
                <a href="/index.php?do=search&m=course&q=讲师亮相" target="_blank"  style="white-space:nowrap;margin:3px;">讲师亮相</a>
                <a href="/index.php?do=search&m=course&q=讲师" target="_blank"  style="white-space:nowrap;margin:3px;">讲师</a>
                <a href="/index.php?do=search&m=course&q=51CTO" target="_blank"  style="white-space:nowrap;margin:3px;">51CTO</a>
                <a href="/index.php?do=search&m=course&q=祝福" target="_blank"  style="white-space:nowrap;margin:3px;">祝福</a>
                <a href="/index.php?do=search&m=course&q=cs培训" target="_blank"  style="white-space:nowrap;margin:3px;">cs培训</a>
                <a href="/index.php?do=search&m=course&q=cs视频课程" target="_blank"  style="white-space:nowrap;margin:3px;">cs视频课程</a>
                <a href="/index.php?do=search&m=course&q=cs教程" target="_blank"  style="white-space:nowrap;margin:3px;">cs教程</a>
                <a href="/index.php?do=search&m=course&q=cs学习" target="_blank"  style="white-space:nowrap;margin:3px;">cs学习</a>
                <a href="/index.php?do=search&m=course&q=cs技巧" target="_blank"  style="white-space:nowrap;margin:3px;">cs技巧</a>
                <a href="/index.php?do=search&m=course&q=课程发布" target="_blank"  style="white-space:nowrap;margin:3px;">课程发布</a>
                <a href="/index.php?do=search&m=course&q=51CTO学院" target="_blank"  style="white-space:nowrap;margin:3px;">51CTO学院</a>
                <a href="/index.php?do=search&m=course&q=课程推广" target="_blank"  style="white-space:nowrap;margin:3px;">课程推广</a>
                <a href="/index.php?do=search&m=course&q=视频发布" target="_blank"  style="white-space:nowrap;margin:3px;">视频发布</a>
                <a href="/index.php?do=search&m=course&q=讲师使用指南" target="_blank"  style="white-space:nowrap;margin:3px;">讲师使用指南</a>
                <a href="/index.php?do=search&m=course&q=ppt培训" target="_blank"  style="white-space:nowrap;margin:3px;">ppt培训</a>
                <a href="/index.php?do=search&m=course&q=ppt教程" target="_blank"  style="white-space:nowrap;margin:3px;">ppt教程</a>
                <a href="/index.php?do=search&m=course&q=ppt大赛" target="_blank"  style="white-space:nowrap;margin:3px;">ppt大赛</a>
                <a href="/index.php?do=search&m=course&q=ppt" target="_blank"  style="white-space:nowrap;margin:3px;">ppt</a>
                <a href="/index.php?do=search&m=course&q=ppt学习" target="_blank"  style="white-space:nowrap;margin:3px;">ppt学习</a>
                <a href="/index.php?do=search&m=course&q=linux" target="_blank"  style="white-space:nowrap;margin:3px;">linux</a>
                <a href="/index.php?do=search&m=course&q=系统运维" target="_blank"  style="white-space:nowrap;margin:3px;">系统运维</a>
                <a href="/index.php?do=search&m=course&q=鸟哥" target="_blank"  style="white-space:nowrap;margin:3px;">鸟哥</a>
                <a href="/index.php?do=search&m=course&q=Linux技术沙龙" target="_blank"  style="white-space:nowrap;margin:3px;">Linux技术沙龙</a>
                <a href="/index.php?do=search&m=course&q=linux操作系统" target="_blank"  style="white-space:nowrap;margin:3px;">linux操作系统</a>
                <a href="/index.php?do=search&m=course&q=讲师寄语" target="_blank"  style="white-space:nowrap;margin:3px;">讲师寄语</a>
                <a href="/index.php?do=search&m=course&q=51CTO学院讲师" target="_blank"  style="white-space:nowrap;margin:3px;">51CTO学院讲师</a>
                <a href="/index.php?do=search&m=course&q=周年庆" target="_blank"  style="white-space:nowrap;margin:3px;">周年庆</a>
                <a href="/index.php?do=search&m=course&q=运维" target="_blank"  style="white-space:nowrap;margin:3px;">运维</a>
                <a href="/index.php?do=search&m=course&q=技术沙龙" target="_blank"  style="white-space:nowrap;margin:3px;">技术沙龙</a>
                <a href="/index.php?do=search&m=course&q=WEB开发" target="_blank"  style="white-space:nowrap;margin:3px;">WEB开发</a>
                <a href="/index.php?do=search&m=course&q=WEB" target="_blank"  style="white-space:nowrap;margin:3px;">WEB</a>
                <a href="/index.php?do=search&m=course&q=移动开发" target="_blank"  style="white-space:nowrap;margin:3px;">移动开发</a>
                <a href="/index.php?do=search&m=course&q=WOT" target="_blank"  style="white-space:nowrap;margin:3px;">WOT</a>
                <a href="/index.php?do=search&m=course&q=IT" target="_blank"  style="white-space:nowrap;margin:3px;">IT</a>
                <a href="/index.php?do=search&m=course&q=在线教育" target="_blank"  style="white-space:nowrap;margin:3px;">在线教育</a>
                <a href="/index.php?do=search&m=course&q=IT精品课" target="_blank"  style="white-space:nowrap;margin:3px;">IT精品课</a>
                <a href="/index.php?do=search&m=course&q=IT课程" target="_blank"  style="white-space:nowrap;margin:3px;">IT课程</a>
                <a href="/index.php?do=search&m=course&q=实战" target="_blank"  style="white-space:nowrap;margin:3px;">实战</a>
                <a href="/index.php?do=search&m=course&q=职业" target="_blank"  style="white-space:nowrap;margin:3px;">职业</a>
                <a href="/index.php?do=search&m=course&q=职位" target="_blank"  style="white-space:nowrap;margin:3px;">职位</a>
                <a href="/index.php?do=search&m=course&q=软考培训" target="_blank"  style="white-space:nowrap;margin:3px;">软考培训</a>
                <a href="/index.php?do=search&m=course&q=软件保过班" target="_blank"  style="white-space:nowrap;margin:3px;">软件保过班</a>
                <a href="/index.php?do=search&m=course&q=软考学习" target="_blank"  style="white-space:nowrap;margin:3px;">软考学习</a>
                <a href="/index.php?do=search&m=course&q=软考" target="_blank"  style="white-space:nowrap;margin:3px;">软考</a>
                <a href="/index.php?do=search&m=course&q=运维工程师" target="_blank"  style="white-space:nowrap;margin:3px;">运维工程师</a>
                <a href="/index.php?do=search&m=course&q=王佩丰" target="_blank"  style="white-space:nowrap;margin:3px;">王佩丰</a>
                <a href="/index.php?do=search&m=course&q=office" target="_blank"  style="white-space:nowrap;margin:3px;">office</a>
                <a href="/index.php?do=search&m=course&q=linux运维" target="_blank"  style="white-space:nowrap;margin:3px;">linux运维</a>
                <a href="/index.php?do=search&m=course&q=马哥" target="_blank"  style="white-space:nowrap;margin:3px;">马哥</a>
                </div>
</div>

<!-- pop start -->
<!-- <div class="pop-box">
    <span class="pop-close"></span>
    <div class="pop-con">
        <h2>尊敬的老师 您好：</h2>
        <p>51CTO学院将于XXXX年X月X日开启‘手机专享’功能，手机专享课程在‘51CTO学院</p>
        <p>移动端’以9.5折的销售。优惠部分学院与您一起承担。</p>
        <p>手机专享由讲师自主、自愿选择课程创建活动。X月X日前加入在移动端后续推广中优先推荐</p>
        <a class="pop-btn" href="http://edu.51cto.com/lecturer/addact.html">创建活动</a>
    </div>
</div> -->
<!-- pop end -->

<script>
    if(!setCookie){
        setCookie(name, value, iDay);
        getCookie(name);
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
var cur = "index" || "index";
$("#cur_"+cur).addClass("cur");



// 关闭弹窗
$('.pop-close, .pop-btn').click(function(){
    $('.pop-box').hide();
});

/*if(getCookie('popshow')==1){
    // 隐藏弹窗
    $('.pop-box').hide();
}else{
    // 显示弹窗
    $('.pop-box').show();
    setPopShow();
} */
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
         			<div class="p_kc_li clearfix bd_bottom1" style="position: relative;"> 
            		<a href="/course/course_id-7737.html" target="_blank">
             			<img alt="IT课堂 " src="https://s1.51cto.com/images/201611/818d1ee62c87e175791875d39a3203bf50578c_small.jpg" width="126" height="94" />
            		</a>
            		<dl>
	              		<dt class="font14">
	                  		<span class="fl kc_name"><a href="/course/course_id-7737.html" target="_blank">51CTO学院&amp;马哥教育Linux公开课-一个运维工程师的独白 （4课时）</a></span>
	              	  		<span class="fr c_red font12 tr">免费</span>
	              		</dt>
	              		<dd class="p_dd02">
	              			年的时间不长，从一个运维小白成长为运维负责人；从不会拼写‘Linux’ 到参与各种双11购物节，大促活动；从负责一台PC机到四千台服务器，你需要掌握什么样的技能？这期间他是怎样的经历？作为一名运维工程师，如何在职场中保持快速成长，如何面对复杂的业务场景，怎样与...              </dd>
	              		<dd class="p_dd03">
		                	<p class="fl p_dd03_l">
								<span><em>1028</em>人学习</span>
								<span><em><a href="/course/course_id-7737.html" target="_blank">0</a></em>条讨论</span>
							</p>
		                	<span class="p_play">
		                    	<a href="<%=basePath %>datainfo/courseinfo.jsp" target="_blank"><img alt="开始学习" src="https://static1.51cto.com/edu/images/p_play_ico.png" align="absmiddle" />开始学习</a>
		                	</span>
              	  		</dd>
           			</dl>
         			</div>
         		</c:forEach>
              <div class="box3"><div class="aa"><div class="pagesDevice"> <a href="<%=basePath %>datainfo/face.jsp" class="pagesGoPrve">&nbsp;</a><a href="<%=basePath %>datainfo/face.jsp" class="pagesNum">1</a><a href="<%=basePath %>datainfo/face1.jsp" class="pagesNum pagesNumCur">2</a></div></div></div>
          </td>
      </tr>
    </table>
  </div>

</div>
<script>
    var imgteacher = 'https://static1.51cto.com/edu/images/';

    // 领取优惠券 
    $('p[name=coupon_btn]').one('click',function(){
        var user_id = '';
        if(user_id == '' || user_id == '0') {
          window.location.href='http://home.51cto.com/index/?reback=http%253A%252F%252Fedu.51cto.com%252Flecturer%252Fuser_id-8899635-page-2.html';
          return false;
        }
        var me = $(this);
        var meid = me.attr('id');
        $.ajax({
            url: '/batch/getcoupon',
            data:{'batch_id': meid},
            type:'post',
            dataType:'json',
            success: function(e){
                if(e.status == 1){
                  me.parent().parent().addClass('show');
                  me.parent().parent().parent().find('.coupon_img').attr('src', 'https://static1.51cto.com/edu/images/whitestyle/coupons.png');
                  me.html('已领取');
                }else{
                    alert(e.msg);
                }
            }
        });
    });


    // 讲师优惠券 131313   
    var paychild = $('.coupon-list li'),
        paychildwidth = paychild.width()+30,
        paybox = $('.coupon-list'),
        payLeft = $("#pay-left"),
        payLight = $("#pay-right"),
        pay_middle = $('#pay_middle'); 

    if(paychild.length < 3){
      payLeft.hide();
      payLight.hide();
      pay_middle.hide();
    }
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

<!----------------------数据分析  begin --------------------->
<script type="text/javascript">
var lecid = "8899635"; 
</script>
<!----------------------数据分析  end ----------------------->

<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="http://edu.51cto.com/" title="IT学院"><img src="<%=basePath %>image/itlogo.png" alt="51cto学院" width="194" height="40"/>
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
            <p class="Call fl red">176-0797-5702</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2017-2027 <a href="<%=basePath %>datainfo/shouye.jsp" target="_blank">51CTO.com</a></p>
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
    var sessionid = "jje0hpk4aae4b5be7lpantjdd6",
            ip = "182.97.87.71",
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

