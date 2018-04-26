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
	<form method="post" name="example" id="example" class="form-x" action="<%=basePath %>newmsgservlet?order=updatesave" enctype="multipart/form-data" onsubmit="return check();">
     <input type="hidden" name="newmsgid" value="${newmsgbean.newmsgid}">
     <input type="hidden" name="imageurl" value="${newmsgbean.imageurl}">
     <input type="hidden" name="publishusername" value="${newmsgbean.publishusername}">
      <div class="form-group">
        <div class="label">
          <label>公告昵称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="msgname" value="${newmsgbean.msgname}" data-validate="required:请填写公告昵称"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>公告封面：</label>
        </div>
        <div class="form-group">
        <div class="field">
          <input type="file" class="input w50" name="fileup"  value="${newmsgbean.imageurl}">
          <div class="tips"><img src="${newmsgbean.imageurl}" width="40px" height="40">请对公告的封面进行美化</div>
        </div>
      </div>
    <div class="form-group">
        <div class="label">
          <label>公告主题：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="msgmain"  value="${newmsgbean.oneword}" data-validate="required:请填写公告主题"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>类    别：</label>
        </div>
        <div class="field">
          <select name="leibie" class="input" onchange="changesearch()" style="width:160px; line-height:17px; display:inline-block">
            <c:if test="${newmsgbean.newsType==1}">
            	<option value="1" selected="selected">公告</option>
            </c:if>
            <c:if test="${newmsgbean.newsType!=1}">
            	<option value="0" selected="selected">通知</option>
            </c:if>
          </select>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>内容：</label>
        </div>
        <div class="field">
          <textarea name="msgContent" id="msgContent" cols="100" rows="8"   style="width:100%;height:500px;visibility:hidden;">${newmsgbean.msgcontent}</textarea>
          <div class="tips"></div>
        </div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label>发布时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50 easyui-datebox"  value="${newmsgbean.publishdate}" name="date"  />
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>排序</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="paixu" value="${newmsgbean.seq}"  placeholder="输入讲师名称" data-validate="required:请填写讲师名称"/>
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
	            <c:if test="${newmsgbean.newsType==1}">
            		 <option value="1" selected="selected">有效</option>
	            </c:if>
	            <c:if test="${newmsgbean.newsType!=1}">
	            	<option value="0" selected="selected">无效</option>
	            </c:if>
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
          <button class="button bg-main icon-check-square-o" style="float:left" type="submit"> 修  改 公  告</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>