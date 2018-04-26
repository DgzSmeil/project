<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery QQ时间轴代码</title>

<style>
*{margin:0;padding:0}
body{font-size:14px;font-family:"微软雅黑";background:url("images/2.jpg") top no-repeat;background-attachment:fixed;z-index:0;background-size:100%;}
.box{width:960px;height:2000px;margin:100px auto;position:relative;z-index:1;}

/*内容发布区域*/
.box .boxcenter{width:500px;height:200px;background:#fff;position:absolute;top:80px;left:180px;border:1px solid green;border-radius:6px;}
.box .boxcenter .boxc_t{height:30px;line-height:30px;}
.box .boxcenter .boxc_t h4{padding-left:20px;background:#3BBFB4;border-top-left-radius:6px;border-top-right-radius:6px;}
.box .boxcenter .boxc_c{width:460px;height:100px;border:1px solid #A6C8FF;margin:8px auto;text-indent:10px;box-shadow:0 0 4px #A6C8FF;}
.box .boxcenter .boxc_b{width:80px;height:30px;position:absolute;right:10px;bottom:8px;}
.box .boxcenter .boxc_b a{font-size:14px;color:#fff;line-height:30px;background:#3bbfb4;border-radius:6px;display:block;text-align:center;text-decoration:none;}
.box .boxcenter .boxc_b a:hover{background:#2C8E86;}
.box .timeline{width:60px;height:100%;position:absolute;top:100px;left:80px;border-right:2px solid #5d7895;}/**/
.timeline .timeline_t{width:50px;height:50px;border-radius:50%;border:1px solid #fff;background:url("images/100.png") no-repeat;background-size:100%;}
.timeline .nextbox{width:380px;height:80px;position:absolute;top:260px;left:60px;}
.a{width:380px;height:80px;background:#fff;border-radius:6px;margin-top:30px;font-size:16px;line-height:20px;text-indent:20px;word-break:break-all;position:relative;left:6px;}
.a .b{width:6px;height:6px;border-radius:50%;border:2px solid #fff;background:#9DCFE1;position:absolute;top:35px;left:-10px;}
#time{font-size:20px;color:#ababab;}
#hour{font-size:12px;color:#92CADE;}
</style>

</head>
<body>
<br/>

<h1 align="center"><font color="blue">评价</font></h1>
<div class="box">

	<!--内容发布区域-->
	<div class="boxcenter">
		<div class="boxc_t"><h4>欢迎你评价</h4></div>
		<div class="boxc_c" contenteditable="true" id="aa"></div>
		<div class="boxc_b" onclick="info();"><a href="#" >评价</a></div>
	</div>
	
</div>

<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">	
	function info(){
		var msg = document.getelementById("aa").value;
		alert(msg);
	}

</script>
</body>
</html>