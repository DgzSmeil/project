<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="author" content="Tencent.AlloyTeam.Svenzeng" />
	<meta name="copyright" content="Tencent.AlloyTeam" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
	<title>街头霸王</title>
	<script src="<%=basePath %>streetfighter/js/config.js"></script>
	<script src="<%=basePath %>streetfighter/js/util.js"></script>
	<script src="<%=basePath %>streetfighter/js/interface.js"></script>
	<script src="<%=basePath %>streetfighter/js/ai.js"></script>
	<script src="<%=basePath %>streetfighter/js/class.js"></script>
	<script src="<%=basePath %>streetfighter/js/timer.js"></script>
	<script src="<%=basePath %>streetfighter/js/map.js"></script>
	<script src="<%=basePath %>streetfighter/js/main.js"></script>
	<script src="<%=basePath %>streetfighter/js/game.js"></script>
</head>
<body>
<!--Google Analytics-->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-23019343-9']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- 
	主机:
  
   * 移动: W: 上, D: 前, A: 后, S：下 
   * 攻击: J: 轻拳, K: 重拳, U: 轻腿, I: 重腿
   * 技能: 下→前→拳: 波动拳, 下→后→腿：旋风腿, 前→下→前→拳：升龙拳
   i
	副机（小键盘）:
  
   * 移动: ↑: 上, ←: 前, →: 后, ↓：下 
   * 攻击: 1: 轻拳, 2: 重拳, 4: 轻腿, 5: 重腿
   * 技能: 下→前→拳: 波动拳, 下→后→腿：旋风腿, 前→下→前→拳：升龙拳
   
   

按F2暂停游戏, 1键大战电脑ai, 2键双人对打.

 -->
</body>