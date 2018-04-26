<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>CSS3 3D立方体动画代码</title>
<style type="text/css">
*{
	margin:0 auto;
	padding:0;
}
@keyframes rotate{
	0%{
		transform:rotateX(0deg) rotateY(0deg);
	}
	100%{
		transform:rotateX(360deg) rotateY(360deg);
	}
}
html{
	background:linear-gradient(#888 0%, #000 80%);
	height:100%;
}
.wrap{
	margin-top:200px;
	perspective: 1000px; /* 视图距元素的距离 相当于摄像机 */
}
.cube{
	width:200px;
	height:200px;
	position:relative;
	color:#fff;
	font-size:36px;
	font-weight:bold;
	text-align:center;
	line-height:200px;
	transform-style:preserve-3d; /* 默认flat 2D */
	transform:rotateX(-30deg) rotateY(-70deg); 
	animation:rotate 20s infinite linear; /*播放时间 播放次数为循环 缓动效果为匀速 */
}
.cube > div{
	width:100%;
	height:100%;
	border:1px solid #fff;
	position:absolute;
	background-color:#333;
	opacity:.6;
	transition:transform 0.4s ease-in;
}
.cube .out-front{
	transform: translateZ(100px);
}
.cube .out-back{
	transform: translateZ(-100px) rotateY(180deg);
}
.cube .out-left{
	transform: translateX(-100px) rotateY(-90deg);
}
.cube .out-right{ 
	transform: translateX(100px) rotateY(90deg);
}
.cube .out-top{
	transform: translateY(-100px) rotateX(90deg);
}
.cube .out-bottom{
	transform: translateY(100px) rotateX(-90deg);
}
.cube > span{
	display:block;
	width:100px;
	height:100px;
	border:1px solid black;
	background-color:#999;
	position:absolute;
	top:50px;
	left:50px;
}
.cube .in-front{
	transform: translateZ(50px);
}
.cube .in-back{
	transform: translateZ(-50px) rotateY(180deg);
}
.cube .in-left{
	transform: translateX(-50px) rotateY(-90deg);
}
.cube .in-right{
	transform: translateX(50px) rotateY(90deg);
}
.cube .in-top{
	transform: translateY(-50px) rotateX(90deg);
}
.cube .in-bottom{
	transform: translateY(50px) rotateX(-90deg);
}
.wrap:hover .out-front{
	transform: translateZ(200px);
}
.wrap:hover .out-back{
	transform: translateZ(-200px) rotateY(180deg);
}
.wrap:hover .out-left{
	transform: translateX(-200px) rotateY(-90deg);
}
.wrap:hover .out-right{
	transform: translateX(200px) rotateY(90deg);
}
.wrap:hover .out-top{
	transform: translateY(-200px) rotateX(90deg);
}
.wrap:hover .out-bottom{
	transform: translateY(200px) rotateX(-90deg);
}

</style>
</head>
<body>
	<div class="wrap">
		<div class="cube">
			<div class="out-front"><a href="<%=basePath %>/datainfo/login.jsp">登录</a></div>
			<div class="out-back"><a href="<%=basePath %>/datainfo/zhuce.jsp">注册</a></div>
			<div class="out-left">首页</div>
			<div class="out-right">右面</div> 
			<div class="out-top">上面</div>
			<div class="out-bottom">下面</div>

			<span class="in-front"></span>
			<span class="in-back"></span>
			<span class="in-left"></span>
			<span class="in-right"></span>
			<span class="in-top"></span>
			<span class="in-bottom"></span>
		</div>
	</div>
	<div style="text-align:center;">
</div>

</body>
</html>