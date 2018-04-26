<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="msgContent"]', {
				cssPath : '${pageContext.request.contextPath}/kindeditor/plugins/code/prettify.css',
				uploadJson : '${pageContext.request.contextPath}/jsp/upload_json.jsp',
				fileManagerJson : '${pageContext.request.contextPath}/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
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
<jsp:include page="/IncludeJS.jsp"></jsp:include>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>发布课程</strong></div>
  <div class="body-content">
	<form method="post" name="example" id="example" class="form-x" action="<%=basePath %>newmsgservlet?order=add" enctype="multipart/form-data" onsubmit="return check();">
      <div class="form-group">
        <div class="label">
          <label>公告昵称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="msgname" placeholder="输入公告名称" data-validate="required:请填写公告名称"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>公告封面：</label>
        </div>
        <div class="form-group">
        <div class="field">
          <input type="file" class="input w50" name="fileup"  placeholder="输入上传公告封面" data-validate="required:请填写公告名称">
          <div class="tips">请对公告的封面进行美化</div>
        </div>
      </div>
    <div class="form-group">
        <div class="label">
          <label>公告主题：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="msgmain"   placeholder="输入公告主题" data-validate="required:请填写公告主题"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>类    别：</label>
        </div>
        <div class="field">
          <select name="leibie" class="input" onchange="changesearch()" style="width:160px; line-height:17px; display:inline-block">
            <option value="">请选择类别类别</option>
            <option value="1">公告</option>
            <option value="0">通知</option>
          </select>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>内容：</label>
        </div>
        <div class="field">
          <textarea name="msgContent" id="msgContent" cols="100" rows="8" style="width:100%;height:500px;visibility:hidden;"></textarea>
          <div class="tips"></div>
        </div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label>发布时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50 easyui-datebox"  name="data"   placeholder="输入时间"/>
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>排序</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="paixu"   placeholder="输入序号" data-validate="required:请填写讲师名称"/>
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>状态</label>
        </div>
        <div class="field">
          <div class="field">
	          <select name="zhuangtai" class="input" onchange="changesearch()" style="width:160px; line-height:17px; display:inline-block">
	            <option value="">请选择状态</option>
	            <option value="1">有效</option>
	            <option value="0">无效</option>
	          </select>
          <div class="tips"></div>
        </div>
      </div> 
      <br> <br> <br>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" style="float:left" type="submit"> 发 布 公  告</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>