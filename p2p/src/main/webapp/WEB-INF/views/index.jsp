<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.gs.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path %>/static/p2p/public.css">
    <link rel="stylesheet" href="<%=path %>/static/p2p/index.css">
    <link rel="icon" href="<%=path %>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon">
    <link rel="stylesheet" href="<%=path%>/static/css/index.css"/>
</head>


<body>
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
<![endif]-->
<!-- top -->
<%@include file="./master/top.jsp" %>

<!-- nav -->
<%@include file="./master/head.jsp" %>
<!-- banner -->
<div class="ppt">
    <div class=".benn" id="home_pic">

    </div>
    <div class="pptNum">
        <span class="normal">3</span>
        <span class="normal">2</span>
        <span class="cur normal">1</span>
    </div>

</div>
<!-- news -->
<div class="news">
    <div class="wrap">
        <div class="news-list icon icon-news">
            <ul id="news-list" style="height: 192px; top: -96px;">

            </ul>
        </div>

    </div>
</div>
<!-- statis -->
<div class="statis">
    <div class="wrap">
        <div class="statis-main">
            <ul class="statis-top cl">
                <li class="first"><p>普金资本高收益网络借贷信息中介平台</p></li>
                <li class="center"><p>累计投资金额：<span id="investAmount">2,341,210</span><span class="small">元</span></p></li>
                <!--<li class="center"><p>累计赚取收益：<span id="hasInterest">0</span><span class="small">元</span></p></li>-->
                <li class="last"><p>累计注册投资人：<span id="userTotal">23</span><span class="small">人</span></p></li>
            </ul>
            <div class="explian cl">
                <a href="<%=path%>/html/about" class="first">
                    <p class="icon icon-ex1"></p>
                    <div class="text">
                        <h3>实力雄厚</h3>
                        <p>国资背景，抱柱之信</p>
                        <p>赣州城投旗下参股企业</p>
                    </div>
                </a>
                <a href="<%=path%>/html/safety" class="center">
                    <p class="icon icon-ex2"></p>
                    <div class="text">
                        <h3>安全稳健</h3>
                        <p>专注城投供应链金融服务</p>
                        <p>银行级风控措施+大数据</p>
                    </div>
                </a>
                <!-- 					<a href="activity/activity_01.html" class="last" target="_blank"> -->
                <a href="<%=path%>/#" class="last">
                    <p class="icon icon-ex3"></p>
                    <div class="text">
                        <h3>新手福利</h3>
                        <p>新用户投资即获红包</p>
                        <p>推荐用户投资得红包</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- product -->
<div class="product wrap">
    <div class="product-n" id="newUser">


        <div class="product-new">
            <div class="title cl"><img alt="" src="<%=path %>/static/p2p/product-new-icon2.png"></div>
            <ul class="product-new-main cl">
                <li class="rate cl">
                    <p><span id="ty-rate">12</span>%</p>
                    <span>预期年化收益率</span>
                </li>
                <li class="date">
                    <div class="date-item">
                        <div class="line icon icon-progress">
                            <p>募集进度：</p>
                            <p class="progress"><em style="width: 100%;"></em></p>
                            <p class="progress-text"><span id="xs-schedules">100.00</span>%</p>
                        </div>
                        <p class="icon icon-doll">项目金额：<span id="xs-doll">10.00万元</span></p>
                        <p class="icon icon-time">投资期限：<span id="ty-date">1个月</span></p>
                    </div>
                </li>
                <li>
                    <div class="button">
                        <button type="button" id="ty-btn" disabled="disabled" style="background-color: rgb(176, 176, 176);">还款中</button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 恒金保 -->
    <div class="product-h" id="pj_hengjin">
        <div class="product-h-l">
            <img src="<%=path %>/static/p2p/product_01.png" alt="恒金保">
            <a href="<%=path%>/detail/page#005" class="top"></a>
            <a href="<%=path%>/detail/page#005" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-h">
                <c:forEach items="${pager}" var="d">
                    <li>
                        <div class="product-content">
                            <div class="top">
                                <p class="product-title">
                                    <a href="<%=path%>/jkb/jkb_look/${d.baid}">${d.cpname}</a>
                                </p>
                                <p class="p-rate"><span>${d.nprofit}</span><span class="small">%</span></p>
                                <span class="p-rate-text">预期年化收益率</span>
                            </div>
                            <div class="bottom">
                                <div class="line icon icon-progress">
                                    <p>募集进度：</p>
                                    <p class="progress"><em style="width:${(d.ytmoney/d.money)*100}%"></em></p>
                                    <p class="progress-text">${(d.ytmoney/d.money)*100}%</p>
                                </div>
                                <p class="icon icon-doll">项目金额：${d.money}万元</p>
                                <p class="icon icon-time">投资期限：${d.term}个月</p>
                            </div>

                            <div class="submit">
                                <c:if test="${d.state== 3}">
                                    <button type="button" class="submit" onclick="toInvest(${d.state},${d.baid})">招标中</button>
                                </c:if>
                                <c:if test="${d.state== 4}">
                                    <button type="button" class="submit disabled" onclick="toInvest(${d.state},${d.baid})">还款中</button>
                                </c:if>
                                <c:if test="${d.state== 5}">
                                    <button type="button" class="submit disabled" onclick="toInvest(${d.state},${d.baid})">已还完</button>
                                </c:if>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!-- 普金保 -->
    <div class="product-h" id="pj_pujin">
        <div class="product-h-l">
            <img src="<%=path %>/static/p2p/product_02.png" alt="多金保">
            <a href="<%=path%>/detail/page#004" class="top"></a>
            <a href="<%=path%>/detail/page#004" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-p">
                <c:forEach items="${pager3}" var="d">
                    <li>
                        <div class="product-content">
                            <div class="top">
                                <p class="product-title">
                                    <a href="<%=path%>/jkb/jkb_look/${d.baid}">${d.cpname}</a>
                                </p>
                                <p class="p-rate"><span>${d.nprofit}</span><span class="small">%</span></p>
                                <span class="p-rate-text">预期年化收益率</span>
                            </div>
                            <div class="bottom">
                                <div class="line icon icon-progress">
                                    <p>募集进度：</p>
                                    <p class="progress"><em style="width:${(d.ytmoney/d.money)*100}%"></em></p>
                                    <p class="progress-text">${(d.ytmoney/d.money)*100}%</p>
                                </div>
                                <p class="icon icon-doll">项目金额：${d.money}万元</p>
                                <p class="icon icon-time">投资期限：${d.term}个月</p>
                            </div>

                            <div class="submit">
                                <c:if test="${d.state== 3}">
                                    <button type="button" class="submit" onclick="toInvest(${d.state},${d.baid})">招标中</button>
                                </c:if>
                                <c:if test="${d.state== 4}">
                                    <button type="button" class="submit disabled" onclick="toInvest(${d.state},${d.baid})">还款中</button>
                                </c:if>
                                <c:if test="${d.state== 5}">
                                    <button type="button" class="submit disabled" onclick="toInvest(${d.state},${d.baid})">已还完</button>
                                </c:if>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!-- 多金宝 -->
    <div class="product-h" id="pj_duojin">
        <div class="product-h-l">
            <img src="<%=path %>/static/p2p/product_03.png" alt="多金宝">
            <a href="<%=path%>/detail/page#003" class="top"></a>
            <a href="<%=path%>/detail/page#003" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-d">
                <c:forEach items="${pager2}" var="d">
                    <li>
                        <div class="product-content">
                            <div class="top">
                                <p class="product-title">
                                    <a href="<%=path%>/jkb/jkb_look/${d.baid}">${d.cpname}</a>
                                </p>
                                <p class="p-rate"><span>${d.nprofit}</span><span class="small">%</span></p>
                                <span class="p-rate-text">预期年化收益率</span>
                            </div>
                            <div class="bottom">
                                <div class="line icon icon-progress">
                                    <p>募集进度：</p>
                                    <p class="progress"><em style="width:${(d.ytmoney/d.money)*100}%"></em></p>
                                    <p class="progress-text">${((d.ytmoney/d.money)*100)}%</p>
                                </div>
                                <p class="icon icon-doll">项目金额：${d.money}万元</p>
                                <p class="icon icon-time">投资期限：${d.term}个月</p>
                            </div>

                            <div class="submit">
                                <c:if test="${d.state== 3}">
                                    <button type="button" class="submit" onclick="toInvest(${d.state},${d.baid})">招标中</button>
                                </c:if>
                                <c:if test="${d.state== 4}">
                                    <button type="button" class="submit disabled" onclick="toInvest(${d.state},${d.baid})">还款中</button>
                                </c:if>
                                <c:if test="${d.state== 5}">
                                    <button type="button" class="submit disabled" onclick="toInvest(${d.state},${d.baid})">已还完</button>
                                </c:if>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

