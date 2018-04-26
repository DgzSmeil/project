<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/25
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>账户总览</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>
<div class="top" id="top">
    <!-- top -->
    <div class="wrap">
        <div class="top-left icon icon-phone">
            <span>客服热线：</span>400-606-2079 <span>（8:30～17:30）</span>
        </div>
        <div class="top-right cl">
            <ul class="top-list">
                <li class="first">
                    <c:if test="${user == null }">
                        <a href="<%=path%>/user/regist_page" class="icon icon-person">注册领红包</a>
                    </c:if>
                    <c:if test="${user != null }">
                        <a href="<%=path%>/user/logout" class="">退出</a>
                    </c:if>
                </li>
                <li><a href="<%=path %>/recommend/handpage" target="mainFrame" class="icon icon-inv">邀请有礼</a></li>
                <li><a href="<%=path%>/html/about#gdbj">关于我们</a></li>
                <li><a href="<%=path%>/html/help">帮助中心</a></li>
                <li id="userName">
                    <c:if test="${user == null }">
                        <a href="<%=path%>/user/login_page" class="">登录</a>
                    </c:if>
                    <c:if test="${user != null }">
                        <a href="<%=path%>/user/user_home" class="user">${user.phone}</a>
                    </c:if>
                </li>
                <li class="no"><a href="javascript:;" class="icon icon-app" id="app">APP下载</a></li>
            </ul>
            <div id="qrCodeDiv" style="display: none;">
                <div class="CodeDiv">
                    <img src="<%=path %>/static/p2p/qrCode_ios.png">
                    <p>IOS下载</p>
                </div>
                <div class="CodeDiv">
                    <img src="<%=path %>/static/p2p/qrCode_android.png">
                    <p>Android下载</p>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- head -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><img src="<%=path %>/static/p2p/logo.png" alt="普金资本"></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc">
                    <c:if test="${user != null}">
                        <a href="<%=path%>/user/user_home">我的账户</a>
                    </c:if>
                    <c:if test="${user == null}">
                        <a href="<%=path%>/user/login_page">我的账户</a>
                    </c:if>
                </li>
                <li><a href="<%=path%>/html/about">信息披露 </a></li>
                <li><a href="<%=path%>/html/safety">安全保障</a></li>
                <li class="xialakuang">
                    <a href="<%=path %>/detail/page">投资理财</a>
                    <div class="sub-nav">
                        <a href="<%=path %>/detail/page#005">恒金保</a>
                        <a href="<%=path %>/detail/page#004">普金保</a>
                        <a href="<%=path %>/detail/page#003">多金宝</a>
                        <a href="<%=path %>/detail/page#006">新手标</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="javascript:void(0);" onclick="index();">首页</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- head end -->

<!-- center -->
<div class="account cl">
    <!-- center_left end -->
    <div class="account-left">
        <div class="account-left-nav">
            <div class="navbar icon icon-account">我的账户</div>
            <ul class="sub-nav">
                <li class="active"><a href="<%=path %>/user/user_money" target="mainFrame">账户总览</a></li>
                <li><a href="<%=path %>/logczz/page" target="mainFrame">充值</a></li>
                <li><a href="<%=path %>/logtx/page" target="mainFrame">提现</a></li>
                <li><a id="myCoupon" href="<%=path %>/ticket/myTicket" target="mainFrame">我的赠券</a></li>

                <li><a href="<%=path %>/log_money/mylog_money" target="mainFrame">资金记录</a></li>
            </ul>
            <div class="navbar icon icon-self">我的管理</div>
            <ul class="sub-nav">
                <li><a href="<%=path %>/tzb/myTzb" target="mainFrame">投资管理</a></li>
                <li><a href="<%=path %>/jkb/jkb_page">申请借款</a></li>
                <li><a href="<%=path %>/jkb/my_jkb" target="mainFrame">借款管理</a></li>
            </ul>
            <div class="navbar icon icon-settings">账户设置</div>
            <ul class="sub-nav">
                <li><a href="<%=path %>/bank/page" target="mainFrame">我的银行卡</a></li>
                <li><a href="<%=path %>/user/user_safe" target="mainFrame">安全设置</a></li>
                <li><a href="<%=path %>/letter/showpage" target="mainFrame">消息中心</a></li>
            </ul>
        </div>
        <a href="<%=path %>/recommend/handpage" target="mainFrame" class="tuijian">
            <img src="<%=path%>/static/resources/front/v01/src/images/account/tuijian.png"/>
        </a>
    </div>
    <!-- center_left end -->

    <!-- center_right -->
    <div style="width: 100%;height: 951px;">
        <iframe name="mainFrame" style="width: 100%;height: 100%;" scrolling="no" rameborder="0" src="<%=path %>/user/user_money" frameborder="0" id="iframe1"></iframe>
    </div>
    <!-- center_right end -->
