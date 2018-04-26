<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.StudentBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IT课堂-邀请好友，共享尊贵会员！半年会员免费送~</title>
<meta name="keywords" content="Java、linux、mooc、html5、Python、数据库、excel、.NET、虚拟化、spark、hadoop、ios开发、Android开发、PHP开发、web开发、cocos2dx开发、思科认证、vpn安全、Swift开发、软考、人工智能、深度学习" />
<meta name="description" content="邀请好友注册，最高送51CTO半年会员！被邀请人同享会员体验特权~赶紧行动吧！" />
<link href="/favicon.ico" type="image/x-icon" rel=icon/>
<link href="<%=basePath %>css/reset1.css?v=2.5.3" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>css/style11.css?v=2.5.3" rel="stylesheet" type="text/css" />
<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.5.3"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/msgbox.js?v=2.5.3"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/nav.js?v=2.5.3"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/mbox.js?v=2.5.3"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.5.3"></script>
<!-- 通用顶部简导航 -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/gen_top.css?v=2.3.20"/>
<script type="text/javascript" src="<%=basePath %>js/gen_top.js?v=2.3.20"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/base.css?v=2.5.3"/>
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.5.3" rel="Stylesheet" />
<script type="text/javascript">
var gen_logo = '1';
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
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vipred.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%";/></a></li>
       		 </c:if>
       </c:if>
    </ul>
