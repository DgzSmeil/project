<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">

<link  rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/sinaFaceAndEffec.css" />

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<title>反馈信息</title>
</head>
<body>
<div id="content" style="width: 700px; height: auto;margin-left:220px;margin-top:40px">
	<div class="wrap">
		<div class="comment">
			<div class="head-face">
				<img src="images/1.jpg" / >
				<p><%=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8") %></p>
			</div>
			<div class="content">
				<div class="cont-box">
					<textarea class="text" placeholder="请输入..." value=""></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  >☺</span><span class="img-icon">▧</span></div>
					<div class="submit-btn"><input type="button" onClick="out()" value="提交反馈" /></div>
				</div>
			</div>
		</div>
		<div id="info-show">
			<ul></ul>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/sinaFaceAndEffec.js"></script>
<script type="text/javascript">
	// 绑定表情
	$('.face-icon').SinaEmotion($('.text'));
	// 测试本地解析
	function out() {
		var inputText = $('.text').val();
		$('#info-show ul').append(reply(AnalyticEmotion(inputText)));
	}
	
	var html;
	function reply(content){
		html  = '<li>';
		html += '<div class="head-face">';
		html += '<img src="images/1.jpg" / >';
		html += '</div>';
		html += '<div class="reply-cont">';
		html += '<p class="username"><%=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8") %></p>';
		html += '<p class="comment-body">'+content+'</p>';
		html += '<p class="comment-footer"><%=new Date().toLocaleString()%></p>';
		html += '</div>';
		html += '</li>';
		return html;
	}
</script>
<div style="text-align:center;">
</div>
</body>
</html>

