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
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>发布课程</strong></div>
  <div class="body-content">
	<form method="post" class="form-x" action="<%=basePath %>courseservlet?order=across" onsubmit="return check();">
      <input type="hidden" name="courseid" value="${coursebean.course_id}">
      <input type="hidden" name="teacherid" value="${coursebean.teacher_id}">
      <input type="hidden" name="teachername" value="${coursebean.replay_username}">
      <div class="form-group">
        <div class="label">
          <label>审核操作：</label>
        </div>
        <div class="field">
          <select name="status" class="input w50">
            <option value="0">请选择审核操作</option>
	            <option value="0">未审核</option>
	            <option value="1">审核通过</option>
	            <option value="2">审核驳回</option>
	            <option value="3">封号</option>
          </select>
          <div class="tips">不选择默认未审核</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="coursename" value="${coursebean.course_name}" data-validate="required:请填写课程名称"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程封面：</label>
        </div>
        <div class="form-group">
        <div class="field">
         	<img src="${coursebean.picture_url}" width="100px" height="60px">
        </div>
      </div>
    <div class="form-group">
        <div class="label">
          <label>课程寄语：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="courseword"    value="${coursebean.one_word}" data-validate="required:请填写课程寄语"/>
          <div class="tips"></div>
        </div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label>课程简介：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="courseindex"   value="${coursebean.introduce}" data-validate="required:请填写讲师简介"/>
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>课程课时：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="coursetime"   value="${coursebean.course_count}" data-validate="required:请填写课程课时"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="courseprice"  value="${coursebean.price}" data-validate="required:请填写课程价格"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程优惠：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="discount" value="${coursebean.discount}" data-validate="required:请填写课程优惠"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>是否有效：</label>
        </div>
        <div class="field">
        	<c:if test="${coursebean.effective==1}">
        		<input type="radio" class="radio" name="isactive" value="1" checked="checked"/>有效<input type="radio" class="radio" name="isactive" value="0"/>无效
        	</c:if>
          	<c:if test="${coursebean.effective==0}">
        		<input type="radio" class="radio" name="isactive" value="1"/>有效<input type="radio" class="radio" name="isactive" value="0"  checked="checked"/>无效
        	</c:if>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>排列序号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="xuhao" value="${coursebean.seq}"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>是否免费：</label>
        </div>
        <div class="field">
        	<c:if test="${coursebean.ismoney==0}">
	          <input type="radio" class="radio" name="isfree" value="0" checked="checked"/>免费<input type="radio" class="radio" name="isfree" value="1"/>会员
        	</c:if>
        	<c:if test="${coursebean.ismoney==1}">
	          <input type="radio" class="radio" name="isfree" value="0"/>免费<input type="radio" class="radio" name="isfree" value="1"  checked="checked"/>会员
        	</c:if>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>原因：</label>
        </div>
        <div class="field">
           <textarea type="text" class="input w50" name="reason" style="height:150px;" placeholder="输入审核结果" data-validate="required:请填写审核结果"></textarea>
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
			<input class="button border-main icon-edit" type="submit" value="确认审核">
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>