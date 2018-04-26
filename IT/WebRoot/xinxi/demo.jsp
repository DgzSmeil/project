<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery表单中获取短信验证码倒计时</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function  () {
	//获取短信验证码
	var validCode=true;
	$(".msgs").click (function  () {
		var time=60;
		var code=$(this);
		if (validCode) {
			validCode=false;
			code.addClass("msgs1");
		var t=setInterval(function  () {
			time--;
			code.html(time+"秒");
			if (time==0) {
				clearInterval(t);
			code.html("重新获取");
				validCode=true;
			code.removeClass("msgs1");

			}
		},1000)
		}
	})
})
</script>
<style type="text/css">
form{margin:200px auto;width:500px;}
label{font-size:14px;color:#555;line-height:40px;margin-right:10px;}
input{width:212px;height:38px;border-style:none;padding:0 4px;border:1px solid #C8C8C8;margin-right:10px;outline:none;}
.msgs{display:inline-block;width:104px;color:#fff;font-size:12px;border:1px solid #0697DA;text-align:center;height:30px;line-height:30px;background:#0697DA;cursor:pointer;}
form .msgs1{background:#E6E6E6;color:#818080;border:1px solid #CCCCCC;}
</style>
</head>
<body>
<form method="post" action="<%=basePath %>apiservlet?order=sendcode">
	<input name="codepwd" id="codepwd" type="text" value=""/>
	<table border=1>
		<tr>
			<td>
				<label style="float:left;">手机号码&nbsp;</label>
				<input type="text" class="c_code_msg" id="phone" style="margin-right: 10px;"/>
				<span class="msgs" id="getcode">获取短信验证码</span>
			</td>
		</tr>
		<tr>
			<td>
				<label style="float:left;">验&nbsp;&nbsp;证&nbsp;&nbsp;码</label>
				<input type="text" class="c_code_msg" name="code"/>
				<input value="核对验证码" type="button"  id="but" style="display:inline-block;width:110px;color:#fff;font-size:12px;border:1px solid #0697DA;text-align:center;height:30px;line-height:30px;background:#0697DA;cursor:pointer;"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$("#getcode").bind("click",function(){
		$.post(
			"${pageContext.request.contextPath}/apiservlet?order=sendcode",
			{
				"phone":$("#phone").val()
			},
			function(data){
				$("#codepwd").val(data);
			},
			"text"
		);
	});
	$("#but").bind("click",function(){
		if($("#code").val()!=$("#codepwd").val){
			alert("对不起！验证码失败！");
			return false;
		}
		if($("#code").val()==$("#codepwd").val){
			alert("恭喜你！验证成功！");
			return true;
		}
	
	});
</script>
</body>
</html>