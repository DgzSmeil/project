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
	<form method="post" class="form-x" action="<%=basePath %>sectionservlet?order=checkcross" onsubmit="return check();">
		<input type="hidden" name="sectionid" value="<%=request.getParameter("sectionid")%>">
		<c:if test="${msg!=null}">
      		<script type="text/javascript">
      			alert("尊敬的"+${param.name}+"${msg}");
      		</script>
      	</c:if>
      	<div class="form-group">
        <div class="label">
          <label>审核操作：</label>
        </div>
        <div class="field">
       	<c:if test="${sectionbean.status==0}" var="s">
        	<select name="status" class="input w50">
	           	<option value="0">请选择审核操作</option>
	            <option value="0" selected>未审核</option>
	            <option value="1">审核通过</option>
	            <option value="2">审核驳回</option>
	            <option value="3">封号</option>
            </select>
         </c:if>
         <c:if test="${sectionbean.status==1}" var="s">
        	<select name="status" class="input w50">
	           	<option value="0">请选择审核操作</option>
	            <option value="0">未审核</option>
	            <option value="1"  selected>审核通过</option>
	            <option value="2">审核驳回</option>
	            <option value="3">封号</option>
            </select>
         </c:if>
         <c:if test="${sectionbean.status==2}" var="s">
        	<select name="status" class="input w50">
	           	<option value="0">请选择审核操作</option>
	            <option value="0">未审核</option>
	            <option value="1">审核通过</option>
	            <option value="2" selected>审核驳回</option>
	            <option value="3">封号</option>
            </select>
         </c:if>
         <c:if test="${sectionbean.status==3}" var="s">
        	<select name="status" class="input w50">
	           	<option value="0">请选择审核操作</option>
	            <option value="0">未审核</option>
	            <option value="1">审核通过</option>
	            <option value="2">审核驳回</option>
	            <option value="3" selected>封号</option>
            </select>
         </c:if>
          <div class="tips">
          	<c:if test="${sectionbean.status==0}" var="s">
          		<font color="red">当前状态：未审核</font>
          	</c:if>
          	<c:if test="${sectionbean.status==1}" var="s">
          		<font color="red">当前状态：审核通过</font>
          	</c:if>
          	<c:if test="${sectionbean.status==2}" var="s">
          		<font color="red">当前状态：审核驳回</font>
          	</c:if>
          	<c:if test="${sectionbean.status==3}" var="s">
          		<font color="red">当前状态：封号</font>
          	</c:if>
          </div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>课程名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="sectionname" value="${sectionbean.coursename}"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>章节名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="sectionname"  value="${sectionbean.sectionname}"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>章节备注：</label>
        </div>
        <div class="form-group">
        <div class="field">
          <textarea type="text" class="input w50" name="remark" style="height:150px;">${sectionbean.sectionremark}</textarea>
          <div class="tips">请对课程简介说明</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>视频时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="sectionlength"   value="${sectionbean.timelength}"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>是否免费：</label>
        </div>
        <div class="field">
        	<c:if test="${sectionbean.isfree==0}">
          		<input type="radio" class="radio" name="isfree" value="0" checked="checked"/>免费<input type="radio" class="radio" name="isfree" value="1"/>会员
        	</c:if>
        	<c:if test="${sectionbean.isfree==1}">
          		<input type="radio" class="radio" name="isfree" value="0"/>免费<input type="radio" class="radio" name="isfree" value="1"  checked="checked"/>会员
        	</c:if>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>排序：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="paixu"  value="${sectionbean.paixu}" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>视频播放审核：</label>
        </div>
        <div class="form-group">
        <div class="field">
          <embed width="800" height="500" align="center" src="${sectionbean.sectionurl}"/>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>原因：</label>
        </div>
        <div class="field">
           <textarea type="text" class="input w50" name="reason" style="height:150px;" placeholder="输入审核结果" data-validate="required:请填写审核结果">${sectionbean.reason}</textarea>
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