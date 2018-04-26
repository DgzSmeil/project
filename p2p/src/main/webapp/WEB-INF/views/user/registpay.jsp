<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>
	<title>身份认证</title>
	<link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
	<link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>
	<link rel="stylesheet" href="<%=path %>/static/plugin/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" href="<%=path %>/static/plugin/easyui/themes/icon.css" />
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />

<body>
<!-- head end -->
	<div class="registpay-content">
		<div class="regist-box" style="display: block;">
			<h3>身份实名认证</h3>
			<p class="error-msg icon icon-error"></p>
			<form id="form1">
				<div class="from">
					<label for="Name" class="icon icon-user"></label>
					<input type="text" name="rname" id="Name" maxlength="18" placeholder="真实姓名"/>
				</div>
				<div class="from">
					<label for="idCard" class="icon icon-idcard"></label>
					<input type="text" name="idno" id="idCard" maxlength="18" placeholder="身份证号"/>
				</div>
				<div class="from">
					<label for="Age" class="icon icon-user"></label>
					<input type="text" name="age" id="Age" maxlength="3" placeholder="年    龄"/>
				</div>
				<div class="from">
					<label for="Marriage" class="icon icon-user"></label>
					<select  name="ism" id="Marriage" style="width: 324px;height: 46px;border: 0px;">
						<option value="1" selected="selected">未  婚</option>
						<option value="2">已  婚</option>
					</select>
				</div>
				<div class="from">
					<label for="School" class="icon icon-user"></label>
					<input type="text" name="bschool" id="School" maxlength="15" placeholder="毕业院校"/>
				</div>
				<div class="from">
					<label for="Address" class="icon icon-msg"></label>
					<input type="text" name="addr" id="Address" maxlength="30" placeholder="现居住地"/>
				</div>
				<div class="from">
					<label for="Job" class="icon icon-mobile"></label>
					<input type="text" name="work" id="Job" maxlength="10" placeholder="当前职位"/>
				</div>
				<div class="from">
					<label for="eduBack" class="icon icon-email"></label>
					<select name="xl" id="eduBack" style="width: 324px;height: 46px;border: 0px;">
						<option value="xl" selected="selected">当前学历</option>
						<option value="小学">小学</option>
						<option value="初中">初中</option>
						<option value="中专">中专</option>
						<option value="高中">高中</option>
						<option value="大专">大专</option>
						<option value="本科">本科</option>
						<option value="硕士">硕士</option>
						<option value="博士">博士</option>
					</select>
				</div>
			</form>
			<button class="btn" type="button">提交认证</button>
		</div>
		<div id="registPay" style="display:none;"></div>
	</div>
<!-- foot -->
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/plugin/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/plugin/easyui/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/registpay.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/public.js"></script>
</body>
</html>