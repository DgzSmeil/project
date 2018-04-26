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
<div class="account-right" style="width: 100%;height: 951px;">
        <!-- begin -->
            <div class="account-right-nav">
                <div class="sub-a-nav">
                    <a href="javascript:void(0);" class="all-a active">账户总览</a>
                </div>
                <em class="em-line" style="left:0px;"></em>
            </div>
            <div class="account-content" style="display: block;">

                <div class="all-view">
                    <div class="center-view">
                        <div class="center-header">
                            <img src="<%=path%>/static/upload/123.jpg" width="120" height="120">
                        </div>
                        <div class="center-self">
                            <p class="name">${user.phone}</p>
                            <p class="safety">安全等级： <span id="safeLevel">高</span></p>
                            <p class="center-icon">
                                <a href="<%=path %>/user/user_safe" class="icon icon-c-phone"></a>
                                <a href="<%=path %>/user/user_safe" class="icon icon-c-mail"></a>
                            </p>
                            <p id="reset"></p>
                        </div>
                        <div class="center-user">
                            <p class="amt color"><span id="usableSum">${userMoney.kymoney}</span>元</p>
                            <p class="text"><i></i>可用余额</p>
                            <p class="link">
                                <a href="<%=path %>/logczz/page" class="active">充值</a>
                                <a href="<%=path %>/logtx/page">提现</a>
                            </p>
                        </div>
                        <div class="center-profit">
                            <p class="amt"><span id="earnSum">${userMoney.symoney}</span>元</p>
                            <p class="text">收益总额</p>

                            <p class="icon icon-quan">代金券 <b id="voucher">
                                <c:if test="${ut.dCount==null}">
                                    0
                                </c:if>
                                <c:if test="${ut.dCount!=null}">
                                    ${ut.dCount}
                                </c:if>
                               </b> 张，现金券 <b id="cashMap">
                                <c:if test="${ut.xCount==null}">
                                    0
                                </c:if>
                                <c:if test="${ut.xCount!=null}">
                                    ${ut.xCount}
                                </c:if></b> 张</p>
                        </div>
                    </div>
                    <div class="center-main">
                        <div class="canvas">
                            <div class="center-total">
                                <p id="allTotal">${userMoney.zmoney}</p>
                                <p class="text">总资产</p>
                            </div>
                        </div>
                        <div class="center-data">
                            <p><i class="color color1"></i>投资总额：<span id="investSum">${userMoney.tzmoney}</span></p>

                            <p><i class="color color2"></i>冻结金额：<span id="freezeAmount">${userMoney.djmoney}</span></p>

                            <p><i class="color color3"></i>待收总额：<span id="forPaySum">${userMoney.dsmoney}</span></p>

                            <p><i class="color color4"></i>奖励金额：<span id="otherEarnAmount">${userMoney.jlmoney}</span></p>
                        </div>
                    </div>
                </div>
                <div id="huifuHtml"></div>
            </div>
            <div class="popup regist-box">
                <p class="title left">注册汇付天下</p>
                <a href="javascript:void(0);" class="close icon icon-close"></a>
                <div class="popup-from">
                    <button type="button" class="btn" id="person-submit">个人用户注册</button>
                    <button type="button" class="btn" id="single-submit">企业用户注册</button>
                </div>
            </div>
        </div>
        <!-- end -->
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function(){

        $(".luckyLink").mouseover(function (){
            $(".luckyDetails").show();
        }).mouseout(function (){
            $(".luckyDetails").hide();
        });
    })
</script>
</html>
