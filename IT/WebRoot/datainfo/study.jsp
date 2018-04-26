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
<title>实战IT网络培训课程_中国最大的IT实战在线教育培训平台</title>
<meta name="keywords" content="IT实战培训,IT在线培训,IT教育培训,IT在线教育,微信开发,PHP,Java,Unity3D,Linux,Hadoop,虚拟化" />
<meta name="description" content="中国最大的IT实战在线教育培训平台：拥有云计算，大数据，移动开发，游戏开发，系统/运维，考试认证，编程语言，Web开发，软件研发，网络技术，服务器存储，数据库，嵌入式，企 业信息化，Office，设计，大学MOOC，其它等各种IT领域实战培训课程视频。" />
<link rel="shortcut icon" href="<%=basePath%>images/lo.png"
			type="image/x-icon"/>
<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.4.5"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/msgbox.js?v=2.4.5"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/nav.js?v=2.4.5"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/mbox.js?v=2.4.5"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.5"></script>
<!-- 通用顶部简导航 -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.82"/>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.82"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.5"/>
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.5" rel="Stylesheet" />
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
<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til">中国最大的IT技能学习平台</li>
        <li class="fr navi"><a target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="<%=basePath %>courselistservlet?order=list" target="_blank">首页</a></li>
                <li><a href="<%=basePath %>datainfo/login.jsp" target="_blank">登录界面</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册界面</a></li>
                <li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                <li><a href="<%=basePath %>mainservlet?order=face" target="_blank">IT课堂主站</a></li>
            	<c:if test="<%=studentBean!=null %>">
                	<li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                	<li><a href="<%=basePath %>datainfo/myface.jsp" target="_blank">个人主页</a></li>
                </c:if>
            </ul>
        </li>
       <c:if test="${studentBean!=null}">
        	<li class="fr"><a target="_blank" href="<%=basePath %>loginservlet?order=loginin&name=${studentBean.studentmobile}">学习中心</a></li>
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
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vipred.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%";/></a></li>
       		 </c:if>
       </c:if>
    </ul>
</div>       <ul class="FixedSideBar">
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
            <p><a href="<%=basePath %>datainfo/fankui.jsp" target="_blank">意见反馈</a></p>
        </li>
        <li class="FixedSideBar_GoTop">
            <p>返回顶部</p>
        </li>
    </ul>
