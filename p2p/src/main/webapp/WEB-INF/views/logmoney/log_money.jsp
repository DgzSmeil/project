<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>账户总览</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>

    <link rel="stylesheet" href="<%=path%>/static/css/pagination.css"/>
    <!-- 提示框 -->
    <script src="<%=path %>/static/js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="<%=path %>/static/css/sweetalert.css">
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>

    <!-- begin -->
    <div class="account-right" style="width: 100%;height: 951px;">

        <div class="account-right-nav">
            <div class="sub-a-nav">
                <a class="active" href="javascript:void(0);">资金记录</a>
            </div>
            <em></em>
        </div>
        <div class="account-content">
            <div class="fund-param-list">
                <p>交易类型：</p>
                <ul class="cl">
                    <li id="type4" class="active"><a href="javascript:void(0);">全部</a></li>
                    <li id="type0"><a href="javascript:void(0);">充值</a></li>
                    <li id="type1"><a href="javascript:void(0);">提现</a></li>
                    <li id="type2"><a href="javascript:void(0);">还款</a></li>
                    <li id="type6"><a href="javascript:void(0);">收款</a></li>
                    <li id="type5"><a href="javascript:void(0);">投资</a></li>
                    <li id="type3"><a href="javascript:void(0);">系统金额</a></li>
                </ul>
            </div>
            <div class="account-form account-form-manage cl" style="display: block;">
                <lable class="lable-long">发布时间：</lable>
                <input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
                <p class="text">至</p>
                <input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
                <input type="hidden" id="type" readonly="readonly">
                <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
                <button type="button" class="search" id="loanSearch">搜索</button>
                <button type="button" class="search" id="clean_date">清空</button>
            </div>
            <div class="account-list">
                <ul class="fund-list-box list-box">
                    <li class="title">
                        <div class="children0">交易时间</div>
                        <div class="children1">交易类型</div>
                        <div class="children2">收入</div>
                        <div class="children3">支出</div>
                        <div class="children4">操作</div>
                    </li>
                </ul>
                <ul class="fund-list-box listData"></ul>
                <ul class="paging"></ul>
            </div>
        </div>
    </div>
    <!-- end -->

</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>


<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/log_money.js"></script>

</html>
