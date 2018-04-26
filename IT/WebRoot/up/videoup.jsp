<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>文件的上传</title>
	<script type="text/javascript">
		function check(){
			var filename = form1.fileup.value;
			var port = filename.indexOf(".")+1;
			if(port>0){
				filename = filename.substring(port);
				if(filename!="mp4" && filename!="MP4" filename!="avi" && filename!="AVI" && filename!="WMV" && filename!="wmv" && filename!="swf" && filename!="SWF"){
					alert("上传视频值支持avi,WMV,mp4格式");
					return false;
				}
			}
			return true;
		}
	</script>
	
  </head>
  
  <body>
  	<h1 align="center">视频的上传</h1>
    <form name="form1" action="<%=basePath %>videoservlet" method="post" enctype="multipart/form-data" onsubmit="return check();">
    	 <div style="text-align:center">视频名称：<input type="file" name="fileup" size="20" style="width:260px;height:30px;"></div><br/>
    	 <div align="center"><input type="submit" value=" 上 传 " style="width:160px;height:30px;"></div>
    </form>
  </body>
</html>
