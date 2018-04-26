<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0044)https://www.pujinziben.com/account.html#cash -->
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>我的账户—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
	<meta name="keywords" content="普金资本，P2P汽车、房产融资，借贷，理财计划，投资理财">
	<meta name="description" content="普金资本是目前中国P2P投资融资行业中最快速、最安全的网上理财平台，为借贷和民间投资用户提供安全、高效的理财服务。">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/public.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/account.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/datepicker.css">
	<link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/login.css">
<link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon"></head>

<body rlt="1" style="">
<div class="account-right" style="width: 100%;height: 951px;">
		<!-- begin -->
		<div class="account-right">
<div class="account-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="show-cash active">绑定银行卡</a>
	</div>
	<em class="em-line" style="left: 0px;"></em>
</div>
<div class="account-content" style="display: block;">
	<!-- 提现 -->
	<div class="cash-pay" style="display: block;">
		<p class="tips-title">
			<b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%的提现服务费，15天以后提现免服务费。禁止信用卡套现！<br>
			a）提现手续费由汇付收取，固定费用2元。<br>
			b）请输入您要提现的金额，我们将在1至3个工作日(国家节假日除外)之内将钱转入您网站上填写的银行账号。<br>
			c）每笔提现金额至少为100元以上。
		</p>
		<div class="pay-from">
			<div class="label cl">
				<input type="hidden" id="uid" value="${user.uid }"/>
				<label class="long">真实姓名：</label><p class="text" id="realName">${user.phone }</p>
			</div>
			<div class="label cl">
				<label class="long">身份证：</label><p class="text" id="idno">${user.idno }</p>
			</div>
			<div class="label cl">
				<label class="long">卡号：</label><input type="text"  id="cardno" placeholder="请输入卡号">
			</div>
			<div class="label cl label-msg">
				<label class="long">所属银行：</label>
				<select  id="type" style="width: 300px;height: 40px">
					<option value="建设银行">建设银行</option>
					<option value="中国银行">中国银行</option>
					<option value="中国邮政银行">中国邮政银行</option>
					<option value="中国工商银行">中国工商银行</option>
					<option value="民生银行">民生银行</option>
					<option value="交通银行">交通银行</option>
					<option value="招商银行">招商银行</option>
					<option value="中信银行">中信银行</option>
					<option value="北京银行">北京银行</option>
				</select>
			</div>
			<button type="button" class="btn long disabled" id="cash-submit" onclick="return bindingcode();">立即绑定</button>
		</div>
		<div id="returnHtml"></div>
	</div>
	</div>
			<input type="hidden" id="msg" value="${msg}"/>
		</div>

<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/account.js"></script>

<script>
    $(function(){
        if($('#msg').val() == 1) {
            alert("您还未添加银行卡，请先添加银行卡！");
		}
		var uid = $('#uid').val();
		$.post("/user/userbyid",
			{uid:uid},
			function (data){
		    	if(data != null) {
		    	    $('#realName').text(data.rname);
                    $('#idno').text(data.idno);
				}
			},"json"
		);

    })
</script>
</body>
</html>


