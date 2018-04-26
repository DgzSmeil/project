<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/6
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>普金资本平台</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css">
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css">
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body onhashchange="hashChange()">
<%@include file="./master/top.jsp" %>
<%@include file="./master/head.jsp" %>
<div class="account cl">
    <div class="account-left">
        <div class="account-left-nav">
            <div class="navbar icon icon-help">帮助中心</div>
            <ul class="sub-nav">
                <li class=""><a href="#product">产品介绍</a></li>
                <li><a href="#common">常见问题</a></li>
                <li><a href="#contract">合同资料</a></li>
                <li><a href="#noun">名词解释</a></li>
                <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li>
            </ul>
        </div>
    </div>
    <!-- begin -->
    <div class="account-right">

    </div>
    <!-- end -->
</div>
<%@include file="./master/foot.jsp" %>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/public.js"></script>

<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/help.js"></script>
</body>
</html>