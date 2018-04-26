<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
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
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 头像更改</strong></div>
  <div class="body-content">
    <form name="form1" action="<%=basePath %>teacherservlet?order=checkstudentface" method="post" enctype="multipart/form-data" onsubmit="return check();">    
      <input type="hidden" name="studentname" value="${param.studentmobile}" >
      <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field">
          <input type="file" id="url1" name="fileup" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
          <button class="button bg-main icon-check-square-o" type="submit"> 上传</button>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>