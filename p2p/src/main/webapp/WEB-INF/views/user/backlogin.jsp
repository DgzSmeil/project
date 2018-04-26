<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/7
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>登录</title>
</head>
<style>
    .login-content {
        width: 100%;
        height: 100%;
        padding-top: 90px;
        background: url("<%=path%>/static/resources/front/v01/src/images/login.jpg") top center no-repeat;
    }
</style>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/style3.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/animate-custom.css" />
<body>
<div class="login-content">
    <div class="container">
        <section>
            <div id="container_demo" >
                <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                <a class="hiddenanchor" id="toregister"></a>
                <a class="hiddenanchor" id="tologin"></a>
                <div id="wrapper">
                    <div id="login" class="animate form">
                        <form id="loginForm"  action="<%=path%>/user/login" autocomplete="on" method="post">
                            <h1>管理员登录</h1>
                            <p>
                                <label for="phone" class="uname" > 手机号码： </label>
                                <input id="phone" name="phone" maxlength="11" required="required" type="text" placeholder="请输入手机号码"/>
                            </p>
                            <p>
                                <label for="pwd" class="youpasswd"> 登录密码： </label>
                                <input id="pwd" name="pwd" required="required" type="password" placeholder="请输入登录密码" />
                            </p>
                            <p>
                                <label for="code"> 验证码： </label>
                                <input id="code" name="code" required="required" type="text" placeholder="请输入验证码" /><br/><br/>
                                <img src="<%=path%>/code" style="border: 1px solid #b4dbed;height: 38px;" onclick="this.src='<%=path%>/code?r=' + Math.random();"/>
                            </p>
                            <p class="login button">
                                <input type="button" onclick="backlogin()" value="登 录" />
                            </p>
                        </form>
                    </div>


                </div>
            </div>
            <div class="login-footer">
                <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
            </div>

        </section>
    </div>
</div>
</body>
<%@include file="../master/easyui/footer.jsp" %>
<script src="<%=path %>/static/js/huser/huser.js"></script>
</html>