</div>
<!-- news -->
<div class="news-main wrap">
    <div class="news-main-left" style="display: block;">
        <div class="news-main-top">
            <h3>媒体报道</h3>
            <p class="more icon icon-more"><a href="<%=path%>/html/about#gsdt?type=1">更多</a></p>
        </div>
        <div class="news-main-content" id="media">
            <ul class="news-main-list" >
            </ul>
        </div>
    </div>
    <div class="news-main-right" style="display: block;">
        <div class="news-main-top">
            <h3>最新公告</h3>
            <p class="more icon icon-more"><a href="<%=path%>/html/about#ptgg">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="newsContent">
                </ul>
        </div>
        <div class="news-main-top ptop">
            <h3>公司动态</h3>
            <p class="more icon icon-more"><a href="<%=path%>/html/about#gsdt">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="news-part">
                </ul>
        </div>
    </div>
</div>
<div class="index-link">
    <div class="wrap">
        <div class="link-title">
            合作伙伴
        </div>
        <div class="link-list">
            <div class="link-list-box" style="width: 5840px;">
                <ul class="cl" id="linkList" style="width: 2920px;">
                </ul>
                <ul class="cl" id="linkList2" style="width: 2920px;">
                </ul>
            </div>
        </div>
    </div>
</div>

<%@include file="master/foot.jsp" %>

</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/about.js"></script>

<script>

    (function ($) {
        $.fn.extend({
            "ppting": function (t) {
                var num = 5; //共多少张要轮播的
                var $this = $(this), i = 0, $pics = $('.ppt'), autoChange = function () {
                    var $currentPic = $pics.find('a:eq(' + (i + 1 === num ? 0 : i + 1) + ')');
                    $currentPic.css({
                        display: 'block'
                    }).siblings('a').css({
                        display: 'none'
                    });
                    $pics.find('.pptNum>span:contains(' + (i + 2 > num ? num - i : i + 2) + ')').attr('class', 'cur normal').siblings('span').attr('class', 'normal');
                    i = i + 1 === num ? 0 : i + 1;
                }, st = setInterval(autoChange, t || 2000);
                $this.hover(function () {
                    clearInterval(st);
                }, function () { st = setInterval(autoChange, t || 2000) });
                $pics.find('.pptNum>span').click(function () {
                    i = parseInt($(this).text(), 10) - 2;
                    autoChange();
                });
            }
        });
    }(jQuery));
    $('.ppt').ppting(2000);
    //投标
    function toInvest(status,id){
        if(status!=3){return};
        window.location.href = '/jkb/jkb_look/'+id;
    }
</script>
</html>