</div>
<!-- center end -->
<!-- foot -->
<div id="ajaxFooter">
    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="tencent://message/?uin=3036302675&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
            <li><a href="javascript:;" class="sidebar-wx"></a></li>
            <li><a href="<%=path%>/jkb/calc" class="sidebar-cl"></a></li>
            <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
            <li><a href="#top" class="sidebar-top"></a></li>
        </ul>
    </div>
    <!-- concat -->
    <div class="index-concat">
        <div class="wrap cl">
            <div class="index-concat-left">
                <img src="<%=path %>/static/p2p/index_erweima.png" alt="扫码关注普金资本">
            </div>
            <div class="index-concat-phone">
                <p>财富热线</p>
                <h3>400-606-2079</h3>
            </div>
            <div class="index-concat-channel">
                <p class="about_cel_text">
                    <a target="_blank" href="http://weibo.com/pujinziben" class="about_wb"></a>
                    <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                    </a>
                    <a target="_blank" href="tencent://message/?uin=2311960484&amp;Site=&amp;Menu=yes" class="about_qq"></a>
                    <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                    </a>
                </p>
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl">
                <a href="javascript:;" class="title">友情链接</a>
                <a target="_blank" href="http://www.p2peye.com/">网贷天眼</a>
                <a target="_blank" href="http://www.wdtianxia.com/">网贷天下</a>
                <a target="_blank" href="http://bank.pingan.com/">中国平安银行</a>
                <a target="_blank" href="http://www.ccb.com/cn/home/indexv3.html">中国建设银行</a>
                <a target="_blank" href="http://www.wangdaidongfang.com/">网贷东方</a>
                <a target="_blank" href="http://www.p2p001.com/">第一网贷</a>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank" class="beian">赣ICP备16004010号</a>
                <a href="http://new.cnzz.com/v1/login.php?siteid=1260871948" target="_blank">  <img src="<%=path %>/static/p2p/CNZZ.png" alt=""></a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=36070202000195" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian"><img src="<%=path %>/static/p2p/beian.png" style="float:left;">赣公网安备 36070202000195号</a>
            </p>
            <div class="footer-list" style="width:650px;text-align:center">
                <a id="___szfw_logo___" href="https://credit.szfw.org/CX05252017016185201512.html" target="_blank">
                    <img src="<%=path %>/static/p2p/foot2.png" border="0">
                </a>
                <a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com" target="_blank">
                    <img src="<%=path %>/static/p2p/ft_link_02.png" alt="">
                </a>
                <a href="http://si.trustutn.org/info?sn=685170725000594426611&amp;certType=4" target="_blank">
                    <img width="110px" height="40px" src="<%=path %>/static/p2p/p2p_bottom_large_img.jpg" alt="">
                </a>
                <a href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business" target="_blank">
                    <img src="<%=path %>/static/p2p/ft_link_04.png" alt="">
                </a>
                <a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343">
                    <img width="112px" height="34px" src="<%=path %>/static/p2p/foot1.png">
                </a>
            </div>
        </div>
    </div>
    <div class="popup wechart-box">=path
        <p class="title left">关注普金资本微信公众号</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <img class="wechart" src="<%=path %>/static/p2p/wechart.jpg">
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/public.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/account.js"></script>
<script>
    $(function(){
        $(".sub-nav li").bind("click",function(){
            $(".sub-nav li").removeClass("active");
            $(this).addClass("active");

        });
        $(".xialakuang").mouseover(function (){
            $(".xialakuang .sub-nav").show();
        }).mouseout(function (){
            $(".xialakuang .sub-nav").hide();
        });
        $(".no").mouseover(function (){
            $("#qrCodeDiv").show();
        }).mouseout(function (){
            $("#qrCodeDiv").hide();
        });
        $("#qrCodeDiv").mouseover(function (){
            $("#qrCodeDiv").show();
        }).mouseout(function (){
            $("#qrCodeDiv").hide();
        });
    })
    function index(){
        window.location.href = "/";
    }
</script>
</html>
