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
<link rel="stylesheet" href="systemvo/css/pintuer.css">
<link rel="stylesheet" href="systemvo/css/admin.css">
<script src="systemvo/js/jquery.js"></script>
<script src="systemvo/js/pintuer.js"></script>
<script type="text/javascript">
	function del(id,mid){
		if(confirm("您确定要删除吗?")){			
			
		}
	}
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
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>发布课程</strong></div>
  <div class="body-content">
	<form method="post" class="form-x" action="<%=basePath %>sectionservlet?order=addsave&courseid=${requestScope.courseid}" enctype="multipart/form-data" onsubmit="return check();">
		<c:if test="${msg!=null}">
      		<script type="text/javascript">
      			alert("尊敬的"+${param.name}+"${msg}");
      		</script>
      	</c:if>
      <div class="form-group">
        <div class="label">
          <label>课程名称：</label>
        </div>
        <div class="field">
          <select name="courseid" id="courseid" class="input w50">
            <option value="0">请选择课程</option>
            <c:forEach items="${courselist}" var="c">
            	 <option value="${c.course_id}">${c.course_name}</option>
            </c:forEach>
          </select>
          <div class="tips">只有通过审核的才能上传</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>章节名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="sectionname" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>章节备注：</label>
        </div>
        <div class="form-group">
        <div class="field">
          <textarea type="text" class="input w50" name="remark" style="height:150px;" placeholder="多个分类标题请转行"></textarea>
          <div class="tips">请对课程简介说明</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>视频网址：</label>
        </div>
        <div class="field">
          <input type="file" class="input" name="fileup" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>视频时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="sectionlength" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>是否免费：</label>
        </div>
        <div class="field">
          <input type="radio" class="radio" name="isfree" value="0"/>免费<input type="radio" class="radio" name="isfree" value="1"/>会员
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>排序：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="paixu" value="0"  data-validate="number:排序必须为数字" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 发 布 课 程</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>