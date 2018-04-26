<%@ page import="com.gs.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	User user = (User)session.getAttribute("user");
%>
<html>
<head>
	<title>注册-普金资本—安全可靠专注于供应链金融的国资背景P2P理财平台</title>
	<link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css">
	<link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css">
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>
	<!--[if lt IE 8]>
    <div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
  	<![endif]-->
	<!-- top -->
	<div class="nav-out">
		<div class="wrap cl">
			<div class="logo"><a href="<%=path%>/"><img src="<%=path%>/static/resources/front/v01/src/images/logo.png" alt="普金资本"></a></div>
			<p class="to-login">已有账号，<a href="<%=path%>/user/login_page" >立即登录</a></p>
		</div>
	</div>
	<div class="regist-content">
		<div class="regist-exp">
			<p>普金资本理财资金由汇付天下托管</p>
		</div>
		<div class="regist-box">
			<h3>欢迎注册</h3>
			<p class="error-msg icon icon-error"></p>
			<div class="from">
				<label for="username" class="icon icon-user"></label>
				<input type="text" name="username" id="username" maxlength="18" autocomplete="new-password" onblur="choseUser(this)" placeholder="输入用户名"/>
			</div>
			<div class="from">
				<label for="phone" class="icon icon-mobile"></label>
				<input type="text" name="" id="phone"  onblur="chosePhone(this)" autocomplete="new-password" maxlength="11" placeholder="输入手机号"/>
			</div>
			<div class="from">
				<label for="pwd" class="icon icon-pwd"></label>
				<input type="password" name="pwd" id="pwd" autocomplete="new-password" onblur="chosePwd(this)" placeholder="输入密码" maxlength="18"/>
			</div>
			<div class="from from-msg">
				<label for="msgcode" class="icon icon-msg"></label>
				<input type="text" name="msgcode" id="msgcode" maxlength="6" placeholder="输入短信验证码"/>
				<div class="msg-btn">
					<button type="button" id="getMsgCode">获取验证码</button>
				</div>
			</div>
			<div class="from-text">
				<p class="code icon icon-bottom">推荐码(选填)</p>
			</div>
			<div class="from from-ext" id="asda">
				<label for="useCode" class="icon icon-ext"></label>
				<input type="text" name="tzm" id="useCode" placeholder="输入邀请码" value="${requestScope.tzm}"/>
			</div>
			<button class="btn" type="button" onclick="regist(this)">注册</button>
			<div class="agree"><input type="checkbox" id="agree">我已阅读并同意《<a href="javascript:AgreeMent(0);">普金资本服务协议</a>》和《<a href="javascript:AgreeMent(1);">风险提示书</a>》</div>
		</div>
	</div>
	
	<div class="popup claimm-from" style="height: 350px;top: 20%;left: 35%;">
		<p class="title left">输入验证码获取短信</p>
		<a href="javascript:void(0);" class="close icon icon-close"></a>
		<div class="popup-from">
			<center>
				<img id="imgCode" title="点击换个验证码" src="<%=path%>/code" width="120px" style="clear: both;" onclick="this.src='<%=path%>/code?r=' + new Date();"/>
			</center>
			<div class="label cl">
				<label class="long">验证码：</label><input type="text" autocomplete="off" maxlength="16"  id="claimm-price" placeholder="输入图形验证码"/>
			</div>
		</div>	
		<center>
			<button type="button" class="btn" style="width: 30%;margin:30px;" id="claimm-submit">确定</button>
		</center>	
	</div>
	
	<div id="popup-captcha"></div>
	<div class="popup AgreeMent">
		<p class="title left">普金资本服务协议</p>
		<a href="javascript:void(0);" class="close icon icon-close"></a>
		<div class="popup-area">
			
		</div>
	</div>
	<div class="login-footer">
		<p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
	</div>
	<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/jquery.js" ></script>
	<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/regist.js" ></script>
	<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/public.js" ></script>
</body>
</html>