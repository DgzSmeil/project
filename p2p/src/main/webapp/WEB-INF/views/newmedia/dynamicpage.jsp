<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/9
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- saved from url=(0050)https://www.pujinziben.com/news.html?id=195&flag=1 -->
<html lang="en"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>普金资本平台</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/about.css"/>

    <link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body onhashchange="hashChange()">
<%@include file="../master/top.jsp" %>
<%@include file="../master/head.jsp" %>
<div class="news cl">
    <div class="news-contents" style="display: block;">
        <h3 id="news-title">${requestScope.title}</h3>
        <div class="news-contents-top">
            <a class="links news-share fl bds_more bdsharebuttonbox" href="javascript:;" data-cmd="more">
            </a>
            <a class="links news-weixin fl" href="javascript:;">
                分享到微信邀请好友
            </a>
            <div class="weChart">
                <img id="weChartImg" src="<%=path %>/static/images/share.png">
                <div class="shareMsg">
                    <p>打开微信“扫一扫”，点击右上角“发送给朋友”或“分享到朋友圈”</p>
                    <p class="weChartTips">（好友通过您分享的链接成功注册，您就成了他的理财师）</p>
                </div>
                <p class="loginTag">请先<a href="">登录</a></p>
                <span class="topTag"></span>
            </div>
            <a class="news-back fr" href="/html/about#gsdt">返回列表</a>
            <p class="news-time fr">${requestScope.time}</p>
        </div>
        <div class="news-contents-bottom">
            ${requestScope.content}
        </div>
    </div>
</div>
<%@include file="../master/foot.jsp" %>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/about.js"></script>
<script type="text/javascript">

</script>
</body></html>
