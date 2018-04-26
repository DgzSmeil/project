<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0044)https://www.pujinziben.com/account.html#cash -->
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>理财工具箱—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/public.css">
	<link rel="stylesheet" href="<%=path%>/static/css/aboutus.css">
<link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon"></head>

<body>
<%@include file="./master/head.jsp" %>
<br/>
<div class="user-container">
	<div class="wrapper clearfix">
		<!--开始-->
		<div class="container clearfix ">
			<div class="tag-style">
				<ul>
					<li class="on">
						收益计算器
					</li>
				</ul>
			</div>

			<div class="count-form">
				<div class="input-type-box">
                        <span class="input-type">
                            <span class="text">投资金额 </span>
                            <input type="text" class="text-tip" id="money" value=" " maxlength="10"><span class="text"> 元</span>
                            <span class="err-tip" id="err-money">请输入投资金额 </span>
                        </span>
					<span class="input-type">
                    <span class="text">年化利率 </span>
                        <input type="text" value="" class="text-tip" id="toolrate" maxlength="5"><span class="text"> %</span>
                        <span class="err-tip" id="err-rate">请输入年化利率 </span>
                        </span>
				</div>
				<div class="input-type-box">
					<a href="javascript:;" class="td-btn-1 count-star" id="btnCalculate">开始计算</a>
					<span class="input-type">
                            <span class="text">投资期限 </span>
                            <input type="text" value="" class="text-tip" id="moneydata" maxlength="4">
                            <div class="text">
                                <div class="sort-condition">
                                    <ul class="bgff abs" id="dvPopSort">
                                        <li class="v1 on" attrval="2" attrname="月">月</li>
                                        <li class="v2" attrval="1" attrname="日" style="display: none;">日</li>
                                    </ul>
                                    <i class="tool-arrow"></i>
                                </div>
                            </div>
                            <span class="err-tip" id="err-time">请输入投资期限</span>
                        </span>


					<span class="input-type gar" id="garday" style="display: none;">
                            <i class="tool-arrow-1   "></i>
                            <span class="text mt15" style="margin-right:5px;">还款方式 </span>
                        <div class=" re-payment-type-2" get-value="一次性还本付息">
                            一次性还本付息
                        </div>
                        </span>
					<span class="input-type" id="gar">
                            <i class="tool-arrow-1"></i>
                            <span class="text mt15" style="margin-right:5px;">还款方式 </span>
                            <div class="re-payment-type-1" get-value="先息后本">
                                先息后本
                            </div>
                            <div class=" re-payment-type" style="display: none;">
                                <dl>
                                    <dt value="先息后本">先息后本</dt>
                                    <dd value="一次性还本付息">一次性还本付息</dd>
                                    <dd value="等额本息">等额本息</dd>
                                </dl>
                            </div>
                        </span>
				</div>
			</div>
			<div class="bgff">
				<div class="profit-count clearfix">
					<h3>计算结果：<span class="g9 f14">（收益仅供参考，实际收益以最终投资结果为准！）</span></h3>
					<ul class="result cl fix">
						<li>
							<p>预期收益</p>
							<p class="num"><span id="c1">0</span><span class="g9 f14">元</span></p>
						</li>
						<li>
							<p>本息合计</p>
							<p class="num"><span id="c2">0</span><span class="g9 f14">元</span></p>
						</li>
						<li class="br0">
							<p>月收本息</p>
							<p class="num"><span id="c3">0</span><span class="g9 f14">元</span></p>
						</li>
					</ul>
				</div>
			</div>
			<div class="bgff res" style="display: none;">
				<div class="payment">
					<h3>回款明细： </h3>
					<table width="100%" class="mt25">
						<tbody>
						<tr>
							<th>期数</th>
							<th>回款本息</th>
							<th>回款本金</th>
							<th>利息</th>
							<th>待收本息</th>
						</tr>
						</tbody>
					</table>
					<ul class="payment-int clearfix">
						<li><span>每月付息：</span>借款人每月偿还固定利息，最后一期偿还全部本金。 </li>
						<li class="w400"><span>到期本息：</span>借款人借款到期后一次性偿还本金和利息。</li>
						<li><span>等额本息：</span>借款人每月以相等的金额偿还借款本息，也是银行房贷等采用的方法。</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="dial-window" style="display: none;" class="z103">
			<div class="title">
				加载中 <i class="close close-x icon abs"></i>
			</div>
			<div class="body">
				<!--        <img src="/assets/images/public/loading.gif" alt="加载中">-->
			</div>
			<div id="dial-window-btns" class="btns tc">
				<a href="javascript:void(0)" class="td-btn-1 td-btn-1-or dete " id="dial-window-okbtn">确定</a>
				<a href="javascript:void(0)" class="td-btn-1 td-btn-1-gar  cancle " id="dial-window-canclebtn">取消</a>
			</div>
		</div>
		<div id="diallayer" style="display: none;"></div>
		<!--结束 end-->
	</div>
</div>

<div id="ajaxFooter">
	<div class="mod-sidebar">
		<ul>
			<li><a target="_blank" href="tencent://message/?uin=3036302675&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
			<li><a href="javascript:;" class="sidebar-wx"></a></li>
			<li><a href="https://www.pujinziben.com/calculator.html" class="sidebar-cl"></a></li>
			<li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
			<li><a href="#top" class="sidebar-top"></a></li>
		</ul>
	</div>

	<div class="footer">
		<div class="wrap">
			<p class="text">
				版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
				备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank" class="beian">赣ICP备16004010号</a>
				<a href="http://new.cnzz.com/v1/login.php?siteid=1260871948" target="_blank">  <img src="<%=path %>/static/p2p/CNZZ.png" alt=""></a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=36070202000195" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian"><img src="<%=path %>/static/p2p/beian.png" style="float:left;">赣公网安备 36070202000195号</a>
			</p>
			<div class="footer-list" style="width:650px;text-align:center">
				<a id="___szfw_logo___" href="https://credit.szfw.org/CX05252017016185201512.html" target="_blank">
					<img src="<%=path %>/static/p2p/foot2.png" border="0">
				</a>
				<a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com" target="_blank">
					<img src="<%=path %>/static/p2p/ft_link_02.png" alt="">
				</a>
				<a href="http://si.trustutn.org/info?sn=685170725000594426611&amp;certType=4" target="_blank">
					<img width="110px" height="40px" src="<%=path %>/static/p2p/p2p_bottom_large_img.jpg" alt="">
				</a>
				<a href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business" target="_blank">
					<img src="<%=path %>/static/p2p/ft_link_04.png" alt="">
				</a>
				<a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343">
					<img width="112px" height="34px" src="<%=path %>/static/p2p/foot1.png">
				</a>
			</div>
		</div>
	</div>
	<div class="popup wechart-box">
		<p class="title left">关注普金资本微信公众号</p>
		<a href="javascript:void(0);" class="close icon icon-close"></a>
		<div class="popup-from">
			<img class="wechart" src="<%=path %>/static/p2p/wechart.jpg">
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/sca_fina.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/countUp.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/calc.js"></script>

</html>


