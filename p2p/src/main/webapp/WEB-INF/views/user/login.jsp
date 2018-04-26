<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>登录-普金资本—安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css" tppabs="http://www.pujinziben.com/resources/front/v01/src/css/public.css">
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css" tppabs="http://www.pujinziben.com/resources/front/v01/src/css/login.css">
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>
<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="<%=path%>/"><img src="<%=path%>/static/resources/front/v01/src/images/logo.png" alt="普金资本"></a></div>
        <p class="index"><a href="<%=path%>/" class="icon icon-home">普金资本首页</a></p>
    </div>
</div>
<div class="login-content">
    <div class="wrap">
        <div class="login-box">
            <div class="login-top cl">
                <p class="welcome">欢迎登录</p>
                <p>没有账户，<a href="<%=path%>/user/regist_page">免费注册</a></p>
            </div>
            <p class="error-msg icon icon-error"></p>
            <div class="from">
                <label for="phone" class="icon icon-user"></label>
                <input type="text" name="phone" id="phone" autocomplete="off" placeholder="输入手机号码" maxlength="11"/>
            </div>
            <div class="from">
                <label for="password" class="icon icon-pwd"></label>
                <input type="password" name="password"  id="password" autocomplete="new-password" placeholder="输入登录密码" maxlength="18"/>
            </div>
            <div class="from">
                <div class="pull-box">
                    <div class="pull-bg" style="width: 0px;"></div>
                    <div class="pull-default">请按住滑块，拖动到最右边</div>
                    <div class="pull-btn"></div>
                </div>
            </div>
            <button class="btn"  type="button">登录</button>
            <div class="forget">
                <a href="javascript:;">忘记密码</a>
            </div>
        </div>
    </div>
</div>
<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
<script>
    if (window != top){
        top.location.href = location.href;
    }
</script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/jquery.js" ></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/login.js" ></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/public.js"></script>
</body>
</html>
