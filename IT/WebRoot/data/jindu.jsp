<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> 倒计时跳转页面 </title>
  <script type="text/javascript">
	var index=5;
	function go(){
		var btngo = document.getElementById("btngo");
		btngo.value = index;

		//等待指定的时间后自动运行(运行一次)
		setTimeout('go()',1000);
		if(index==0){
			location.href="<%=basePath%>courselistservlet?order=list";
		}
		index--;
		//setInterval();间隔指定的时间运行一次
	}
  </script>
 </head>
 <body onload="go();">
 	<h1>恭喜你！你的讲师申请已经提交！我们将以洪荒之力的速度处理，请耐心等待结果！</h1>
	<h2>5秒钟以后跳转到主页</h2>
	<form>
		<div><input type="hidden" name="studentname" value="<%=new String(request.getParameter("studentname").getBytes("iso-8859-1"),"utf-8") %>"></div>
		<div><input type="button" align="center" style="width:50px;height:30px;background-color:grey" id="btngo" value="走" onload="go();"></div>
	
	</form>
 </body>
</html>
