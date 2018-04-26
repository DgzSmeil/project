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
            <a href="javascript:void(0);" class="active" id="dLink">代金券<i id="dCount"></i></a>
            <a href="javascript:void(0);"  id="jLink">加息券<i id="jCount"></i></a>
            <a href="javascript:void(0);"  id="xLink">现金券<i id="xCount"></i></a>
           <!-- <a href="javascript:void(0);"  id="tLink">体验金<i id=""></i></a>  -->
        </div>
        <em class="em-line"></em>
    </div>
    <div class="account-content" id="dtaste">
        <div class="sub-nav">
            <a href="javascript:;" class="active" id="Dunused">未使用</a>
            <a href="javascript:;" id="Dused">已使用</a>
            <a href="javascript:;" id="Dexpired">已过期</a>
        </div>
        <div class="dtaste-listData dtaste-listData1">
            <ul class="taste-list nouse cl">
            </ul>
            <ul class="paging">
            </ul>
        </div>
        <div class="dtaste-listData dtaste-listData2">
            <ul class="taste-list use cl" >
            </ul>
            <ul class="paging">
            </ul>
        </div>
        <div class="dtaste-listData dtaste-listData3">
            <ul class="taste-list overdue cl" >
            </ul>
            <ul class="paging">
            </ul>
        </div>
    </div>
    <div class="account-content" id="jtaste">
        <div class="sub-nav">
            <a href="javascript:;" class="active" id="Junused">未使用</a>
            <a href="javascript:;" id="Jused">已使用</a>
            <a href="javascript:;" id="Jexpired">已过期</a>
        </div>
        <div class="jtaste-listData jtaste-listData1">
            <ul class="taste-list nouse cl">
            </ul>
            <ul class="paging">
            </ul>
        </div>
        <div class="jtaste-listData jtaste-listData2">
            <ul class="taste-list use cl" >
            </ul>
            <ul class="paging">
            </ul>
        </div>
        <div class="jtaste-listData jtaste-listData3">
            <ul class="taste-list overdue cl" >
            </ul>
            <ul class="paging">
            </ul>
        </div>
    </div>
    <div class="account-content" id="xtaste">
        <div class="sub-nav">
            <a href="javascript:;" class="active" id="Xunused">未使用</a>
            <a href="javascript:;" id="Xused">已使用</a>
            <a href="javascript:;" id="Xexpired">已过期</a>
        </div>
        <div class="xtaste-listData xtaste-listData1">
            <ul class="taste-list nouse cl">
            </ul>
            <ul class="paging">
            </ul>
        </div>
        <div class="xtaste-listData xtaste-listData2">
            <ul class="taste-list use cl" >
            </ul>
            <ul class="paging">
            </ul>
        </div>
        <div class="xtaste-listData xtaste-listData3">
            <ul class="taste-list overdue cl" >
            </ul>
            <ul class="paging">
            </ul>
        </div>
    </div>
    <div class="account-content" id="ttaste">
        <div class="sub-nav">
            <a href="javascript:;" class="active">未使用</a>
            <a href="javascript:;">已使用</a>
            <a href="javascript:;">已过期</a>
        </div>
        <ul class="taste-list nouse" >
            <li class="none">没有符合条件的内容！</li>
        </ul>
        <ul class="taste-list use" >
            <li class="none">没有符合条件的内容！</li>
        </ul>
        <ul class="taste-list overdue" >
            <li class="none">没有符合条件的内容！</li>
        </ul>
    </div>

</div>


</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
<script src="<%=path%>/static/js/myTicket.js"></script>
<script>

</script>
</html>
