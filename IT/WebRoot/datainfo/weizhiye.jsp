<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.StudentBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>IT课堂直播培训-专业的IT职业在线教育及实战培训平台</title>
    <!-- <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/pxb/all.min.css"> -->
    <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/plugin/datepicker/datepicker.css">
    <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/plugin/webuploader/webuploader.css">
    <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/css/../center/css/base.css?v=2.4.5">
    <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/pxb/base.css?v=2.4.5">
    <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/pxb/style.css?v=2.4.5">
    <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/pxb/wxk.css?v=2.4.5">
    <script src="https://static.edu.51cto.com/plugin/jquery.min.js"></script>
    <script src="https://static.edu.51cto.com/plugin/jquery.form.js"></script>
    <script src="https://static.edu.51cto.com/plugin/jquery.mousewheel.min.js"></script>
    <!-- 通用顶部简导航 -->
    <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/css/gen_top.css?v=2.2.82">
    <script type="text/javascript" src="https://static.edu.51cto.com/js/gen_top.js?v=2.2.82"></script>
</head>
<script type="text/javascript">
    var image_url = 'https://s1.51cto.com/';
    var pxy_url = 'http://pay.51cto.com/';
    var edu_url = 'http://edu.51cto.com/';
    var uc_api = 'http://ucenter.51cto.com/';
    var uc_url = 'https://ucenter.51cto.com/';
    var home_url = 'http://home.51cto.com/';
    var uppath = 'http://u2.51cto.com/';
    var p_url = 'http://video.51cto.com/';
    var web_url = 'http://edu.51cto.com/px/';

    var imgpath = 'https://static.edu.51cto.com/images/';
    var csspath = 'https://static.edu.51cto.com/css/';
    var jspath = 'https://static.edu.51cto.com/js/';
    var edu_api = 'http://edu.51cto.com/api/php/edu_server.php';
    var static_img = 'https://static.edu.51cto.com/pxb/images/';
    var static_css = 'https://static.edu.51cto.com/pxb/css/';
    var static_js = 'https://static.edu.51cto.com/pxb/js/';
    var static_path = 'https://static.edu.51cto.com/pxb/'
    var pxb_search = web_url+'train/search?';
    var log_url = 'http://da.51cto.com/';
    var sendlog_url = web_url+'log/sends';
    if (!Date.now) {
        Date.now = function() { return new Date().getTime(); };
    }
</script>
<body>
<% 
	StudentBean studentBean = (StudentBean)session.getAttribute("bean");
%>
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
            <a href="<%=basePath %>courselistservlet?order=mycar1" target="_blank" class="red">购物车<span>${requestScope.num}</span></a>
        </li>
        <li class="fr reg"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册</a></li>
        <c:if test="${studentBean==null}">
        	<li class="fr"><a href="<%=basePath %>datainfo/login.jsp">登录</a></li>
        </c:if>
       <c:if test="${studentBean!=null}">
       		 <li class="fr"><a href="<%=basePath %>loginservlet?order=exit"><font color="red">【安全退出】</font></a></li>
       		 <li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=${studentBean.studentmobile}" target="_blank">${studentBean.studentname}</a></li>
       </c:if>
    </ul>
</div><div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="<%=basePath %>courselistservlet?order=list" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" class="fl"></a>
        </div>
        <ul class="Navigate fl">
            <li><a href="<%=basePath %>courselistservlet?order=list">首页</a></li>
            <li><a href="<%=basePath %>datainfo/weizhiye.jsp" target="_blank">微职位培训</a></li>
            <li><a  target="_blank">视频课程</a></li>
            <li><a  target="_blank">套餐</a></li>
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
    </div>
</div>

