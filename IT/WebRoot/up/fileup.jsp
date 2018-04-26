<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				if(filename!="jpg" && filename!="JPG" && filename!="png" && filename!="PNG"){
					alert("文件上传只支持jsp,png格式");
					return false;
				}
			}
			filename = form1.fileup1.value;
			port = fiename.indexOf(".")+1;
			if(port>0){
				filename = filename.substring(port);
				if(filename!="jpg" && filename!="JPG" && filename!="png" && filename!="PNG"){
					alert("文件上传只支持jsp,png格式");
					return false;
				}
			}
			return true;
		}
	</script>
  </head>
  <body>
  <c:if test="${msg!=null}">
  	<script type="text/javascript">
  		alert("${msg}");	
  	</script>
  </c:if>
  	<h1 align="center">文件的上传</h1>
    <form name="form1" action="<%=basePath %>fileservlet" method="post" enctype="multipart/form-data" onsubmit="return check();">
    	 <div style="text-align:center">文件名称：<input type="file" name="fileup" size="20" style="width:260px;height:30px;"></div><br/>
         <div style="text-align:center">文件名称：<input type="file" name="fileup1" size="20" style="width:260px;height:30px;"></div><br/>
    	 <div align="center"><input type="submit" value=" 上 传 " style="width:160px;height:30px;"></div>
    </form>
  </body>
</html>