</div><!-- 顶部广告位 -->
<link rel="stylesheet" href="https://static1.51cto.com/edu/css/actlist/49/style.css?v=1.01"/>
<div class="activity-49-bg" >
  <!-- banner -->
  <div class="banner-bg-49">
    <div class="banner-49 w1200">
      <form>
        <div class="banner-49-url">
                     <p>邀请好友注册成为IT课堂学院新学员，双方均可获赠会员和学院余额</p>
                  </div>
        <div class="banner-49-btns">
                      <a class="left-btn" href="javascript:void(0);">生成邀请链接</a>
                                      <a class="right-btn" href="#8H">我要发福利</a>
                    </div>
      </form>
    </div>
  </div>

  <!-- activity rule -->
  <div class="activity-rule-bg w1200">
    <div class="activity-rule">
      <ul class="activity-rule-list activity-rule-list-01">
                                  <li class="num-01  fl">
            <span>第1人</span>
            <p>5天会员+1元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-01  fl">
            <span>第2人</span>
            <p>10天会员+2元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-01  fl">
            <span>第3人</span>
            <p>15天会员+3元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-01  fl">
            <span>第4人</span>
            <p>20天会员+4元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-01  fl">
            <span>第5人</span>
            <p>25天会员+5元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-02  fl">
            <span>第6人</span>
            <p>35天会员+6元余额</p>
            <a href="javascript:;"></a>
          </li>
                <div class="clear" style="height: 0;width: 0;"></div>
      </ul>
      <ul class="activity-rule-list activity-rule-list-02">
                          <li class="num-02  fr">
            <span>第7人</span>
            <p>45天会员+7元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-02  fr">
            <span>第8人</span>
            <p>55天会员+8元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-02  fr">
            <span>第9人</span>
            <p>65天会员+9元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-02  fr">
            <span>第10人</span>
            <p>75天会员+10元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-03  fr">
            <span>第11人</span>
            <p>95天会员+11元余额</p>
            <a href="javascript:;"></a>
          </li>
                <div class="clear" style="height: 0;width: 0;"></div>
      </ul>
      <a name="8H"></a>
      <ul class="activity-rule-list activity-rule-list-03">
                          <li class="num-03  fl">
            <span>第12人</span>
            <p>115天会员+12元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-03  fl">
            <span>第13人</span>
            <p>135天会员+13元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-03  fl">
            <span>第14人</span>
            <p>155天会员+14元余额</p>
            <a href="javascript:;"></a>
          </li>
                          <li class="num-04  fl">
            <span>第15人</span>
            <p>180天会员+15元余额</p>
            <a href="javascript:;"></a>
          </li>
                <div class="clear" style="height: 0;width: 0;"></div>
      </ul>
      <div class="activity-rule-list-last">
                  <p class="num-first">我也要领取福利</p>
          <a href="http://edu.51cto.com/user/login.html">邀请好友GO&gt;</a>
              </div>
      <div class="clear"></div>
      <div class="activity-rule-box">
        <h2>活动规则</h2>
        <p>邀请好友注册成为IT课堂新学员，邀请人和被邀请人均可获赠会员和学院余额；</p>
        <p>您的邀请将为好友直接获得<span>5天会员体验及5元学院余额</span>，并可另外邀请其他好友，获得奖励同上；</p>
        <p>会员天数可累加，即可在已开通会员到期日期后顺延天数。</p>
      </div>

      <div class="activity-rule-aLogin activity-rule-nLogin">
                              <a class="btn" href="javascript:;">您有两种方式邀请好友</a>
            <p>step1：生成邀请链接发送给好友</p>
            <a class="res" href="http://edu.51cto.com/user/login.html" style="margin-left: 70px;">生成链接</a>
                                                <div class="activity-rule-aLogin-fx">
              <p class="fl">step2：我要分享到</p>
              <div class="bdsharebuttonbox fl">
                <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
              </div>
              <div class="clear"></div>
            </div>
                        </div>
    </div>
  </div>

  <!-- vip -->
  <div class="activity-vip-bg w1200">
    <div class="activity-title-bg">
      <i class="icon-01"></i>
      <span>会员特权</span>
      <i class="icon-02"></i>
      <p>一个会员，全站特权</p>
      <i class="icon-03"></i>
      <div class="clear"></div>
    </div>
    <div class="activity-vip-box">
      <ul class="quanyibox">
          <li>
              <a class="save-visit" href="http://home.51cto.com//members/privilege"><img src="https://static4.51cto.com/home/web/images/members/quanyi1.png" alt=""></a>
              <span>2000门课程免费学</span>
          </li>
          <li>
              <a class="save-visit" href="http://home.51cto.com//members/privilege#tab1"><img src="https://static4.51cto.com/home/web/images/members/quanyi2.png" alt=""></a>
              <span>买课程享9.5折优惠</span>
          </li>
          <li>
              <a class="save-visit" href="http://home.51cto.com//members/privilege#tab2"><img src="https://static4.51cto.com/home/web/images/members/quanyi3.png" alt=""></a>
              <span class="first-goods">免费下载资料120次</span>
              <span class="second-goods" style="display: none;">免费下载资料500次</span>
          </li>
          <li>
              <a class="save-visit" href="http://home.51cto.com//members/privilege#tab3"><img src="https://static4.51cto.com/home/web/images/members/quanyi4.png" alt=""></a>
              <span>尊享会员标识</span>
          </li>
          <li>
              <a class="save-visit" target="_blank" href="http://wot.51cto.com/act/2017/architecture"><img src="https://static4.51cto.com/home/web/images/members/quanyi5.png" alt=""></a>
              <span>WOTI巅峰票直降500</span>
              <em>优惠码：46AD0B5856BD7DE9</em>
          </li>
          <li>
              <a href="http://home.51cto.com//members/privilege"><img src="https://static4.51cto.com/home/web/images/members/quanyi6.png" alt=""></a>
              <span>更多权益敬请期待</span>
          </li>
          <div class="clear"></div>
      </ul>
      <div class="taocantab">
        <div class="taocan first-goods show">
          <span class="selt"></span>
          <dl>
              <c:forEach items="${list1}" var="p">
	              <dt><span>5.8</span>折</dt>
	              <dd>
	                <div class="line1">${p.VIPleibie}</div>
	                <div class="line2">￥${p.VIPmoney}/3个月</div>
	                <div class="line3">原价：<span>￥${p.VIPsrcmoney}</span></div>
	              </dd>
              </c:forEach>
              <div class="clear"></div>
          </dl>
        </div>
        <div class="taocan second-goods">
          <span class="selt"></span>
          <span class="jian"></span>
          <dl>
              <dt><span>5.7</span>折</dt>
              <c:forEach items="${list1}" var="l">
	              <dd>
	                <div class="line1">${l.VIPleibie}</div>
	                <div class="line2">￥${l.VIPmoney}/12个月</div>
	                <div class="line3">原价：<span>￥${l.VIPsrcmoney}</span></div>
	              </dd>
	          </c:forEach>
              <div class="clear"></div>
          </dl>
        </div>
      </div>
      <div class="activity-vip-btn-bg">
        <a class="activity-vip-btn" href="<%=basePath %>huiyuanservlet?order=list&n=m" target="_blank">查看详情<span>&gt;</span></a>
      </div>
    </div>
  </div>

  <!-- more -->
  <div class="activity-more-bg w1200">
    <div class="activity-title-bg">
      <i class="icon-01"></i>
      <span>更多优惠</span>
      <i class="icon-02"></i>
      <p>活动时间：2017年6月10日-2017年6月17日</p>
      <i class="icon-03"></i>
      <div class="clear"></div>
    </div>
    <div class="activity-more-box">
      <p>活动期间会员购买正价<span>课程享8折</span>（套餐不参与会员折扣），购买<span>微职位</span>活动课程最高<span>立减2000元</span>；</p>
      <p>新注册学员可享受<span>首单7折优惠</span>，并<span>赠5元优惠券</span>（优惠券与折扣不可同时使用）；</p>
      <p>本活动最终解释权归IT课堂所有。</p>
      <img class="activity-more-top" src="https://static1.51cto.com/edu/css/actlist/49/images/r_08.png" />
    </div>
  </div>
  
  <div class="activity-footer mt70">
    <img src="https://static1.51cto.com/edu/css/actlist/49/images/r_09.png"/>
  </div>