<input type="hidden" value="">
<div class="pagebg" style="width: 100%;background: #fff;">
    <div class="Page" style="height:90px;">
        <a href="http://edu.51cto.com/px/train/94?banner" target="_blank">
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
            <li><a >微职位培训</a></li>
            <li><a  target="_blank">视频课程</a></li>
            <li><a  target="_blank">套餐</a></li>
            <li><a  target="_blank">职业路线图</a></li>
            <li><a  target="_blank">企业学习</a></li>
            <li><a   target="_blank">免费试听</a></li>
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
<div class="Page">
  <div class="CourseListPage">
    <div class="CourseListScreen">
    <div class="fl bg_ef" style="height:1px;width:100%;overflow:hidden;"></div>
      <p class="fl w60 bg_ef">领域：</p>
      <ul class="CourseClassification fl">
        <li class="CourseClassification_Cur"><a >全部</a></li>
                <li >
            <a >云计算</a>
                        <p class="CourseClassification_Sub">
                                <a   >OpenStack</a>
                                <a   >虚拟化</a>
                                <a  >云平台</a>
                                <a   >Office 365</a>
                                <a  >云服务</a>
                                <a   >Docker</a>
                                <a>其他</a>
                            </p>
                    </li>
                <li >
            <a >大数据</a>
                        <p class="CourseClassification_Sub">
                                <a>深度学习</a>
                                <a>Hadoop</a>
                                <a>Spark</a>
                                <a>Storm</a>
                                <a>Hive</a>
                                <a>Yarn</a>
                                <a>其他</a>
                            </p>
                    </li>
                <li >
            <a >移动开发</a>
                        <p class="CourseClassification_Sub">
                                <a>HTML5</a>
                                <a>移动测试</a>
                                <a>微信开发</a>
                                <a>iOS</a>
                                <a>Android</a>
                                <a>Swift</a>
                                <a>WinPhone</a>
                                <a>他</a>
                            </p>
                    </li>
                <li >
            <a >游戏开发</a>
                        <p class="CourseClassification_Sub">
                                <a >Unity3D</a>
                                <a >Cocos2d-x</a>
                                <a  >VR虚拟现实</a>
                                <a  >手游开发</a>
                                <a  >3D游戏</a>
                                <a  >开发工具</a>
                                <a  >其他</a>
                            </p>
                    </li>
                <li >
            <a >系统/运维</a>
                        <p class="CourseClassification_Sub">
                                <a  >Linux</a>
                                <a  >Windows</a>
                                <a  >Unix</a>
                                <a   >Mac os</a>
                                <a   >其他</a>
                            </p>
                    </li>
                <li >
            <a >考试认证</a>
                        <p class="CourseClassification_Sub">
                                <a  >软考</a>
                                <a  >红帽认证</a>
                                <a  >华为认证</a>
                                <a  >思科认证</a>
                                <a  >微软认证</a>
                                <a  >H3C认证</a>
                                <a   >等级考试</a>
                                <a   >其他</a>
                            </p>
                    </li>
                <li >
            <a >编程语言</a>
                        <p class="CourseClassification_Sub">
                                <a  >Python</a>
                                <a  >Java</a>
                                <a  >C/C++</a>
                                <a  >.Net</a>
                                <a  >Ruby</a>
                                <a   >Objective-C</a>
                                <a  >Go语言</a>
                                <a  >Qt</a>
                                <a  >VB</a>
                                <a  >Delphi</a>
                                <a   >R语言</a>
                                <a  >其他</a>
                            </p>
                    </li>
                <li >
            <a >Web开发</a>
                        <p class="CourseClassification_Sub">
                                <a  >PHP</a>
                                <a   >Html/CSS</a>
                                <a   >JavaScript</a>
                                <a   >jQuery</a>
                                <a   >Node.js</a>
                                <a   >XML/XSL</a>
                                <a   >Dreamweaver</a>
                                <a   >浏览器技术</a>
                                <a   >其他</a>
                            </p>
                    </li>
                <li >
            <a>软件研发</a>
                        <p class="CourseClassification_Sub">
                                <a  >软件测试</a>
                                <a  >敏捷开发</a>
                                <a  >研发管理</a>
                                <a  >软件设计</a>
                                <a  >软件架构</a>
                                <a  >其他</a>
                            </p>
                    </li>
                <li >
            <a >数据库</a>
                        <p class="CourseClassification_Sub">
                                <a  >MySQL</a>
                                <a  >Oracle</a>
                                <a  >SQL Server</a>
                                <a  >Access</a>
                                <a  >DB2</a>
                                <a   >NoSQL</a>
                                <a   >MongoDB</a>
                                <a   >Hbase</a>
                                <a   >Sybase</a>
                                <a   >其他</a>
                            </p>
                    </li>
                <li >
            <a >网络技术</a>
                        <p class="CourseClassification_Sub">
                                <a>网络管理</a>
                                <a >路由交换</a>
                                <a >安全技术</a>
                                <a >通信技术</a>
                                <a  >数据中心</a>
                                <a  >其他</a>
                            </p>
                    </li>
                <li >
            <a >服务器存储</a>
                        <p class="CourseClassification_Sub">
                                <a >Windows Server</a>
                                <a >Exchange</a>
                                <a >Lync</a>
                                <a >SharePoint</a>
                                <a  >Nginx</a>
                                <a  >集群</a>
                                <a  >分布式</a>
                                <a  >邮件服务器</a>
                                <a  >其他</a>
                            </p>
                    </li>
                <li >
            <a >大学课程</a>
                        <p class="CourseClassification_Sub">
                                <a   >计算机网络</a>
                                <a   >数据结构</a>
                                <a   >计算机导论</a>
                                <a   >算法基础</a>
                                <a   >软件工程</a>
                                <a   >操作系统</a>
                                <a   >其他</a>
                            </p>
                    </li>
                <li >
            <a>嵌入式</a>
                        <p class="CourseClassification_Sub">
                                <a   >嵌入式Linux</a>
                                <a   >驱动/内核开发</a>
                                <a   >单片机/工控</a>
                                <a   >物联网</a>
                                <a   >智能硬件</a>
                                <a   >体感技术</a>
                                <a   >其他</a>
                            </p>
                    </li>
                <li >
            <a >企业信息化</a>
                        <p class="CourseClassification_Sub">
                                <a  >项目管理</a>
                                <a  >ERP</a>
                                <a   >CRM</a>
                                <a   >BPM</a>
                                <a   >管理软件</a>
                                <a   >其他</a>
                            </p>
                    </li>
                <li >
            <a >Office办公</a>
                        <p class="CourseClassification_Sub">
                                <a  >Excel</a>
                                <a  >PPT</a>
                                <a   >Word</a>
                                <a  >其他</a>
                            </p>
                    </li>
                <li >
            <a >设计</a>
                        <p class="CourseClassification_Sub">
                                <a   >交互设计</a>
                                <a   >平面设计</a>
                                <a   >室内设计</a>
                                <a   >其他</a>
                            </p>
                    </li>
                <li >
            <a>其它</a>
                        <p class="CourseClassification_Sub">
                                <a   >IT职场</a>
                                <a  >网络营销</a>
                                <a  >多媒体</a>
                                <a   >互联网运营</a>
                                <a   >英语四六级</a>
                                <a  >其他</a>
                            </p>
                    </li>
              </ul>
    <div class="fl bg_ef" style="height:1px;width:100%;overflow:hidden;"></div>
      <p class="fl w60">难度：</p>
                                                                                                                                                                <ul class="fl">
        <li><a  class="gre">全部</a></li>
        <li><a  >初级</a></li>
        <li><a  >中级</a></li>
        <li><a  >高级</a></li>
      </ul>
    <div class="fl bg_ef" style="height:1px;width:100%;overflow:hidden;"></div>
      <p class="fl w60">属性：</p>
                                                                                                                                                                <ul class="fl">
        <li><a  class="gre">全部</a></li>
        <li><a  >独家</a></li>
        <li><a  >首发</a></li>
        <li><a  >普通</a></li>
      </ul>
      <div class="fl bg_ef" style="height:1px;width:100%;overflow:hidden;"></div>
      <!-- 价格123 -->
      <p class="fl w60">价格：</p>
      <ul class="fl" style="width: 380px;">
        <li><a class="gre">全部</a></li>
        <li><a href="<%=basePath %>findcourselistservlet?order=findprice&startprice=0&endprice=299">299以下</a></li>
        <li><a href="<%=basePath %>findcourselistservlet?order=findprice&startprice=300&endprice=499">300-499</a></li>
        <li><a href="<%=basePath %>findcourselistservlet?order=findprice&startprice=500&endprice=1000"> 500-1000</a></li>
        <li><a href="<%=basePath %>findcourselistservlet?order=findprice&startprice=1000&endprice=100000">1000以上</a></li>
      </ul>
      <form action="/index.php" method="get">
      </form>
      <div class="clear"></div>
    </div>

    <div class="SearchResultTools bg_ef mt30">
                                                                                                                                              <ul class="SearchResultScreen fl">
        <li class="SRSA_Item SRSA_Cur SRSA_down"><a >综合排序</a></li>
        <li class="SRSA_Item  "><a href="<%=basePath %>findcourselistservlet?order=findif&ifvalue=time">发布时间</a></li>
        <li class="SRSA_Item  "><a >销量</a></li>
        <li class="SRSA_Item  "><a >好评</a></li>
        <li class="SRSA_Item  "><a href="<%=basePath %>findcourselistservlet?order=findif&ifvalue=price">价格</a></li>

                                                                                                                                                                                                                                <!--<li class="ml20" style="padding-top:2px;*+padding-top:0px;"><input type="checkbox" id="itsOver"  onclick="window.location.href='/?do=course&m=courseList&diff=3&attr=3&end=1&sort=&asc=0'" /></li>
         <li><label for="itsOver">已完结</label></li> -->
         <li class="SRSA_Item_new SRSA_Item "><a >一元专区<i></i></a></li>
         <li class="SRSA_Item "><a >免费课程</a></li>
      </ul>
        		<ul class="SearchResultPageDevice fr f16" style="">
  			<li class="SRPD_next "><a >&nbsp;</a></li>
  			<li class="SRPD_prev SRPD_prev_no"><a >&nbsp;</a></li>
  		</ul>
         <p class="fr mr15" style="line-height:36px;">
          相关课程共 <span class="gre">${pager.pagebarsum}</span> 门
        </p>
        <div class="clear"></div>
    </div>
        <div class="micro_position_Rec">
      <div class="Main">
         <div class="fl Info Block">
          <div class="main">
            <h2 class="fl">微职位</h2>
            <h3 class="fl">&nbsp;- IT职场晋升培训领导者</h3>
            <div class="clear"></div>
            <p class="mb10">权威的学习模式.顶尖的授课名师.贴心的就业推荐</p>
            <p>面向的学员：IT普通从业者希望通过培训改变职位及薪资</p>
            <p>我们的使命：把IT普通从业者锻造成企业急需的IT精英人群</p>
          </div>
        </div>
                        <div class="fr Block list">
          <div class="fl subList">
            <h2>技能方向</h2>
            <div class="clear"></div>
            	<c:forEach items="${courselist}" var="l">
                	<a href="<%=basePath %>courselistservlet?order=datainfo&courseid=${l.course_id}" target="_blank" >·${l.course_name}</a>
            	</c:forEach>
            </div>
          <div class="fl subList">
            <h2>认证方向</h2>
            <div class="clear"></div>
                <c:forEach items="${courselist}" var="l">
                	<a href="<%=basePath %>courselistservlet?order=datainfo&courseid=${l.course_id}" target="_blank" >·${l.course_name}</a>
            	</c:forEach>
            </div>
        </div>
           <div class="clear"></div>
      </div>
    </div>
    <ul class="CourseVideoList">
      
      <c:forEach items="${courselist}" var="l">
      		<li class="CourseVideoListItem packItem">
        <div class="courseCardType tr8">套餐</div>
         <a title="${l.one_word}" target="_blank" style="position: relative;" href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${l.course_id}">
          <img src="${l.picture_url}" alt="C++实战ffmpeg和QT5跨平台视频播放器系列套餐"/>
        </a>
        <div class="CourseVideoListItem_LessionNum">
          <div></div>
          <p>共<span class="red">${l.course_count}</span>课时</p>
        </div>
        <dl>
          <dt class="f14">
            <a target="_blank" href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${l.course_id}" title="C++实战ffmpeg和QT5跨平台视频播放器系列套餐">${l.one_word}</a>
          </dt>
         <c:if test="${l.ismoney==1}">
         	 <dd class="del">原价：284</dd>
         </c:if>
         <c:if test="${l.ismoney==0}">
         	 <dd class="del">免费</dd>
         </c:if>
        </dl>
        <div class="info03">
          <p class="fr red tr" style="height:42px;margin-bottom:-17px;">
          <c:if test="${l.ismoney==1}">
            <span class="f14 fontG">¥${l.price}</span>
            </c:if>
            <c:if test="${l.ismoney==0}">
            <span class="f14 fontG">免费</span>
            </c:if>
          </p>
          <div class="clear"></div>
        </div>
        <div style="height:26px;">
          <p class="fl">共${l.course_count}个课程</p>
        </div>
      </li>
      </c:forEach>
      <li class="clear"></li>
    </ul>

    <div class="pagesDevice">
    	<c:forEach begin="1" end="${pager.sumpage}" var="n">
	    	<a href="<%=basePath %>courselistservlet?order=study" class="pagesNum pagesNumCur">${n}</a>
    	</c:forEach>
	    <a href="<%=basePath %>findcourselistservlet?order=list&currentpage=${pager.currentpage}&handle=downpage" class="pagesGoNext">&nbsp;</a>
	    <a href="<%=basePath %>findcourselistservlet?order=list&currentpage=${pager.sumpage}&handle=lastpage" class="pagesGoEnd" title="最后一页">&nbsp;</a>
    </div>
  </div>
