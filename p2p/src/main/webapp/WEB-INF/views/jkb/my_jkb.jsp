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
            <div class="sub-a-nav">
                <a href="javascript:void(0);" class="active" id="loanLink">借款管理</a>
                <a href="javascript:void(0);" id="detailLink">还款明细</a>
                <a href="javascript:void(0);" id="repayEditLink" class="">自动还款设置</a>
            </div>
        </div>
        <em class="em-line"></em>
    </div>
    <div class="account-content" id="loan">
        <div class="sub-nav">
            <a href="javascript:;" class="active" id="loan-s">审核中</a>
            <a href="javascript:;" class="" id="loan-l">申请失败</a>
            <a href="javascript:;" id="loan-z" class="">招标中</a>
            <a href="javascript:;" id="loan-x" class="">还款中</a>
            <a href="javascript:;" id="loan-c" class="">成功</a>
        </div>
        <div class="account-form account-form-manage cl" style="display: block;">
            <lable class="lable-long">发布时间：</lable>
            <input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
            <p class="text">至</p>
            <input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
            <input type="hidden" id="state" readonly="readonly">
            <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
            <button type="button" class="search" id="loanSearch">搜索</button>
            <button type="button" class="search" id="loanSearchClean">清空</button>
        </div>

        <div class="loan-listData loan-listData1" style="display: block;">
            <ul class="loanData list-box">
                <li class="title title1">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">还款方式</div>
                    <div class="children3">金额（元）</div>
                    <div class="children4">年利率</div>
                    <div class="children5">期限（月）</div>
                    <div class="children6">申请时间</div>
                    <div class="children7">状态</div>
                </li>
            </ul>
            <ul class="loanData listData"></ul>
            <ul class="paging"></ul>
        </div>

        <div class="loan-listData loan-listData2" style="display: none;">
            <ul class="loanData list-box">
                <li class="title title1">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">审核理由</div>
                    <div class="children3">还款方式</div>
                    <div class="children4">金额（元）</div>
                    <div class="children5">年利率</div>
                    <div class="children6">申请时间</div>
                    <div class="children7">状态</div>
                </li>
            </ul>
            <ul class="loanData listData"></ul>
            <ul class="paging"></ul>
        </div>

    </div>
    <div class="account-content" id="repay">
        <div class="sub-nav">
            <a href="javascript:;" class="active" id="detail-h">还款中</a>
            <a href="javascript:;" id="detail-y">已还款</a>
            <a href="javascript:;" id="detail-m">还款明细</a>
        </div>
        <div class="account-form cl">
            <lable class="lable-long">还款时间：</lable>
            <input type="text" class="date icon icon-date" autocomplete="off" id="d-startDate" readonly="readonly"/>
            <p class="text">至</p>
            <input type="text" class="date icon icon-date" autocomplete="off" id="d_endDate" readonly="readonly"/>
            <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
            <button type="button" class="search" id="detailSearch">搜索</button>
            <button type="button" class="search" id="detailSearchClean">清空</button>
        </div>
        <div class="listTable1">
            <ul class="detailData list-box" >
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">第几期</div>
                    <div class="children2">负责人</div>
                    <div class="children3">借款金额</div>
                    <div class="children4">年利率</div>
                    <div class="children5">标种类型</div>
                    <div class="children6">还款期限</div>
                    <div class="children7">应还本息</div>
                    <div class="children8">操作</div>
                </li>
            </ul>
            <ul class="detailData listData">
            </ul>
            <ul class="paging detailPaging">
            </ul>
        </div>
        <div class="listTable2">
            <ul class="detailData list-box" >
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">第几期</div>
                    <div class="children2">借款金额</div>
                    <div class="children3">负责人</div>
                    <div class="children4">借款期限</div>
                    <div class="children5">还款时间</div>
                    <div class="children6">已还本息</div>
                    <div class="children7">逾期罚息</div>
                    <div class="children8">操作</div>
                </li>
            </ul>
            <ul class="detailData listData">
            </ul>
            <ul class="paging detailPaging">
            </ul>
        </div>
        <div class="listTable3">
            <ul class="detailData list-box" >
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">第几期</div>
                    <div class="children2">应还款日期</div>
                    <div class="children3">实际还款日期</div>
                    <div class="children4">本期应还本息</div>
                    <div class="children5">利息</div>
                    <div class="children6">逾期罚款</div>
                    <div class="children7">逾期天数</div>
                    <div class="children8">还款状态</div>
                    <div class="children9">操作</div>
                </li>
            </ul>
            <ul class="detailData listData">
            </ul>
            <ul class="paging detailPaging">
            </ul>
        </div>
    </div>
    <div class="popup repay-detail">
        <p class="title left">还款明细</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-list">
            <ul class="repay-detail-data list-box" >
                <li class="">
                    <div class="children0">序号</div>
                    <div class="children1">还款日期</div>
                    <div class="children2">还款本息</div>
                    <div class="children3">实还日期</div>
                    <div class="children4">逾期天数</div>
                    <div class="children5">实还本息</div>
                    <div class="children6">逾期罚款</div>
                    <div class="children7">应还总额</div>
                    <div class="children8">状态</div>
                    <div class="children9">操作</div>
                </li>
            </ul>
            <ul class="listData">
            </ul>
            <ul class="paging">
            </ul>
        </div>
    </div>
    <div class="popup repay-from">
        <p class="title left">还款</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <input type="text" style="display:none;" id="hkid">
            <div class="label cl">
                <label class="long">应还本息：</label><p class="text" id="hkb-ybx">--</p>
            </div>
            <div class="label cl">
                <label class="long">已还本息：</label><p class="text" id="hkb-rbx">--</p>
            </div>
            <div class="label cl">
                <label class="long">应还利息：</label><p class="text" id="hkb-ylx">--</p>
            </div>
            <div class="label cl">
                <label class="long">已还利息：</label><p class="text" id="hkb-rlx">--</p>
            </div>
            <div class="label cl">
                <label class="long">应还本金：</label><p class="text" id="hkb-ybj">--</p>
            </div>
            <div class="label cl">
                <label class="long">已还本金：</label><p class="text" id="hkb-rbj">--</p>
            </div>
            <div class="label cl">
                <label class="long">已还期数：</label><p class="text" id="hkb-rnum">--</p>
            </div>
            <div class="label cl">
                <label class="long">总期数：</label><p class="text" id="hkb-tnum">--</p>
            </div>
            <div class="label cl">
                <label class="long">还款日期：</label><p class="text" id="hkb-hkdate">--</p>
            </div>
            <button type="button" class="btn" id="repay-submit" style="display: none">还款</button>
            <button type="button" class="btn" id="repay-ok" style="display: none">确定</button>
        </div>
    </div>

    <div class="account-content" id="repayEdit" style="display: none;">
        <p class="tips-title">
            <b>自动还款工具说明:</b><br>
            a）用户开启自动还款设置后，到达还款日的当天凌晨12点，如果用户账户正常，即会自动进行还款。<br>
            b）保证用户账户可用余额足够支付还款金额，如果还款日当天超过凌晨12点用户账户可用余额不足而导致自动还款失败，则用户需要进行手动还款，否则会造成还款逾期。
        </p>
        <div class="popup-from">
            <div class="div_state">
                <label class="text_div">自动还款状态：</label><p class="div_state_text" id="payment_state">已开启</p>
            </div>
            <div class="div_state">
                <label class="text_div">操作：</label><p class="div_state_text"><button type="button" class="btn_start" id="payment_btn">关闭</button></p>
            </div>
        </div>
    </div>

</div>
<!-- end -->


</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>

<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/my_jkb.js"></script>
<script>

</script>
</html>
