<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="account-left">
    <div class="account-left-nav">
        <div class="navbar icon icon-account">我的账户</div>
        <ul class="sub-nav">
            <li class="tive"><a href="#account">账户总览</a></li>
            <li><a href="<%=path %>/logczz/page">充值</a></li>
            <li><a href="<%=path %>/logtx/page">提现</a></li>

            <li><a id="myCoupon" href="#taste">我的赠券<i id="couponCount"></i></a></li>

            <li><a href="#fund">资金记录</a></li>
        </ul>
        <div class="navbar icon icon-self">我的管理</div>
        <ul class="sub-nav">
            <li><a href="#invest">投资管理</a></li>
            <li><a href="#claimm">债权管理</a></li>
            <li><a href="#claimb">债权购买</a></li>
            <li><a href="#loan">借款管理</a></li>
        </ul>
        <div class="navbar icon icon-settings">账户设置</div>
        <ul class="sub-nav">
            <li><a href="#bank">我的银行卡</a></li>
            <li><a href="#safe">安全设置</a></li>
            <li><a href="#msg">消息中心</a></li>
        </ul>
    </div>
    <a href="#tuijian" class="tuijian"><img src="<%=path%>/static/resources/front/v01/src/images/account/tuijian.png"/></a>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function(){
        $(".sub-nav li").bind("click",function(){
            $(".sub-nav li").removeClass("active");
            $(this).addClass("active");

        });
    })
</script>
</html>