</div>

<script>

  $('.taocan').click(function(){
    $('.taocan').removeClass('show');
    $(this).addClass('show');
  })

  window._bd_share_config = {
    "common": {
      "bdSnsKey":{},
      "bdText":"51CTO学院-邀请好友，共享尊贵会员！半年会员免费送~",
      "bdDesc":"邀请好友注册，最高送51CTO半年会员！被邀请人同享会员体验特权~赶紧行动吧！",
      "bdMini":"2",
      "bdMiniList":false,
      "bdPic":"https://s1.51cto.com/images/201705/b14613458fcbef8bc0c253d0cdabb32cb34467.png",
      "bdStyle":"0",
      "bdSize":"24"
    },
    "share": {}
  };
  with(document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~ ( - new Date() / 36e5)];
</script>

<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="http://edu.51cto.com/" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" alt="IT课堂" width="194" height="40"/>
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
            <p class="copy">Copyright &copy; 2017-2027 <a href="http://www.51cto.com/" target="_blank">51CTO.com</a></p>
        </div>
        <div class="clear"></div>
    </div>
</div>

<img src="https://static1.51cto.com/edu/images/whitestyle/qqbm_bs.png" style="position: fixed;right:10px;bottom:100px;z-index: 99;cursor: pointer;" onclick="$('#AdviceMask').show();$('#Advice').show();"/>

<div class="mask disp-n" id="AdviceMask"></div>
<div class="Advice disp-n" id="Advice">
    <div class="Main">
        <button class="close" onclick="$('#AdviceMask').hide();$('#Advice').hide();">&nbsp;</button>
        <button id="bizQQ_WPA">&nbsp;</button>
        <h3>可以开发票么？</h3>
        <p>可以的，购买课程或者充值余额后都是可以开具发票的，具体详情点击：<a href="http://bbs.51cto.com/thread-1472105-1.html" target="_blank">我要开发票</a></p>
        <h3>购买的课程可以下载么？</h3>
        <p>目前PC端暂不支持下载课程视频，请手机或者平板电脑下载“IT课堂”APP后再下载视频哦！</p>
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
    var sessionid = "gdb7i3bdbodfgljteok0rtm385",
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