<script src="https://static.edu.51cto.com/plugin/util.js"></script>
<script src="https://static.edu.51cto.com/plugin/scrollbar.js"></script>
<script src="https://static.edu.51cto.com/plugin/select.js"></script>
<script src="https://static.edu.51cto.com/plugin/word-count.js"></script>
<script src="https://static.edu.51cto.com/plugin/mbox.js"></script>
<script src="https://static.edu.51cto.com/plugin/new_mbox.js"></script>
<script src="https://static.edu.51cto.com/pxb/js/top.js?v=1.1.2"></script>
<script src="https://static.edu.51cto.com/plugin/datepicker/datepicker.js"></script>
<script src="https://static.edu.51cto.com/plugin/datepicker/datepicker.zh-CN.js"></script>
<!--<script src="https://static.edu.51cto.com/plugin/placeholder.js"></script>-->
<script src="https://static.edu.51cto.com/plugin/time.js"></script>
<div class="Content">
<style type="text/css">
.Content .lineB {width:1200px;}
</style>
<div class="banner" id="Banner">
        <div class="Page">
            <ul class="IndexBannerPicsList">
            	<li color="#2e73ac"><a href="<%=basePath %>datainfo/shangban.jsp" target="_blank"><img src="<%=basePath %>image/w1.jpg"/></a></li>            		
            	<li color="#000000"><a href="http://edu.51cto.com/px/train/108?px" target="_blank"><img src="<%=basePath %>image/w2.jpg"/></a></li>            		
            	<li color="#ed6d00"><a href="http://edu.51cto.com/px/train/100?px" target="_blank"><img src="<%=basePath %>image/w3.jpg"/></a></li>            		
            	<li color="#e86646"><a href="http://edu.51cto.com/px/train/115?px" target="_blank"><img src="<%=basePath %>image/w4.jpg"/></a></li>            		
            	<li color="#000000"><a href="http://edu.51cto.com/px/train/104?px" target="_blank"><img src="<%=basePath %>image/w5.jpg"/></a></li>            		
            	<li color="#13165b"><a href="http://edu.51cto.com/px/train/122?px" target="_blank"><img src="<%=basePath %>image/w6.jpg"/></a></li>            		
            	<li color="#870000"><a href="http://edu.51cto.com/px/train/105?px" target="_blank"><img src="<%=basePath %>image/w7.jpg"/></a></li>            		
            </ul>
            <div class="IndexBannerPicsList_Btn">
                <ul></ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="Page">
    	<div class="lineB mt30">
            <p class="title fl">
                <a target="_blank"  href="http://edu.51cto.com/px/train/list?type=1"><span class="f22">高薪就业班</span></a>
                <p class="fl fgray padding10" >51CTO学院首推企业人才定制服务方案，量身定制，推荐就业，一点受理，全国联动</p>
                <p class="fr padding10 fgray"><a target="_blank"  href="http://edu.51cto.com/px/train/list?type=1" class=" ">更多>></a></p>
            <div class="clear"></div>
            <div class="classes" style="width:1220px;">
                <div class="lesson">
                <div>
                 <a target="_blank"  href="http://edu.51cto.com/px/train/108?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/58490b2847b79894389400c6fed20d0976c51e_small.jpg"/>
                        </a>
                        <p class="times">共348课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/108?pxb">
                        <p class="lessonName">
							IT金领：年薪百万大数据工程师高端培训【微职位】                        </p>
                    </a>
                    <p>
                     <span class="classTime fgray">
                     	<span> 随到随学 20周</span>
                     </span>
                        <span class="fred">￥</span>
                        <span class="fred">8800</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/11983635">
                            <span class="classTeacher fgray" title="孟硕">孟硕</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/115?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/23a1bac33fc3370e92c1576f8460706c290d7c_small.jpg"/>
                        </a>
                        <p class="times">共280课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/115?pxb">
                        <p class="lessonName">
							直通名企：Linux高端云计算与架构师微职位                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span> 随到随学 29周</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">9800</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/4265610">
                            <span class="classTeacher fgray" title="马哥">马哥</span>
                        </a>
                    </p>
                </div>
                <div class="lesson">
                    <div>
                        <a target="_blank"  href="http://edu.51cto.com/px/train/94?pxb">
                        	<img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201607/891aaab3974878d39b43801858971bbadd968c_small.jpg"/>
                        </a>
                        <p class="times">共813课时</p>
                    </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/94?pxb">
                        <p class="lessonName">
							直通名企：Python高级自动化开发工程师微职位                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span> 随到随学 40周</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">7200</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/3050674">
                            <span class="classTeacher fgray" title="Alex(李杰)">Alex(</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/115?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/e24b15e03c4bec82bd00647da23d664a12522d_small.jpg"/>
                        </a>
                        <p class="times">共167课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/115?pxb">
                        <p class="lessonName">
							直通名企：Linux高端运维工程师微职位                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span> 随到随学 15周</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">6500</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/4265610">
                            <span class="classTeacher fgray" title="马哥">马哥</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/120?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/7635aad88d80e0b3f1763997e204ef57839cce_small.jpg"/>
                        </a>
                        <p class="times">共35课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/120?pxb">
                        <p class="lessonName">
							【试学】虚拟化&amp;云计算全能管理工程师微职位                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span> 随到随学 3周</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">998</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/7168277">
                            <span class="classTeacher fgray" title="赵海兵">赵海兵</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/108?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/a5bc2815855c60effbe226097fb6b470b7a331_small.jpg"/>
                        </a>
                        <p class="times">共34课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/108?pxb">
                        <p class="lessonName">
							【试学】大数据工程师微职位                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span> 随到随学 3周</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">998</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/11983635">
                            <span class="classTeacher fgray" title="孟硕">孟硕</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/122?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/e7a51fc39bedaea0c5c509e735ac7fb360be52_small.jpg"/>
                        </a>
                        <p class="times">共1306课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/122?pxb">
                        <p class="lessonName">
							虚拟化&amp;云计算全能管理工程师微职位                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span> 随到随学 18周</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">5680</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/7168277">
                            <span class="classTeacher fgray" title="赵海兵">赵海兵</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/104?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201609/d53c3c089868123f95801423534165c2c36db5_small.jpg"/>
                        </a>
                        <p class="times">共838课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/104?pxb">
                        <p class="lessonName">
							Unity游戏开发工程师微职位【手游+页游+ARPG】                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span> 随到随学 17周</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">3280</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/9142031">
                            <span class="classTeacher fgray" title="刘国柱">刘国柱</span>
                        </a>
                    </p>
                </div>
                                <div class="clear "></div>
            </div>
        </div>
            	        <div class="lineB ">
            <p class="title fl">
                <a target="_blank"  href="http://edu.51cto.com/px/train/list?type=2">
                    <span class="f22">考试认证班</span>
                </a>
                <p class="fl fgray padding10" >解决IT人才考试证书需求，专业教学辅导，一次通过考试，不留遗憾</p>
                <p class="fr padding10 fgray">
                    <a target="_blank"  href="http://edu.51cto.com/px/train/list?type=2" class=" ">更多>></a>
                </p>
            <div class="clear"></div>
            <div class="classes " style="width:1220px;">
                                                 <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/100?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201701/57ed40f6227f5a295fc288c02650724cb444d5_small.jpg"/>
                        </a>
                        <p class="times">共263课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/100?pxb">
                        <p class="lessonName">
    						软考2017年零基础保过班                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>开课中</span>
                             <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">3180</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/1030946">
                            <span class="classTeacher fgray" title="薛大龙">薛大龙</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/109?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201610/d65e9ff73d7e0471ed32487de7f52cfe2b2366_small.jpg"/>
                        </a>
                        <p class="times">共86课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/109?pxb">
                        <p class="lessonName">
    						华为HCNP考试认证培训班2期-【100%通过率】                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>开课中</span>
                             <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">3500</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/542102">
                            <span class="classTeacher fgray" title="肖宗鹏">肖宗鹏</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/114?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/c648e7b4844089ac6e10837f5444c20395b74b_small.jpg"/>
                        </a>
                        <p class="times">共148课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/114?pxb">
                        <p class="lessonName">
    						红帽认证RHCE工程师培训第8期                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>2017-02-27开课</span>
                             <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">7000</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/5428084">
                            <span class="classTeacher fgray" title="老段">老段</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/127?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/11c0a16917b2961e03c74697a7c22358d0bf04_small.png"/>
                        </a>
                        <p class="times">共106课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/127?pxb">
                        <p class="lessonName">
    						软考：网络工程师培训班 第3期                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>开课中</span>
                             <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">999</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/5957446">
                            <span class="classTeacher fgray" title="朱小平">朱小平</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/126?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/948a8808735f46bad01759b97ccdeedcdf984b_small.jpg"/>
                        </a>
                        <p class="times">共51课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/126?pxb">
                        <p class="lessonName">
    						软考：信息安全工程师培训班第2期                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>2017-02-22开课</span>
                             <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">1680</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/1030946">
                            <span class="classTeacher fgray" title="薛大龙">薛大龙</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/125?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/980df65272b7fa49f3991629b79acaa3aa20ab_small.jpg"/>
                        </a>
                        <p class="times">共166课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/125?pxb">
                        <p class="lessonName">
    						软考：信息系统监理师培训班第3期                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>开课中</span>
                             <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">1880</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/1030946">
                            <span class="classTeacher fgray" title="薛大龙">薛大龙</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/124?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/1131791412c11aa6c86948306974dd32f74fb1_small.jpg"/>
                        </a>
                        <p class="times">共176课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/124?pxb">
                        <p class="lessonName">
    						软考中项：系统集成项目管理工程师培训班 第5期                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>开课中</span>
                             <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">2880</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/1030946">
                            <span class="classTeacher fgray" title="薛大龙">薛大龙</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/123?pxb">
                            <img width="285px" height="157px" style="display: block;" src="https://s1.51cto.com/images/201612/9702fc6214848d6e026796a3a83eb25cb26ed0_small.png"/>
                        </a>
                        <p class="times">共263课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/123?pxb">
                        <p class="lessonName">
    						软考高项：信息系统项目管理师培训班 第5期                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>开课中</span>
                             <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">3180</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/1030946">
                            <span class="classTeacher fgray" title="薛大龙">薛大龙</span>
                        </a>
                    </p>
                </div>
                                 <div class="clear "></div>
            </div>   
        </div>
                <div class="clear"></div>
                <div class="lineB">
            <p class="title fl">
                <a target="_blank"  href="http://edu.51cto.com/px/train/list?type=3">
                    <span class="f22">技能提高班</span>
                </a>
                <p class="fl fgray padding10" >业内资深专家指导，提升IT职业技能，让你更有竞争力</p>
                <p class="fr padding10 fgray">
                    <a target="_blank"  href="http://edu.51cto.com/px/train/list?type=3" class=" ">更多>></a>
                </p>
            <div class="clear"></div>
            <div class="classes " style="width:1220px;">
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/113?pxb">
                            <img width="285px" height="157px"style="display: block;" src="https://s1.51cto.com/images/201611/1448c9d822fe6c4f1cc481279baba384ec2bb5_small.jpg"/>
                        </a>
                        <p class="times">共2课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/113?pxb">
                        <p class="lessonName">
							大数据工程师微职位：第一、二模块基础理论面试考核                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>随到随学 1周</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">1000</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/8899635">
                            <span class="classTeacher fgray" title="51CTO学院">51CTO</span>
                        </a>
                    </p>
                </div>
                                                <div class="lesson">
                    <div>
                                                <a target="_blank"  href="http://edu.51cto.com/px/train/69?pxb">
                            <img width="285px" height="157px"style="display: block;" src="https://s1.51cto.com/images/201607/f70a93a879bbcea972c82450c2b8d31231019f_small.jpg"/>
                        </a>
                        <p class="times">共6课时</p>
                                            </div>
                    <a target="_blank"  href="http://edu.51cto.com/px/train/69?pxb">
                        <p class="lessonName">
							Docker运维工程师实战培训班--运维帮出品                        </p>
                    </a>
                    <p>
                                                <span class="classTime fgray">
                                <span>已结束</span>
                            <!--A状态处于报名阶段的显示开课时间-->
                        </span>
                        <span class="fred">￥</span>
                        <span class="fred">599</span>
                        <span class="fgray empty1">|</span>
                        <a target="_blank"  href="http://edu.51cto.com/px/lec/236914">
                            <span class="classTeacher fgray" title="运维帮">运维帮</span>
                        </a>
                    </p>
                </div>
                            </div>
            <div class="clear "></div>
        </div>
		 </div>
<script src="https://static.edu.51cto.com/pxb/js/index.js"></script>
<script type="text/javascript">
    var rmid = 0;//首页
</script>

<script type="text/javascript">
if(document.location.protocol=='https:'){
    document.write('\<script type="text\/javascript" charset="utf-8" src="https\:\/\/gate.soperson.com\/20000923\/10053831\.js"\>\<\/script\>')
}else{
    document.write('\<script type="text\/javascript" charset="utf-8" src="http\:\/\/lead.soperson.com\/20000923\/10053831\.js"\>\<\/script\>')
}
</script></div>
<script type="text/javascript">
   $(".headMenu li[index='index']").addClass("Cur");
</script>
<script typ="text/javascript">
    var levelid = 0; //课程难度
    var packid = 0; //套餐ID
    var source = 1;
    var user_id = 0;
    var lec_id = 0;
    var sessionid = '42j1orkd6fk4pqbihq5e3sj2o1';
    var ip='218.204.104.235';
</script>
<script src="https://static.edu.51cto.com/js/md5.js"></script>
<script src="https://static.edu.51cto.com/pxb/js/log_public.js"></script>
<script src="https://static.edu.51cto.com/pxb/js/pxb_pv_tract.js"></script>


<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="http://edu.51cto.com/" title="51cto学院"><img src="<%=basePath %>image/itlogo.png" alt="51cto学院" width="194" height="40"/>
            </caption>
            <tr>
                <td>
                    <img src="https://static.edu.51cto.com/css/../center/images/qrcode.png" alt="学院APP" width="110" height="110"/>
                    <p>学院APP</p>
                </td>
                <td>
                    <img src="https://static.edu.51cto.com/css/../center/images/qrcode2.png" alt="官方微信" width="110" height="110"/>
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
                <a href="http://51edu.blog.51cto.com/8899635/1862738" target="_blank" title="学员交流">学员交流</a>
            </div>
            <p class="Call fl red">400-851-9651</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2005-2017 <a href="http://www.51cto.com/" target="_blank">51CTO.com</a></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div style="display:none;"><script src="https://logs.51cto.com/rizhi/count/count.js" language="JavaScript"></script></div>

<script type="text/javascript"> document.write(unescape("%3Cscript src='https://tongji.51cto.com/cto.js/5b055a2454fed8b88459c3cffdd96ed8' type='text/javascript'%3E%3C/script%3E")); </script>

<script type="text/javascript">
$(function(){      
    $('<iframe frameborder="0" scrolling="no" width="0" height="0" src="http://log.51cto.com/pageview.php?frompos=edu_art"></iframe>').appendTo('body');
})
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