</div>


<script type="text/javascript">
$(".CourseComm_TitleStarsYes").each(function(){
  var sssss = parseFloat($(this).find('input').val());
  $(this).animate({'width':(sssss*15)+'px'});
});
if($(".live").length>0){
  $(".live:last").after($(".packItem"))
}
var imgpath = false;
var sendtype = 9; 
$(function(){
  //
  var x = $(".CourseClassification li").eq(0).offset().top;
  $(".CourseClassification li").each(function(){
    if($(this).offset().top != x){
      $(this).before('<li class="zhanwei"></li>');
      return false;
    }
  });
  //
  //模拟Select动作
  $(".CCInputSelect>p").click(function(){
    if($(this).next().css('display')=='none'){
      $(this).next().css('display','block');
      $(this).removeClass('grey');
    }else{
      $(this).next().css('display','none');
      $(this).addClass('grey');
    }
  });
  $(".CCInputSelect>ul>li").click(function(){
    var x = $(this).html();
    $(this).parent().prev().html(x);
    $(this).parent().css('display','none');
    $(this).parent().prev().addClass('grey');
    //技术难度 do something...
  });
  $(".CCInputSelect>ul").bind('mouseleave',function(){
    $(this).css('display','none');
    $(this).prev().addClass('grey');
  });
  //模拟Select动作End

  //放大
  $(".CourseVideoListItem").mouseenter(function(){
  	$(this).addClass('ICLItemCur');
  }).mouseleave(function(){
  	$(this).removeClass('ICLItemCur');
  });
});

function SplitString(value,len){
  var _tmp = '';
  var _length = 0;

  for (var i = 0; i < value.length; i++) {
    if (value.charCodeAt(i) > 255) {
      _length++;
      _length++;
    }else{
      _length++;
    }
    if(_length<len){
      _tmp+=value.charAt(i);
    }
  }
  if(_length>=len){
    _tmp+='...';
  }
  return _tmp;
}
$('.CourseClassification_Cur').find('p.CourseClassification_Sub').show();
//CourseComm_TitleStars

// 输入框只能输入数字
$('.priceInput').keyup(function(){
  this.value = parseInt(this.value);
  if(this.value==''||isNaN(this.value))this.value=0;
  if(this.value>99999)this.value=99999;
})
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
    var sessionid = "ngm83d62e58nl4mqhtvu258d83",
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
