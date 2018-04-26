<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.StudentBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IT课堂送福利</title>
<link rel="stylesheet" href="<%=basePath %>choujiang/css/style.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>choujiang/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>choujiang/js/awardRotate.js"></script>
<script type="text/javascript">
$(function (){

	var rotateTimeOut = function (){
		$('#rotate').rotate({
			angle:0,
			animateTo:2160,
			duration:8000,
			callback:function (){
				alert('网络超时，请检查您的网络设置！');
			}
		});
	};
	var bRotate = false;

	var rotateFn = function (awards, angles, txt){
		bRotate = !bRotate;
		$('#rotate').stopRotate();
		$('#rotate').rotate({
			angle:0,
			animateTo:angles+1800,
			duration:3000,
			callback:function (){
				alert(txt);
				$.post(
					"${pageContext.request.contextPath}/studentservlet",
					{
						"money":$("#money").val(),
						"order":"yanzheng"
					},
					function(data){
						if(data=='ok'){
							location.href="${pageContext.request.contextPath}/moneyservlet?order=list&username="+$("#username").val();
						}
					},
					"text"
				);
				bRotate = !bRotate;
			}
		})
	};

	$('.pointer').click(function (){
		var money = document.getElementById("money1").value;
		if(money!=0){
			return;
		}
		if(bRotate)return;
		var item = rnd(0,7);

		switch (item) {
			case 0:
				//var angle = [26, 88, 137, 185, 235, 287, 337];
				rotateFn(0, 337, '未中奖');
				document.getElementById("money").value=0;
				break;
			case 1:
				//var angle = [88, 137, 185, 235, 287];
				rotateFn(1, 26, '一元礼包');
				document.getElementById("money").value=1;
				break;
			case 2:
				//var angle = [137, 185, 235, 287];
				rotateFn(2, 88, '二元礼包');
				document.getElementById("money").value=2;
				break;
			case 3:
				//var angle = [137, 185, 235, 287];
				rotateFn(3, 137, '三元礼包');
				document.getElementById("money").value=3;
				break;
			case 4:
				//var angle = [185, 235, 287];
				rotateFn(4, 185, '四元礼包');
				document.getElementById("money").value=4;
				break;
			case 5:
				//var angle = [235, 287];
				rotateFn(5, 235, '五元大礼包');
				document.getElementById("money").value=5;
				break;
			case 6:
				//var angle = [287];
				rotateFn(6, 287, '六元豪华大礼包');
				document.getElementById("money").value=6;
				break;
		}

		console.log(item);
	});
});
function rnd(n, m){
	return Math.floor(Math.random()*(m-n+1)+n)
}
</script>
<script type="text/javascript">
	$(function(){
		$("#choujiang").bind("click",function(){
			$.post(
					"${pageContext.request.contextPath}/studentservlet",
					{
						"order":"checkyanzheng"
					},
					function(data){
						if(data!=0){
							alert("你已经抽过奖不能再抽了");
							$("#money1").val(data);
						}
					},
					"text"
				);
		});
	
	});
</script>
</head>
<body>
<%
	StudentBean studentBean = (StudentBean)session.getAttribute("bean");
%>
    <div class="turntable-bg">
    	<input type="hidden" value="" name="money" id="money"/>
    	<input type="hidden" value="${birthday.money}"  id="money1"/>
    	<input type="hidden" value="<%=studentBean.getStudentname() %>" id="username"/>
        <!--<div class="mask"><img src="images/award_01.png"/></div>-->
        <div class="pointer"><img src="<%=basePath %>choujiang/images/pointer.png" alt="点击开始抽奖" id="choujiang"/></div>
        <div class="rotate" ><img id="rotate" src="<%=basePath %>choujiang/images/turntable2.png" alt="turntable"/></div>
    </div>
</body>
</html>