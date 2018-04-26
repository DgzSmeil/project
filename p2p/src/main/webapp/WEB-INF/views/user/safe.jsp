<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<%--18770714017    18770714017xyp--%>
<html>
<head>
    <title>安全设置</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>
<div class="account-right" style="height: 950px;">
    <div class="account-right-nav">
        <div class="sub-a-nav">
            <a href="javascript:void(0);" class="active">安全中心</a>
        </div>
        <em></em>
    </div>
    <div class="account-content" style="display: block;">
        <div class="safe">
            <div class="safe-top">
                <p class="safe-t-text">您的资料完善度</p>
                <p class="safe-t-line"><em style="width: 50%;"></em></p>
                <p class="safe-t-r">中</p>
            </div>
            <div class="safe-content">
                <ul class="safe-list">
                    <li>
                        <div class="safe-list-1">
                            <p class="icon icon-true" id="cellPhone-icon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</p>
                        </div>
                        <div class="safe-list-2" id="cellPhone-text">${user1.phone.substring(0, 3)}****${user1.phone.substring(7, 11)}</div>
                        <div class="safe-list-3">
                            <a id="cellPhone" class="on">已绑定</a>
                            <a href="javascript:;" id="changePhone" onclick="changePhone(${user1.phone})">修改</a>
                        </div>
                    </li>
                    <li>
                        <c:if test="${user1.email == null}">
                            <div class="safe-list-1">
                                <p class="icon icon-wrong">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                            </div>
                            <div class="safe-list-2" id="email-text">获取最新的投资讯息和账户信息变动通知！</div>
                            <div class="safe-list-3">
                                <a href="javascript:;" id="email">进行绑定</a>
                            </div>
                        </c:if>
                        <c:if test="${user1.email != null}">
                            <div class="safe-list-1">
                                <p class="icon icon-true">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                            </div>
                            <div class="safe-list-2" id="email-text">${user1.email.substring(0, 2)}***${user1.email.substring(user1.email.indexOf("@", 5)-2)}</div>
                            <div class="safe-list-3">
                                <a class="on">已绑定</a>
                                <a href="javascript:;" id="email">修改</a>
                            </div>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${rzVip.ispass != 2}">
                            <div class="safe-list-1">
                                <p class="icon icon-wrong">身份认证</p>
                            </div>
                            <div class="safe-list-2">一旦实名认证通过不能修改！</div>
                            <div class="safe-list-3">
                                <a href="javascript:;" id="realName" onclick="registpay();" target="allpage">去认证</a>
                            </div>
                        </c:if>
                        <c:if test="${rzVip.ispass == 2}">
                            <div class="safe-list-1">
                                <p class="icon icon-true">身份认证</p>
                            </div>
                            <div class="safe-list-2" id="realName-text">${user1.rname.substring(0, 1)}**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user1.idno.substring(0, 4)}
                                ******${user1.idno.substring(user1.idno.length()-6)}</div>
                            <div class="safe-list-3">
                                <a href="javascript:;" class="on" >已认证</a>
                            </div>
                        </c:if>
                    </li>
                    <li>
                        <div class="safe-list-1">
                            <p class="icon icon-true">登录密码</p>
                        </div>
                        <div class="safe-list-2">
                            ******
                        </div>
                        <div class="safe-list-3">
                            <a href="javascript:;" id="password-btn" onclick="changePwd();">修改密码</a>
                        </div>
                    </li>
                    <li>
                        <c:if test="${user1.zpwd == null }">
                            <div class="safe-list-1">
                                <p class="icon icon-wrong">交易密码</p>
                            </div>
                            <div class="safe-list-2" id="zpwd-text">请设置交易密码！</div>
                            <div class="safe-list-3">
                                <a href="javascript:;" id="dealpwd" onclick="savePwd();">设置</a>
                            </div>
                        </c:if>
                        <c:if test="${user1.zpwd != null}">
                            <div class="safe-list-1">
                                <p class="icon icon-true">交易密码</p>
                            </div>
                            <div class="safe-list-2" id="zpwd-text">******</div>
                            <div class="safe-list-3">
                                <a href="javascript:void(0);"  id="changedealPwd" onclick="changedealPwd();">修改 </a>
                                <a href="javascript:;"  id="forgetpwd" onclick="forgetpwd();">忘记密码</a>
                            </div>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="popup bind-email" style="display: none;">
        <p class="title left">绑定邮箱</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <div class="label cl">
                <label>添加邮箱</label><input type="text" id="addEmail" maxlength="30" placeholder="输入您的邮箱地址">
            </div>
            <button type="button" class="btn" id="email-submit">添加邮箱</button>
        </div>
    </div>
    <div class="popup change-phone" style="display: none;">
        <p class="title left">修改手机号</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from step1">
            <div class="label cl">
                <label>原手机号</label>
                <p class="text" id="oldPhoneNum">${user1.phone.substring(0, 3)}****${user1.phone.substring(7, 11)}</p>
            </div>
            <div class="label label-msg cl">
                <label>验证码</label>
                <input type="text" id="oldMobilePhoneCode" maxlength="6" placeholder="输入您短信验证码">
                <button type="button" id="getMsgCodeOld">获取验证码</button>
            </div>
            <button type="button" class="btn" id="phone-submit-one">验证</button>
        </div>
        <div class="popup-from step2">
            <div class="label cl">
                <label>新手机号</label>
                <input type="text" id="newMobilePhone" maxlength="11" placeholder="输入您的新手机号码">
            </div>
            <div class="label label-msg cl">
                <label>验证码</label>
                <input type="text" id="newMobilePhoneCode" maxlength="6" placeholder="输入您的短信验证码">
                <button type="button" id="getMsgCode">获取验证码</button>
            </div>
            <button type="button" class="btn" id="phone-submit">修改</button>
        </div>
        <div class="popup-result">
            <div class="success">
                <p>手机号修改成功，请重新登录！</p>
                <button type="button" class="btn" id="phone-submit-success">确定</button>
            </div>
        </div>
    </div>
    <div class="popup change-pwd" style="display: none;">
        <p class="title left">修改密码</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <div class="label cl">
                <label>原始密码</label>
                <input type="password" id="oldPassword" maxlength="18" autocomplete="new-password" placeholder="输入原始密码">
            </div>
            <div class="label cl">
                <label>新密码</label>
                <input type="password" id="newPassword" maxlength="18" autocomplete="new-password" placeholder="输入新密码">
            </div>
            <div class="label cl">
                <label>确认密码</label>
                <input type="password" id="confirmPassword" maxlength="18" autocomplete="new-password" placeholder="再次输入新密码">
            </div>
            <button type="button" class="btn" id="pwd-submit">确定</button>
        </div>
        <div class="popup-result">
            <div class="success">
                <p>密码修改成功!</p>
                <button type="button" class="btn" id="submit-success">确定</button>
            </div>
        </div>
    </div>
    <div class="popup change-zpwd" style="display: none;">
        <p class="title left">设置交易密码</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <div class="label cl">
                <label>手机号</label>
                <p class="text" id="oldPhone">${user1.phone.substring(0, 3)}****${user1.phone.substring(7, 11)}</p>
            </div>
            <div class="label cl">
                <label>设置密码</label>
                <input type="password" id="dealPassword" maxlength="6" autocomplete="new-zpassword" placeholder="设置交易密码">
            </div>
            <div class="label cl">
                <label>确认密码</label>
                <input type="password" id="confirmdealPassword" maxlength="6" autocomplete="new-zpassword" placeholder="再次输入密码">
            </div>
            <div class="label label-msg cl">
                <label>验证码</label>
                <input type="text" id="oldMobileCode" maxlength="6" placeholder="输入您验证码进行验证">
                <button type="button" id="getpwdMsgCode">获取验证码</button>
            </div>
            <button type="button" class="btn" id="zpwd-submit">确定</button>
        </div>
        <div class="popup-result">
            <div class="success">
                <p>交易密码设置成功!</p>
                <button type="button" class="btn" id="changezpwd-success">确定</button>
            </div>
        </div>
    </div>
    <div class="popup forget-zpwd" style="display: none;">
        <p class="title left">忘记密码</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <div style="display: none"><p id="hiddenphone">${user1.phone}</p><p id="hiddenSmscode"></p></div>
            <div class="fail">
                <p>确认忘记密码将把初始密码发送至您的手机！</p>
                <button type="button" class="btn" id="forgetzPwd-submit">确定</button>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/chart.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/public.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/account.js"></script>
</html>
