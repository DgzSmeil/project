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
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>我的课程</strong></div>
  <div class="body-content">
	<form method="post" class="form-x" action="<%=basePath %>refundservlet?order=teacherrefundupdate">
      <input type="hidden" name="courseid" value="${refund.courseid}">
      <input type="hidden" name="refundid" value="${refund.refundid}">
      <input type="hidden" name="teacherid" value="${refund.teacherid}">
      <input type="hidden" name="studentid" value="${refund.studentid}">
      <input type="hidden" name="sectionid" value="${refund.sectionid}"/>
      <input type="hidden" name="payrecodeid" value="${requestScope.payrecodeid}"/>
      <div class="form-group">
        <div class="label">
          <label>操作类型：</label>
        </div>
        <div class="field">
          <select name="status" class="input w50">
          		<c:if test="${refund.status==0}">
          			<option value="-1">请选择审核操作</option>
		            <option value="1">同意退款</option>
		            <option value="2">退款驳回</option>
		            <option value="3">拒绝退款</option>
		            <option value="4">提交管理处理</option>
          		</c:if>
          		<c:if test="${refund.status==1}">
          			<option value="-1">请选择审核操作</option>
		            <option value="1" selected="selected">同意退款</option>
		            <option value="2">退款驳回</option>
		            <option value="3">拒绝退款</option>
		            <option value="4">提交管理处理</option>
          		</c:if>
            	<c:if test="${refund.status==3}">
          			<option value="-1">请选择审核操作</option>
		            <option value="1">同意退款</option>
		            <option value="2">退款驳回</option>
		            <option value="3" selected="selected">拒绝退款</option>
		            <option value="4">提交管理处理</option>
          		</c:if>
          		<c:if test="${refund.status==2}">
          			<option value="-1">请选择审核操作</option>
		            <option value="1">同意退款</option>
		            <option value="2" selected="selected">退款驳回</option>
		            <option value="3">拒绝退款</option>
		            <option value="4">提交管理处理</option>
          		</c:if>
          		<c:if test="${refund.status==4}">
          			<option value="-1">请选择审核操作</option>
		            <option value="1">同意退款</option>
		            <option value="2">拒绝退款</option>
		            <option value="3">退款驳回</option>
		            <option value="4" selected="selected">提交管理处理</option>
          		</c:if>
          </select>
          <div class="tips">不填默认同意退款</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程封面：</label>
        </div>
        <div class="field">
          <input type="image" style="height:200px;width:200px" class="input w50" name="coursename" src="<%=basePath %>${refund.picture_url}" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程名称：</label>
        </div>
        <div class="field">
		<label><font size=4">${refund.course_name}</font></label>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生Tel：</label>
        </div>
        <div class="field">
			<label><font size=4">${studentBean.studentmobile}</font></label>
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>备注原因：</label>
        </div>
        <div class="field">
           <textarea type="text" class="input w50" name="reason" style="height:150px;" placeholder="输入退款原因" data-validate="required:输入退款原因"></textarea>
          <div class="tips"></div>
        </div>
      </div> 
      <c:if test="${refund.status!=1}">
      	<div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 确认保存</button>
        </div>
      </div>
      </c:if>
    </form>
  </div>
</div>
</body>
</html>